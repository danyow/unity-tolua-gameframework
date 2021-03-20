local BaseUI = require "Core.BaseUI"
local DailyReward = class("DailyReward", BaseUI)

function DailyReward:prefabPath()
    return "Prefabs/Activities/DailyReward/DailyReward"
end

function DailyReward:isFloat()
    return true
end

function DailyReward:onAwake()
    self.super.onAwake(self)

    self.mianPanel = self.transform:Find("MainPanel")

    self.menus = {}
    for i = 1, 2 do
        local btn = {}
        self.menus[i] = btn
        btn.trans = self.transform:Find("MainPanel/Menus/Btn" .. i)
        btn.on = btn.trans:Find("On")
        btn.off = btn.trans:Find("Off")
        btn.trans:OnClick(i, self.onMenuSelect, self)
    end

    local btnClose = self.transform:Find("MainPanel/BtnClose")
    btnClose:OnClick(
        function()
            Destroy(self.gameObject)
        end
    )
end

function DailyReward:onEnable()
    self.super.onEnable(self)

    --黑色蒙版动画
    self.transform:DOAlpha(0, 0.5, 0.3, Ease.OutSine, false)

    --小对话框动画
    self.mianPanel.anchoredPosition = Vector2(0, -200)
    self.mianPanel:DOLocalMove(Vector3.one, 0.3):SetEase(Ease.OutBack)

    self:onMenuSelect(1)
end

function DailyReward:onMenuSelect(index)
    Log(self, "self")
    Log(index, "index")
    self.currSelectIndex = index
    for i = 1, #self.menus do
        local btn = self.menus[i]
        btn.on.gameObject:SetActive(i == index)
        btn.off.gameObject:SetActive(i ~= index)
    end
end

return DailyReward
