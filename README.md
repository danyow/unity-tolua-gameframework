# Unity-ToLua-GameFramework 

（框架文件夹ToLuaGameFramework，拖入到你的工程里即可。但是熟悉本框架之前建议整个Demo工程全部下载，业务层开发都在LuaDev里）

#### 介绍

- 基于toLua扩展的Unity热跟新实用框架，继承MonoBehaviour常用的生命周期，方便管理组件逻辑。

- 使用UI栈自动管理层级，支持消息机制唤起UI，高度解耦，代码简单高效。

- 集成DOTween并做了一些少量扩展。

- LuaDev目录下常用功能界面已形成，接着往下开发即可，开箱即用，方便快捷。

- 更多功能不断完善中......


#### 快速使用 (请下载工程配合查阅对照，本文档针对工程LuaDev目录进行讲解)

- 两种模式：

1.  开发模式：LuaConfig.cs里将UseAssetBundleLua和UseAssetBundleRes设置为false，读取LuaDev目录下实时编写的代码。 
2.  发布模式：LuaConfig.cs里将UseAssetBundleLua和UseAssetBundleRes设置为true，加载AB包里的代码。菜单ToLuaUIFramework->Build XXX AssetBundle。 

- 本框架推荐C#只用来简单的加载Lua资源和启动Lua框架,游戏逻辑全部在Lua里开发。

- C#的开始：  

1.  修改LuaConfig.cs中的LuaDevPath定义您的开发目录。  

2.  开发目录内创建Lua目录和Prefabs目录，建议两个文件夹名称不要修改。UI图集、模型、音效等素材可放在开发目录外。以保证开发目录干净整洁  

    注册好各种事件，然后直接调用 LuaMain.Instance.StartFramework() 即可
```
        MessageCenter.Add(MsgEnum.ABLoadingBegin, (BaseMsg msg) =>
        {
            text.text = "正在更新资源";
            slider.value = 0;
        });
        MessageCenter.Add(MsgEnum.ABLoadingError, (BaseMsg msg) =>
        {
            text.text = msg.args[0].ToString();
        });
        MessageCenter.Add(MsgEnum.ABLoadingProgress, (BaseMsg msg) =>
        {
            float progress = float.Parse(msg.args[0].ToString());
            text.text = Mathf.FloorToInt(progress * 100) + "%";
            slider.value = progress;
        });
        MessageCenter.Add(MsgEnum.ABLoadingFinish, (BaseMsg msg) =>
        {
            Debug.Log("更新完成");
        });
        MessageCenter.Add(MsgEnum.RunLuaMain, (BaseMsg msg) =>
        {
            Debug.Log("开始执行Lua的Main脚本");
            Destroy(text.gameObject);
            Destroy(slider.gameObject);
            MessageCenter.Remove(MsgEnum.ABLoadingBegin);
            MessageCenter.Remove(MsgEnum.ABLoadingError);
            MessageCenter.Remove(MsgEnum.ABLoadingProgress);
            MessageCenter.Remove(MsgEnum.ABLoadingFinish);
            MessageCenter.Remove(MsgEnum.RunLuaMain);
        });

        //启动框架
        LuaMain.Instance.StartFramework();

        //执行该命令，会自动检测下载 LuaConfig.cs里的ExportRes_For_Startup字典里的资源，完成后执行Main.lua
        //而LuaConfig.cs里的ExportRes_For_Delay字典里的资源不会下载，开发者可在Lua代码内部使用前下载，方法见下文第10点。
        
```

- 开始全游戏Lua代码：

Prefabs内放好预设体。建议Lua目录内创建结构一样的子目录结构，目录内创建对应的UI控制Lua脚本。如果是UI，继承BaseUI，否则继承LuaBahaviour。方式如下:  
  
Login.lua继承BaseUI:  
```
    local BaseUI = require "Core.BaseUI"  
    local Login = Class("Login", BaseUI)  
    return Login
```
Ball.lua继承LuaBehaviour:  
```
    local LuaBehaviour = require "Core.LuaBehaviour"  
    local Ball = Class("Ball", LuaBehaviour)  
    return Ball  
```
  
4.  必须重写的方法PrefabPath()(指定所绑定的预设体的路径)：  
```
   local BaseUI = require "Core.BaseUI"  
   local Login = Class("Login", BaseUI)  
  
   function Login:PrefabPath()  
      return "Prefabs/Battle/Actors/Ball" 
   end  
  
   return Login  
```

