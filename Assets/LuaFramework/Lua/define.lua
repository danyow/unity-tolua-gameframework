--Unity对象
GameObject = UnityEngine.GameObject
Input = UnityEngine.Input
Slider = UnityEngine.UI.Slider

--C#对象
EventManager = LuaFramework.EventManager
LuaManager   = LuaFramework.LuaManager.instance
ResManager   = LuaFramework.ResManager.instance
UIManager    = LuaFramework.UIManager.instance
SoundManager = LuaFramework.SoundManager.instance

--第三方插件
JSON = require "cjson"

--Lua工具
BButton             = LuaFramework.BButton
ButtonTriggerMethod = BButton.TriggerMethod
ButtonChange        = LuaFramework.ButtonChange
CommandManager      = require "CommandManager"
EventManager        = require "EventManager"
UIEventManager      = require "UIEventManager"
