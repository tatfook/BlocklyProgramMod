--[[
    Title: 
    Author(s):  
    Date: 
    Desc: 
    use the lib:
    ------------------------------------------------------------
    NPL.load("(gl)Mod/BlocklyProgramMod/filters.lua");
    local Filters = commonlib.gettable("Mod.BlocklyProgramMod.Filters");
    ------------------------------------------------------------
]]

local Filters = commonlib.gettable("Mod.BlocklyProgramMod.Filters");

function Filters.Install()
    local filters = GameLogic.GetFilters();
    filters:add_filter("register_command", Filters.RegisterCommands);
end

function Filters.RegisterCommands()
    NPL.load("(gl)Mod/BlocklyProgramMod/commands.lua");
end
