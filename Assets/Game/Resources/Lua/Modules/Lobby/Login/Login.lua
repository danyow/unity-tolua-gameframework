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
            --CommandManager.execute(CommandID.OpenUI, ModuleId.LobbyMain)
        end
    )
end

return Login
