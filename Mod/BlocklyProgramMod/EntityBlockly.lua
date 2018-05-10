NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingCommandQueue.lua")
NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingAPI.lua")
NPL.load("(gl)script/apps/Aries/Creator/Game/Entity/EntityCommandBlock.lua")
local EntityNPC = commonlib.gettable("MyCompany.Aries.Game.EntityManager.EntityNPC")
local Direction = commonlib.gettable("MyCompany.Aries.Game.Common.Direction")
local BlockEngine = commonlib.gettable("MyCompany.Aries.Game.BlockEngine")
local block_types = commonlib.gettable("MyCompany.Aries.Game.block_types")
local names = commonlib.gettable("MyCompany.Aries.Game.block_types.names")
local GameLogic = commonlib.gettable("MyCompany.Aries.Game.GameLogic")
local EntityManager = commonlib.gettable("MyCompany.Aries.Game.EntityManager")
local ProgrammingAPI = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingAPI")
local ProgrammingCommandQueue = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandQueue")

local Entity =
    commonlib.inherit(
    commonlib.gettable("MyCompany.Aries.Game.EntityManager.EntityCommandBlock"),
    commonlib.gettable("MyCompany.Aries.Game.EntityManager.EntityBlockly")
)
echo("----------------------------------entity blockly loaded----------------------------------")

-- class name
Entity.class_name = "EntityBlockly"
EntityManager.RegisterEntityClass(Entity.class_name, Entity)
Entity.is_persistent = true
-- always serialize to 512*512 regional entity file
Entity.is_regional = true
-- if true, we will not reset time to 0 when there is no time event.
Entity.disable_auto_stop_time = true
-- in seconds
-- Entity.framemove_interval = 0.01;
function Entity:ctor()
    self.inventory:SetOnChangedCallback(
        function()
            self:OnInventoryChanged()
        end
    )
    self:SetFrameMoveInterval(0)
    self.mEventSystem = commonlib.EventSystem:new()
end

function Entity:OnInventoryChanged()
    self:Reset()
end

function Entity:Reset()
    --reset all relevant data
end

-- virtual function:
function Entity:init()
    if (not Entity._super.init(self)) then
        return
    end

    return self
end

-- virtual function: execute command
-- @param bIgnoreNeuronActivation: true to ignore neuron activation.
-- @param bIgnoreOutput: ignore output
function Entity:OpenEditor()
    echo("----------------------------------blockly activated----------------------------------")
    NPL.load("(gl)Mod/BlocklyProgramMod/CodeBlockWindow.lua")
    local CodeBlockWindow = commonlib.gettable("Mod.BlocklyProgramMod.CodeBlockWindow")
    CodeBlockWindow.ShowPage(self)
end

function Entity:ExecuteCommand(entityPlayer, bIgnoreNeuronActivation, bIgnoreOutput)
    if self.mAPI then
        self.mAPI.mAlive = false
        if self.mEntity then
            self.mEntity:SetDead()
        end
        self.mAPI = nil
    end
    local ret = Entity._super.ExecuteCommand(self, entityPlayer, bIgnoreNeuronActivation, bIgnoreOutput)
    local movie_entity = self:FindNearByMovieEntity()
    local asset_file = EntityManager.GetPlayer():GetMainAssetPath()
    local skin
    local scaling = 1
    local x, y, z = self:GetPosition()
    local name = "fuck"
    if movie_entity and movie_entity.inventory then
        for i = 1, movie_entity.inventory:GetSlotCount() do
            local itemStack = movie_entity.inventory:GetItem(i)
            if (itemStack and itemStack.count > 0 and itemStack.serverdata) then
                if (itemStack.id == block_types.names.TimeSeriesNPC) then
                    local timeSeries = itemStack.serverdata.timeseries
                    local function GetValueAtTime0(timeSeries, name)
                        local ts = timeSeries[name]
                        if (ts and ts.data) then
                            return ts.data[1]
                        end
                    end
                    asset_file = GetValueAtTime0(timeSeries, "assetfile")
                    if (asset_file) then
                        -- asset file must always match
                        x = GetValueAtTime0(timeSeries, "x")
                        y = GetValueAtTime0(timeSeries, "y")
                        z = GetValueAtTime0(timeSeries, "z")
                        skin = GetValueAtTime0(timeSeries, "skin")
                        facing = GetValueAtTime0(timeSeries, "facing")
                        scaling = GetValueAtTime0(timeSeries, "scaling")
                        opacity = GetValueAtTime0(timeSeries, "opacity")
                        name = GetValueAtTime0(timeSeries, "name")
                        break
                    end
                end
            end
        end
    end
    self.mEntity =
        EntityNPC:Create(
        {
            x = x,
            y = y,
            z = z,
            facing = facing,
            opacity = opacity,
            item_id = block_types.names.TimeSeriesNPC,
            name = name,
            can_random_move = false
        }
    )
    if (self.mEntity) then
        if (skin) then
            self.mEntity:SetSkin(skin)
        end
        self.mEntity:SetDisplayName(name)
        self.mEntity:Attach()
    end
    Entity.mCurrentExecute = self
    self.mCoroutine =
        coroutine.create(
        function()
            self.mRunCode()
        end
    )
    coroutine.resume(self.mCoroutine)
    return ret
end

-- called every frame
function Entity:FrameMove(deltaTime)
    if self.mCoroutine then
        if "suspended" == coroutine.status(self.mCoroutine) then
            coroutine.resume(self.mCoroutine)
        end
    end
    self.mEventSystem:DispatchEventByType("FrameMove", "FrameMove")
end

function Entity:SaveToXMLNode(node, bSort)
    node = Entity._super.SaveToXMLNode(self, node, bSort)
    local attr = node.attr
    attr.mCode = self.mCode
    return node
end

function Entity:LoadFromXMLNode(node)
    Entity._super.LoadFromXMLNode(self, node)
    local attr = node.attr
    self:setCode(attr.mCode)
end

function Entity:createAPI()
    self.mAPI = ProgrammingAPI:new({mEntity = self.mEntity, mCreator = self, mParentCoroutine = self.mCoroutine})
    return self.mAPI
end

function Entity:FindNearByMovieEntity()
    local cx, cy, cz = self.bx, self.by, self.bz
    for side = 0, 5 do
        local dx, dy, dz = Direction.GetOffsetBySide(side)
        local x, y, z = cx + dx, cy + dy, cz + dz
        local blockTemplate = BlockEngine:GetBlock(x, y, z)
        if (blockTemplate and blockTemplate.id == names.MovieClip) then
            local movieEntity = BlockEngine:GetBlockEntity(x, y, z)
            if (movieEntity) then
                return movieEntity
            end
        end
    end
end

function Entity:setCode(code)
    local run_code =
        "NPL.load('(gl)Mod/BlocklyProgramMod/EntityBlockly.lua');\nlocal API=commonlib.gettable('MyCompany.Aries.Game.EntityManager.EntityBlockly').mCurrentExecute:createAPI();\n"
    run_code = run_code .. code
    run_code = run_code .. "API:active();\n"
    if true then
        local file_handle = io.open("Mod/BlocklyProgramMod/GeneratedCode.lua", "w")
        file_handle:write(run_code)
        file_handle:close()
        self.mRunCode = function()
            NPL.load("(gl)Mod/BlocklyProgramMod/GeneratedCode.lua", true)
        end
    else
        local func, err = NPL.loadstring(run_code)
        if err then
            echo(err)
        else
            self.mRunCode = func
        end
    end
end
