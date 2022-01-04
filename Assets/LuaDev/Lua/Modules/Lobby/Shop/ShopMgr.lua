local BaseMgr = require "Core.BaseMgr"
local ShopMgr = Class("ShopMgr", BaseMgr)

function ShopMgr:Ctor()
    self.super.Ctor(self)
    self:AddUI("Shop", require "Modules.Lobby.Shop.Shop")
end

return ShopMgr
