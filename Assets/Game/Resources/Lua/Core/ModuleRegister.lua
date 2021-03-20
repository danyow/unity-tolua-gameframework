--注册模块
local moduleList = {
    [ModuleId.Common] = require "Modules.Common.CommonMgr",
    [ModuleId.Login] = require "Modules.Lobby.Login.LoginMgr",
    [ModuleId.LobbyMain] = require "Modules.Lobby.LobbyMain.LobbyMainMgr"
}
return moduleList
