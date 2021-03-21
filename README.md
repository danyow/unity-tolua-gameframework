# Unity-ToLua-UIFramework 

（示例工程适合Unity 2019.1.9f1,其他版本可能出现语法兼容问题而报错，请自行根据版本变换语法）

#### 介绍

- 基于toLua扩展的Unity热跟新实用框架，继承MonoBehaviour常用的生命周期，方便管理组件逻辑。

- 组件内定制AssetBundle回收方案，内存管理你说了算。

- 使用UI栈自动管理层级，消息机制唤起UI，高度解耦，代码简单高效。

- 集成DOTween并扩展transform.DOAlpha方法，方便整个界面多节点一次性透明动画。

- Game目录下常用功能界面已形成，接着往下开发即可，开箱即用，方便快捷。

- 更多功能不断完善中......


#### 快速使用(请下载工程配合查阅对照，本文档针对工程Game目录进行讲解)

- 两种模式：

1.  开发模式：Config.cs里将UseAssetBundle设置为false。lua代码和预设体都放入Resources目录里开发，方便即写即跑快速调试，出母包时将Resources文件名改名以排除打包
2.  发布模式：Config.cs里将UseAssetBundle设置为true。菜单ToLuaUIFramework->Build XXX AssetBundle（此时Resources不要改名）

- 开始码代码：

1.  修改Config.cs中的GameResourcesPath定义您的开发目录，必须是Resources目录

2.  Resources内创建Lua目录和Prefabs目录，强烈建议两个文件夹名称不要修改。UI图集、模型、音效等素材可放在Resources目录外。以保证开发目录干净整洁

3.  Prefabs内放好预设体。建议Lua目录内创建结构一样的子目录结构，目录内创建对应的UI控制Lua脚本。如果是UI，继承BaseUI，否则继承LuaBahaviour。方式如下:  
  
Login.lua继承BaseUI:  
```
    local BaseUI = require "Core.BaseUI"  
    local Login = class("Login", BaseUI)  
    return Login
```
Ball.lua继承LuaBehaviour:  
```
    local LuaBehaviour = require "Core.LuaBehaviour"  
    local Ball = class("Ball", LuaBehaviour)  
    return Ball  
```
  
4.  必须重写的方法prefabPath()(指定所绑定的预设体的路径)：  
```
   local BaseUI = require "Core.BaseUI"  
   local Login = class("Login", BaseUI)  
  
   function Login:prefabPath()  
      return "Prefabs/Battle/Actors/Ball" 
   end  
  
   return Login  
```

5. 选择性重写的方法：指定创建的父级。不重写时父级默认查找场中的中的MainCanvas节点当父级（可自行修改）。
   第二种指定父级的方式是实例化时new(parent)传参。用本方法指定优先级更高。重写方法并返回nil或""时，new传入才有效。    
```
function Login:getParent()
    return GameObject.Find("MainCanvas").transform
end
```

6.  实现经典熟悉的生命周期函数，以及按钮绑定方法、DOTween使用  
```
   local BaseUI = require "Core.BaseUI"  
   local Login = class("Login", BaseUI)  
  
   function Login:prefabPath()  
      "Prefabs/Battle/Actors/Ball"
   end  
  
   function Login:onAwake()
      self.super.onAwake(self)

      --按钮的绑定
      self.btnClose = self.transform:Find("BtnClose")  
      self.btnClose:OnClick(function()  
          Destroy(self.gameObect)
      end)  

      self.btnClose:OnPointerDown(function()  
          Log("按下了关闭按钮")
      end) 

      --按钮事件支持传递一个参数，放在首位
      self.btnOpenSecondUI = self.transform:Find("BtnOpenSecondUI")  
      self.btnOpenSecondUI:OnClick(传递的参数, function(传递的参数)  
          CommandManager.execute(CommandID.OpenUI, UIID.您定义的UIID)  
      end) 

   end  

   function Login:onEnable() 
       self.super.onEnable(self)
   end  

   function Login:onStart()  
      --DOTween使用（本框架扩展了DOTween的整界面同时透明动画的方法，支持重载以忽略某些参数，详见DOTweenExtend.cs）     
      --self.transform:DOAlpha(初始透明度，目标透明度，动画时长，缓动方式，是否包含所有子节点)  
      self.transform:DOAlpha(0, 1, 1.5, Ease.OutExpo, true):OnComplete(function()
          Log("透明淡入完成")  
      end)  
   end  

   function Login:onDisable()  
       self.super.onDisable(self)
   end  

   function Login:onDestroy()  
       self.super.onDestroy(self)
   end  
  
   return Login
```

7.  Update方法的实现。出于性能考虑，Update方法需要手动注册和注销： 
```
   local BaseUI = require "Core.BaseUI"  
   local Login= class("Login", BaseUI)  
  
   function Login:onAwake()  
       self.super.onAwake(self)

      --定义回调
      self.updateHandler = UpdateBeat:CreateListener(self.update, self)
   end  

   function Login:onEnable()  
       self.super.onEnable(self)

       --开始Update
       UpdateBeat:AddListener(self.updateHandler)
   end  

   function Login:onDisable()  
       self.super.onDisable(self)

       --停止Update
       UpdateBeat:RemoveListener(self.updateHandler)
   end  

   function Login:update()  
       --这里每帧执行一次
   end  
  
   return Login
```

