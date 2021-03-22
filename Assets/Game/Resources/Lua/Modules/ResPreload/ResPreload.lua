local BaseUI = require "Core.BaseUI"
local ResPreload = class("ResPreload", BaseUI)

function ResPreload:prefabPath()
    return "Prefabs/Common/ResPreload"
end

function ResPreload:onAwake()
    self.super.onAwake(self)
    self.slider = self.transform:Find("Slider"):GetComponent("Slider")
end

function ResPreload:onStart()
    self.super.onStart(self)
    local preloadPrefabPaths = {
        "Prefabs/Lobby"
    }
    ResManager.PreloadLocalAssetBundles(
        preloadPrefabPaths,
        function(progress)
            self.slider.value = progress
            if progress == 1 then
                Destroy(self.gameObject)
                --最后一个参数不传，默认是1
                CommandManager.execute(CommandID.OpenUI, ModuleID.Login, 2)
            end
        end
    )
end

return ResPreload
