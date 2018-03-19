NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingCommandQueue.lua");
NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingCommand.lua");
NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingCommandManager.lua");
local CommandManager=commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandManager").singleton();
local CommandFactory=commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommand.Factory");
local CommandQueue = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandQueue").singleton();
local API = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingAPI");
function API.step()
    CommandQueue:add(CommandFactory.create("Move",{mEntity=CommandManager:getEntity(),mDistance=1}));
end
function API.turnLeft()
    CommandQueue:add(CommandFactory.create("Turn",{mEntity=CommandManager:getEntity(),mType=0}));
end
function API.turnRight()
    CommandQueue:add(CommandFactory.create("Turn",{mEntity=CommandManager:getEntity(),mType=1}));
end
function API.destroyBlock()
    CommandQueue:add(CommandFactory.create("DestroyBlock",{mEntity=CommandManager:getEntity()}));
end
function API.run()
    CommandQueue:execute();
end
