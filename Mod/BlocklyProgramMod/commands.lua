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
NPL.load("(gl)script/ide/System/Compiler/nplc.lua")
NPL.load("(gl)Mod/BlocklyProgramMod/CodeBlockWindow.lua")
local CodeBlockWindow = commonlib.gettable("Mod.BlocklyProgramMod.CodeBlockWindow")
local Commands = commonlib.gettable("MyCompany.Aries.Game.Commands")
local CommandManager = commonlib.gettable("MyCompany.Aries.Game.CommandManager")

echo("----------------------------------commands----------------------------------")

Commands["RunBlocklyCode"] = {
    name = "RunBlocklyCode",
    quick_ref = "/RunBlocklyCode",
    handler = function(cmd_name, cmd_text, cmd_params, fromEntity)
        echo("devilwalk--------------------------------------------------debug:RunBlocklyCode:cmd_text:" .. cmd_text)
        --parse page key
        local pos_start, pos_end = string.find(cmd_text, "\n")
        local page_key = tonumber(string.sub(cmd_text, 1, pos_start - 1))
        echo(
            "devilwalk--------------------------------------------------debug:commands.lua:RunBlocklyCode:page_key:" ..
            tostring(page_key)
        )
        local code = string.sub(cmd_text, pos_start + 1)
        if not CodeBlockWindow.mPageKey then
            CodeBlockWindow.mPageKey = page_key
        end
        if CodeBlockWindow.mPageKey == page_key then
            CodeBlockWindow.setCode(code)
        end
    end
}
