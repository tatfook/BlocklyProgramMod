local function assert(boolean, errorMessage)
    if not boolean then
        echo("devilwalk--------------------------------------assert:" .. (errorMessage or ""))
    end
end
local CommandQueue =
    commonlib.inherit(commonlib.EventSystem, commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandQueue"))
function CommandQueue:ctor()
end
function CommandQueue:add(command)
    self.mCommands = self.mCommands or {}
    self.mCommands[#self.mCommands + 1] = command
    command:AddEventListener(
        "Finish",
        function(command)
            echo(
                "devilwalk----------------------------------debug:CommandQueue:onCommandFinish:self.mCurrentCommandIndex:" ..
                    tostring(self.mCurrentCommandIndex)
            )
            assert(command == self.mCommands[self.mCurrentCommandIndex])
            self.mCurrentCommandIndex = self.mCurrentCommandIndex + 1
        end,
        command
    )
end
function CommandQueue:execute()
    echo("devilwalk----------------------------------debug:CommandQueue:execute")
    self.mCurrentCommandIndex = 1
end
function CommandQueue:frameMove()
    if not self.mCommands then
        return false
    end
    local current_command = self.mCommands[self.mCurrentCommandIndex]
    if current_command then
        current_command:frameMove()
        return true;
    else
        return false;
    end
end
function CommandQueue:reset()
    if self.mCurrentCommandIndex and self.mCommands[self.mCurrentCommandIndex] then
        self.mCommands[self.mCurrentCommandIndex]:stop()
    end
    self.mCommands = nil
    self.mCurrentCommandIndex = nil
end
function CommandQueue:stop()
    if self.mCurrentCommandIndex and self.mCommands[self.mCurrentCommandIndex] then
        self.mCommands[self.mCurrentCommandIndex]:stop()
    end
    self.mCommands = nil
    self.mCurrentCommandIndex = nil
end