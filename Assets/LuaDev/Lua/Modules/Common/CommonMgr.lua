local BaseMgr = require "Core.BaseMgr"
local CommonMgr = Class("CommonMgr", BaseMgr)

function CommonMgr:Ctor()
    self.super.Ctor(self)
    self:AddUI(1, require "Modules.Common.Alert")
end

return CommonMgr