5. 选择性重写的方法：指定本UI是否参与UI栈的层级管理，如果是某主UI的子页面需要菜单点击才创建的子UI,可重写并返回false。  
   子UI延迟创建时设置了不参与UI栈管理层级，但包含特效需要刷新层级关系的，首次生成时调用UIManager.RefreshSortObjects(self.transform)方法刷新一次即可  
   参考：脚本DailyReward.lua中的onMenuSelect(index)方法
```
function DailyReward_Content_1:IsUIStack()
    return false
end
```

6.  实现经典熟悉的生命周期函数，以及按钮绑定方法、DOTween使用  
```
   local BaseUI = require "Core.BaseUI"  
   local Login = Class("Login", BaseUI)  
  
   function Login:PrefabPath()  
      "Prefabs/Battle/Actors/Ball"
   end  
  
   function Login:Awake()
      self.super.Awake(self)

      --按钮的绑定
      self.btnClose = self.transform:Find("BtnClose")  
      self.btnClose:OnClick(function()  
          Destroy(self.gameObect)
      end)  

   end

   function Login:OnEnable() 
       self.super.OnEnable(self)
   end  

   function Login:Start()  
      --DOTween使用（本框架扩展了DOTween的整界面同时透明动画的方法，支持重载以忽略某些参数，详见DOTweenExtend.cs）     
      --self.transform:DOAlpha(初始透明度，目标透明度，动画时长，缓动方式，是否包含所有子节点)  
      self.transform:DOAlpha(0, 1, 1.5, Ease.OutExpo, true):OnComplete(function()
          Log("透明淡入完成")  
      end)  
   end  

   function Login:Update()  
       --这里每帧执行一次
   end

   function Login:FixedUpdate()  
       --这里每帧执行一次
   end

   function Login:LateUpdate()  
       --这里每帧执行一次
   end

   function Login:OnDisable()  
       self.super.onDisable(self)
   end  

   function Login:OnDestroy()  
       self.super.onDestroy(self)
   end  
  
   return Login
```

7.  正式生成UI，三种方式：
    
- 直接New()： 比如：Main.lua里创建预加载界面的方法
```
    local PreloadUI = require "Modules.ResPreload.ResPreload"
    PreloadUI:New()
    或
    local parent = GameObject.Find("MainCanvas").transform
    PreloadUI:New(parent)
```
- 分模块开发，在各自模块里管理对应UI集合，通过发送命令展示：（高度解耦，数据隔离，大项目推荐）  
    第1步：创建模块类（如Demo中的LoginMgr）,并在Ctor()添加好该模块各个UI类  
    第2步：Enum文件里创建一个模块ID，并注册到ModuleRegister  
    第3步：发送一个命令，即可展示UI  
    注：模块管理器与UI之间的相互访问，可参考Login.lua和LoginMgr.lua  

    模块类基础内容：
```
    local BaseMgr = require "Core.BaseMgr"
    local LobbyMainMgr = Class("LobbyMainMgr", BaseMgr)

    function LobbyMainMgr:Ctor()
        self.super.Ctor(self)
        self:AddUI("LobbyMain", require "Modules.Lobby.LobbyMain.LobbyMain")
    end

    return LobbyMainMgr
```

   触发打开
```
    CommandManager.Execute(CommandID.OpenUI, "LobbyMainMgr", "LobbyMain"，父级(可选))  

    --发送命令适合跨模块使用，不想用命令也可以调用方法实现打开UI(适合模块内使用,或需要得到UI对象进行进一步赋值时使用)

    local alert = Modules.Common:OpenUI("Alert")
    alert:setContent("Hello Lua")
```
- 以上是对象有脚本绑定的打开方法，如果简单一个无绑定的对象，用以下方法即可：
```
    local go = ResManager.SpawnPrefab(预设体在Resources目录下的路径，父级(可选))
```

8.  按钮事件的绑定（两种写法）
- 第1种写法：绑定内部函数，无需传self，循环参数i可直接引用,不会被循环覆盖
```
    for i = 1,10 do
        local btn = self.transform:Find("Btn_"..i)
        btn:OnClick(function()
            --这里完全可以直接引用循环中的“i”值做计算
            Log(i)
        end)
    end
```
- 第2种写法，绑定外部函数，需要传self，循环参数i需要当参数透传,放在第三位（self之后）
```
    function MyClass:Awake()
        for i = 1,10 do
            local btn = self.transform:Find("Btn_"..i)
            btn:OnClick(self.OnBtnClick, self, i)
        end
    end
    function MyClass:OnBtnClick(index)
        Log(index)
    end
```
- 以上为点击放开时触发，若需按下时就触发，可将OnClick方法换成OnDown方法

