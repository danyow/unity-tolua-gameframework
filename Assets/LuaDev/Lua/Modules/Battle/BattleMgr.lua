local BaseMgr = require "Core.BaseMgr"
local BattleMgr = Class("BattleMgr", BaseMgr)

function BattleMgr:Ctor()
    self.super.Ctor(self)
    self:AddUI("BattleUI", require "Modules.Battle.BattleUI")
end

return BattleMgr
