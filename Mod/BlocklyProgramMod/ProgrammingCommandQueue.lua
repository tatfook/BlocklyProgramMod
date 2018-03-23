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
            if
                self.mCompleteCondition and self.mCompleteCondition.mCompleteConditionFunction and
                    self.mCompleteCondition.mCompleteConditionFunction()
             then
                if self.mCompleteCondition.mCompleteCallback then
                    self.mCompleteCondition.mCompleteCallback()
                end
                self.mCurrentCommandIndex = 6666666
            end
            if self.mCurrentCommandIndex < #self.mCommands then
                self.mCurrentCommandIndex = self.mCurrentCommandIndex + 1
            else
                if self.mCurrentCommandIndex == 6666666 then
                    self:DispatchEventByType("CompleteSucceed", {})
                else
                    self:DispatchEventByType("CompleteFailed", {})
                end
                self.mCurrentCommandIndex = nil
                self.mTimer:Change()
            end
        end,
        command
    )
end
function CommandQueue:execute()
    echo("devilwalk----------------------------------debug:CommandQueue:execute")
    self.mCurrentCommandIndex = 1
    self.mTimer =
        commonlib.Timer:new(
        {
            callbackFunc = function(timer)
                self:frameMove()
            end
        }
    )
    self.mTimer:Change(0, 0)
end
function CommandQueue:frameMove()
    if self.mCurrentCommandIndex then
        local current_command = self.mCommands[self.mCurrentCommandIndex]
        current_command:frameMove()
    end
end
function CommandQueue:setCompleteCondition(completeConditionFunction, completeCallback, resetCallback, stopCallback)
    self.mCompleteCondition = {
        mCompleteConditionFunction = completeConditionFunction,
        mCompleteCallback = completeCallback,
        mResetCallback = resetCallback,
        mStopCallback = stopCallback
    }
end
function CommandQueue:getCompleteCondition()
    return self.mCompleteCondition
end
function CommandQueue:reset()
    if self.mCurrentCommandIndex and self.mCommands[self.mCurrentCommandIndex] then
        self.mCommands[self.mCurrentCommandIndex]:stop()
    end
    self.mCommands = nil
    self.mCurrentCommandIndex = nil
    self.mTimer:Change()
    self.mTimer = nil
    if self.mCompleteCondition and self.mCompleteCondition.mResetCallback then
        self.mCompleteCondition.mResetCallback()
    end
end
function CommandQueue:stop()
    if self.mCurrentCommandIndex and self.mCommands[self.mCurrentCommandIndex] then
        self.mCommands[self.mCurrentCommandIndex]:stop()
    end
    self.mCommands = nil
    self.mCurrentCommandIndex = nil
    self.mTimer:Change()
    self.mTimer = nil
    if self.mCompleteCondition and self.mCompleteCondition.mStopCallback then
        self.mCompleteCondition.mStopCallback()
    end
end
function CommandQueue:setPageKey(key)
    if self.mPageKey then
        return self.mPageKey == key
    else
        self.mPageKey = key
        return true
    end
end
function CommandQueue:getPageKey()
    return self.mPageKey
end