9.  创建时指定父级的三种方法：  
- 第1种：New传入
```
    local PreloadUI = require "Modules.ResPreload.ResPreload"
    PreloadUI:New(parent)
```
- 第2种：发送命令时当参数携带
```
    CommandManager.execute(CommandID.OpenUI, "模块类名", 模块管理类里的UI索引(可选)，父级(可选))
```
- 第3种：修改模块管理器的基类（BaseMgr.lua）公共方法，当以上两种都不传时，将默认以此为父级
```
    function BaseMgr:DefaultParent()
        --TODO:请根据项目实际情况修改
        local parent = GameObject.Find("MainCanvas").transform
        return parent
    end
```

10.  延迟下载资源的后续下载方法：  
- 资源配置：配在LuaConfig.cs的ExportRes_For_Delay字典里，启动框架时会忽略这里的资源不会下载
- Lua代码里判断下载后进入
```
    local btnDailyReward = self.transform:Find("BtnDailyReward")
    btnDailyReward:OnClick(
        function()
            if ResManager.instance:IsABLoaded("Prefabs/Activities/DailyReward") and
               ResManager.instance:IsABLoaded("Prefabs/Activities/DailyTask") then
                Modules.DailyReward:OpenUI("DailyReward")
            else
                local abs = {"Prefabs/Activities/DailyReward", "Prefabs/Activities/DailyTask"}
                ResManager.instance:UpdateABsByNames(abs, function(name, progress, allCompleted)
                    Log(progress, name .. "progress")
                    if allCompleted then
                        Modules.DailyReward:OpenUI("DailyReward")
                    end
                end)
            end
        end
    )
```

#### 关于UI栈  

1. 特性
- 继承BaseUI后，UI自动受UI栈管理。即每生成一个UI界面都会自动压入UI栈，Destroy后自动出栈，默认情况下除栈顶之外的其他UI自动隐藏，只需发送命令打开新UI即可，前一个UI无需多加代码关闭。栈顶的UI被Destroy出栈后，新的栈顶UI会自动显示，无需多写代码激活。如果不希望关闭UI后自动显示前一个UI,可在打开新UI命令前，先将当前UI进行Destroy即可

- 当某些UI因特殊情况需要自己添加Canvas并且指定独立的Camera的情况，本UI栈会将其生成在场景根目录，指定的父级无效，并且会与无Canvas的普通UI合理排序，无需自行处理（例如：工程内的预设体BattleUI）

- 所以：当打开一个UI后，想跳回原来的UI，有两种方法：方法1：直接Destroy自己，无需再发送命令打开前UI。方法2：直接用命令或者模块方法打开前UI，无需多写代码关掉自己

- 继承BaseUI后，通过发送命令打开新UI时，UI将被当成一个单例使用。系统先从栈内查找，如果找到则直接移到栈顶显示，不会重复创建新UI

2.  特殊情况：
- 情况1：某些UI需要常驻被覆盖也不隐藏的，只需重写以下方法并返回true即可
```
    function FirstUI:KeepActive()  
       return true
    end  
```
- 情况2：当新打开的UI属于悬浮弹窗，则前一个UI要保持显示不能隐藏的，只需在悬浮窗UI里重写以下方法并返回true即可
```
    function FirstUI:IsFloat()  
       return true
    end  
```
3. 刷新UI栈：当创建UI后又动态在onAwake里指定Canvas的Camera，或者因为动态添加特效需要调整层级的，必须用以下方法刷新一次UI栈，以便框架重新排列sortingOrder的关系。  
```
    --有特效添加的先调用该方法再刷新
    UIManager.RefreshSortObjects(self.transform)

    --否则只调用该方法即可
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
    function LuaBehaviour:DestroyABAfterSpawn()
        return true
    end
```

4. 如果Lua类重写该方法，在所有被创建出来的预设体被删除之后将会立即清除内存里的AssetBundle资源  
```
    function LuaBehaviour:DestroyABAfterAllSpawnDestroy()
        return true
    end
```

5. 销毁所有已加载的AssetBundle，当传入参数为true时，将连同预设体克隆出来的的资源一起清除，如果对象还在场景中，体现为资源丢失的紫色效果  
```
    ResManager:UnloadAllAssetBundles(false)
```
