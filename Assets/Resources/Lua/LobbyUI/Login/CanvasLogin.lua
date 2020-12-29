local BaseUI = require "Base.BaseUI"
local CanvasLogin = class("CanvasLogin", BaseUI)

function CanvasLogin:getPrefabPath()
    return "Prefabs/LobbyUI/Login/CanvasLogin"
end

function CanvasLogin:onAwake()
    local btnStart = self.transform:Find("Panel/BtnStart")
    UIEventManager.SetButtonClick(
        btnStart,
        function()
            local CanvasLobby = require "LobbyUI.Lobby.CanvasLobby"
            CanvasLobby:new()
        end
    )
end

return CanvasLogin
