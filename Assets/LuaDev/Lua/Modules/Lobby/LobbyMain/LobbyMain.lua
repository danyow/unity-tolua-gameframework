local BaseUI = require "Core.BaseUI"
local LobbyMain = Class("LobbyMain", BaseUI)

function LobbyMain:prefabPath()
    return "Prefabs/Lobby/LobbyMain/LobbyMain"
end

function LobbyMain:onAwake()
    self.super.onAwake(self)

    self.updateHandler = UpdateBeat:CreateListener(self.update, self)

    local btnLogout = self.transform:Find("BtnLogout")
    btnLogout:OnClick(
        function()
            --CommandManager.execute(CommandID.OpenUI, ModuleID.Login)
            --或
            Module.Get(ModuleID.Login):openUI(1)
        end
    )

    local btnPlayerInfo = self.transform:Find("BtnPlayerInfo")
    btnPlayerInfo:OnClick(
        function()
            --CommandManager.execute(CommandID.OpenUI, ModuleID.Player)
            --或
            Module.Get(ModuleID.Player):openUI(1)
        end
    )

    local btnDailyReward = self.transform:Find("BtnDailyReward")
    btnDailyReward:OnClick(
        function()
            CommandManager.execute(CommandID.OpenUI, ModuleID.DailyReward)
            --或
            --Module.Get(ModuleID.DailyReward):openUI(1)
        end
    )

    local btnBtnShop = self.transform:Find("BtnShop")
    btnBtnShop:OnClick(
        function()
            CommandManager.execute(CommandID.OpenUI, ModuleID.Shop)
            --或
            --Module.Get(ModuleID.Shop):openUI(1)
        end
    )

    local btnFight = self.transform:Find("BtnFight")
    btnFight:OnClick(
        function()
            CommandManager.execute(CommandID.OpenUI, ModuleID.Room)
            --或
            --Module.Get(ModuleID.Room):openUI(1)
        end
    )

    local btnAlert = self.transform:Find("BtnAlert")
    btnAlert:OnClick(
        function()
            local alert = Module.Get(ModuleID.Common):openUI(1)
            alert:setContent("底层无特效，无需动态添加Canvas")
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
        local alert = Module.Get(ModuleID.Common):openUI(1)
        alert:setContent("鼠标右键事件")
    end
end

return LobbyMain
