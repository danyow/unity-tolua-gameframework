local BaseUI = require "Core.BaseUI"
local Alert = require "Common.Alert"

local LobbyMain = class("LobbyMain", BaseUI)

function LobbyMain:prefabPath()
    return "Prefabs/LobbyUI/Lobby/LobbyMain"
end

function LobbyMain:onAwake()
    self.updateHandler = UpdateBeat:CreateListener(self.update, self)

    local btnLogout = self.transform:Find("Panel/BtnLogout")
    UIEventManager.SetButtonClick(
        btnLogout,
        function()
            CommandManager.execute(CommandID.OpenUI, UIID.Login)
        end
    )

    local btnPlayerInfo = self.transform:Find("Panel/BtnPlayerInfo")
    UIEventManager.SetButtonClick(
        btnPlayerInfo,
        function()
            CommandManager.execute(CommandID.OpenUI, UIID.PlayerInfo)
        end
    )

    local btnBtnShop = self.transform:Find("Panel/BtnShop")
    UIEventManager.SetButtonClick(
        btnBtnShop,
        function()
            CommandManager.execute(CommandID.OpenUI, UIID.Shop)
        end
    )

    local btnFight = self.transform:Find("Panel/BtnFight")
    UIEventManager.SetButtonClick(
        btnFight,
        function()
            CommandManager.execute(CommandID.OpenUI, UIID.RoomSelect)
        end
    )
end

function LobbyMain:onEnable()
    UpdateBeat:AddListener(self.updateHandler)
end

function LobbyMain:onDisable()
    UpdateBeat:RemoveListener(self.updateHandler)
end

function LobbyMain:update()
    if Input.GetMouseButtonUp(1) then
        CommandManager.execute(CommandID.OpenUI, UIID.Alert)
    end
end

return LobbyMain
