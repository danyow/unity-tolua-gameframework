# Unity-Lua-Framework

#### 介绍

- 基于toLua扩展的Unity热跟新实用框架，完全继承MonoBehaviour生命周期，开箱即用。

- 组件内控制AssetBundle回收，内存管理你说了算。

- 自带Tween动画模块，一行代码实现动画，比DotTween、LeanTween等四大Tween工具更加灵活轻便。

- 更多功能不断完善中......


#### 软件架构

- 暂无。。。

#### 安装教程

1.  将LuaFramework拖入工程里，参考LuaFramework以外的目录Demo使用即可。

2.  预加载本地AssetBundle
    local paths = {
        "Assets/Resources/Prefabs/LobbyUI"
    }
    ResManager:PreloadLocalAssetBundles(
        paths,
        function(progress)
            self.slider.value = progress
            if progress == 1 then
                --进入登录
            end
        end
    )
	销毁所有已加载的AssetBundle
	ResManager:UnloadAllAssetBundles(false)



#### 使用说明

1.  待更新。。。
