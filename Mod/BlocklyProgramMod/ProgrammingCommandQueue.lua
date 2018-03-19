local function assert(boolean,errorMessage)
    if not boolean then
        echo("devilwalk--------------------------------------assert:"..(errorMessage or ""));
    end
end
local CommandQueue = commonlib.inherit(nil,commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandQueue"));
local Singleton;
function CommandQueue.singleton()
    Singleton=Singleton or CommandQueue:new();
    return Singleton;
end
function CommandQueue:ctor()
end
function CommandQueue:add(command)
    self.mCommands=self.mCommands or {};
    self.mCommands[#self.mCommands+1]=command;
    command:AddEventListener("Finish",function(command)
        echo("devilwalk----------------------------------debug:CommandQueue:onCommandFinish:self.mCurrentCommandIndex:"..tostring(self.mCurrentCommandIndex));
        assert(command==self.mCommands[self.mCurrentCommandIndex]);
        if self.mCurrentCommandIndex<#self.mCommands then
            self.mCurrentCommandIndex=self.mCurrentCommandIndex+1;
        else
            self.mCurrentCommandIndex=nil;
            self.mTimer:Change();
        end
    end,command);
end
function CommandQueue:execute()
    echo("devilwalk----------------------------------debug:CommandQueue:execute");
    self.mCurrentCommandIndex=1;
    self.mTimer=commonlib.Timer:new({callbackFunc=function(timer)
        self:frameMove();
    end});
    self.mTimer:Change(0,0);
end
function CommandQueue:frameMove()
    if self.mCurrentCommandIndex then
        local current_command=self.mCommands[self.mCurrentCommandIndex];
        current_command:frameMove();
    end
end