local LuaBehaviour = Class("LuaBehaviour")

function LuaBehaviour:Ctor(parent, module)
    self.module = module
    self:CreateGameObject(parent)
end

function LuaBehaviour:CreateGameObject(parent)
    local prefabPath = self:PrefabPath()
    if not prefabPath or prefabPath == "" then
        LogError("请重写prefabPath()方法并指定Prefab路径")
        return
    end
    local go =
        ResManager.SpawnPrefab(prefabPath, parent, self:DestroyABAfterSpawn(), self:DestroyABAfterAllSpawnDestroy())
    self:OnGameObjectSpawn(go)
end

function LuaBehaviour:OnGameObjectSpawn(go)
    self.gameObject = go
    self.transform = go.transform
    if self._luaClassId then
        self.transform:GetComponent("LuaBehaviour"):SetLuaClassId(self._luaClassId)
    end
    if not self.hasCallAwake then
        self:Awake()
        self:OnEnable()
        self.hasCallAwake = true
    end
    local csharpLuaBehaviour = go:GetComponent("LuaBehaviour")
    csharpLuaBehaviour:SetLuaClass(self)
end

--由子类重写来定义
function LuaBehaviour:PrefabPath()
    return ""
end

--由子类重写来定义
function LuaBehaviour:DestroyABAfterSpawn()
    return false
end

--由子类重写来定义
function LuaBehaviour:DestroyABAfterAllSpawnDestroy()
    return false
end

function LuaBehaviour:Awake()
    --Log("Awake", self.__cname)
end

function LuaBehaviour:OnEnable()
    --Log("OnEnable", self.__cname)
end

function LuaBehaviour:Start()
    --Log("Start", self.__cname)
end

function LuaBehaviour:OnDisable()
    --Log("OnDisable", self.__cname)
end

function LuaBehaviour:OnDestroy()
    --Log("OnDestroy", self.__cname)
end

return LuaBehaviour
