local BaseMgr = require "Core.BaseMgr"
local PlayerMgr = Class("PlayerMgr", BaseMgr)

function PlayerMgr:Ctor()
    self.super.Ctor(self)
    self:AddUI("PlayerInfo", require "Modules.Lobby.Player.PlayerInfo")
end

return PlayerMgr
