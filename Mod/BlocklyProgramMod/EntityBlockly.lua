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
            if not self.mIgnoreOutput then
                self:SetLastCommandResult(15)
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
    self._super.ExecuteCommand(self, entityPlayer, bIgnoreNeuronActivation, true)
    self.mIgnoreOutput = bIgnoreOutput
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
