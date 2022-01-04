local BaseMgr = require "Core.BaseMgr"
local DailyRewardMgr = Class("DailyRewardMgr", BaseMgr)

function DailyRewardMgr:Ctor()
    self.super.Ctor(self)
    self:AddUI(1, require "Modules.Activities.DailyReward.DailyReward")
    self:AddUI(11, require "Modules.Activities.DailyReward.DailyReward_Content_1")
    self:AddUI(12, require "Modules.Activities.DailyReward.DailyReward_Content_2")
end

return DailyRewardMgr
