local BaseUI = require "Core.BaseUI"
local LoginUI = class("LoginUI", BaseUI)

function LoginUI:getPrefabPath()
    return "Prefabs/LobbyUI/Login/LoginUI"
end

function LoginUI:onAwake()
    local btnStart = self.transform:Find("Panel/BtnStart")
    UIEventManager.SetButtonClick(
        btnStart,
        function()
            local CanvasLobby = require "LobbyUI.Lobby.CanvasLobby"
            CanvasLobby:new()
        end
    )
end

return LoginUI
