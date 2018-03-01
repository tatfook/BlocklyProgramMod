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
    
    -- register a new block item, id < 10512 is internal items, which is not recommended to modify. 
    GameLogic.GetFilters():add_filter("block_types", function(xmlRoot) 
                                          local blocks = commonlib.XPath.selectNode(xmlRoot, "/blocks/");
                                          if(blocks) then
                                              NPL.load("(gl)Mod/BlocklyProgramMod/EntityBlockly.lua");
                                              blocks[#blocks+1] = {name="block", attr={ name="Jigsaw",
                                                                                        id=513,
                                                                                        class="BlockCommandBlock",
                                                                                        entity_class="EntityBlockly",
                                                                                        hasAction="true",
                                                                                        disable_gen_icon="true",
                                                                                        can_pick = "false",
                                                                                        threeSideTex="true",
                                                                                        searchkey="Jigsaw",
                                                                                        mapcolor="#ff0000",
                                                                                        texture="Mod/BlocklyProgramMod/textures/block.png",
                                                                                        cubeMode="true",
                                                                                        obstruction="true",
                                                                                        solid="true",
                                                                                        text="Jigsaw Programming Block",
                                                                                        icon = "Mod/BlocklyProgramMod/textures/icon.png",
                                                                  }}
                                              LOG.std(nil, "info", "Blockly", "Jigsaw block is registered");
                                          end
                                          return xmlRoot;
                                     end)

    -- add block to category list to be displayed in builder window (E key)
    GameLogic.GetFilters():add_filter("block_list", function(xmlRoot) 
                                          for node in commonlib.XPath.eachNode(xmlRoot, "/blocklist/category") do
                                              if(node.attr.name == "gear") then
                                                  node[#node+1] = {name="block", attr={name="Jigsaw"} };
                                              end
                                          end
                                          return xmlRoot;
                                     end)
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
