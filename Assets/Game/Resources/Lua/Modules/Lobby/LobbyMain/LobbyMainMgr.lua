local BaseMgr = require "Core.BaseMgr"
local LobbyMainMgr = class("LobbyMainMgr", BaseMgr)

function LobbyMainMgr:ctor()
    self.super.ctor(self)
    self:addUI(1, require "Modules.Lobby.LobbyMain.LobbyMain")
end

return LobbyMainMgr
