local BaseMgr = require "Core.BaseMgr"
local DailyRewardMgr = class("DailyRewardMgr", BaseMgr)

function DailyRewardMgr:ctor()
    self.super.ctor(self)
    self:addUI(1, require "Modules.Activities.DailyReward.DailyReward")
    self:addUI(11, require "Modules.Activities.DailyReward.DailyReward_Content_1")
    self:addUI(12, require "Modules.Activities.DailyReward.DailyReward_Content_2")
end

return DailyRewardMgr
