local BaseUI = require "Core.BaseUI"
local Login = Class("Login", BaseUI)

function Login:PrefabPath()
    return "Prefabs/Login/Login"
end

function Login:Awake()
    self.super.Awake(self)

    local btnStart = self.transform:Find("BtnStart")
    btnStart:OnClick(
        function()
            CommandManager.Execute(CommandID.OpenUI, "LobbyMainMgr")
        end
    )

    local btnRegister = self.transform:Find("BtnRegister")
    btnRegister:OnClick(
        function()
            --CommandManager.Execute(CommandID.OpenUI, "LoginMgr", "Register")
            --或
            Modules.Login:OpenUI("Register")
        end
    )
end

--由模块触发调用
function Login:RefrshUI()
    --在UI里方法模块管理器的方法
    local serverData = self.module:getServerData()
    Log(serverData)
end

return Login
