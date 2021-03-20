local BaseMgr = require "Core.BaseMgr"
local DailyReward = class("DailyReward", BaseMgr)

function DailyReward:ctor()
    self.super.ctor(self)
    self:addUI(1, require "Modules.Activities.DailyReward.DailyReward")
end

return DailyReward
