NPL.load("(gl)script/apps/Aries/Creator/Game/Entity/EntityManager.lua")
NPL.load("(gl)script/apps/Aries/Creator/Game/Entity/EntityNPC.lua")
NPL.load("(gl)script/apps/Aries/Creator/Game/game_logic.lua")
local GameLogic = commonlib.gettable("MyCompany.Aries.Game.GameLogic")
local EntityNPC = commonlib.gettable("MyCompany.Aries.Game.EntityManager.EntityNPC")
local EntityManager = commonlib.gettable("MyCompany.Aries.Game.EntityManager")
local CommandManager = commonlib.inherit(nil, commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandManager"))
local Singleton
function CommandManager.singleton()
    Singleton = Singleton or CommandManager:new()
    return Singleton
end
local function _onCommandQueueCompleteSucceed()
    echo(
        "devilwalk--------------------------------------------------debug:ProgrammingCommandManager.lua:_onCommandQueueCompleteSucceed"
    )
    CodeHighLighting.Close()
end
function CommandManager:ctor()
    self.mInvalidatePageKeys = {}
end
function CommandManager:setCommandQueue(queue)
    if queue ~= self.mCommandQueue then
        if self.mCommandQueue then
            if self.mCommandQueue:getPageKey() then
                self.mInvalidatePageKeys[self.mCommandQueue:getPageKey()] = true
            end
            self.mCommandQueue:RemoveEventListener("CompleteSucceed", _onCommandQueueCompleteSucceed)
        end
        self.mCommandQueue = queue
        self.mCommandQueue:AddEventListener("CompleteSucceed", _onCommandQueueCompleteSucceed)
    end
end
function CommandManager:getCommandQueue()
    return self.mCommandQueue
end
function CommandManager:setEntity(entity)
    self.mEntity = entity
end
function CommandManager:getEntity()
    return self.mEntity
end
function CommandManager:setCompleteCondition(completeConditionFunction, completeCallback, resetCallback, stopCallback)
    self.mCommandQueue:setCompleteCondition(completeConditionFunction, completeCallback, resetCallback, stopCallback)
end
function CommandManager:getCompleteCondition()
    return self.mCommandQueue:getCompleteCondition()
end
function CommandManager:run(code)
    echo("devilwalk--------------------------------------------------debug:CommandManager:run")
    --parse page key
    local pos_start, pos_end = string.find(code, "\n")
    local page_key = tonumber(string.sub(code, 1, pos_start - 1))
    echo(
        "devilwalk--------------------------------------------------debug:CommandManager:run:page_key:" ..
            tostring(page_key)
    )
    if not self.mInvalidatePageKeys[page_key] and self.mCommandQueue:setPageKey(page_key) then
        code = string.sub(code, pos_start + 1)
        NPL.load("(gl)Mod/BlocklyProgramMod/CodeHighLighting.lua")
        local CodeHighLighting = commonlib.gettable("Mod.BlocklyProgramMod.CodeHighLighting")
        CodeHighLighting.ShowPage()
        local code_highLight = CodeHighLighting.parse(code)
        local run_code = "NPL.load('(gl)Mod/BlocklyProgramMod/ProgrammingAPI.lua');\r\n"
        run_code = run_code .. "local API = commonlib.gettable('Mod.BlocklyProgramMod.ProgrammingAPI');\r\n"
        run_code = run_code .. code_highLight .. "\r\n"
        run_code = run_code .. "API.run();"
        echo("devilwalk--------------------------------------------debug:run code:\r\n" .. run_code)
        local func, err = NPL.loadstring(run_code)
        if err then
            echo(err)
        end
        NPL.load("(gl)Mod/BlocklyProgramMod/StopButton.lua")
        local StopButton = commonlib.gettable("Mod.BlocklyProgramMod.StopButton")
        StopButton.showPage()
        func()
    end
end
function CommandManager:reset(pageKey)
    if not pageKey or (not self.mInvalidatePageKeys[pageKey] and self.mCommandQueue:setPageKey(pageKey)) then
        CodeHighLighting.Close()
        self.mCommandQueue:reset()
    end
end
function CommandManager:stop()
    CodeHighLighting.Close()
    self.mCommandQueue:stop()
end

GameLogic.GetFilters():add_filter(
    "register_classes_into_sandbox_api",
    function(classes)
        classes.BlocklyProgrammingCommandManager = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandManager").singleton()
    end
)
