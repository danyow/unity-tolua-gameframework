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

2.  Resources内创建Lua目录和Prefabs目录，强烈建议两个文件夹名称不要修改。UI图集和模型声音的素材可放在Resources目录外。以保证开发目录干净整洁

3.  Prefabs内放好预设体。建议Lua目录内创建结构一样的子目录结构，并在Lua目录内创建对应的UI控制Lua脚本。如果是UI，继承BaseUI，否则继承LuaBahaviour。方式如下:  
  
FirstUI.lua继承BaseUI:  
```
    local BaseUI = require "Core.BaseUI"  
    local FirstUI = class("FirstUI", BaseUI)  
    return FirstUI  
```
FirstActor.lua继承LuaBehaviour:  
```
    local LuaBehaviour = require "Core.LuaBehaviour"  
    local FirstActor = class("FirstActor", LuaBehaviour)  
    return FirstActor  
```
  
4.  必须重写的方法prefabPath()(指定所绑定的预设体的路径)：  
```
   local BaseUI = require "Core.BaseUI"  
   local FirstUI = class("FirstUI", BaseUI)  
  
   function FirstUI:prefabPath()  
      return "Prefabs/UI/FirstUIPrefab"  
   end  
  
   return FirstUI  
```

5.  实现经典熟悉的回调，以及按钮绑定方法、DOTween使用  
```
   local BaseUI = require "Core.BaseUI"  
   local FirstUI = class("FirstUI", BaseUI)  
  
   function FirstUI:prefabPath()  
      return "Prefabs/UI/FirstUIPrefab"  
   end  
  
   function FirstUI:onAwake()  
      --按钮的绑定
      self.btnClose = self.transform:Find("BtnClose")  
      self.btnClose:OnClick(function()  
          Log("点击了关闭按钮")
      end)  
      self.btnClose:OnPointerDown(function()  
          Log("按下了关闭按钮")
      end) 

      --打开新UI
      self.btnOpenSecondUI = self.transform:Find("BtnOpenSecondUI")  
      self.btnOpenSecondUI:OnClick(function()  
          CommandManager.execute(CommandID.OpenUI, UIID.您定义的UIID)  
      end) 

   end  

   function FirstUI:onEnable()  
   end  

   function FirstUI:onStart()  
      --DOTween使用（本框架扩展了DOTween的整界面同时透明动画的方法，支持重载以忽略某些参数，详见DOTweenExtend.cs）     
      --self.transform:DOAlpha(初始透明度，目标透明度，动画时长，缓动方式，是否包含所有子节点)  
      self.transform:DOAlpha(0, 1, 1.5, Ease.OutExpo, true):OnComplete(function()
          Log("透明淡入完成")  
      end)  
   end  

   function FirstUI:onDisable()  
   end  

   function FirstUI:onDestroy()  
   end  
  
   return FirstUI  
```

6.  注册UI,以实现通过发送命令展示UI，高度解耦：  
    按照Demo定义UIID,然后添加到UIRegisterList.lua内的列表里即可  

7.  通过命令启动UI  
    打开ToLuaUIFramework/Lua/Main.lua脚本，替换第19行开启UI命令里的UIID成你的UIID即可  
```
    CommandManager.execute(CommandID.OpenUI, UIID.您定义的UIID)  
```

8.  不通过发送消息开启UI的方法（即创建预设体的方法）：
```
    local classPath = require "LobbyUI.Lobby.LobbyMain"
    local lobbyUI = classPath:new(parent) 
    --parent没有可不传
    local lobbyUI = classPath:new()
```

快速开始至此告一段落。。。
    
#### 关于UI栈的功能


#### AssetBundle的操作

2.  预加载本地AssetBundle  
```
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
```
    销毁所有已加载的AssetBundle  
```
    ResManager:UnloadAllAssetBundles(false)
```

#### 持续更新中。。。
