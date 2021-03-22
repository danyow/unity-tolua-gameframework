local BaseUI = require "Core.BaseUI"
local PlayerInfo = class("PlayerInfo", BaseUI)

function PlayerInfo:prefabPath()
    return "Prefabs/Lobby/Player/PlayerInfo"
end

function PlayerInfo:isFloat()
    return true
end

function PlayerInfo:onAwake()
    self.super.onAwake(self)

    self.panel = self.transform:Find("Panel")

    local btnBack = self.transform:Find("Panel/OverLayer/BtnBack")
    btnBack:OnClick(
        function()
            Destroy(self.gameObject)
        end
    )

    local btnAlert = self.transform:Find("Panel/OverLayer/BtnAlert")
    btnAlert:OnClick(
        function()
            local alert = Module.get(ModuleID.Common):openUI(1)
            alert:setContent("自动添加Canvas以盖住特效")
        end
    )
end

function PlayerInfo:onEnable()
    self.super.onEnable(self)

    --黑色蒙版动画
    self.transform:DOAlpha(0, 0.5, 0.3, Ease.OutSine, false)

    --小对话框动画
    self.panel.anchoredPosition = Vector2(0, -200)
    self.panel:DOLocalMove(Vector3.one, 0.3):SetEase(Ease.OutBack)
end

return PlayerInfo
