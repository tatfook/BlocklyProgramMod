NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingCommand.lua");
NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingCommandManager.lua");
local CommandManager=commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandManager").singleton();
local CommandFactory=commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommand.Factory");
local API = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingAPI");
function API.step()
    CommandManager:getCommandQueue():add(CommandFactory.create("Move",{mEntity=CommandManager:getEntity(),mDistance=1}));
end
function API.turnLeft()
    CommandManager:getCommandQueue():add(CommandFactory.create("Turn",{mEntity=CommandManager:getEntity(),mType=0}));
end
function API.turnRight()
    CommandManager:getCommandQueue():add(CommandFactory.create("Turn",{mEntity=CommandManager:getEntity(),mType=1}));
end
function API.destroyBlock()
    CommandManager:getCommandQueue():add(CommandFactory.create("DestroyBlock",{mEntity=CommandManager:getEntity()}));
end
function API.run()
    CommandManager:getCommandQueue():execute();
end
