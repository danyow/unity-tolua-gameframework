local BaseUI = require "Core.BaseUI"
local DailyReward_Content_2 = class("DailyReward_Content_2", BaseUI)

function DailyReward_Content_2:prefabPath()
    return "Prefabs/Activities/DailyReward/DailyReward_Content_2"
end

function DailyReward_Content_2:isUIStack()
    return false
end

function DailyReward_Content_2:onAwake()
    self.super.onAwake(self)

    
end

return DailyReward_Content_2
