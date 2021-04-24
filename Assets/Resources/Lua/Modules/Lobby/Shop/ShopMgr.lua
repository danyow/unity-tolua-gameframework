local BaseMgr = require "Core.BaseMgr"
local ShopMgr = Class("ShopMgr", BaseMgr)

function ShopMgr:ctor()
    self.super.ctor(self)
    self:addUI(1, require "Modules.Lobby.Shop.Shop")
end

return ShopMgr
