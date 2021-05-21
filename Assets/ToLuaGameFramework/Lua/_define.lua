--Unity对象
GameObject = UnityEngine.GameObject
Input = UnityEngine.Input
Slider = UnityEngine.UI.Slider
PlayerPrefs = UnityEngine.PlayerPrefs
EventTrigger = UnityEngine.EventSystems.EventTrigger

--C#对象
EventManager = ToLuaGameFramework.EventManager
ResManager = ToLuaGameFramework.ResManager
UIManager = ToLuaGameFramework.UIManager
SoundManager = ToLuaGameFramework.SoundManager
HttpManager = ToLuaGameFramework.HttpManager

--C#工具或方法
MD5 = {}
MD5.StirngToMD5 = ToLuaGameFramework.LMD5.StirngToMD5
MD5.BytesToMD5 = ToLuaGameFramework.LMD5.BytesToMD5
MD5.FileToMD5 = ToLuaGameFramework.LMD5.FileToMD5
AES = {}
AES.Encrypt = ToLuaGameFramework.LAES.Encrypt
AES.Decrypt = ToLuaGameFramework.LAES.Decrypt

--第三方json插件(用法：JSON.decode(),JSON.encode())
JSON = require "cjson"

--Lua工具
LButton = ToLuaGameFramework.LButton
LButtonEffect = ToLuaGameFramework.LButtonEffect
