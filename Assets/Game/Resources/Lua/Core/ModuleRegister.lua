--注册模块
local moduleList = {
    [ModuleId.Common] = require "Modules.Common.CommonMgr",
    [ModuleId.Login] = require "Modules.Lobby.Login.LoginMgr",
    [ModuleId.LobbyMain] = require "Modules.Lobby.LobbyMain.LobbyMainMgr",
    [ModuleId.Player] = require "Modules.Lobby.Player.PlayerMgr",
    [ModuleId.Shop] = require "Modules.Lobby.Shop.ShopMgr",
    [ModuleId.Room] = require "Modules.Lobby.Room.RoomMgr",
    [ModuleId.FightUI] = require "Modules.Battle.UI.FightUIMgr",
    [ModuleId.Actor] = require "Modules.Battle.Actor.ActorMgr",

    --活动
    [ModuleId.DailyReward] = require "Modules.Activities.DailyReward.DailyRewardMgr"
}
return moduleList
