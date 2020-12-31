local BaseUI = require "Core.BaseUI"
local Login = class("Login", BaseUI)

function Login:prefabPath()
    return "Prefabs/LobbyUI/Login/Login"
end

function Login:onAwake()
    local btnStart = self.transform:Find("Panel/BtnStart")
    UIEventManager.SetButtonClick(
        btnStart,
        function()
            CommandManager.execute(CommandID.OpenUI, UIID.LobbyMain)
        end
    )
end

return Login
