--[[
    Title: 
    Author(s):  
    Date: 
    Desc: 
    use the lib:
    ------------------------------------------------------------
    NPL.load("(gl)Mod/BlocklyProgramMod/commands.lua");
    ------------------------------------------------------------
]]

local Commands = commonlib.gettable("MyCompany.Aries.Game.Commands");
local CommandManager = commonlib.gettable("MyCompany.Aries.Game.CommandManager");

echo("----------------------------------commands----------------------------------");

Commands["blocklytest"] = {
    name="blocklytest", 
    quick_ref="/blocklytest", 
    handler = function(cmd_name, cmd_text, cmd_params, fromEntity)
        echo("----------------------------------command blockly test----------------------------------");
        CommandManager:RunCommand("/webserver Mod/BlocklyProgramMod/web");
    end,
};
