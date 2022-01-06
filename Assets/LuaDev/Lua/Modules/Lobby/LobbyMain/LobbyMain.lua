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
            Modules.Login:OpenUI("Login")
            --或
            --CommandManager.Execute(CommandID.OpenUI, "LoginMgr", "Login")
        end
    )

    local btnPlayerInfo = self.transform:Find("BtnPlayerInfo")
    btnPlayerInfo:OnClick(
        function()
            Modules.Player:OpenUI("PlayerInfo")
            --或
            --CommandManager.Execute(CommandID.OpenUI, "PlayerMgr")
        end
    )

    local btnDailyReward = self.transform:Find("BtnDailyReward")
    btnDailyReward:OnClick(
        function()
            if ResManager.instance:IsABLoaded("Prefabs/Activities/DailyReward") then
                Modules.DailyReward:OpenUI("DailyReward")
            else
                local abs = {"Prefabs/Activities/DailyReward"}
                ResManager.instance:UpdateABsByNames(abs, function(name, progress, allCompleted)
                    Log(progress, name .. "progress")
                    if allCompleted then
                        Modules.DailyReward:OpenUI("DailyReward")
                    end
                end)
            end
        end
    )

    local btnBtnShop = self.transform:Find("BtnShop")
    btnBtnShop:OnClick(
        function()
            Modules.Shop:OpenUI("Shop")
            --或
            --CommandManager.Execute(CommandID.OpenUI, "ShopMgr")
        end
    )

    local btnFight = self.transform:Find("BtnFight")
    btnFight:OnClick(
        function()
            Modules.Room:OpenUI("RoomSelect")
            --或
            --CommandManager.Execute(CommandID.OpenUI, "RoomMgr")
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
