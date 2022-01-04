--模块注册
Modules = {
    Common = require "Modules.Common.CommonMgr",
    Login = require "Modules.Login.LoginMgr",
    LobbyMain = require "Modules.Lobby.LobbyMain.LobbyMainMgr",
    Player = require "Modules.Lobby.Player.PlayerMgr",
    Shop = require "Modules.Lobby.Shop.ShopMgr",
    Room = require "Modules.Lobby.Room.RoomMgr",
    Battle = require "Modules.Battle.BattleMgr",
    Actor = require "Modules.Actor.ActorMgr",

    --定期的活动
    DailyReward = require "Modules.Activities.DailyReward.DailyRewardMgr"
}

--实例化全部模块
for key, _module in pairs(Modules) do
    Modules[key] = _module:New()
end
