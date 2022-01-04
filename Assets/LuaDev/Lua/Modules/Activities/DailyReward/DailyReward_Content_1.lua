local BaseUI = require "Core.BaseUI"
local DailyReward_Content_1 = Class("DailyReward_Content_1", BaseUI)

function DailyReward_Content_1:PrefabPath()
    return "Prefabs/Activities/DailyReward/DailyReward_Content_1"
end

function DailyReward_Content_1:IsUIStack()
    return false
end

function DailyReward_Content_1:Awake()
    self.super.Awake(self)

    local btnAlert = self.transform:Find("BtnAlert")
    btnAlert:OnClick(
        function()
            local alert = Modules.Common:OpenUI("Alert")
            alert:SetContent("动态添加Canvas以盖住特效")
        end
    )
end

return DailyReward_Content_1
