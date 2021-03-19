local BaseMgr = require "Core.BaseMgr"
local LoginMgr = class("LoginMgr", BaseMgr)

function LoginMgr:getModuleId()
    return ModuleId.Login
end

function LoginMgr:requireUIs()
    self.super:requireUIs()
    self:addUI(1, require "Modules.Lobby.Login.Login")
    self:addUI(2, require "Modules.Lobby.Login.Register")
end

return LoginMgr
