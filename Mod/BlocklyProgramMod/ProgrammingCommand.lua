local function assert(boolean, errorMessage)
    if not boolean then
        echo("devilwalk--------------------------------------assert:" .. (errorMessage or ""))
    end
end

local Command = commonlib.inherit(commonlib.EventSystem, commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommand"))
Command.EState = {Unstart = 0, Executing = 1, Finish = 2}
function Command:ctor()
    self.mState = Command.EState.Unstart
end
function Command:execute()
    self.mState = Command.EState.Executing
end
function Command:frameMove()
    if self.mState == Command.EState.Unstart then
        self:execute()
    elseif self.mState == Command.EState.Executing then
        self:executing()
    elseif self.mState == Command.EState.Finish then
        self:finish()
    end
end
function Command:executing()
end
function Command:finish()
    echo("devilwalk--------------------------------------------debug:Command:finish")
    self:DispatchEventByType("Finish", {})
end
function Command:stop()
    echo("devilwalk--------------------------------------------debug:Command:stop")
end
--[[
    new Move({
        mContext={
            mEntity=xxxx,
            mDistance=xxxx
        }
    });
]]
local Move = commonlib.inherit(Command, commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommand.Move"))
function Move:ctor()
    assert(self.mContext ~= nil, "command move context is nil")
    assert(self.mContext.mEntity ~= nil, "command move entity is nil")
    assert(self.mContext.mDistance ~= nil, "command move distance is nil")
end
function Move:execute()
    local src_block_pos_x, src_block_pos_y, src_block_pos_z = self.mContext.mEntity:GetBlockPos()
    local dst_block_pos_x = src_block_pos_x
    local dst_block_pos_y = src_block_pos_y
    local dst_block_pos_z = src_block_pos_z
    if -0.5 < self.mContext.mEntity:GetFacing() and 0.5 > self.mContext.mEntity:GetFacing() then
        dst_block_pos_x = src_block_pos_x + self.mContext.mDistance
    elseif 1.07 < self.mContext.mEntity:GetFacing() and 2.07 > self.mContext.mEntity:GetFacing() then
        dst_block_pos_z = dst_block_pos_z - self.mContext.mDistance
    elseif 2.64 < self.mContext.mEntity:GetFacing() and 3.64 > self.mContext.mEntity:GetFacing() then
        dst_block_pos_x = src_block_pos_x - self.mContext.mDistance
    elseif -2.07 < self.mContext.mEntity:GetFacing() and -1.07 > self.mContext.mEntity:GetFacing() then
        dst_block_pos_z = dst_block_pos_z + self.mContext.mDistance
    else
        assert(false, "entity facing is error:" .. tostring(self.mContext.mEntity:GetFacing()))
    end
    self.mContext.mDestBlockPosition = {dst_block_pos_x, dst_block_pos_y, dst_block_pos_z}
    self.mContext.mEntity:WalkTo(dst_block_pos_x, dst_block_pos_y, dst_block_pos_z)
    self._super.execute(self)
    echo(
        "devilwalk--------------------------------------------debug:Move:execute:src_block_pos:" ..
            tostring(src_block_pos_x) .. "," .. tostring(src_block_pos_y) .. "," .. tostring(src_block_pos_z)
    )
    echo(
        "devilwalk--------------------------------------------debug:Move:execute:dst_block_pos:" ..
            tostring(dst_block_pos_x) .. "," .. tostring(dst_block_pos_y) .. "," .. tostring(dst_block_pos_z)
    )
end
function Move:executing()
    echo("devilwalk--------------------------------------------debug:Move:executing:self.mContext.mDestBlockPosition:")
    echo(self.mContext.mDestBlockPosition)
    if not self.mContext.mEntity:HasTarget() then
        self.mContext.mEntity:SetBlockPos(
            self.mContext.mDestBlockPosition[1] + 1,
            self.mContext.mDestBlockPosition[2],
            self.mContext.mDestBlockPosition[3]
        )
        self.mContext.mEntity:SetBlockPos(
            self.mContext.mDestBlockPosition[1],
            self.mContext.mDestBlockPosition[2],
            self.mContext.mDestBlockPosition[3]
        )
        self.mState = Command.EState.Finish
    end
end
function Move:stop()
    echo("devilwalk--------------------------------------------debug:Move:stop")
    self.mContext.mEntity:SetBlockTarget()
end
--[[
    new Move({
        mContext={
            mEntity=xxxx,
            mType=xxxx
        }
    });
]]
local Turn = commonlib.inherit(Command, commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommand.Turn"))
Turn.EType = {Left = 0, Right = 1, Back = 2}
function Turn:ctor()
    assert(self.mContext ~= nil, "command turn context is nil")
    assert(self.mContext.mEntity ~= nil, "command turn entity is nil")
    assert(self.mContext.mType ~= nil, "command turn type is nil")
end
function Turn:execute()
    echo(
        "devilwalk--------------------------------------------debug:Turn:execute:src_facing:" ..
            tostring(self.mContext.mEntity:GetFacing())
    )
    local delta_facing = 0
    if self.mContext.mType == Turn.EType.Left then
        delta_facing = -1.57
    elseif self.mContext.mType == Turn.EType.Right then
        delta_facing = 1.57
    elseif self.mContext.mType == Turn.EType.Back then
        delta_facing = 3.14
    else
        assert(false, "turn type error:" .. tostring(self.mContext.mType))
    end
    self.mContext.mEntity:SetFacingDelta(delta_facing)
    self._super.execute(self)
    echo(
        "devilwalk--------------------------------------------debug:Turn:execute:dst_facing:" ..
            tostring(self.mContext.mEntity:GetFacing())
    )
end
function Turn:executing()
    self.mState = Command.EState.Finish
end

local DestroyBlock =
    commonlib.inherit(Command, commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommand.DestroyBlock"))
function DestroyBlock:ctor()
    assert(self.mContext ~= nil, "command turn context is nil")
    assert(self.mContext.mEntity ~= nil, "command turn entity is nil")
end
function DestroyBlock:executing()
    NPL.load("(gl)script/apps/Aries/Creator/Game/block_engine.lua")
    local BlockEngine = commonlib.gettable("MyCompany.Aries.Game.BlockEngine")
    local src_block_pos_x, src_block_pos_y, src_block_pos_z = self.mContext.mEntity:GetBlockPos()
    src_block_pos_y=src_block_pos_y;
    local dst_block_pos_x = src_block_pos_x
    local dst_block_pos_y = src_block_pos_y
    local dst_block_pos_z = src_block_pos_z
    if -0.5 < self.mContext.mEntity:GetFacing() and 0.5 > self.mContext.mEntity:GetFacing() then
        dst_block_pos_x = src_block_pos_x + 1
    elseif 1.07 < self.mContext.mEntity:GetFacing() and 2.07 > self.mContext.mEntity:GetFacing() then
        dst_block_pos_z = dst_block_pos_z - 1
    elseif 2.64 < self.mContext.mEntity:GetFacing() and 3.64 > self.mContext.mEntity:GetFacing() then
        dst_block_pos_x = src_block_pos_x - 1
    elseif -2.07 < self.mContext.mEntity:GetFacing() and -1.07 > self.mContext.mEntity:GetFacing() then
        dst_block_pos_z = dst_block_pos_z + 1
    else
        assert(false, "entity facing is error:" .. tostring(self.mContext.mEntity:GetFacing()))
    end
    BlockEngine:SetBlockToAir(dst_block_pos_x,dst_block_pos_y,dst_block_pos_z,3);
    self.mState = Command.EState.Finish
    echo(
        "devilwalk--------------------------------------------debug:DestroyBlock:execute:dst_block_pos:" ..
            tostring(dst_block_pos_x) .. "," .. tostring(dst_block_pos_y) .. "," .. tostring(dst_block_pos_z)
    )
end

local Factory = commonlib.gettable("Mod.BlocklyProgramMod.ProgrammingCommand.Factory")
function Factory.create(className, context)
    return Mod.BlocklyProgramMod.ProgrammingCommand[className]:new({mContext = context})
end
