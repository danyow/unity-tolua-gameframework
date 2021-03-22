local BaseUI = require "Core.BaseUI"
local Login = class("Login", BaseUI)

function Login:prefabPath()
    return "Prefabs/Lobby/Login/Login"
end

function Login:onAwake()
    self.super.onAwake(self)

    local btnStart = self.transform:Find("BtnStart")
    btnStart:OnClick(
        function()
            CommandManager.execute(CommandID.OpenUI, ModuleID.LobbyMain)
        end
    )

    local btnRegister = self.transform:Find("BtnRegister")
    btnRegister:OnClick(
        function()
            --CommandManager.execute(CommandID.OpenUI, ModuleID.Login, 2)
            --或
            Module.get(ModuleID.Login):openUI(2)
        end
    )
end

--由模块触发调用
function Login:refrshUI()
    --在UI里方法模块管理器的方法
    local serverData = self.module:getServerData()
    Log(serverData)
end

return Login
