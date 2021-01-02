# Unity-ToLua-UIFramework

#### 介绍

- 基于toLua扩展的Unity热跟新实用框架，继承MonoBehaviour常用的生命周期，方便管理组件逻辑。

- 组件内定制AssetBundle回收方案，内存管理你说了算。

- 使用UI栈自动管理层级，消息机制唤起UI，高度解耦，代码简单高效。

- 集成DOTween并扩展transform.DOAlpha方法，方便整个界面多节点一次性透明动画。

- 内置常规RPG游戏UI实例，开箱即用。

- 更多功能不断完善中......


#### 快速使用

- 两种模式：

1.  开发模式：Config.cs里将UseAssetBundle设置为false。lua代码和预设体都放入Resources目录里开发，方便即写即跑快速调试，出母包时将Resources文件名改名以排除打包
2.  发布模式：Config.cs里将UseAssetBundle设置为true。菜单ToLuaUIFramework->Build XXX AssetBundle（此时Resources不要改名）

- 开始码代码：

1.  修改Config.cs中的GameResourcesPath定义您的开发目录，必须是Resources目录

2.  Resources内创建Lua目录和Prefabs目录，强烈建议两个文件夹名称不要修改。其他UI和模型可放在Resources目录外。以保证开发目录干净整洁

3.  Prefabs内放好预设体。建议Lua目录内创建结构一样的子目录结构，并Lua目录内创建预设体对应的UI控制Lua脚本。如果是UI，Lua类继承BaseUI，否则继承LuaBahaviour。继承方式如下:  

local BaseUI = require "Core.BaseUI"  
local FirstUI = class("FirstUI", BaseUI)  
return FirstUI  
    
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
