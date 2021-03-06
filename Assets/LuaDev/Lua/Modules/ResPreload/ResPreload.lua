local BaseUI = require "Core.BaseUI"
local ResPreload = Class("ResPreload", BaseUI)

function ResPreload:PrefabPath()
    return "Prefabs/Preload/ResPreload"
end

function ResPreload:Awake()
    self.super.Awake(self)
    self.slider = self.transform:Find("Slider"):GetComponent("Slider")
    self.slider.value = 0
end

function ResPreload:Start()
    self.super.Start(self)
    local preloadPrefabPaths = {
        "Prefabs/Lobby"
    }
    ResManager.PreloadLocalAssetBundles(
        preloadPrefabPaths,
        function(progress)
            self.slider.value = progress
            if progress == 1 then
                coroutine.start(function()
                    coroutine.wait(0.2)
                    Destroy(self.gameObject)
                    --最后一个参数不传，默认是1
                    CommandManager.Execute(CommandID.OpenUI, "LoginMgr", "Login")
                end)
            end
        end
    )
end

return ResPreload
