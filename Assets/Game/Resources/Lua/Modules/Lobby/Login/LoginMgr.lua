local BaseMgr = require "Core.BaseMgr"
local LoginMgr = class("LoginMgr", BaseMgr)

function LoginMgr:ctor()
    self.super.ctor(self)
    self:addUI(1, require "Modules.Lobby.Login.Login")
    self:addUI(2, require "Modules.Lobby.Login.Register")

    --TODO:注册服务器广播事件：onReceveServerData()
end

--由服务器广播触发
function LoginMgr:onReceveServerData(msg)
    self.msg = msg
    --在模块管理器里获取UI的方法
    local loginUI = self:getUI(1)
    if loginUI and loginUI.gameObject.activeInHierarchy then
        loginUI:refrshUI()
    end
end

function LoginMgr:getServerData()
    return self.msg
end

return LoginMgr
