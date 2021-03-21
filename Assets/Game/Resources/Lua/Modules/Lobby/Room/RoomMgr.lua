local BaseMgr = require "Core.BaseMgr"
local RoomMgr = class("RoomMgr", BaseMgr)

function RoomMgr:ctor()
    self.super.ctor(self)
    self:addUI(1, require "Modules.Lobby.Room.RoomSelect")
end

return RoomMgr
