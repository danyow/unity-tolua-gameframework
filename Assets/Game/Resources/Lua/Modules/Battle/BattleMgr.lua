local BaseMgr = require "Core.BaseMgr"
local BattleMgr = class("BattleMgr", BaseMgr)

function BattleMgr:ctor()
    self.super.ctor(self)
    self:addUI(1, require "Modules.Battle.BattleUI")
end

return BattleMgr
