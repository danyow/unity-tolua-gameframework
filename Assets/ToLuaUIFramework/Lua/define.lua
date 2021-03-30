--Unity对象
GameObject = UnityEngine.GameObject
Input = UnityEngine.Input
Slider = UnityEngine.UI.Slider

--C#对象
EventManager = ToLuaUIFramework.EventManager
ResManager   = ToLuaUIFramework.ResManager
UIManager    = ToLuaUIFramework.UIManager
SoundManager = ToLuaUIFramework.SoundManager
HttpManager  = ToLuaUIFramework.HttpManager

--第三方json插件(用法：JSON.decode(),JSON.encode())
JSON = require "cjson"

--Lua工具
BButton             = ToLuaUIFramework.BButton
BButtonTrigger      = ToLuaUIFramework.BButtonTrigger