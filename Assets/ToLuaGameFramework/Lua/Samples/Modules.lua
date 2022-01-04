--模块创建
Modules = {
    CommonMgr = require "Modules.Common.CommonMgr",
    LoginMgr = require "Modules.Login.LoginMgr",
    SafeBoxMgr = require "Modules.SafeBox.SafeBoxMgr",
    PhoneMgr = require "Modules.Phone.PhoneMgr",
    DDZManager = require "Modules.Game30300801.DDZManager"
}

--实例化
for key, module in pairs(Modules) do
    Modules[key] = module:New()
end
