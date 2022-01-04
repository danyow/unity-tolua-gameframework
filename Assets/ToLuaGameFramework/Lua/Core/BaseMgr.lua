local BaseMgr = Class("BaseMgr")

_SpawnedUIList = {}
function OnGameObjectDestroy(_luaClassId)
    _SpawnedUIList[_luaClassId] = nil
end

function BaseMgr:Ctor()
    --self.moduleId在Main.lua初始化时自动赋值
    self.moduleId = 0
    CommandManager.Add(CommandID.OpenUI, self.OnReceiveOpenUICmd, self)
end

--子类在构造ctor()里调用添加UI类(子类构造加super)
function BaseMgr:AddUI(index, ui)
    if not self.uiClassList then
        self.uiClassList = {}
    end
    for key, value in pairs(self.uiClassList) do
        if key == index then
            LogError("index(" .. index .. ")已存在", "AddUI")
            return
        elseif value == ui then
            LogError("ui(" .. ui.__cname .. ")已存在", "AddUI")
            return
        end
    end
    self.uiClassList[index] = ui
end

function BaseMgr:OnReceiveOpenUICmd(moduleId, uiIndex, parent)
    if moduleId == self.moduleId then
        if not uiIndex then
            uiIndex = 1
        end
        self:OpenUI(uiIndex, parent)
    end
end

function BaseMgr:OpenUI(uiIndex, parent)
    if not self.uiClassList then
        return
    end
    local clazz = self.uiClassList[uiIndex]
    if clazz then
        if not parent then
            parent = self:defaultParent()
        end
        --判断已创建的UI不能重复创建，虽然GameObject已被删除，单Lua类未清空，不断new会造成内存浪费
        local _luaClassId = tostring(self.moduleId) .. "_" .. tostring(uiIndex)
        local ui = _SpawnedUIList[_luaClassId]
        if not ui then
            ui = clazz:new(parent, self)
            if ui.transform then
                ui.transform:GetComponent("LuaBehaviour"):SetLuaClassId(_luaClassId)
                ui._luaClassId = nil
            else
                --当这里仍无法获取transform无法调用SetUIID()，则先把_UIId缓存起来，在回调里再设置
                ui._luaClassId = _luaClassId
            end
            _SpawnedUIList[_luaClassId] = ui
            if not self.uiList then
                self.uiList = {}
            end
            self.uiList[uiIndex] = ui
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

function BaseMgr:GetUI(uiIndex)
    if self.uiList then
        return self.uiList[uiIndex]
    end
    return nil
end

function BaseMgr:CloseUI(uiIndex)
    local ui = self:GetUI(uiIndex)
    if ui then
        Destroy(ui.gameObject)
    end
end

function BaseMgr:defaultParent()
    --请根据项目实际情况修改
    return GameObject.Find("MainCanvas").transform
end

return BaseMgr
