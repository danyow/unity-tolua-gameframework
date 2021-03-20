local BaseUI = require "Core.BaseUI"
local PlayerInfo = class("PlayerInfo", BaseUI)

function PlayerInfo:prefabPath()
    return "Prefabs/Lobby/PlayerInfo/PlayerInfo"
end

function PlayerInfo:isFloat()
    return true
end

function PlayerInfo:onAwake()
    self.super.onAwake(self)

    self.dialog = self.transform:Find("Dialog")

    local btnBack = self.transform:Find("Dialog/BtnBack")
    btnBack:OnClick(
        function()
            Destroy(self.gameObject)
        end
    )

    local btnAlert = self.transform:Find("Dialog/BtnAlert")
    btnAlert:OnClick(
        function()
            --CommandManager.execute(CommandID.OpenUI, ModuleId.Alert)
        end
    )
end

function PlayerInfo:onEnable()
    self.super.onEnable(self)

    --黑色蒙版动画
    self.transform:DOAlpha(0, 0.5, 0.3, Ease.OutSine, false)

    --小对话框动画
    self.dialog.anchoredPosition = Vector2(0, -200)
    self.dialog:DOLocalMove(Vector3.one, 0.3):SetEase(Ease.OutBack)
end

return PlayerInfo
