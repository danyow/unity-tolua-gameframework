local BaseUI = require "Core.BaseUI"
local DailyReward = Class("DailyReward", BaseUI)

function DailyReward:PrefabPath()
    return "Prefabs/Activities/DailyReward/DailyReward"
end

function DailyReward:IsFloat()
    return true
end

function DailyReward:Awake()
    self.super.Awake(self)

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

    --内容页
    self.contentRoot = self.transform:Find("MainPanel/ContentRoot")
    self.contents = {}

    local btnClose = self.transform:Find("MainPanel/BtnClose")
    btnClose:OnClick(
        function()
            Destroy(self.gameObject)
        end
    )
end

function DailyReward:OnEnable()
    self.super.OnEnable(self)

    --黑色蒙版动画
    self.transform:DOAlpha(0, 0.5, 0.3, Ease.OutSine, false)

    --小对话框动画
    self.mianPanel.anchoredPosition = Vector2(0, -200)
    self.mianPanel:DOLocalMove(Vector3.one, 0.3):SetEase(Ease.OutBack)

    self:onMenuSelect(1)
end

function DailyReward:onMenuSelect(index)
    self.currSelectIndex = index
    for i = 1, #self.menus do
        local btn = self.menus[i]
        btn.on.gameObject:SetActive(i == index)
        btn.off.gameObject:SetActive(i ~= index)
    end

    if not self.contents[index] then
        local contentIndexInModule = 10 + index
        self.contents[self.currSelectIndex] = self.module:OpenUI(contentIndexInModule, self.contentRoot)
        UIManager.RefreshSortObjects(self.transform)
    end
    for i = 1, #self.menus do
        local content = self.contents[i]
        if content then
            content.gameObject:SetActive(i == self.currSelectIndex)
        end
    end
end

return DailyReward
