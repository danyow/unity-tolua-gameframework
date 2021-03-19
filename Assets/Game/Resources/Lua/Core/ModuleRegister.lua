--注册模块
local moduleList = {
    [ModuleId.Login] = require "Modules.Lobby.Login.LoginMgr"
}

local ModuleRegister = {}
function ModuleRegister.init()
    if not ModuleRegister.modules then
        ModuleRegister.modules = {}
        for key, value in pairs(moduleList) do
            ModuleRegister.modules[key] = value:new()
        end
    end
end
return ModuleRegister
