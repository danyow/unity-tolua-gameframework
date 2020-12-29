local BaseUI = require "Base.BaseUI"
local Alert = require "Common.Alert"

local CanvasLobby = class("CanvasLobby", BaseUI)

function CanvasLobby:getPrefabPath()
    return "Prefabs/LobbyUI/Lobby/CanvasLobby"
end

function CanvasLobby:onAwake()
    self.updateHandler = UpdateBeat:CreateListener(self.update, self)

    local btnLogout = self.transform:Find("Panel/BtnLogout")
    UIEventManager.SetButtonClick(
        btnLogout,
        function()
            local CanvasLogin = require "LobbyUI.Login.CanvasLogin"
            CanvasLogin:new()
        end
    )

    local btnPlayerInfo = self.transform:Find("Panel/BtnPlayerInfo")
    UIEventManager.SetButtonClick(
        btnPlayerInfo,
        function()
            local CanvasPlayerInfo = require "LobbyUI.PlayerInfo.CanvasPlayerInfo"
            CanvasPlayerInfo:new()
        end
    )

    local btnBtnShop = self.transform:Find("Panel/BtnShop")
    UIEventManager.SetButtonClick(
        btnBtnShop,
        function()
            local CanvasShop = require "LobbyUI.Shop.CanvasShop"
            CanvasShop:new()
        end
    )

    local btnFight = self.transform:Find("Panel/BtnFight")
    UIEventManager.SetButtonClick(
        btnFight,
        function()
            local CanvasRoom = require "LobbyUI.Room.CanvasRoom"
            CanvasRoom:new()
        end
    )
end

function CanvasLobby:onEnable()
    UpdateBeat:AddListener(self.updateHandler)
end

function CanvasLobby:onDisable()
    UpdateBeat:RemoveListener(self.updateHandler)
end

function CanvasLobby:update()
    if Input.GetMouseButtonUp(1) then
        Alert:new()
    end
end

return CanvasLobby
