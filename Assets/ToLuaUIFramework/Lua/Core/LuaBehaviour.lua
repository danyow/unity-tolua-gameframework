local LuaBehaviour = class("LuaBehaviour")

function LuaBehaviour:ctor(parent)
    self:createGameObject(parent)
end

function LuaBehaviour:createGameObject(parent)
    self.parentFromNew = parent
    local customParent = self:getParent()
    if customParent then
        parent = customParent
    end
    local prefabPath = self:prefabPath()
    if prefabPath and prefabPath ~= "" then
        ResManager:SpawnPrefab(
            prefabPath,
            parent,
            function(go, _isSingletonActive)
                self:onGameObjectSpawn(go, _isSingletonActive)
            end,
            self:destroyABAfterSpawn(),
            self:destroyABAfterAllSpawnDestroy()
        )
    end
end

function LuaBehaviour:onGameObjectSpawn(go, _isSingletonActive)
    self.gameObject = go
    self.transform = go.transform
    if self._luaClassId then
        self.transform:GetComponent("LuaBehaviour"):SetLuaClassId(self._luaClassId)
    end
    if not _isSingletonActive then
        self:onAwake()
        self:onEnable()
    end
    local csharpLuaBehaviour = go:GetComponent("LuaBehaviour")
    csharpLuaBehaviour:SetLuaClass(self)
end

--由子类重写，设置物体生成时的父级节点，优先级高于new(parent)参数传入
function LuaBehaviour:getParent()
    return nil
end

--由子类重写来定义
function LuaBehaviour:prefabPath()
    return ""
end

--由子类重写来定义
function LuaBehaviour:destroyABAfterSpawn()
    return false
end

--由子类重写来定义
function LuaBehaviour:destroyABAfterAllSpawnDestroy()
    return false
end

function LuaBehaviour:onAwake()
    --Log("onAwake", self.__cname)
end

function LuaBehaviour:onEnable()
    --Log("onEnable", self.__cname)
end

function LuaBehaviour:onStart()
    --Log("onStart", self.__cname)
end

function LuaBehaviour:onDisable()
    --Log("onDisable", self.__cname)
end

function LuaBehaviour:onDestroy()
    --Log("onDestroy", self.__cname)
end

return LuaBehaviour
