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
            --CommandManager.Execute(CommandID.OpenUI, ModuleID.Login)
            --或
            Module.Get(ModuleID.Login):OpenUI(1)
        end
    )

    local btnPlayerInfo = self.transform:Find("BtnPlayerInfo")
    btnPlayerInfo:OnClick(
        function()
            --CommandManager.Execute(CommandID.OpenUI, ModuleID.Player)
            --或
            Module.Get(ModuleID.Player):OpenUI(1)
        end
    )

    local btnDailyReward = self.transform:Find("BtnDailyReward")
    btnDailyReward:OnClick(
        function()
            CommandManager.Execute(CommandID.OpenUI, ModuleID.DailyReward)
            --或
            --Module.Get(ModuleID.DailyReward):OpenUI(1)
        end
    )

    local btnBtnShop = self.transform:Find("BtnShop")
    btnBtnShop:OnClick(
        function()
            CommandManager.Execute(CommandID.OpenUI, ModuleID.Shop)
            --或
            --Module.Get(ModuleID.Shop):OpenUI(1)
        end
    )

    local btnFight = self.transform:Find("BtnFight")
    btnFight:OnClick(
        function()
            CommandManager.Execute(CommandID.OpenUI, ModuleID.Room)
            --或
            --Module.Get(ModuleID.Room):OpenUI(1)
        end
    )

    local btnAlert = self.transform:Find("BtnAlert")
    btnAlert:OnClick(
        function()
            local alert = Module.Get(ModuleID.Common):OpenUI(1)
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
        local alert = Module.Get(ModuleID.Common):OpenUI(1)
        alert:SetContent("鼠标右键事件")
    end
end

return LobbyMain
