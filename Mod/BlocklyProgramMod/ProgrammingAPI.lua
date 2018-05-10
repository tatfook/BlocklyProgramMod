NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingCommand.lua")
NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingCommandQueue.lua")
NPL.load("(gl)Mod/BlocklyProgramMod/main.lua")
local Mod = commonlib.gettable("Mod.BlocklyProgramMod")
local CommandQueue = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandQueue")
local CommandFactory = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommand.Factory")
local API = commonlib.inherit(nil, commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingAPI"))
local function assert(boolean, errorMessage)
    if not boolean then
        echo("devilwalk--------------------------------------assert:ProgrammingAPI.lua:" .. (errorMessage or ""))
    end
end
local function _onFrameMove(inst)
    --echo("devilwalk----------------------------debug:ProgrammingAPI.lua:_onFrameMove:inst.mCoroutine:"..tostring(inst.mCoroutine))
    if inst.mCoroutine then
        if "suspended" == coroutine.status(inst.mCoroutine) then
            coroutine.resume(inst.mCoroutine)
        elseif "dead" == coroutine.status(inst.mCoroutine) then
            inst.mCreator.mEventSystem:RemoveEventListener("FrameMove", _onFrameMove, inst)
        end
    end
end
function API:ctor()
    assert(self.mEntity ~= nil, "API:ctor:self.mEntity:nil")
    assert(self.mCreator ~= nil, "API:ctor:self.mCreator:nil")
    self.mCommandQueue = CommandQueue:new()
    self.mAlive = true
    self.mCoroutine =
        coroutine.create(
        function()
            self.mCommandQueue:execute()
            while self.mAlive do
                self.mCommandQueue:frameMove()
                if coroutine.status( self.mCoroutine ) == "running" then
                    coroutine.yield()
                end
            end
        end
    )
    self.mCreator.mEventSystem:AddEventListener("FrameMove", _onFrameMove, self)
end
function API:setActive(activeFunction)
    self.active = activeFunction
end
function API:move(count)
    self.mCommandQueue:add(CommandFactory.create("Move", {mEntity = self.mEntity, mDistance = count}))
    if coroutine.status( self.mParentCoroutine ) == "running" then
        coroutine.yield()
    end
end
function API:turn(type)
    if type == "left" then
        type = 0
    elseif type == "right" then
        type = 1
    elseif type == "back" then
        type = 2
    else
        assert(false, "API.turn:type:" .. tostring(type))
        type = 0
    end
    self.mCommandQueue:add(CommandFactory.create("Turn", {mEntity = self.mEntity, mType = type}))
    if coroutine.status( self.mParentCoroutine ) == "running" then
        coroutine.yield()
    end
end
function API:setEventFunction(name, parameters, func)
    if "OnKeyPressed" == name then
        if not self.mOnKeyPressed then
            self.mOnKeyPressed = {mKeys = {}}
            self.mOnKeyPressed.mFunction = function(inst, event)
                if event.event_type == "keyPressEvent" then
                    local callback = inst.mOnKeyPressed.mKeys[event.keyname].mFunction
                    if callback then
                        if inst.mOnKeyPressed.mKeys[event.keyname].mAPI then
                            inst.mOnKeyPressed.mKeys[event.keyname].mAPI.mAlive = false
                            inst.mOnKeyPressed.mKeys[event.keyname].mAPI = nil
                        end
                        local new_api = API:new({mEntity = inst.mEntity, mCreator = inst.mCreator})
                        local coro =
                            coroutine.create(
                            function()
                                callback(new_api)
                            end
                        )
                        new_api.mParentCoroutine = coro
                        local function on_frame_move(key)
                            if key.mCoroutine then
                                if "suspended" == coroutine.status(key.mCoroutine) then
                                    coroutine.resume(key.mCoroutine)
                                elseif "dead" == coroutine.status(key.mCoroutine) then
                                    inst.mCreator.mEventSystem:RemoveEventListener("FrameMove", key.mOnFrameMove, key)
                                    key.mOnFrameMove = nil
                                end
                            end
                        end
                        inst.mOnKeyPressed.mKeys[event.keyname].mCoroutine = coro
                        inst.mOnKeyPressed.mKeys[event.keyname].mAPI = new_api
                        if not inst.mOnKeyPressed.mKeys[event.keyname].mOnFrameMove then
                            inst.mOnKeyPressed.mKeys[event.keyname].mOnFrameMove = on_frame_move
                            inst.mCreator.mEventSystem:AddEventListener(
                                "FrameMove",
                                on_frame_move,
                                inst.mOnKeyPressed.mKeys[event.keyname]
                            )
                        end
                    end
                end
            end
            Mod.mEventSystem:AddEventListener("handleKeyEvent", self.mOnKeyPressed.mFunction, self)
        end
        self.mOnKeyPressed.mKeys[parameters] = self.mOnKeyPressed.mKeys[parameters] or {}
        self.mOnKeyPressed.mKeys[parameters].mFunction = func
    elseif "OnClick" == name then
        if not self.mOnClick then
            self.mOnClick = {}
            self.mOnClick.mFunction = function(inst, event)
                if event.mouse_button == "left" and event.event_type == "mouseReleaseEvent" then
                    if inst.mOnClick.mAPI then
                        inst.mOnClick.mAPI.mAlive = false
                        inst.mOnClick.mAPI = nil
                    end
                    local new_api = API:new({mEntity = inst.mEntity, mCreator = inst.mCreator})
                    local coro =
                        coroutine.create(
                        function()
                            func(new_api)
                        end
                    )
                    new_api.mParentCoroutine = coro
                    local function on_frame_move(key)
                        if key.mCoroutine then
                            if "suspended" == coroutine.status(key.mCoroutine) then
                                coroutine.resume(key.mCoroutine)
                            elseif "dead" == coroutine.status(key.mCoroutine) then
                                inst.mCreator.mEventSystem:RemoveEventListener("FrameMove", key.mOnFrameMove, key)
                                key.mOnFrameMove = nil
                            end
                        end
                    end
                    inst.mOnClick.mCoroutine = coro
                    inst.mOnClick.mAPI = new_api
                    if not inst.mOnClick.mOnFrameMove then
                        inst.mOnClick.mOnFrameMove = on_frame_move
                        inst.mCreator.mEventSystem:AddEventListener("FrameMove", on_frame_move, inst.mOnClick)
                    end
                end
            end
            Mod.mEventSystem:AddEventListener("handleMouseEvent", self.mOnClick.mFunction, self)
        end
    elseif "OnEvent" == name then
        if not self.mOnEvent then
            self.mOnEvent = {mKeys = {}}
        end
        self.mOnEvent.mKeys[parameters] = self.mOnEvent.mKeys[parameters] or {}
        self.mOnEvent.mKeys[parameters].mFunction = func
    end
end
function API:sendEvent(event)
    if self.mOnEvent and self.mOnEvent.mKeys[event] then
        self.mOnEvent.mKeys[event].mFunction()
    end
end
function API:postEvent(event)
    if self.mOnEvent and self.mOnEvent.mKeys[event] then
        local func = self.mOnEvent.mKeys[event].mFunction
        local new_api = API:new({mEntity = self.mEntity, mCreator = self.mCreator})
        local coro =
            coroutine.create(
            function()
                func(new_api)
            end
        )
        new_api.mParentCoroutine = coro
        local function on_frame_move(key)
            if key.mCoroutine then
                if "suspended" == coroutine.status(key.mCoroutine) then
                    coroutine.resume(key.mCoroutine)
                elseif "dead" == coroutine.status(key.mCoroutine) then
                    self.mCreator.mEventSystem:RemoveEventListener("FrameMove", key.mOnFrameMove, key)
                    key.mOnFrameMove = nil
                end
            end
        end
        self.mOnEvent.mKeys[event].mCoroutine = coro
        self.mOnEvent.mKeys[event].mAPI = new_api
        if not self.mOnEvent.mKeys[event].mOnFrameMove then
            self.mOnEvent.mKeys[event].mOnFrameMove = on_frame_move
            self.mCreator.mEventSystem:AddEventListener("FrameMove", on_frame_move, self.mOnEvent.mKeys[event])
        end
    end
end
function API:destroyBlock()
    self.mCommandQueue:add(CommandFactory.create("DestroyBlock", {mEntity = self.mEntity}))
    if coroutine.status( self.mParentCoroutine ) == "running" then
        coroutine.yield()
    end
end
