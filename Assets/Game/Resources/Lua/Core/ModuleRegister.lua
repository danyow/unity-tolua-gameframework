--注册模块
local moduleList = {
    [ModuleID.Common] = require "Modules.Common.CommonMgr",
    [ModuleID.Login] = require "Modules.Lobby.Login.LoginMgr",
    [ModuleID.LobbyMain] = require "Modules.Lobby.LobbyMain.LobbyMainMgr",
    [ModuleID.Player] = require "Modules.Lobby.Player.PlayerMgr",
    [ModuleID.Shop] = require "Modules.Lobby.Shop.ShopMgr",
    [ModuleID.Room] = require "Modules.Lobby.Room.RoomMgr",
    [ModuleID.Battle] = require "Modules.Battle.BattleMgr",
    [ModuleID.Actor] = require "Modules.Actor.ActorMgr",

    --活动
    [ModuleID.DailyReward] = require "Modules.Activities.DailyReward.DailyRewardMgr"
}
return moduleList
