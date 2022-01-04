local BaseUI = require "Core.BaseUI"
local DailyReward_Content_2 = Class("DailyReward_Content_2", BaseUI)

function DailyReward_Content_2:PrefabPath()
    return "Prefabs/Activities/DailyReward/DailyReward_Content_2"
end

function DailyReward_Content_2:IsUIStack()
    return false
end

function DailyReward_Content_2:Awake()
    self.super.Awake(self)

    
end

return DailyReward_Content_2
