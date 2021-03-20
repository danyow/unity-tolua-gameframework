local BaseMgr = require "Core.BaseMgr"
local CommonMgr = class("CommonMgr", BaseMgr)

function CommonMgr:ctor()
    self.super.ctor(self)
    self:addUI(1, require "Modules.Common.Alert")
end

return CommonMgr
