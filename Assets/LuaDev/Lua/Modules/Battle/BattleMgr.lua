local BaseMgr = require "Core.BaseMgr"
local BattleMgr = Class("BattleMgr", BaseMgr)

function BattleMgr:Ctor()
    self.super.Ctor(self)
    self:AddUI(1, require "Modules.Battle.BattleUI")
end

return BattleMgr
