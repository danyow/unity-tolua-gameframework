local uidPool = 0

function Class(classname, super)
    local superType = type(super)
    local cls

    if superType ~= "function" and superType ~= "table" then
        superType = nil
        super = nil
    end

    if super then
        cls = {}
        setmetatable(cls, {__index = super})
        cls.super = super
    else
        cls = {}
    end

    cls.__cname = classname
    cls.__index = cls
    uidPool = uidPool + 1
    cls.__uid = uidPool

    function cls:New(...)
        local instance = setmetatable({}, cls)
        instance.class = cls
        instance:Ctor(...)
        return instance
    end

    return cls
end

function ClearClass(class)
    for i, v in pairs(class) do
        if type(v) ~= "function" then
            class[i] = nil
        end
    end
end

--例：AddLuaComponent(self.gameObject, require "Modules.Common.WealthListener")
--luaCalss：传require对象而不是直接传字符串路径，是为了方便写完可以用Ctrl+光标检测路径的可用性
function AddLuaComponent(transform, luaCalss)
    if IsNil(transform) then
        LogError("transform 为 Null")
        return 
    end
    if IsNil(luaCalss) then
        LogError("luaCalss 为 nil")
        return 
    end
    local haveLuaBahavious = luaCalss.super.__cname == "LuaBehaviour"
    if not haveLuaBahavious then
        local parent = luaCalss.super
        while parent.super and parent.super.__cname == "LuaBehaviour" do
            haveLuaBahavious = true
            break
        end
    end
    if not haveLuaBahavious then
        LogError("必须继承 LuaBehaviour 或 BaseUI 才能使用 AddLuaComponent() 方法")
        return 
    end
    local csharpBehaviour = transform:GetComponent("LuaBehaviour")
    if IsNil(csharpBehaviour) then
        csharpBehaviour = transform.gameObject:AddComponent(typeof(ToLuaGameFramework.LuaBehaviour))
    end
    local com = luaCalss:New()
    csharpBehaviour:AddLuaClass(com, com._OnEnable, com._Start, com._OnDisable,com._OnApplicationFocus, com._OnDestroy)
    com.gameObject = transform.gameObject
    com.transform = transform
    com:_Awake()
    return com
end

--例：
-- local com = AddLuaComponent(gameObject, luaCalss)
-- RemoveLuaComponent(self.gameObject, com)
-- 或
-- RemoveLuaComponent(self.gameObject, require "Modules.Common.WealthListener")
function RemoveLuaComponent(gameObject, luaCalss)
    if IsNil(gameObject) then
        LogError("gameObject 为 Null")
        return 
    end
    if not luaCalss then
        LogError("luaCalss 为 nil")
        return 
    end
    local csharpBehaviour = gameObject:GetComponent("LuaBehaviour")
    if not IsNil(csharpBehaviour) then
        csharpBehaviour:RemoveLuaClass(luaCalss)
    end
end

function Destroy(gameObject)
    if gameObject then
        GameObject.Destroy(gameObject)
    end
end

--C#的long型转number
function LongToNumber(longValue)
    if type(longValue) == "userdata" then
        return tonumber(tostring(longValue))
    end
    return tonumber(longValue)
end

--判断C#对象是否为空
function IsNil(uobj)
    if not uobj then
        return true
    end
    if type(uobj) == "userdata" then
        if not uobj.Equals or uobj:Equals(nil) then
            return true
        end
    end
    return false
end

-- 传回调时附带作用域
function Handler(self, method)
    return function(...)
        return method(self, ...)
    end
end

-- 传入transform, 遍历所有子集设置颜色，ignoreNameList为忽略的节点名
function SetColor(trans, color, ignoreNameList)
	local img = trans:GetComponent("Image")
	if not img then
		img = trans:GetComponent("RawImage")
	end
	if img then
		if ignoreNameList then
			local ignore = false
			for key, value in pairs(ignoreNameList) do
				if img.name == value then
					ignore = true
					break
				end
			end
			if not ignore then
				img.color = color
            else
                return
			end
		else
			img.color = color
		end
	end
	local text = trans:GetComponent("Text")
	if text then
		if ignoreNameList then
			local ignore = false
			for key, value in pairs(ignoreNameList) do
				if text.name == value then
					ignore = true
					break
				end
			end
			if not ignore then
				text.color = color
            else
                return
			end
		else
			text.color = color
		end
	end
	for i = 1, trans.childCount do
		SetColor(trans:GetChild(i-1), color, ignoreNameList)
	end
end

-- 获取表内有效值的长度
function TableLen(table)
    local count = 0
    if table then
        for key, value in pairs(table) do
            if not IsNil(value) then
                count = count + 1
            end
        end
    end
    return count
end

-- C#的枚举转整型
function EnumToInt(enum)
    return LUtils.EnumToInt(enum)
end