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
NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingCommandManager.lua")
NPL.load("(gl)script/apps/Aries/Creator/Game/Entity/EntityManager.lua");
local EntityManager = commonlib.gettable("MyCompany.Aries.Game.EntityManager");
local ProgrammingCommandManager = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandManager").singleton()
local Commands = commonlib.gettable("MyCompany.Aries.Game.Commands")
local CommandManager = commonlib.gettable("MyCompany.Aries.Game.CommandManager")

echo("----------------------------------commands----------------------------------")

Commands["BlocklyEntity"] = {
    name = "BlocklyEntity",
    quick_ref = "/BlocklyEntity",
    handler = function(cmd_name, cmd_text, cmd_params, fromEntity)
        ProgrammingCommandManager:setEntity(EntityManager.GetEntity(cmd_text));
    end
}

Commands["runcode"] = {
    name = "runcode",
    quick_ref = "/runcode",
    handler = function(cmd_name, cmd_text, cmd_params, fromEntity)
        if not cmd_text or cmd_text == "" then
            cmd_text =
                " \
                API.destroyBlock();\r\n \
                for i=1,10 do\r\n \
                    API.destroyBlock();\r\n \
                    API.step();\r\n \
            end\r\n \
            API.turnLeft();\r\n \
            for i=1,10 do\r\n \
                API.destroyBlock();\r\n \
                API.step();\r\n \
            end\r\n \
            API.turnRight();\r\n \
            for i=1,10 do\r\n \
                API.destroyBlock();\r\n \
                API.step();\r\n \
            end\r\n \
           "
        end
        ProgrammingCommandManager:run(cmd_text)
    end
}