8.  正式生成UI，三种情况：
    
- 直接new()： 比如：Main.lua里创建预加载界面的方法
```
    local PreloadUI = require "Modules.ResPreload.ResPreload"
    PreloadUI:new()
    或
    local parent = GameObject.Find("MainCanvas").transform
    PreloadUI:new(parent)
```
- 分模块开发，在各自模块里管理对应UI集合，通过发送命令展示：（高度解耦，数据隔离，大项目推荐）  
    第1步：创建模块类（如Demo中的LoginMgr）,并在ctor()添加好该模块各个UI类  
    第2步：Define文件里创建一个模块ID，并注册到ModuleRegister  
    第3步：发送一个命令，即可展示UI  
    注：模块管理器与UI之间的相互访问，可参考Login.lua和LoginMgr.lua
```
    CommandManager.execute(CommandID.OpenUI, ModuleId.您定义的UIID, 指定模块里的UI索引(可选)，父级(可选))  
    --发送命令适合跨模块使用，不想用命令也可以这样打开UI(适合模块内使用)
    Module.get(ModuleId.您定义的UIID):openUI(UI索引)
```
- 以上对象有脚本绑定的打开方法，如果简单一个无绑定的对象，用以下方法即可：
```
    local go = ResManager.SpawnPrefab(预设体在Resources目录下的路径，父级(可选))
```

9.  按钮事件的绑定（两种写法）
- 第1种写法：绑定内部函数，无需传self，循环参数可是直接引用
```
    for i = 1,10 do
        local btn = self.transform:Find("Btn_"..i)
        btn:OnClick(function()
            --这里完全可以直接引用循环中的“i”值做计算
            Log(i)
        end)
    end
```
- 第2种写法，绑定外部函数，需要传self，循环参数需要当参数透传
```
    function MyClass:onAwake()
        for i = 1,10 do
            local btn = self.transform:Find("Btn_"..i)
            btn:OnClick(i, self.onBtnClick, self)
        end
    end
    function MyClass:onBtnClick(index)
        Log(index)
    end
```
- 以上为点击放开时触发，若需按下时就触发，可将OnClick方法换成OnDown方法

#### 关于UI栈  

1. 特性
- 继承BaseUI后，UI自动受UI栈管理。即每生成一个UI界面都会自动压入UI栈，Destroy后自动出栈，默认情况下除栈顶之外的其他UI自动隐藏，只需发送命令打开新UI即可，前一个UI无需多加代码关闭。栈顶的UI被Destroy出栈后，新的栈顶UI会自动显示，无需多写代码激活。如果不希望关闭UI后自动显示前一个UI,可在打开新UI命令前，先将当前UI进行Destroy即可
- 继承BaseUI后，通过发送命令打开新UI时，UI将被当成一个单例使用。系统先从栈内查找，如果找到则直接移到栈顶显示，不会重复创建新UI

2.  特殊情况：
- 情况1：某些UI需要常驻被覆盖也不隐藏的，只需重写以下方法并返回true即可
```
    function FirstUI:keepActive()  
       return true
    end  
```
- 情况2：当新打开的UI属于悬浮弹窗，则前一个UI要保持显示不能隐藏的，只需在悬浮窗UI里重写以下方法并返回true即可
```
    function FirstUI:isFloat()  
       return true
    end  
```
3. 刷新UI栈：当创建UI后又动态在onAwake里指定Canvas的Camera，或者因为动态添加特效需要调整层级的，必须用以下方法刷新一次UI栈，以便框架重新排列sortingOrder的关系。  
```
    UIManager:RefreshStack() 
```

#### AssetBundle的操作

1. 导出AssetBundle

- 第1步：导出前配置好Config.cs里的4个目录：OutputPath，RemoteUrl，ExportLuaPaths，ExportResPath  

- 第2步：菜单执行ToLuaUIFramework->Build XXX AssetBundle  

- 第3步：Config.cs里将UseAssetBundle设置为true, 将开发Resources目录改名以免资源被打入母包中，开始出包

2. 预加载（此步骤可做可不做）

如需预加载本地AssetBundle资源，可仿照Game目录下的的ResPreload.lua执行预加载，预加载的目录可自行配进paths数组里  
```
    local paths = {
        "Prefabs/LobbyUI"
    }
    ResManager:PreloadLocalAssetBundles(
        paths,
        function(progress)
            self.slider.value = progress
            if progress == 1 then
                --预加载完成
            end
        end
    )
```

3. 如果Lua类重写该方法，在创建预设体之后将会立即清除内存里的AssetBundle资源  
```
    function LuaBehaviour:destroyABAfterSpawn()
        return true
    end
```

4. 如果Lua类重写该方法，在所有被创建出来的预设体被删除之后将会立即清除内存里的AssetBundle资源  
```
    function LuaBehaviour:destroyABAfterAllSpawnDestroy()
        return true
    end
```

5. 销毁所有已加载的AssetBundle，当传入参数为true时，将连同预设体克隆出来的的资源一起清除，如果对象还在场景中，体现为资源丢失的紫色效果  
```
    ResManager:UnloadAllAssetBundles(false)
```
