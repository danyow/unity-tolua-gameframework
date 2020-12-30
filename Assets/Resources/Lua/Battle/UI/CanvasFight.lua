local BaseUI = require "Core.BaseUI"
local CanvasFight = class("CanvasFight", BaseUI)

function CanvasFight:getPrefabPath()
    return "Prefabs/Battle/UI/CanvasFight"
end

function CanvasFight:onAwake()
    local btnBack = self.transform:Find("Panel/BtnBack")
    UIEventManager.SetButtonClick(
        btnBack,
        function()
            Destroy(self.gameObject)
            local CanvasLobby = require "LobbyUI.Lobby.CanvasLobby"
            CanvasLobby:new()
        end
    )
end

return CanvasFight
