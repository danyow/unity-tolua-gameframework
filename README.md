# Unity-ToLua-UIFramework

#### 介绍

- 基于toLua扩展的Unity热跟新实用框架，完全继承MonoBehaviour生命周期，开箱即用。

- 组件内定制AssetBundle回收方案，内存管理你说了算。

- 使用UI栈自动管理层级，消息机制唤起UI，高度解耦，代码简单高效。

- 集成DOTween并扩展transform.DOAlpha方法，方便整个界面多节点一次性透明动画。

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
