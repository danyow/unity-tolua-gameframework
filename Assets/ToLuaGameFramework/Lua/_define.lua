--Unity对象
Application = UnityEngine.Application
GameObject = UnityEngine.GameObject
Transform = UnityEngine.Transform
Input = UnityEngine.Input
Slider = UnityEngine.UI.Slider
PlayerPrefs = UnityEngine.PlayerPrefs
EventTrigger = UnityEngine.EventSystems.EventTrigger
HorizontalLayoutGroup = UnityEngine.UI.HorizontalLayoutGroup
VerticalLayoutGroup = UnityEngine.UI.VerticalLayoutGroup
LayoutRebuilder = UnityEngine.UI.LayoutRebuilder
Random = UnityEngine.Random

--C#对象
EventManager = ToLuaGameFramework.EventManager
ResManager = ToLuaGameFramework.ResManager
UIManager = ToLuaGameFramework.UIManager
SoundManager = ToLuaGameFramework.SoundManager
HttpManager = ToLuaGameFramework.HttpManager

--C#工具或方法
MD5 = {
    StirngToMD5 = ToLuaGameFramework.LMD5.StirngToMD5,
    BytesToMD5 = ToLuaGameFramework.LMD5.BytesToMD5,
    FileToMD5 = ToLuaGameFramework.LMD5.FileToMD5
}
AES = {
    Encrypt = ToLuaGameFramework.LAES.Encrypt,
    Decrypt = ToLuaGameFramework.LAES.Decrypt
}
LUtils = ToLuaGameFramework.LUtils

--第三方json插件(用法：JSON.decode(),JSON.encode())
JSON = require "cjson"

--Lua工具
LButton = ToLuaGameFramework.LButton
LButtonEffect = ToLuaGameFramework.LButtonEffect
