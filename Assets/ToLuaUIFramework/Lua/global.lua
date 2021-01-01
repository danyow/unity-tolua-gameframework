function class(classname, super)
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

    function cls:new(param)
        local instance = setmetatable({}, cls)
        instance.class = cls
        instance:ctor(param)
        return instance
    end

    return cls
end

function Destroy(obj)
    if obj then
        GameObject.Destroy(obj)
    end
end

function Log(msg)
    Debugger.Log(msg)
end

function LogError(msg)
    Debugger.LogError(msg)
end
