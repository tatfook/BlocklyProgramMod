NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingCommandQueue.lua")
NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingCommandManager.lua")
local ProgrammingCommandManager = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandManager").singleton()
local ProgrammingCommandQueue = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandQueue")
local EntityManager = commonlib.gettable("MyCompany.Aries.Game.EntityManager")
local CommandManager = commonlib.gettable("MyCompany.Aries.Game.CommandManager")

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
    self.mProgrammingCommandQueue = ProgrammingCommandQueue:new()
    self.mProgrammingCommandQueue:AddEventListener(
        "CompleteSucceed",
        function()
            if self.mLastResult then
                self:SetLastCommandResult(self.mLastResult)
            end
        end
    )
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

    -- start as paused
    self:Pause()

    return self
end

-- virtual function: execute command
-- @param bIgnoreNeuronActivation: true to ignore neuron activation.
-- @param bIgnoreOutput: ignore output
function Entity:ExecuteCommand(entityPlayer, bIgnoreNeuronActivation, bIgnoreOutput)
    echo("----------------------------------blockly activated----------------------------------")
    NPL.load("(gl)script/apps/WebServer/WebServer.lua")

    local addr = WebServer:site_url()
    if (not addr) then
        CommandManager:RunCommand("/webserver")
        addr = WebServer:site_url()
        if (not addr) then
            count = 0
            self:CheckServerStarted(entityPlayer, bIgnoreNeuronActivation, bIgnoreOutput, addr)
            return
        end
    else
        self:execute(entityPlayer, bIgnoreNeuronActivation, bIgnoreOutput, addr)
    end
end

function Entity:execute(entityPlayer, bIgnoreNeuronActivation, bIgnoreOutput, addr)
    self:OpenBlocklyInBrowser(addr)
    ProgrammingCommandManager:setCommandQueue(self.mProgrammingCommandQueue)
    self.mLastResult = self:ExecuteCommand_Super(entityPlayer, bIgnoreNeuronActivation, true)
    if bIgnoreOutput then
        self.mLastResult = nil
    end
end

function Entity:ExecuteCommand_Super(entityPlayer, bIgnoreNeuronActivation, bIgnoreOutput, addr)
    NPL.load("(gl)script/apps/Aries/Creator/Game/Items/ItemClient.lua")
    NPL.load("(gl)script/apps/Aries/Creator/Game/Common/Direction.lua")
    NPL.load("(gl)script/apps/Aries/Creator/Game/Entity/EntityBlockBase.lua")
    NPL.load("(gl)script/apps/Aries/Creator/Game/Neuron/NeuronManager.lua")
    NPL.load("(gl)script/apps/Aries/Creator/Game/Items/InventoryBase.lua")
    NPL.load("(gl)script/apps/Aries/Creator/Game/Items/ContainerView.lua")
    local ContainerView = commonlib.gettable("MyCompany.Aries.Game.Items.ContainerView")
    local InventoryBase = commonlib.gettable("MyCompany.Aries.Game.Items.InventoryBase")
    local NeuronManager = commonlib.gettable("MyCompany.Aries.Game.Neuron.NeuronManager")
    local CommandManager = commonlib.gettable("MyCompany.Aries.Game.CommandManager")
    local Direction = commonlib.gettable("MyCompany.Aries.Game.Common.Direction")
    local ItemClient = commonlib.gettable("MyCompany.Aries.Game.Items.ItemClient")
    local PhysicsWorld = commonlib.gettable("MyCompany.Aries.Game.PhysicsWorld")
    local BlockEngine = commonlib.gettable("MyCompany.Aries.Game.BlockEngine")
    local TaskManager = commonlib.gettable("MyCompany.Aries.Game.TaskManager")
    local block_types = commonlib.gettable("MyCompany.Aries.Game.block_types")
    local GameLogic = commonlib.gettable("MyCompany.Aries.Game.GameLogic")
    local EntityManager = commonlib.gettable("MyCompany.Aries.Game.EntityManager")
    if (self:IsInputDisabled()) then
        return
    end

    -- clear all time event
    self:ClearTimeEvent()

    -- just in case the command contains variables.
    local variables = (entityPlayer or self):GetVariables()
    local last_result
    local cmd_list = self:GetCommandList()
    if (cmd_list) then
        last_result = CommandManager:RunCmdList(cmd_list, variables, self)
    end

    local bIsInsideBracket
    local bIsNegatingSign
    for i = 1, self.inventory:GetSlotCount() do
        local itemStack = self.inventory:GetItem(i)
        if (itemStack) then
            if (bIsInsideBracket) then
                if (itemStack.id == block_types.names.Redstone_Wire) then
                    -- this is a logical OR
                    bIsInsideBracket = false
                    bIsNegatingSign = false
                end
            else
                if (itemStack.id == block_types.names.Redstone_Torch_On) then
                    bIsNegatingSign = not bIsNegatingSign
                else
                    -- if script return false, we will stop loading slots behind
                    last_result = itemStack:OnActivate(self, entityPlayer)
                    if ((not bIsNegatingSign and last_result == false) or (bIsNegatingSign and last_result ~= false)) then
                        if (not bIsInsideBracket) then
                            bIsInsideBracket = true
                        else
                            break
                        end
                    end
                    if (bIsNegatingSign) then
                        bIsNegatingSign = false
                    end
                end
            end
        end
    end

    if (not bIgnoreOutput) then
        self:SetLastCommandResult(last_result)
    end

    -- if the containing block is a neuron block, we will fire an activation.
    if (not bIgnoreNeuronActivation) then
        local bx, by, bz = self:GetBlockPos()
        local neuron = NeuronManager.GetNeuron(bx, by, bz, false)
        if (neuron) then
            neuron:Activate({type = "click", action = "toggle"})
        end
    end

    return last_result
end

function Entity:OpenBlocklyInBrowser(addr)
    _guihelper.MessageBox(
        "About to switch to your default browser, sure?",
        function(res)
            if (res and res == _guihelper.DialogResult.Yes) then
                CommandManager:RunCommand("/open " .. addr .. "blockly")
            end
        end,
        _guihelper.MessageBoxButtons.YesNo
    )
end

local count = 0
function Entity:CheckServerStarted(entityPlayer, bIgnoreNeuronActivation, bIgnoreOutput, addr)
    commonlib.TimerManager.SetTimeout(
        function()
            local addr = WebServer:site_url()
            if (addr) then
                self:execute(entityPlayer, bIgnoreNeuronActivation, bIgnoreOutput, addr)
            else
                count = count + 1
                -- try 5 times in 5 seconds
                if (count < 5) then
                    self:CheckServerStarted(entityPlayer, bIgnoreNeuronActivation, bIgnoreOutput, addr)
                end
            end
        end,
        1000
    )
end

-- called every frame
function Entity:FrameMove(deltaTime)
end
