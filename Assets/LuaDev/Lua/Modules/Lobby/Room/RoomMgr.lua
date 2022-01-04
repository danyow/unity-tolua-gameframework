local BaseMgr = require "Core.BaseMgr"
local RoomMgr = Class("RoomMgr", BaseMgr)

function RoomMgr:Ctor()
    self.super.Ctor(self)
    self:AddUI("RoomSelect", require "Modules.Lobby.Room.RoomSelect")
end

return RoomMgr
