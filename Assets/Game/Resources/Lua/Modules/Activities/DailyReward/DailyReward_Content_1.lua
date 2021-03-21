local BaseUI = require "Core.BaseUI"
local DailyReward_Content_1 = class("DailyReward_Content_1", BaseUI)

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
            CommandManager.execute(CommandID.OpenUI, ModuleId.Common, 1)
        end
    )
end

return DailyReward_Content_1
