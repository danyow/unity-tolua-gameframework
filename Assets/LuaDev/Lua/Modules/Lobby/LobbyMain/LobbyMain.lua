local BaseUI = require "Core.BaseUI"
local LobbyMain = Class("LobbyMain", BaseUI)

function LobbyMain:PrefabPath()
    return "Prefabs/Lobby/LobbyMain/LobbyMain"
end

function LobbyMain:Awake()
    self.super.Awake(self)

    self.updateHandler = UpdateBeat:CreateListener(self.Update, self)

    local btnLogout = self.transform:Find("BtnLogout")
    btnLogout:OnClick(
        function()
            --CommandManager.Execute(CommandID.OpenUI, "LoginMgr", "Login")
            --或
            Modules.Login:OpenUI("Login")
        end
    )

    local btnPlayerInfo = self.transform:Find("BtnPlayerInfo")
    btnPlayerInfo:OnClick(
        function()
            --CommandManager.Execute(CommandID.OpenUI, "PlayerMgr")
            --或
            Modules.Player:OpenUI("PlayerInfo")
        end
    )

    local btnDailyReward = self.transform:Find("BtnDailyReward")
    btnDailyReward:OnClick(
        function()
            --CommandManager.Execute(CommandID.OpenUI, "DailyRewardMgr", "DailyReward")
            --或
            Modules.DailyReward:OpenUI("DailyReward")
        end
    )

    local btnBtnShop = self.transform:Find("BtnShop")
    btnBtnShop:OnClick(
        function()
            --CommandManager.Execute(CommandID.OpenUI, "ShopMgr")
            --或
            Modules.Shop:OpenUI("Shop")
        end
    )

    local btnFight = self.transform:Find("BtnFight")
    btnFight:OnClick(
        function()
            --CommandManager.Execute(CommandID.OpenUI, "RoomMgr")
            --或
            Modules.Room:OpenUI("RoomSelect")
        end
    )

    local btnAlert = self.transform:Find("BtnAlert")
    btnAlert:OnClick(
        function()
            local alert = Modules.Common:OpenUI("Alert")
            alert:SetContent("底层无特效，无需动态添加Canvas")
        end
    )
end

function LobbyMain:OnEnable()
    self.super.OnEnable(self)
    UpdateBeat:AddListener(self.updateHandler)
end

function LobbyMain:OnDisable()
    self.super.OnDisable(self)
    UpdateBeat:RemoveListener(self.updateHandler)
end

function LobbyMain:Update()
    if Input.GetMouseButtonUp(1) then
        local alert = Modules.Common:OpenUI("Alert")
        alert:SetContent("鼠标右键事件")
    end
end

return LobbyMain
