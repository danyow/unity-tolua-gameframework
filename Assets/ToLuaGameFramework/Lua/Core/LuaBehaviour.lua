local LuaBehaviour = Class("LuaBehaviour")

function LuaBehaviour:ctor(parent, module)
    self.module = module
    self:createGameObject(parent)
end

function LuaBehaviour:createGameObject(parent)
    local prefabPath = self:prefabPath()
    if not prefabPath or prefabPath == "" then
        LogError("请重写prefabPath()方法并指定Prefab路径")
        return
    end
    local go =
        ResManager.SpawnPrefab(prefabPath, parent, self:destroyABAfterSpawn(), self:destroyABAfterAllSpawnDestroy())
    self:onGameObjectSpawn(go)
end

function LuaBehaviour:onGameObjectSpawn(go)
    self.gameObject = go
    self.transform = go.transform
    if self._luaClassId then
        self.transform:GetComponent("LuaBehaviour"):SetLuaClassId(self._luaClassId)
    end
    if not self.hasCallAwake then
        self:onAwake()
        self:onEnable()
        self.hasCallAwake = true
    end
    local csharpLuaBehaviour = go:GetComponent("LuaBehaviour")
    csharpLuaBehaviour:SetLuaClass(self)
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
