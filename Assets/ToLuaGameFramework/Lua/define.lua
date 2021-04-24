--Unity对象
GameObject = UnityEngine.GameObject
Input = UnityEngine.Input
Slider = UnityEngine.UI.Slider

--C#对象
EventManager = ToLuaGameFramework.EventManager
ResManager   = ToLuaGameFramework.ResManager
UIManager    = ToLuaGameFramework.UIManager
SoundManager = ToLuaGameFramework.SoundManager
HttpManager  = ToLuaGameFramework.HttpManager

--第三方json插件(用法：JSON.decode(),JSON.encode())
JSON = require "cjson"

--Lua工具
BButton             = ToLuaGameFramework.BButton
BButtonTrigger      = ToLuaGameFramework.BButtonTrigger

--项目自定义
--LanguageManager     = BToolkit.LanguageManager
--CopyAndPaste        = BToolkit.CopyAndPaste
--TextureDownloader   = BToolkit.TextureDownloader
--TopTip              = MainCtrl.TopTip
--TopDialog           = MainCtrl.TopDialog
--UrlConfig           = Client.Common.UrlConfig
--GameData            = Client.Common.GameData
--HttpRequest         = Client.Common.HttpRequest
--TopRecharge_Online  = Client.Common.TopRecharge_Online
--PanelMoNiTiXian     = Lobby.UI.PanelMoNiTiXian