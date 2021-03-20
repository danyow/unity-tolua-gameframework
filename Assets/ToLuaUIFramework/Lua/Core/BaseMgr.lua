local BaseMgr = class("BaseMgr")

_SpawnedUIList = {}
function OnGameObjectDestroy(_luaClassId)
    _SpawnedUIList[_luaClassId] = nil
end

function BaseMgr:ctor()
    --self.moduleId在Main.lua初始化时自动赋值
    self.moduleId = 0
    CommandManager.add(CommandID.OpenUI, self.onReceiveOpenUICmd, self)
end

--子类在构造ctor()里调用添加UI类(子类构造加super)
function BaseMgr:addUI(index, ui)
    if not self._uiList then
        self._uiList = {}
    end
    for key, value in pairs(self._uiList) do
        if key == index then
            LogError("index(" .. index .. ")已存在", "addUI")
            return
        elseif value == ui then
            LogError("ui(" .. ui.__cname .. ")已存在", "addUI")
            return
        end
    end
    self._uiList[index] = ui
end

function BaseMgr:onReceiveOpenUICmd(moduleId, uiIndex, parent)
    if not self._uiList then
        return
    end
    if moduleId == self.moduleId then
        if not uiIndex then
            uiIndex = 1
        end
        local clazz = self._uiList[uiIndex]
        if clazz then
            --判断已创建的UI不能重复创建，虽然GameObject已被删除，单Lua类未清空，不断new会造成内存浪费
            local _luaClassId = tostring(moduleId) .. "_" .. tostring(uiIndex)
            local ui = _SpawnedUIList[_luaClassId]
            if not ui then
                if parent then
                    ui = clazz:new(parent)
                else
                    ui = clazz:new()
                end
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
                ui.module = self
            else
                --这里本可以直接将ui.gameObject:SetActive(true)激活显示即可，但是需要调用C#层重新处理UI栈以及层级关系
                --所以继续调用createGameObject(),C#层会直接激活已存在的对象并处理新的UI栈层级关系
                ui:createGameObject(ui.parentFromNew)
            end
        end
    end
end

function BaseMgr:getUI(uiIndex)
    if self.uiList then
        return self.uiList[uiIndex]
    end
    return nil
end

return BaseMgr
