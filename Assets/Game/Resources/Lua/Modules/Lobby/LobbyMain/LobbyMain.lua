local BaseUI = require "Core.BaseUI"
local LobbyMain = class("LobbyMain", BaseUI)

function LobbyMain:prefabPath()
    return "Prefabs/Lobby/LobbyMain/LobbyMain"
end

function LobbyMain:onAwake()
    self.super.onAwake(self)

    self.updateHandler = UpdateBeat:CreateListener(self.update, self)

    local btnLogout = self.transform:Find("BtnLogout")
    btnLogout:OnClick(
        function()
            CommandManager.execute(CommandID.OpenUI, ModuleId.Login)
        end
    )

    local btnPlayerInfo = self.transform:Find("BtnPlayerInfo")
    btnPlayerInfo:OnClick(
        function()
            CommandManager.execute(CommandID.OpenUI, ModuleId.Player)
        end
    )

    local btnDailyReward = self.transform:Find("BtnDailyReward")
    btnDailyReward:OnClick(
        function()
            CommandManager.execute(CommandID.OpenUI, ModuleId.DailyReward)
        end
    )
    

    local btnBtnShop = self.transform:Find("BtnShop")
    btnBtnShop:OnClick(
        function()
            --CommandManager.execute(CommandID.OpenUI, ModuleId.Shop)
        end
    )

    local btnFight = self.transform:Find("BtnFight")
    btnFight:OnClick(
        function()
            --CommandManager.execute(CommandID.OpenUI, ModuleId.Room)
        end
    )

    local btnAlert = self.transform:Find("BtnAlert")
    btnAlert:OnClick(
        function()
            --CommandManager.execute(CommandID.OpenUI, ModuleId.Alert)
        end
    )
end

function LobbyMain:onEnable()
    self.super.onEnable(self)
    UpdateBeat:AddListener(self.updateHandler)
end

function LobbyMain:onDisable()
    self.super.onDisable(self)
    UpdateBeat:RemoveListener(self.updateHandler)
end

function LobbyMain:update()
    if Input.GetMouseButtonUp(1) then
        --CommandManager.execute(CommandID.OpenUI, ModuleId.Alert)
    end
end

return LobbyMain
