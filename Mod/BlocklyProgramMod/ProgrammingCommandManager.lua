NPL.load("(gl)script/apps/Aries/Creator/Game/Entity/EntityManager.lua");
NPL.load("(gl)script/apps/Aries/Creator/Game/Entity/EntityNPC.lua");
local EntityNPC = commonlib.gettable("MyCompany.Aries.Game.EntityManager.EntityNPC")
local EntityManager = commonlib.gettable("MyCompany.Aries.Game.EntityManager");
local CommandManager = commonlib.inherit(nil,commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommandManager"));
local Singleton;
function CommandManager.singleton()
    Singleton=Singleton or CommandManager:new();
    return Singleton;
end
function CommandManager:setEntity(entity)
    self.mEntity=entity;
end
function CommandManager:getEntity()
    if not self.mEntity then
        self.mEntity=EntityManager.EntityNPC:Create({bx=19200,by=5,bz=19200, item_id = 30001, facing=0, can_random_move = false});
    end
    return self.mEntity;
end
function CommandManager:run(code)
    NPL.load("(gl)Mod/BlocklyProgramMod/CodeHighLighting.lua");
    local CodeHighLighting=commonlib.gettable("Mod.BlocklyProgramMod.CodeHighLighting");
    CodeHighLighting.ShowPage();
    local code_highLight=CodeHighLighting.parse(code);
    local run_code="NPL.load('(gl)Mod/BlocklyProgramMod/ProgrammingAPI.lua');\r\n";
    run_code=run_code.."local API = commonlib.gettable('Mod.BlocklyProgramMod.ProgrammingAPI');\r\n";
    run_code=run_code..code_highLight.."\r\n";
    run_code=run_code.."API.run();"
    echo("devilwalk--------------------------------------------debug:run code:\r\n"..run_code);
    local func,err=loadstring(run_code);
    if err then
        echo(err);
    end
    func();
end