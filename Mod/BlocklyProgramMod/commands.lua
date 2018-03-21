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
NPL.load("(gl)script/apps/Aries/Creator/Game/Entity/EntityManager.lua")
local EntityManager = commonlib.gettable("MyCompany.Aries.Game.EntityManager")
local ProgrammingCommandManager = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandManager").singleton()
local Commands = commonlib.gettable("MyCompany.Aries.Game.Commands")
local CommandManager = commonlib.gettable("MyCompany.Aries.Game.CommandManager")

echo("----------------------------------commands----------------------------------")

Commands["BlocklyCode"] = {
    name = "BlocklyCode",
    quick_ref = "/BlocklyCode",
    handler = function(cmd_name, cmd_text, cmd_params, fromEntity)
        local run_code =
            " \
            NPL.load('(gl)Mod/BlocklyProgramMod/ProgrammingAPI.lua');\r\n \
            NPL.load('(gl)Mod/BlocklyProgramMod/ProgrammingCommandManager.lua')\r\n \
            local BlocklyProgrammingCommandManager = commonlib.gettable('Mod.BlocklyProgramMod.ProgrammingCommandManager').singleton() \r\n \
        local BlocklyProgrammingAPI = commonlib.gettable('Mod.BlocklyProgramMod.ProgrammingAPI');\r\n \
        "
        run_code = run_code .. cmd_text
        local code_func, err = loadstring(run_code)
        if err then
            echo("devilwalk-----------------------------------------------error:BlocklyCode:compiler err:")
            echo(err)
        end
        local ok, func = pcall(code_func)
        if not ok then
            echo("devilwalk-----------------------------------------------error:BlocklyCode:runtime err:")
            error(func)
            return
        end
    end
}

Commands["RunBlocklyCode"] = {
    name = "RunBlocklyCode",
    quick_ref = "/RunBlocklyCode",
    handler = function(cmd_name, cmd_text, cmd_params, fromEntity)
        echo("devilwalk--------------------------------------------------debug:RunBlocklyCode:cmd_text:" .. cmd_text)
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

Commands["BlocklyReset"] = {
    name = "BlocklyReset",
    quick_ref = "/BlocklyReset",
    handler = function(cmd_name, cmd_text, cmd_params, fromEntity)
        echo("devilwalk--------------------------------------------------debug:BlocklyReset")
        NPL.load("(gl)Mod/BlocklyProgramMod/ProgrammingCommandManager.lua")
        local BlocklyProgrammingCommandManager =
            commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandManager").singleton()
        BlocklyProgrammingCommandManager:getCommandQueue():reset()
    end
}
