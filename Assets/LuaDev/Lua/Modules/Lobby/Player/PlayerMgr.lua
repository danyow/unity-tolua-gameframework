local BaseMgr = require "Core.BaseMgr"
local PlayerMgr = Class("PlayerMgr", BaseMgr)

function PlayerMgr:ctor()
    self.super.ctor(self)
    self:addUI(1, require "Modules.Lobby.Player.PlayerInfo")
end

return PlayerMgr
