local BaseMgr = require "Core.BaseMgr"
local LobbyMainMgr = Class("LobbyMainMgr", BaseMgr)

function LobbyMainMgr:Ctor()
    self.super.Ctor(self)
    self:AddUI("LobbyMain", require "Modules.Lobby.LobbyMain.LobbyMain")
end

return LobbyMainMgr
