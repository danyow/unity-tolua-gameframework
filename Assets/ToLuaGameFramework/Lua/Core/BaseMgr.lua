---@class BaseMgr
local BaseMgr = Class("BaseMgr")

_SpawnedUIList = {}

function OnGameObjectDestroy(_luaClassId)
    _SpawnedUIList[_luaClassId] = nil
end

function BaseMgr:Ctor()
    CommandManager.Add(CommandID.OpenUI, self.OnReceiveOpenUICmd, self)
end

-- 子类在构造Ctor()里调用添加UI类(子类构造加super)
-- key可用符串也可以用整型
function BaseMgr:AddUI(key, ui)
    self.uiClassList = self.uiClassList or {}
    for k, value in pairs(self.uiClassList) do
        if k == key then
            LogError("key(" .. key .. ")已存在", "AddUI")
            return
        elseif value == ui then
            LogError("ui(" .. ui.__cname .. ")已存在", "AddUI")
            return
        end
    end
    ui.module = self
    self.uiClassList[key] = ui
end

function BaseMgr:OnReceiveOpenUICmd(moduleName, uiKey, parent)
    if moduleName == self.__cname then
        self:OpenUI(uiKey, parent)
    end
end

function BaseMgr:OpenUI(uiKey, parent)
    if not self.uiClassList then
        return
    end
    local clazz = nil
    if uiKey == nil or uiKey == "" then
        for key, uiClass in pairs(self.uiClassList) do
            clazz = uiClass
            uiKey = clazz.__cname
            break
        end
    else
        clazz = self.uiClassList[uiKey]
    end

    if clazz then
        --判断已创建的UI不能重复创建，虽然GameObject已被删除，单Lua类未清空，不断new会造成内存浪费
        local _luaClassId = self.__cname .. "_" .. tostring(uiKey)
        local ui = _SpawnedUIList[_luaClassId]
        if not ui then
            ui = clazz:New(parent)
            ui._luaClassId = _luaClassId
            _SpawnedUIList[_luaClassId] = ui
            self.uiList = self.uiList or {}
            self.uiList[uiKey] = ui
        else
            if ui:IsUIStack() then
                --这里本可以直接将ui.gameObject:SetActive(true)激活显示即可，但是需要调用C#层重新处理UI栈以及层级关系
                --所以继续调用createGameObject(),C#层会直接激活已存在的对象并处理新的UI栈层级关系
                ui:CreateGameObject(parent)
            else
                ui.gameObject:SetActive(true)
            end
        end
        return ui
    end
    return nil
end

function BaseMgr:GetUI(uiKey)
    if self.uiList then
        return self.uiList[uiKey]
    end
    return nil
end

function BaseMgr:CloseUI(uiKey)
    local ui = self:GetUI(uiKey)
    if ui then
        Destroy(ui.gameObject)
    end
end

return BaseMgr
