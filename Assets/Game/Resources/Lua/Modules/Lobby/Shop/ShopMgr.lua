local BaseMgr = require "Core.BaseMgr"
local ShopMgr = class("ShopMgr", BaseMgr)

function ShopMgr:ctor()
    self.super.ctor(self)
    self:addUI(1, require "Modules.Lobby.Shop.Shop")
end

return ShopMgr
