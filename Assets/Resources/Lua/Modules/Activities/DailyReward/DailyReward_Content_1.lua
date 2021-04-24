local BaseUI = require "Core.BaseUI"
local DailyReward_Content_1 = Class("DailyReward_Content_1", BaseUI)

function DailyReward_Content_1:prefabPath()
    return "Prefabs/Activities/DailyReward/DailyReward_Content_1"
end

function DailyReward_Content_1:isUIStack()
    return false
end

function DailyReward_Content_1:onAwake()
    self.super.onAwake(self)

    local btnAlert = self.transform:Find("BtnAlert")
    btnAlert:OnClick(
        function()
            local alert = Module.get(ModuleID.Common):openUI(1)
            alert:setContent("动态添加Canvas以盖住特效")
        end
    )
end

return DailyReward_Content_1
