local BaseUI = require "Core.BaseUI"
local Login = Class("Login", BaseUI)

function Login:PrefabPath()
    return "Prefabs/Lobby/Login/Login"
end

function Login:Awake()
    self.super.Awake(self)

    local btnStart = self.transform:Find("BtnStart")
    btnStart:OnClick(
        function()
            CommandManager.Execute(CommandID.OpenUI, ModuleID.LobbyMain)
        end
    )

    local btnRegister = self.transform:Find("BtnRegister")
    btnRegister:OnClick(
        function()
            --CommandManager.Execute(CommandID.OpenUI, ModuleID.Login, 2)
            --或
            Module.Get(ModuleID.Login):OpenUI(2)
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
