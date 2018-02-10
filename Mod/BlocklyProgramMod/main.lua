--[[
Title: 
Author(s):  
Date: 
Desc: 
use the lib:
------------------------------------------------------------
NPL.load("(gl)Mod/BlocklyProgramMod/main.lua");
local BlocklyProgramMod = commonlib.gettable("Mod.BlocklyProgramMod");
------------------------------------------------------------
]]

NPL.load("(gl)Mod/BlocklyProgramMod/filters.lua");
local Filters = commonlib.gettable("Mod.BlocklyProgramMod.Filters");

local BlocklyProgramMod = commonlib.inherit(commonlib.gettable("Mod.ModBase"),commonlib.gettable("Mod.BlocklyProgramMod"));

function BlocklyProgramMod:ctor()
end

-- virtual function get mod name

function BlocklyProgramMod:GetName()
	return "BlocklyProgramMod"
end

-- virtual function get mod description 

function BlocklyProgramMod:GetDesc()
	return "BlocklyProgramMod is a plugin in paracraft"
end

function BlocklyProgramMod:init()
	LOG.std(nil, "info", "BlocklyProgramMod", "plugin initialized");
	Filters.Install();
end

function BlocklyProgramMod:OnLogin()
end
-- called when a new world is loaded. 

function BlocklyProgramMod:OnWorldLoad()
end
-- called when a world is unloaded. 

function BlocklyProgramMod:OnLeaveWorld()
end

function BlocklyProgramMod:OnDestroy()
end
