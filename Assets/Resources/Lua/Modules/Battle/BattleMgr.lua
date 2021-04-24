local BaseMgr = require "Core.BaseMgr"
local BattleMgr = Class("BattleMgr", BaseMgr)

function BattleMgr:ctor()
    self.super.ctor(self)
    self:addUI(1, require "Modules.Battle.BattleUI")
end

return BattleMgr
