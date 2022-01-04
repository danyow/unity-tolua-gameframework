
---@class LuaInjectionStation : Object @ ---------------------------------------------------------------
local LuaInjectionStation = {
}
LuaInjectionStation.NOT_INJECTION_FLAG = nil
LuaInjectionStation.INVALID_INJECTION_FLAG = nil
---@return Byte
---@param index number
function LuaInjectionStation.GetInjectFlag(index) end
---@return LuaFunction
---@param index number
function LuaInjectionStation.GetInjectionFunction(index) end
---@param index number
---@param injectFlag Byte
---@param func LuaFunction
function LuaInjectionStation.CacheInjectFunction(index, injectFlag, func) end
function LuaInjectionStation.Clear() end
---@return boolean
---@param objA Object
---@param objB Object
function LuaInjectionStation.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function LuaInjectionStation.ReferenceEquals(objA, objB) end

---@class Debugger : Object @ ---------------------------------------------------------------
local Debugger = {
}
Debugger.useLog = nil
Debugger.threadStack = nil
Debugger.logger = nil
---@param str string
---@param arg0 Object
---@param arg1 Object
---@param arg2 Object
function Debugger.Log(str, arg0, arg1, arg2) end
---@param str string
---@param arg0 Object
---@param arg1 Object
---@param arg2 Object
function Debugger.LogWarning(str, arg0, arg1, arg2) end
---@param str string
---@param arg0 Object
---@param arg1 Object
---@param arg2 Object
function Debugger.LogError(str, arg0, arg1, arg2) end
---@param str string
---@param e Exception
function Debugger.LogException(str, e) end
---@return boolean
---@param objA Object
---@param objB Object
function Debugger.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Debugger.ReferenceEquals(objA, objB) end

---@class DOTween : Object @ ---------------------------------------------------------------
local DOTween = {
}
DOTween.logBehaviour = nil
DOTween.debugStoreTargetId = nil
DOTween.Version = nil
DOTween.useSafeMode = nil
DOTween.nestedTweenFailureBehaviour = nil
DOTween.showUnityEditorReport = nil
DOTween.timeScale = nil
DOTween.useSmoothDeltaTime = nil
DOTween.maxSmoothUnscaledTime = nil
DOTween.onWillLog = nil
DOTween.drawGizmos = nil
DOTween.debugMode = nil
DOTween.defaultUpdateType = nil
DOTween.defaultTimeScaleIndependent = nil
DOTween.defaultAutoPlay = nil
DOTween.defaultAutoKill = nil
DOTween.defaultLoopType = nil
DOTween.defaultRecyclable = nil
DOTween.defaultEaseType = nil
DOTween.defaultEaseOvershootOrAmplitude = nil
DOTween.defaultEasePeriod = nil
DOTween.instance = nil
---@return IDOTweenInit
---@param recycleAllByDefault Nullable
---@param useSafeMode Nullable
---@param logBehaviour Nullable
function DOTween.Init(recycleAllByDefault, useSafeMode, logBehaviour) end
---@param tweenersCapacity number
---@param sequencesCapacity number
function DOTween.SetTweensCapacity(tweenersCapacity, sequencesCapacity) end
---@param destroy boolean
function DOTween.Clear(destroy) end
function DOTween.ClearCachedTweens() end
---@return number
function DOTween.Validate() end
---@param deltaTime Single
---@param unscaledDeltaTime Single
function DOTween.ManualUpdate(deltaTime, unscaledDeltaTime) end
---@return TweenerCore
---@param plugin ABSTweenPlugin
---@param getter DOGetter
---@param setter DOSetter
---@param endValue T2
---@param duration Single
function DOTween.To(plugin, getter, setter, endValue, duration) end
---@return TweenerCore
---@param getter DOGetter
---@param setter DOSetter
---@param endValue Single
---@param duration Single
---@param axisConstraint AxisConstraint
function DOTween.ToAxis(getter, setter, endValue, duration, axisConstraint) end
---@return TweenerCore
---@param getter DOGetter
---@param setter DOSetter
---@param endValue Single
---@param duration Single
function DOTween.ToAlpha(getter, setter, endValue, duration) end
---@return TweenerCore
---@param getter DOGetter
---@param setter DOSetter
---@param direction Vector3
---@param duration Single
---@param vibrato number
---@param elasticity Single
function DOTween.Punch(getter, setter, direction, duration, vibrato, elasticity) end
---@return TweenerCore
---@param getter DOGetter
---@param setter DOSetter
---@param duration Single
---@param strength Single
---@param vibrato number
---@param randomness Single
---@param ignoreZAxis boolean
---@param fadeOut boolean
function DOTween.Shake(getter, setter, duration, strength, vibrato, randomness, ignoreZAxis, fadeOut) end
---@return TweenerCore
---@param getter DOGetter
---@param setter DOSetter
---@param endValues Vector3[]
---@param durations Single[]
function DOTween.ToArray(getter, setter, endValues, durations) end
---@return Sequence
function DOTween.Sequence() end
---@return number
---@param withCallbacks boolean
function DOTween.CompleteAll(withCallbacks) end
---@return number
---@param targetOrId Object
---@param withCallbacks boolean
function DOTween.Complete(targetOrId, withCallbacks) end
---@return number
function DOTween.FlipAll() end
---@return number
---@param targetOrId Object
function DOTween.Flip(targetOrId) end
---@return number
---@param to Single
---@param andPlay boolean
function DOTween.GotoAll(to, andPlay) end
---@return number
---@param targetOrId Object
---@param to Single
---@param andPlay boolean
function DOTween.Goto(targetOrId, to, andPlay) end
---@return number
---@param complete boolean
---@param idsOrTargetsToExclude Object[]
function DOTween.KillAll(complete, idsOrTargetsToExclude) end
---@return number
---@param targetOrId Object
---@param complete boolean
function DOTween.Kill(targetOrId, complete) end
---@return number
function DOTween.PauseAll() end
---@return number
---@param targetOrId Object
function DOTween.Pause(targetOrId) end
---@return number
function DOTween.PlayAll() end
---@return number
---@param target Object
---@param id Object
function DOTween.Play(target, id) end
---@return number
function DOTween.PlayBackwardsAll() end
---@return number
---@param target Object
---@param id Object
function DOTween.PlayBackwards(target, id) end
---@return number
function DOTween.PlayForwardAll() end
---@return number
---@param target Object
---@param id Object
function DOTween.PlayForward(target, id) end
---@return number
---@param includeDelay boolean
function DOTween.RestartAll(includeDelay) end
---@return number
---@param target Object
---@param id Object
---@param includeDelay boolean
---@param changeDelayTo Single
function DOTween.Restart(target, id, includeDelay, changeDelayTo) end
---@return number
---@param includeDelay boolean
function DOTween.RewindAll(includeDelay) end
---@return number
---@param targetOrId Object
---@param includeDelay boolean
function DOTween.Rewind(targetOrId, includeDelay) end
---@return number
function DOTween.SmoothRewindAll() end
---@return number
---@param targetOrId Object
function DOTween.SmoothRewind(targetOrId) end
---@return number
function DOTween.TogglePauseAll() end
---@return number
---@param targetOrId Object
function DOTween.TogglePause(targetOrId) end
---@return boolean
---@param targetOrId Object
---@param alsoCheckIfIsPlaying boolean
function DOTween.IsTweening(targetOrId, alsoCheckIfIsPlaying) end
---@return number
function DOTween.TotalPlayingTweens() end
---@return List
---@param fillableList List
function DOTween.PlayingTweens(fillableList) end
---@return List
---@param fillableList List
function DOTween.PausedTweens(fillableList) end
---@return List
---@param id Object
---@param playingOnly boolean
---@param fillableList List
function DOTween.TweensById(id, playingOnly, fillableList) end
---@return List
---@param target Object
---@param playingOnly boolean
---@param fillableList List
function DOTween.TweensByTarget(target, playingOnly, fillableList) end
---@return boolean
---@param objA Object
---@param objB Object
function DOTween.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function DOTween.ReferenceEquals(objA, objB) end

---@class Tween : ABSSequentiable @ ---------------------------------------------------------------
local Tween = {
    ---@type boolean
    isRelative = nil,
    ---@type boolean
    active = nil,
    ---@type Single
    fullPosition = nil,
    ---@type boolean
    hasLoops = nil,
    ---@type boolean
    playedOnce = nil,
    ---@type Single
    position = nil,
    ---@type Single
    timeScale = nil,
    ---@type boolean
    isBackwards = nil,
    ---@type Object
    id = nil,
    ---@type string
    stringId = nil,
    ---@type number
    intId = nil,
    ---@type Object
    target = nil,
    ---@type TweenCallback
    onPlay = nil,
    ---@type TweenCallback
    onPause = nil,
    ---@type TweenCallback
    onRewind = nil,
    ---@type TweenCallback
    onUpdate = nil,
    ---@type TweenCallback
    onStepComplete = nil,
    ---@type TweenCallback
    onComplete = nil,
    ---@type TweenCallback
    onKill = nil,
    ---@type TweenCallback
    onWaypointChange = nil,
    ---@type Single
    easeOvershootOrAmplitude = nil,
    ---@type Single
    easePeriod = nil,
    ---@type string
    debugTargetId = nil,
}
---@return boolean
---@param objA Object
---@param objB Object
function Tween.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Tween.ReferenceEquals(objA, objB) end

---@class Sequence : Tween @ ---------------------------------------------------------------
local Sequence = {
}
---@return boolean
---@param objA Object
---@param objB Object
function Sequence.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Sequence.ReferenceEquals(objA, objB) end

---@class Tweener : Tween @ ---------------------------------------------------------------
local Tweener = {
}
---@return Tweener
---@param newStartValue Object
---@param newDuration Single
function Tweener:ChangeStartValue(newStartValue, newDuration) end
---@return Tweener
---@param newEndValue Object
---@param newDuration Single
---@param snapStartValue boolean
function Tweener:ChangeEndValue(newEndValue, newDuration, snapStartValue) end
---@return Tweener
---@param newStartValue Object
---@param newEndValue Object
---@param newDuration Single
function Tweener:ChangeValues(newStartValue, newEndValue, newDuration) end
---@return boolean
---@param objA Object
---@param objB Object
function Tweener.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Tweener.ReferenceEquals(objA, objB) end

---@class Component : Object @ ---------------------------------------------------------------
local Component = {
    ---@type Transform
    transform = nil,
    ---@type GameObject
    gameObject = nil,
    ---@type string
    tag = nil,
    ---@type Component
    rigidbody = nil,
    ---@type Component
    rigidbody2D = nil,
    ---@type Component
    camera = nil,
    ---@type Component
    light = nil,
    ---@type Component
    animation = nil,
    ---@type Component
    constantForce = nil,
    ---@type Component
    renderer = nil,
    ---@type Component
    audio = nil,
    ---@type Component
    networkView = nil,
    ---@type Component
    collider = nil,
    ---@type Component
    collider2D = nil,
    ---@type Component
    hingeJoint = nil,
    ---@type Component
    particleSystem = nil,
}
---@return Component
---@param type Type
function Component:GetComponent(type) end
---@return boolean
---@param type Type
---@param component Component
function Component:TryGetComponent(type, component) end
---@return Component
---@param t Type
---@param includeInactive boolean
function Component:GetComponentInChildren(t, includeInactive) end
---@return Component[]
---@param t Type
---@param includeInactive boolean
function Component:GetComponentsInChildren(t, includeInactive) end
---@return Component
---@param t Type
function Component:GetComponentInParent(t) end
---@return Component[]
---@param t Type
---@param includeInactive boolean
function Component:GetComponentsInParent(t, includeInactive) end
---@param type Type
---@param results List
function Component:GetComponents(type, results) end
---@return boolean
---@param tag string
function Component:CompareTag(tag) end
---@param methodName string
---@param value Object
---@param options SendMessageOptions
function Component:SendMessageUpwards(methodName, value, options) end
---@param methodName string
---@param value Object
---@param options SendMessageOptions
function Component:SendMessage(methodName, value, options) end
---@param methodName string
---@param parameter Object
---@param options SendMessageOptions
function Component:BroadcastMessage(methodName, parameter, options) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Component.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Component.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Component.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Component.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Component.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Component.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Component.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Component.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Component.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Component.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Component.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Component.ReferenceEquals(objA, objB) end

---@class Transform : Component @ ---------------------------------------------------------------
local Transform = {
    ---@type Vector3
    position = nil,
    ---@type Vector3
    localPosition = nil,
    ---@type Vector3
    eulerAngles = nil,
    ---@type Vector3
    localEulerAngles = nil,
    ---@type Vector3
    right = nil,
    ---@type Vector3
    up = nil,
    ---@type Vector3
    forward = nil,
    ---@type Quaternion
    rotation = nil,
    ---@type Quaternion
    localRotation = nil,
    ---@type Vector3
    localScale = nil,
    ---@type Transform
    parent = nil,
    ---@type Matrix4x4
    worldToLocalMatrix = nil,
    ---@type Matrix4x4
    localToWorldMatrix = nil,
    ---@type Transform
    root = nil,
    ---@type number
    childCount = nil,
    ---@type Vector3
    lossyScale = nil,
    ---@type boolean
    hasChanged = nil,
    ---@type number
    hierarchyCapacity = nil,
    ---@type number
    hierarchyCount = nil,
}
---@param parent Transform
---@param worldPositionStays boolean
function Transform:SetParent(parent, worldPositionStays) end
---@param position Vector3
---@param rotation Quaternion
function Transform:SetPositionAndRotation(position, rotation) end
---@param x Single
---@param y Single
---@param z Single
---@param relativeTo Space
function Transform:Translate(x, y, z, relativeTo) end
---@param xAngle Single
---@param yAngle Single
---@param zAngle Single
---@param relativeTo Space
function Transform:Rotate(xAngle, yAngle, zAngle, relativeTo) end
---@param point Vector3
---@param axis Vector3
---@param angle Single
function Transform:RotateAround(point, axis, angle) end
---@param target Transform
---@param worldUp Vector3
function Transform:LookAt(target, worldUp) end
---@return Vector3
---@param x Single
---@param y Single
---@param z Single
function Transform:TransformDirection(x, y, z) end
---@return Vector3
---@param x Single
---@param y Single
---@param z Single
function Transform:InverseTransformDirection(x, y, z) end
---@return Vector3
---@param x Single
---@param y Single
---@param z Single
function Transform:TransformVector(x, y, z) end
---@return Vector3
---@param x Single
---@param y Single
---@param z Single
function Transform:InverseTransformVector(x, y, z) end
---@return Vector3
---@param x Single
---@param y Single
---@param z Single
function Transform:TransformPoint(x, y, z) end
---@return Vector3
---@param x Single
---@param y Single
---@param z Single
function Transform:InverseTransformPoint(x, y, z) end
function Transform:DetachChildren() end
function Transform:SetAsFirstSibling() end
function Transform:SetAsLastSibling() end
---@param index number
function Transform:SetSiblingIndex(index) end
---@return number
function Transform:GetSiblingIndex() end
---@return Transform
---@param n string
function Transform:Find(n) end
---@return boolean
---@param parent Transform
function Transform:IsChildOf(parent) end
---@return Transform
---@param n string
function Transform:FindChild(n) end
---@return IEnumerator
function Transform:GetEnumerator() end
---@param axis Vector3
---@param angle Single
function Transform:RotateAroundLocal(axis, angle) end
---@return Transform
---@param index number
function Transform:GetChild(index) end
---@return number
function Transform:GetChildCount() end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Transform.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Transform.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Transform.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Transform.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Transform.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Transform.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Transform.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Transform.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Transform.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Transform.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Transform.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Transform.ReferenceEquals(objA, objB) end

---@class Light : Behaviour @ ---------------------------------------------------------------
local Light = {
    ---@type LightType
    type = nil,
    ---@type LightShape
    shape = nil,
    ---@type Single
    spotAngle = nil,
    ---@type Single
    innerSpotAngle = nil,
    ---@type Color
    color = nil,
    ---@type Single
    colorTemperature = nil,
    ---@type boolean
    useColorTemperature = nil,
    ---@type Single
    intensity = nil,
    ---@type Single
    bounceIntensity = nil,
    ---@type boolean
    useBoundingSphereOverride = nil,
    ---@type Vector4
    boundingSphereOverride = nil,
    ---@type boolean
    useViewFrustumForShadowCasterCull = nil,
    ---@type number
    shadowCustomResolution = nil,
    ---@type Single
    shadowBias = nil,
    ---@type Single
    shadowNormalBias = nil,
    ---@type Single
    shadowNearPlane = nil,
    ---@type boolean
    useShadowMatrixOverride = nil,
    ---@type Matrix4x4
    shadowMatrixOverride = nil,
    ---@type Single
    range = nil,
    ---@type Flare
    flare = nil,
    ---@type LightBakingOutput
    bakingOutput = nil,
    ---@type number
    cullingMask = nil,
    ---@type number
    renderingLayerMask = nil,
    ---@type LightShadowCasterMode
    lightShadowCasterMode = nil,
    ---@type Single
    shadowRadius = nil,
    ---@type Single
    shadowAngle = nil,
    ---@type LightShadows
    shadows = nil,
    ---@type Single
    shadowStrength = nil,
    ---@type LightShadowResolution
    shadowResolution = nil,
    ---@type Single
    shadowSoftness = nil,
    ---@type Single
    shadowSoftnessFade = nil,
    ---@type Single[]
    layerShadowCullDistances = nil,
    ---@type Single
    cookieSize = nil,
    ---@type Texture
    cookie = nil,
    ---@type LightRenderMode
    renderMode = nil,
    ---@type number
    bakedIndex = nil,
    ---@type Vector2
    areaSize = nil,
    ---@type LightmapBakeType
    lightmapBakeType = nil,
    ---@type number
    commandBufferCount = nil,
    ---@type Single
    shadowConstantBias = nil,
    ---@type Single
    shadowObjectSizeBias = nil,
    ---@type boolean
    attenuate = nil,
    ---@type LightmappingMode
    lightmappingMode = nil,
    ---@type boolean
    isBaked = nil,
    ---@type boolean
    alreadyLightmapped = nil,
}
Light.pixelLightCount = nil
function Light:Reset() end
function Light:SetLightDirty() end
---@param evt LightEvent
---@param buffer CommandBuffer
---@param shadowPassMask ShadowMapPass
function Light:AddCommandBuffer(evt, buffer, shadowPassMask) end
---@param evt LightEvent
---@param buffer CommandBuffer
---@param shadowPassMask ShadowMapPass
---@param queueType ComputeQueueType
function Light:AddCommandBufferAsync(evt, buffer, shadowPassMask, queueType) end
---@param evt LightEvent
---@param buffer CommandBuffer
function Light:RemoveCommandBuffer(evt, buffer) end
---@param evt LightEvent
function Light:RemoveCommandBuffers(evt) end
function Light:RemoveAllCommandBuffers() end
---@return CommandBuffer[]
---@param evt LightEvent
function Light:GetCommandBuffers(evt) end
---@return Light[]
---@param type LightType
---@param layer number
function Light.GetLights(type, layer) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Light.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Light.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Light.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Light.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Light.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Light.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Light.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Light.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Light.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Light.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Light.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Light.ReferenceEquals(objA, objB) end

---@class Material : Object @ ---------------------------------------------------------------
local Material = {
    ---@type Shader
    shader = nil,
    ---@type Color
    color = nil,
    ---@type Texture
    mainTexture = nil,
    ---@type Vector2
    mainTextureOffset = nil,
    ---@type Vector2
    mainTextureScale = nil,
    ---@type number
    renderQueue = nil,
    ---@type MaterialGlobalIlluminationFlags
    globalIlluminationFlags = nil,
    ---@type boolean
    doubleSidedGI = nil,
    ---@type boolean
    enableInstancing = nil,
    ---@type number
    passCount = nil,
    ---@type String[]
    shaderKeywords = nil,
}
---@return boolean
---@param nameID number
function Material:HasProperty(nameID) end
---@param keyword string
function Material:EnableKeyword(keyword) end
---@param keyword string
function Material:DisableKeyword(keyword) end
---@return boolean
---@param keyword string
function Material:IsKeywordEnabled(keyword) end
---@param passName string
---@param enabled boolean
function Material:SetShaderPassEnabled(passName, enabled) end
---@return boolean
---@param passName string
function Material:GetShaderPassEnabled(passName) end
---@return string
---@param pass number
function Material:GetPassName(pass) end
---@return number
---@param passName string
function Material:FindPass(passName) end
---@param tag string
---@param val string
function Material:SetOverrideTag(tag, val) end
---@return string
---@param tag string
---@param searchFallbacks boolean
---@param defaultValue string
function Material:GetTag(tag, searchFallbacks, defaultValue) end
---@param start Material
---@param end Material
---@param t Single
function Material:Lerp(start, _end, t) end
---@return boolean
---@param pass number
function Material:SetPass(pass) end
---@param mat Material
function Material:CopyPropertiesFromMaterial(mat) end
---@return number
function Material:ComputeCRC() end
---@param outNames List
function Material:GetTexturePropertyNames(outNames) end
---@param outNames List
function Material:GetTexturePropertyNameIDs(outNames) end
---@param name string
---@param value Single
function Material:SetFloat(name, value) end
---@param name string
---@param value number
function Material:SetInt(name, value) end
---@param name string
---@param value Color
function Material:SetColor(name, value) end
---@param name string
---@param value Vector4
function Material:SetVector(name, value) end
---@param name string
---@param value Matrix4x4
function Material:SetMatrix(name, value) end
---@param name string
---@param value RenderTexture
---@param element RenderTextureSubElement
function Material:SetTexture(name, value, element) end
---@param name string
---@param value ComputeBuffer
function Material:SetBuffer(name, value) end
---@param name string
---@param value ComputeBuffer
---@param offset number
---@param size number
function Material:SetConstantBuffer(name, value, offset, size) end
---@param name string
---@param values List
function Material:SetFloatArray(name, values) end
---@param name string
---@param values List
function Material:SetColorArray(name, values) end
---@param name string
---@param values List
function Material:SetVectorArray(name, values) end
---@param name string
---@param values List
function Material:SetMatrixArray(name, values) end
---@return Single
---@param name string
function Material:GetFloat(name) end
---@return number
---@param name string
function Material:GetInt(name) end
---@return Color
---@param name string
function Material:GetColor(name) end
---@return Vector4
---@param name string
function Material:GetVector(name) end
---@return Matrix4x4
---@param name string
function Material:GetMatrix(name) end
---@return Texture
---@param name string
function Material:GetTexture(name) end
---@param name string
---@param values List
function Material:GetFloatArray(name, values) end
---@param name string
---@param values List
function Material:GetColorArray(name, values) end
---@param name string
---@param values List
function Material:GetVectorArray(name, values) end
---@param name string
---@param values List
function Material:GetMatrixArray(name, values) end
---@param name string
---@param value Vector2
function Material:SetTextureOffset(name, value) end
---@param name string
---@param value Vector2
function Material:SetTextureScale(name, value) end
---@return Vector2
---@param name string
function Material:GetTextureOffset(name) end
---@return Vector2
---@param name string
function Material:GetTextureScale(name) end
---@return Material
---@param scriptContents string
function Material.Create(scriptContents) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Material.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Material.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Material.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Material.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Material.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Material.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Material.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Material.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Material.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Material.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Material.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Material.ReferenceEquals(objA, objB) end

---@class Rigidbody : Component @ ---------------------------------------------------------------
local Rigidbody = {
    ---@type Vector3
    velocity = nil,
    ---@type Vector3
    angularVelocity = nil,
    ---@type Single
    drag = nil,
    ---@type Single
    angularDrag = nil,
    ---@type Single
    mass = nil,
    ---@type boolean
    useGravity = nil,
    ---@type Single
    maxDepenetrationVelocity = nil,
    ---@type boolean
    isKinematic = nil,
    ---@type boolean
    freezeRotation = nil,
    ---@type RigidbodyConstraints
    constraints = nil,
    ---@type CollisionDetectionMode
    collisionDetectionMode = nil,
    ---@type Vector3
    centerOfMass = nil,
    ---@type Vector3
    worldCenterOfMass = nil,
    ---@type Quaternion
    inertiaTensorRotation = nil,
    ---@type Vector3
    inertiaTensor = nil,
    ---@type boolean
    detectCollisions = nil,
    ---@type Vector3
    position = nil,
    ---@type Quaternion
    rotation = nil,
    ---@type RigidbodyInterpolation
    interpolation = nil,
    ---@type number
    solverIterations = nil,
    ---@type Single
    sleepThreshold = nil,
    ---@type Single
    maxAngularVelocity = nil,
    ---@type number
    solverVelocityIterations = nil,
    ---@type Single
    sleepVelocity = nil,
    ---@type Single
    sleepAngularVelocity = nil,
    ---@type boolean
    useConeFriction = nil,
    ---@type number
    solverIterationCount = nil,
    ---@type number
    solverVelocityIterationCount = nil,
}
---@param density Single
function Rigidbody:SetDensity(density) end
---@param position Vector3
function Rigidbody:MovePosition(position) end
---@param rot Quaternion
function Rigidbody:MoveRotation(rot) end
function Rigidbody:Sleep() end
---@return boolean
function Rigidbody:IsSleeping() end
function Rigidbody:WakeUp() end
function Rigidbody:ResetCenterOfMass() end
function Rigidbody:ResetInertiaTensor() end
---@return Vector3
---@param relativePoint Vector3
function Rigidbody:GetRelativePointVelocity(relativePoint) end
---@return Vector3
---@param worldPoint Vector3
function Rigidbody:GetPointVelocity(worldPoint) end
---@param a Single
function Rigidbody:SetMaxAngularVelocity(a) end
---@param x Single
---@param y Single
---@param z Single
---@param mode ForceMode
function Rigidbody:AddForce(x, y, z, mode) end
---@param x Single
---@param y Single
---@param z Single
---@param mode ForceMode
function Rigidbody:AddRelativeForce(x, y, z, mode) end
---@param x Single
---@param y Single
---@param z Single
---@param mode ForceMode
function Rigidbody:AddTorque(x, y, z, mode) end
---@param x Single
---@param y Single
---@param z Single
---@param mode ForceMode
function Rigidbody:AddRelativeTorque(x, y, z, mode) end
---@param force Vector3
---@param position Vector3
---@param mode ForceMode
function Rigidbody:AddForceAtPosition(force, position, mode) end
---@param explosionForce Single
---@param explosionPosition Vector3
---@param explosionRadius Single
---@param upwardsModifier Single
---@param mode ForceMode
function Rigidbody:AddExplosionForce(explosionForce, explosionPosition, explosionRadius, upwardsModifier, mode) end
---@return Vector3
---@param position Vector3
function Rigidbody:ClosestPointOnBounds(position) end
---@return boolean
---@param direction Vector3
---@param hitInfo RaycastHit
---@param maxDistance Single
---@param queryTriggerInteraction QueryTriggerInteraction
function Rigidbody:SweepTest(direction, hitInfo, maxDistance, queryTriggerInteraction) end
---@return RaycastHit[]
---@param direction Vector3
---@param maxDistance Single
---@param queryTriggerInteraction QueryTriggerInteraction
function Rigidbody:SweepTestAll(direction, maxDistance, queryTriggerInteraction) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Rigidbody.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Rigidbody.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Rigidbody.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Rigidbody.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Rigidbody.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Rigidbody.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Rigidbody.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Rigidbody.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Rigidbody.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Rigidbody.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Rigidbody.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Rigidbody.ReferenceEquals(objA, objB) end

---@class Camera : Behaviour @ ---------------------------------------------------------------
local Camera = {
    ---@type Single
    nearClipPlane = nil,
    ---@type Single
    farClipPlane = nil,
    ---@type Single
    fieldOfView = nil,
    ---@type RenderingPath
    renderingPath = nil,
    ---@type RenderingPath
    actualRenderingPath = nil,
    ---@type boolean
    allowHDR = nil,
    ---@type boolean
    allowMSAA = nil,
    ---@type boolean
    allowDynamicResolution = nil,
    ---@type boolean
    forceIntoRenderTexture = nil,
    ---@type Single
    orthographicSize = nil,
    ---@type boolean
    orthographic = nil,
    ---@type OpaqueSortMode
    opaqueSortMode = nil,
    ---@type TransparencySortMode
    transparencySortMode = nil,
    ---@type Vector3
    transparencySortAxis = nil,
    ---@type Single
    depth = nil,
    ---@type Single
    aspect = nil,
    ---@type Vector3
    velocity = nil,
    ---@type number
    cullingMask = nil,
    ---@type number
    eventMask = nil,
    ---@type boolean
    layerCullSpherical = nil,
    ---@type CameraType
    cameraType = nil,
    ---@type UInt64
    overrideSceneCullingMask = nil,
    ---@type Single[]
    layerCullDistances = nil,
    ---@type boolean
    useOcclusionCulling = nil,
    ---@type Matrix4x4
    cullingMatrix = nil,
    ---@type Color
    backgroundColor = nil,
    ---@type CameraClearFlags
    clearFlags = nil,
    ---@type DepthTextureMode
    depthTextureMode = nil,
    ---@type boolean
    clearStencilAfterLightingPass = nil,
    ---@type boolean
    usePhysicalProperties = nil,
    ---@type Vector2
    sensorSize = nil,
    ---@type Vector2
    lensShift = nil,
    ---@type Single
    focalLength = nil,
    ---@type GateFitMode
    gateFit = nil,
    ---@type Rect
    rect = nil,
    ---@type Rect
    pixelRect = nil,
    ---@type number
    pixelWidth = nil,
    ---@type number
    pixelHeight = nil,
    ---@type number
    scaledPixelWidth = nil,
    ---@type number
    scaledPixelHeight = nil,
    ---@type RenderTexture
    targetTexture = nil,
    ---@type RenderTexture
    activeTexture = nil,
    ---@type number
    targetDisplay = nil,
    ---@type Matrix4x4
    cameraToWorldMatrix = nil,
    ---@type Matrix4x4
    worldToCameraMatrix = nil,
    ---@type Matrix4x4
    projectionMatrix = nil,
    ---@type Matrix4x4
    nonJitteredProjectionMatrix = nil,
    ---@type boolean
    useJitteredProjectionMatrixForTransparentRendering = nil,
    ---@type Matrix4x4
    previousViewProjectionMatrix = nil,
    ---@type Scene
    scene = nil,
    ---@type boolean
    stereoEnabled = nil,
    ---@type Single
    stereoSeparation = nil,
    ---@type Single
    stereoConvergence = nil,
    ---@type boolean
    areVRStereoViewMatricesWithinSingleCullTolerance = nil,
    ---@type StereoTargetEyeMask
    stereoTargetEye = nil,
    ---@type MonoOrStereoscopicEye
    stereoActiveEye = nil,
    ---@type number
    commandBufferCount = nil,
    ---@type boolean
    isOrthoGraphic = nil,
    ---@type Single
    near = nil,
    ---@type Single
    far = nil,
    ---@type Single
    fov = nil,
    ---@type boolean
    hdr = nil,
    ---@type boolean
    stereoMirrorMode = nil,
}
Camera.main = nil
Camera.current = nil
Camera.allCamerasCount = nil
Camera.allCameras = nil
Camera.mainCamera = nil
Camera.onPreCull = nil
Camera.onPreRender = nil
Camera.onPostRender = nil
function Camera:Reset() end
function Camera:ResetTransparencySortSettings() end
function Camera:ResetAspect() end
function Camera:ResetCullingMatrix() end
---@param shader Shader
---@param replacementTag string
function Camera:SetReplacementShader(shader, replacementTag) end
function Camera:ResetReplacementShader() end
---@return Single
function Camera:GetGateFittedFieldOfView() end
---@return Vector2
function Camera:GetGateFittedLensShift() end
---@param colorBuffer RenderBuffer
---@param depthBuffer RenderBuffer
function Camera:SetTargetBuffers(colorBuffer, depthBuffer) end
function Camera:ResetWorldToCameraMatrix() end
function Camera:ResetProjectionMatrix() end
---@return Matrix4x4
---@param clipPlane Vector4
function Camera:CalculateObliqueMatrix(clipPlane) end
---@return Vector3
---@param position Vector3
---@param eye MonoOrStereoscopicEye
function Camera:WorldToScreenPoint(position, eye) end
---@return Vector3
---@param position Vector3
---@param eye MonoOrStereoscopicEye
function Camera:WorldToViewportPoint(position, eye) end
---@return Vector3
---@param position Vector3
---@param eye MonoOrStereoscopicEye
function Camera:ViewportToWorldPoint(position, eye) end
---@return Vector3
---@param position Vector3
---@param eye MonoOrStereoscopicEye
function Camera:ScreenToWorldPoint(position, eye) end
---@return Vector3
---@param position Vector3
function Camera:ScreenToViewportPoint(position) end
---@return Vector3
---@param position Vector3
function Camera:ViewportToScreenPoint(position) end
---@return Ray
---@param pos Vector3
---@param eye MonoOrStereoscopicEye
function Camera:ViewportPointToRay(pos, eye) end
---@return Ray
---@param pos Vector3
---@param eye MonoOrStereoscopicEye
function Camera:ScreenPointToRay(pos, eye) end
---@param viewport Rect
---@param z Single
---@param eye MonoOrStereoscopicEye
---@param outCorners Vector3[]
function Camera:CalculateFrustumCorners(viewport, z, eye, outCorners) end
---@return Matrix4x4
---@param eye StereoscopicEye
function Camera:GetStereoNonJitteredProjectionMatrix(eye) end
---@return Matrix4x4
---@param eye StereoscopicEye
function Camera:GetStereoViewMatrix(eye) end
---@param eye StereoscopicEye
function Camera:CopyStereoDeviceProjectionMatrixToNonJittered(eye) end
---@return Matrix4x4
---@param eye StereoscopicEye
function Camera:GetStereoProjectionMatrix(eye) end
---@param eye StereoscopicEye
---@param matrix Matrix4x4
function Camera:SetStereoProjectionMatrix(eye, matrix) end
function Camera:ResetStereoProjectionMatrices() end
---@param eye StereoscopicEye
---@param matrix Matrix4x4
function Camera:SetStereoViewMatrix(eye, matrix) end
function Camera:ResetStereoViewMatrices() end
---@return boolean
---@param cubemap RenderTexture
---@param faceMask number
---@param stereoEye MonoOrStereoscopicEye
function Camera:RenderToCubemap(cubemap, faceMask, stereoEye) end
function Camera:Render() end
---@param shader Shader
---@param replacementTag string
function Camera:RenderWithShader(shader, replacementTag) end
function Camera:RenderDontRestore() end
---@param renderRequests List
function Camera:SubmitRenderRequests(renderRequests) end
---@param other Camera
function Camera:CopyFrom(other) end
---@param evt CameraEvent
function Camera:RemoveCommandBuffers(evt) end
function Camera:RemoveAllCommandBuffers() end
---@param evt CameraEvent
---@param buffer CommandBuffer
function Camera:AddCommandBuffer(evt, buffer) end
---@param evt CameraEvent
---@param buffer CommandBuffer
---@param queueType ComputeQueueType
function Camera:AddCommandBufferAsync(evt, buffer, queueType) end
---@param evt CameraEvent
---@param buffer CommandBuffer
function Camera:RemoveCommandBuffer(evt, buffer) end
---@return CommandBuffer[]
---@param evt CameraEvent
function Camera:GetCommandBuffers(evt) end
---@return boolean
---@param stereoAware boolean
---@param cullingParameters ScriptableCullingParameters
function Camera:TryGetCullingParameters(stereoAware, cullingParameters) end
---@return Single
function Camera:GetScreenWidth() end
---@return Single
function Camera:GetScreenHeight() end
function Camera:DoClear() end
function Camera:ResetFieldOfView() end
---@param leftMatrix Matrix4x4
---@param rightMatrix Matrix4x4
function Camera:SetStereoViewMatrices(leftMatrix, rightMatrix) end
---@param leftMatrix Matrix4x4
---@param rightMatrix Matrix4x4
function Camera:SetStereoProjectionMatrices(leftMatrix, rightMatrix) end
---@return Matrix4x4[]
function Camera:GetStereoViewMatrices() end
---@return Matrix4x4[]
function Camera:GetStereoProjectionMatrices() end
---@param output Matrix4x4
---@param focalLength Single
---@param sensorSize Vector2
---@param lensShift Vector2
---@param nearClip Single
---@param farClip Single
---@param gateFitParameters GateFitParameters
function Camera.CalculateProjectionMatrixFromPhysicalProperties(output, focalLength, sensorSize, lensShift, nearClip, farClip, gateFitParameters) end
---@return Single
---@param focalLength Single
---@param sensorSize Single
function Camera.FocalLengthToFieldOfView(focalLength, sensorSize) end
---@return Single
---@param fieldOfView Single
---@param sensorSize Single
function Camera.FieldOfViewToFocalLength(fieldOfView, sensorSize) end
---@return Single
---@param horizontalFieldOfView Single
---@param aspectRatio Single
function Camera.HorizontalToVerticalFieldOfView(horizontalFieldOfView, aspectRatio) end
---@return Single
---@param verticalFieldOfView Single
---@param aspectRatio Single
function Camera.VerticalToHorizontalFieldOfView(verticalFieldOfView, aspectRatio) end
---@return number
---@param cameras Camera[]
function Camera.GetAllCameras(cameras) end
---@param cur Camera
function Camera.SetupCurrent(cur) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Camera.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Camera.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Camera.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Camera.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Camera.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Camera.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Camera.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Camera.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Camera.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Camera.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Camera.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Camera.ReferenceEquals(objA, objB) end

---@class AudioSource : AudioBehaviour @ ---------------------------------------------------------------
local AudioSource = {
    ---@type Single
    panLevel = nil,
    ---@type Single
    pan = nil,
    ---@type Single
    volume = nil,
    ---@type Single
    pitch = nil,
    ---@type Single
    time = nil,
    ---@type number
    timeSamples = nil,
    ---@type AudioClip
    clip = nil,
    ---@type AudioMixerGroup
    outputAudioMixerGroup = nil,
    ---@type boolean
    isPlaying = nil,
    ---@type boolean
    isVirtual = nil,
    ---@type boolean
    loop = nil,
    ---@type boolean
    ignoreListenerVolume = nil,
    ---@type boolean
    playOnAwake = nil,
    ---@type boolean
    ignoreListenerPause = nil,
    ---@type AudioVelocityUpdateMode
    velocityUpdateMode = nil,
    ---@type Single
    panStereo = nil,
    ---@type Single
    spatialBlend = nil,
    ---@type boolean
    spatialize = nil,
    ---@type boolean
    spatializePostEffects = nil,
    ---@type Single
    reverbZoneMix = nil,
    ---@type boolean
    bypassEffects = nil,
    ---@type boolean
    bypassListenerEffects = nil,
    ---@type boolean
    bypassReverbZones = nil,
    ---@type Single
    dopplerLevel = nil,
    ---@type Single
    spread = nil,
    ---@type number
    priority = nil,
    ---@type boolean
    mute = nil,
    ---@type Single
    minDistance = nil,
    ---@type Single
    maxDistance = nil,
    ---@type AudioRolloffMode
    rolloffMode = nil,
    ---@type Single
    minVolume = nil,
    ---@type Single
    maxVolume = nil,
    ---@type Single
    rolloffFactor = nil,
}
---@param delay UInt64
function AudioSource:Play(delay) end
---@param delay Single
function AudioSource:PlayDelayed(delay) end
---@param time Double
function AudioSource:PlayScheduled(time) end
---@param clip AudioClip
---@param volumeScale Single
function AudioSource:PlayOneShot(clip, volumeScale) end
---@param time Double
function AudioSource:SetScheduledStartTime(time) end
---@param time Double
function AudioSource:SetScheduledEndTime(time) end
function AudioSource:Stop() end
function AudioSource:Pause() end
function AudioSource:UnPause() end
---@param type AudioSourceCurveType
---@param curve AnimationCurve
function AudioSource:SetCustomCurve(type, curve) end
---@return AnimationCurve
---@param type AudioSourceCurveType
function AudioSource:GetCustomCurve(type) end
---@return Single[]
---@param numSamples number
---@param channel number
function AudioSource:GetOutputData(numSamples, channel) end
---@return Single[]
---@param numSamples number
---@param channel number
---@param window FFTWindow
function AudioSource:GetSpectrumData(numSamples, channel, window) end
---@return boolean
---@param index number
---@param value Single
function AudioSource:SetSpatializerFloat(index, value) end
---@return boolean
---@param index number
---@param value Single
function AudioSource:GetSpatializerFloat(index, value) end
---@return boolean
---@param index number
---@param value Single
function AudioSource:GetAmbisonicDecoderFloat(index, value) end
---@return boolean
---@param index number
---@param value Single
function AudioSource:SetAmbisonicDecoderFloat(index, value) end
---@param clip AudioClip
---@param position Vector3
---@param volume Single
function AudioSource.PlayClipAtPoint(clip, position, volume) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function AudioSource.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function AudioSource.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function AudioSource.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function AudioSource.FindObjectsOfType(type, includeInactive) end
---@param target Object
function AudioSource.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function AudioSource.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function AudioSource.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function AudioSource.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function AudioSource.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function AudioSource.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function AudioSource.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function AudioSource.ReferenceEquals(objA, objB) end

---@class ColorOptions : ValueType @ ---------------------------------------------------------------
local ColorOptions = {
    ---@type boolean
    alphaOnly = nil,
}
function ColorOptions:Reset() end
---@return boolean
---@param objA Object
---@param objB Object
function ColorOptions.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function ColorOptions.ReferenceEquals(objA, objB) end

---@class TweenerCore : Tweener @ ---------------------------------------------------------------
local TweenerCore = {
    ---@type Color
    startValue = nil,
    ---@type Color
    endValue = nil,
    ---@type Color
    changeValue = nil,
    ---@type ColorOptions
    plugOptions = nil,
    ---@type DOGetter
    getter = nil,
    ---@type DOSetter
    setter = nil,
}
---@return Tweener
---@param newStartValue Object
---@param newDuration Single
function TweenerCore:ChangeStartValue(newStartValue, newDuration) end
---@return Tweener
---@param newEndValue Object
---@param newDuration Single
---@param snapStartValue boolean
function TweenerCore:ChangeEndValue(newEndValue, newDuration, snapStartValue) end
---@return Tweener
---@param newStartValue Object
---@param newEndValue Object
---@param newDuration Single
function TweenerCore:ChangeValues(newStartValue, newEndValue, newDuration) end
---@return boolean
---@param objA Object
---@param objB Object
function TweenerCore.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function TweenerCore.ReferenceEquals(objA, objB) end

---@class Behaviour : Component @ ---------------------------------------------------------------
local Behaviour = {
    ---@type boolean
    enabled = nil,
    ---@type boolean
    isActiveAndEnabled = nil,
}
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Behaviour.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Behaviour.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Behaviour.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Behaviour.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Behaviour.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Behaviour.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Behaviour.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Behaviour.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Behaviour.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Behaviour.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Behaviour.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Behaviour.ReferenceEquals(objA, objB) end

---@class MonoBehaviour : Behaviour @ ---------------------------------------------------------------
local MonoBehaviour = {
    ---@type boolean
    useGUILayout = nil,
    ---@type boolean
    runInEditMode = nil,
}
---@return boolean
---@param methodName string
function MonoBehaviour:IsInvoking(methodName) end
---@param methodName string
function MonoBehaviour:CancelInvoke(methodName) end
---@param methodName string
---@param time Single
function MonoBehaviour:Invoke(methodName, time) end
---@param methodName string
---@param time Single
---@param repeatRate Single
function MonoBehaviour:InvokeRepeating(methodName, time, repeatRate) end
---@return Coroutine
---@param methodName string
---@param value Object
function MonoBehaviour:StartCoroutine(methodName, value) end
---@return Coroutine
---@param routine IEnumerator
function MonoBehaviour:StartCoroutine_Auto(routine) end
---@param routine IEnumerator
function MonoBehaviour:StopCoroutine(routine) end
function MonoBehaviour:StopAllCoroutines() end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function MonoBehaviour.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function MonoBehaviour.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function MonoBehaviour.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function MonoBehaviour.FindObjectsOfType(type, includeInactive) end
---@param target Object
function MonoBehaviour.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function MonoBehaviour.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function MonoBehaviour.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function MonoBehaviour.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function MonoBehaviour.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function MonoBehaviour.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function MonoBehaviour.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function MonoBehaviour.ReferenceEquals(objA, objB) end

---@class GameObject : Object @ ---------------------------------------------------------------
local GameObject = {
    ---@type Transform
    transform = nil,
    ---@type number
    layer = nil,
    ---@type boolean
    active = nil,
    ---@type boolean
    activeSelf = nil,
    ---@type boolean
    activeInHierarchy = nil,
    ---@type boolean
    isStatic = nil,
    ---@type string
    tag = nil,
    ---@type Scene
    scene = nil,
    ---@type UInt64
    sceneCullingMask = nil,
    ---@type GameObject
    gameObject = nil,
    ---@type Component
    rigidbody = nil,
    ---@type Component
    rigidbody2D = nil,
    ---@type Component
    camera = nil,
    ---@type Component
    light = nil,
    ---@type Component
    animation = nil,
    ---@type Component
    constantForce = nil,
    ---@type Component
    renderer = nil,
    ---@type Component
    audio = nil,
    ---@type Component
    networkView = nil,
    ---@type Component
    collider = nil,
    ---@type Component
    collider2D = nil,
    ---@type Component
    hingeJoint = nil,
    ---@type Component
    particleSystem = nil,
}
---@return Component
---@param type Type
function GameObject:GetComponent(type) end
---@return Component
---@param type Type
---@param includeInactive boolean
function GameObject:GetComponentInChildren(type, includeInactive) end
---@return Component
---@param type Type
---@param includeInactive boolean
function GameObject:GetComponentInParent(type, includeInactive) end
---@param type Type
---@param results List
function GameObject:GetComponents(type, results) end
---@return Component[]
---@param type Type
---@param includeInactive boolean
function GameObject:GetComponentsInChildren(type, includeInactive) end
---@return Component[]
---@param type Type
---@param includeInactive boolean
function GameObject:GetComponentsInParent(type, includeInactive) end
---@return boolean
---@param type Type
---@param component Component
function GameObject:TryGetComponent(type, component) end
---@param methodName string
---@param value Object
---@param options SendMessageOptions
function GameObject:SendMessageUpwards(methodName, value, options) end
---@param methodName string
---@param value Object
---@param options SendMessageOptions
function GameObject:SendMessage(methodName, value, options) end
---@param methodName string
---@param parameter Object
---@param options SendMessageOptions
function GameObject:BroadcastMessage(methodName, parameter, options) end
---@return Component
---@param componentType Type
function GameObject:AddComponent(componentType) end
---@param value boolean
function GameObject:SetActive(value) end
---@param state boolean
function GameObject:SetActiveRecursively(state) end
---@return boolean
---@param tag string
function GameObject:CompareTag(tag) end
---@param clip Object
---@param time Single
function GameObject:SampleAnimation(clip, time) end
---@param animation Object
function GameObject:PlayAnimation(animation) end
function GameObject:StopAnimation() end
---@return GameObject
---@param type PrimitiveType
function GameObject.CreatePrimitive(type) end
---@return GameObject
---@param tag string
function GameObject.FindWithTag(tag) end
---@return GameObject
---@param tag string
function GameObject.FindGameObjectWithTag(tag) end
---@return GameObject[]
---@param tag string
function GameObject.FindGameObjectsWithTag(tag) end
---@return GameObject
---@param name string
function GameObject.Find(name) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function GameObject.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function GameObject.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function GameObject.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function GameObject.FindObjectsOfType(type, includeInactive) end
---@param target Object
function GameObject.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function GameObject.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function GameObject.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function GameObject.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function GameObject.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function GameObject.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function GameObject.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function GameObject.ReferenceEquals(objA, objB) end

---@class TrackedReference : Object @ ---------------------------------------------------------------
local TrackedReference = {
}
---@return boolean
---@param o Object
function TrackedReference:Equals(o) end
---@return number
function TrackedReference:GetHashCode() end
---@return boolean
---@param objA Object
---@param objB Object
function TrackedReference.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function TrackedReference.ReferenceEquals(objA, objB) end

---@class Application : Object @ ---------------------------------------------------------------
local Application = {
}
Application.isLoadingLevel = nil
Application.streamedBytes = nil
Application.webSecurityEnabled = nil
Application.isPlaying = nil
Application.isFocused = nil
Application.buildGUID = nil
Application.runInBackground = nil
Application.isBatchMode = nil
Application.dataPath = nil
Application.streamingAssetsPath = nil
Application.persistentDataPath = nil
Application.temporaryCachePath = nil
Application.absoluteURL = nil
Application.unityVersion = nil
Application.version = nil
Application.installerName = nil
Application.identifier = nil
Application.installMode = nil
Application.sandboxType = nil
Application.productName = nil
Application.companyName = nil
Application.cloudProjectId = nil
Application.targetFrameRate = nil
Application.stackTraceLogType = nil
Application.consoleLogPath = nil
Application.backgroundLoadingPriority = nil
Application.genuine = nil
Application.genuineCheckAvailable = nil
Application.isShowingSplashScreen = nil
Application.platform = nil
Application.isMobilePlatform = nil
Application.isConsolePlatform = nil
Application.systemLanguage = nil
Application.internetReachability = nil
Application.isPlayer = nil
Application.levelCount = nil
Application.loadedLevel = nil
Application.loadedLevelName = nil
Application.isEditor = nil
---@param exitCode number
function Application.Quit(exitCode) end
function Application.CancelQuit() end
function Application.Unload() end
---@return Single
---@param levelIndex number
function Application.GetStreamProgressForLevel(levelIndex) end
---@return boolean
---@param levelIndex number
function Application.CanStreamedLevelBeLoaded(levelIndex) end
---@return boolean
---@param obj Object
function Application.IsPlaying(obj) end
---@return String[]
function Application.GetBuildTags() end
---@param buildTags String[]
function Application.SetBuildTags(buildTags) end
---@return boolean
function Application.HasProLicense() end
---@param script string
function Application.ExternalEval(script) end
---@return boolean
---@param delegateMethod AdvertisingIdentifierCallback
function Application.RequestAdvertisingIdentifierAsync(delegateMethod) end
---@param url string
function Application.OpenURL(url) end
---@param mode number
function Application.ForceCrash(mode) end
---@return StackTraceLogType
---@param logType LogType
function Application.GetStackTraceLogType(logType) end
---@param logType LogType
---@param stackTraceType StackTraceLogType
function Application.SetStackTraceLogType(logType, stackTraceType) end
---@return AsyncOperation
---@param mode UserAuthorization
function Application.RequestUserAuthorization(mode) end
---@return boolean
---@param mode UserAuthorization
function Application.HasUserAuthorization(mode) end
---@param functionName string
---@param args Object[]
function Application.ExternalCall(functionName, args) end
---@param o Object
function Application.DontDestroyOnLoad(o) end
---@param filename string
---@param superSize number
function Application.CaptureScreenshot(filename, superSize) end
---@param handler LogCallback
function Application.RegisterLogCallback(handler) end
---@param handler LogCallback
function Application.RegisterLogCallbackThreaded(handler) end
---@param index number
function Application.LoadLevel(index) end
---@param index number
function Application.LoadLevelAdditive(index) end
---@return AsyncOperation
---@param index number
function Application.LoadLevelAsync(index) end
---@return AsyncOperation
---@param index number
function Application.LoadLevelAdditiveAsync(index) end
---@return boolean
---@param index number
function Application.UnloadLevel(index) end
---@return boolean
---@param objA Object
---@param objB Object
function Application.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Application.ReferenceEquals(objA, objB) end

---@class Physics : Object @ ---------------------------------------------------------------
local Physics = {
}
Physics.minPenetrationForPenalty = nil
Physics.gravity = nil
Physics.defaultContactOffset = nil
Physics.sleepThreshold = nil
Physics.queriesHitTriggers = nil
Physics.queriesHitBackfaces = nil
Physics.bounceThreshold = nil
Physics.defaultMaxDepenetrationVelocity = nil
Physics.defaultSolverIterations = nil
Physics.defaultSolverVelocityIterations = nil
Physics.bounceTreshold = nil
Physics.sleepVelocity = nil
Physics.sleepAngularVelocity = nil
Physics.maxAngularVelocity = nil
Physics.solverIterationCount = nil
Physics.solverVelocityIterationCount = nil
Physics.penetrationPenaltyForce = nil
Physics.defaultMaxAngularSpeed = nil
Physics.defaultPhysicsScene = nil
Physics.autoSimulation = nil
Physics.autoSyncTransforms = nil
Physics.reuseCollisionCallbacks = nil
Physics.interCollisionDistance = nil
Physics.interCollisionStiffness = nil
Physics.interCollisionSettingsToggle = nil
Physics.clothGravity = nil
Physics.IgnoreRaycastLayer = nil
Physics.DefaultRaycastLayers = nil
Physics.AllLayers = nil
Physics.kIgnoreRaycastLayer = nil
Physics.kDefaultRaycastLayers = nil
Physics.kAllLayers = nil
---@param collider1 Collider
---@param collider2 Collider
---@param ignore boolean
function Physics.IgnoreCollision(collider1, collider2, ignore) end
---@param layer1 number
---@param layer2 number
---@param ignore boolean
function Physics.IgnoreLayerCollision(layer1, layer2, ignore) end
---@return boolean
---@param layer1 number
---@param layer2 number
function Physics.GetIgnoreLayerCollision(layer1, layer2) end
---@return boolean
---@param collider1 Collider
---@param collider2 Collider
function Physics.GetIgnoreCollision(collider1, collider2) end
---@return boolean
---@param origin Vector3
---@param direction Vector3
---@param hitInfo RaycastHit
---@param maxDistance Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.Raycast(origin, direction, hitInfo, maxDistance, layerMask, queryTriggerInteraction) end
---@return boolean
---@param start Vector3
---@param end Vector3
---@param hitInfo RaycastHit
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.Linecast(start, _end, hitInfo, layerMask, queryTriggerInteraction) end
---@return boolean
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param hitInfo RaycastHit
---@param maxDistance Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.CapsuleCast(point1, point2, radius, direction, hitInfo, maxDistance, layerMask, queryTriggerInteraction) end
---@return boolean
---@param origin Vector3
---@param radius Single
---@param direction Vector3
---@param hitInfo RaycastHit
---@param maxDistance Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.SphereCast(origin, radius, direction, hitInfo, maxDistance, layerMask, queryTriggerInteraction) end
---@return boolean
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param hitInfo RaycastHit
---@param orientation Quaternion
---@param maxDistance Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.BoxCast(center, halfExtents, direction, hitInfo, orientation, maxDistance, layerMask, queryTriggerInteraction) end
---@return RaycastHit[]
---@param origin Vector3
---@param direction Vector3
---@param maxDistance Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.RaycastAll(origin, direction, maxDistance, layerMask, queryTriggerInteraction) end
---@return number
---@param origin Vector3
---@param direction Vector3
---@param results RaycastHit[]
---@param maxDistance Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.RaycastNonAlloc(origin, direction, results, maxDistance, layerMask, queryTriggerInteraction) end
---@return RaycastHit[]
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param maxDistance Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.CapsuleCastAll(point1, point2, radius, direction, maxDistance, layerMask, queryTriggerInteraction) end
---@return RaycastHit[]
---@param origin Vector3
---@param radius Single
---@param direction Vector3
---@param maxDistance Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.SphereCastAll(origin, radius, direction, maxDistance, layerMask, queryTriggerInteraction) end
---@return Collider[]
---@param point0 Vector3
---@param point1 Vector3
---@param radius Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.OverlapCapsule(point0, point1, radius, layerMask, queryTriggerInteraction) end
---@return Collider[]
---@param position Vector3
---@param radius Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.OverlapSphere(position, radius, layerMask, queryTriggerInteraction) end
---@param step Single
function Physics.Simulate(step) end
function Physics.SyncTransforms() end
---@return boolean
---@param colliderA Collider
---@param positionA Vector3
---@param rotationA Quaternion
---@param colliderB Collider
---@param positionB Vector3
---@param rotationB Quaternion
---@param direction Vector3
---@param distance Single
function Physics.ComputePenetration(colliderA, positionA, rotationA, colliderB, positionB, rotationB, direction, distance) end
---@return Vector3
---@param point Vector3
---@param collider Collider
---@param position Vector3
---@param rotation Quaternion
function Physics.ClosestPoint(point, collider, position, rotation) end
---@return number
---@param position Vector3
---@param radius Single
---@param results Collider[]
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.OverlapSphereNonAlloc(position, radius, results, layerMask, queryTriggerInteraction) end
---@return boolean
---@param position Vector3
---@param radius Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.CheckSphere(position, radius, layerMask, queryTriggerInteraction) end
---@return number
---@param point1 Vector3
---@param point2 Vector3
---@param radius Single
---@param direction Vector3
---@param results RaycastHit[]
---@param maxDistance Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.CapsuleCastNonAlloc(point1, point2, radius, direction, results, maxDistance, layerMask, queryTriggerInteraction) end
---@return number
---@param origin Vector3
---@param radius Single
---@param direction Vector3
---@param results RaycastHit[]
---@param maxDistance Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.SphereCastNonAlloc(origin, radius, direction, results, maxDistance, layerMask, queryTriggerInteraction) end
---@return boolean
---@param start Vector3
---@param end Vector3
---@param radius Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.CheckCapsule(start, _end, radius, layerMask, queryTriggerInteraction) end
---@return boolean
---@param center Vector3
---@param halfExtents Vector3
---@param orientation Quaternion
---@param layermask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.CheckBox(center, halfExtents, orientation, layermask, queryTriggerInteraction) end
---@return Collider[]
---@param center Vector3
---@param halfExtents Vector3
---@param orientation Quaternion
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.OverlapBox(center, halfExtents, orientation, layerMask, queryTriggerInteraction) end
---@return number
---@param center Vector3
---@param halfExtents Vector3
---@param results Collider[]
---@param orientation Quaternion
---@param mask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.OverlapBoxNonAlloc(center, halfExtents, results, orientation, mask, queryTriggerInteraction) end
---@return number
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param results RaycastHit[]
---@param orientation Quaternion
---@param maxDistance Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.BoxCastNonAlloc(center, halfExtents, direction, results, orientation, maxDistance, layerMask, queryTriggerInteraction) end
---@return RaycastHit[]
---@param center Vector3
---@param halfExtents Vector3
---@param direction Vector3
---@param orientation Quaternion
---@param maxDistance Single
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.BoxCastAll(center, halfExtents, direction, orientation, maxDistance, layerMask, queryTriggerInteraction) end
---@return number
---@param point0 Vector3
---@param point1 Vector3
---@param radius Single
---@param results Collider[]
---@param layerMask number
---@param queryTriggerInteraction QueryTriggerInteraction
function Physics.OverlapCapsuleNonAlloc(point0, point1, radius, results, layerMask, queryTriggerInteraction) end
---@param worldBounds Bounds
---@param subdivisions number
function Physics.RebuildBroadphaseRegions(worldBounds, subdivisions) end
---@param meshID number
---@param convex boolean
function Physics.BakeMesh(meshID, convex) end
---@return boolean
---@param objA Object
---@param objB Object
function Physics.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Physics.ReferenceEquals(objA, objB) end

---@class Collider : Component @ ---------------------------------------------------------------
local Collider = {
    ---@type boolean
    enabled = nil,
    ---@type Rigidbody
    attachedRigidbody = nil,
    ---@type ArticulationBody
    attachedArticulationBody = nil,
    ---@type boolean
    isTrigger = nil,
    ---@type Single
    contactOffset = nil,
    ---@type Bounds
    bounds = nil,
    ---@type PhysicMaterial
    sharedMaterial = nil,
    ---@type PhysicMaterial
    material = nil,
}
---@return Vector3
---@param position Vector3
function Collider:ClosestPoint(position) end
---@return boolean
---@param ray Ray
---@param hitInfo RaycastHit
---@param maxDistance Single
function Collider:Raycast(ray, hitInfo, maxDistance) end
---@return Vector3
---@param position Vector3
function Collider:ClosestPointOnBounds(position) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Collider.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Collider.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Collider.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Collider.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Collider.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Collider.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Collider.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Collider.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Collider.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Collider.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Collider.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Collider.ReferenceEquals(objA, objB) end

---@class Time : Object @ ---------------------------------------------------------------
local Time = {
}
Time.time = nil
Time.timeAsDouble = nil
Time.timeSinceLevelLoad = nil
Time.timeSinceLevelLoadAsDouble = nil
Time.deltaTime = nil
Time.fixedTime = nil
Time.fixedTimeAsDouble = nil
Time.unscaledTime = nil
Time.unscaledTimeAsDouble = nil
Time.fixedUnscaledTime = nil
Time.fixedUnscaledTimeAsDouble = nil
Time.unscaledDeltaTime = nil
Time.fixedUnscaledDeltaTime = nil
Time.fixedDeltaTime = nil
Time.maximumDeltaTime = nil
Time.smoothDeltaTime = nil
Time.maximumParticleDeltaTime = nil
Time.timeScale = nil
Time.frameCount = nil
Time.renderedFrameCount = nil
Time.realtimeSinceStartup = nil
Time.realtimeSinceStartupAsDouble = nil
Time.captureDeltaTime = nil
Time.captureFramerate = nil
Time.inFixedTimeStep = nil
---@return boolean
---@param objA Object
---@param objB Object
function Time.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Time.ReferenceEquals(objA, objB) end

---@class Texture : Object @ ---------------------------------------------------------------
local Texture = {
    ---@type number
    mipmapCount = nil,
    ---@type GraphicsFormat
    graphicsFormat = nil,
    ---@type number
    width = nil,
    ---@type number
    height = nil,
    ---@type TextureDimension
    dimension = nil,
    ---@type boolean
    isReadable = nil,
    ---@type TextureWrapMode
    wrapMode = nil,
    ---@type TextureWrapMode
    wrapModeU = nil,
    ---@type TextureWrapMode
    wrapModeV = nil,
    ---@type TextureWrapMode
    wrapModeW = nil,
    ---@type FilterMode
    filterMode = nil,
    ---@type number
    anisoLevel = nil,
    ---@type Single
    mipMapBias = nil,
    ---@type Vector2
    texelSize = nil,
    ---@type UInt32
    updateCount = nil,
    ---@type Hash128
    imageContentsHash = nil,
}
Texture.masterTextureLimit = nil
Texture.anisotropicFiltering = nil
Texture.totalTextureMemory = nil
Texture.desiredTextureMemory = nil
Texture.targetTextureMemory = nil
Texture.currentTextureMemory = nil
Texture.nonStreamingTextureMemory = nil
Texture.streamingMipmapUploadCount = nil
Texture.streamingRendererCount = nil
Texture.streamingTextureCount = nil
Texture.nonStreamingTextureCount = nil
Texture.streamingTexturePendingLoadCount = nil
Texture.streamingTextureLoadingCount = nil
Texture.streamingTextureForceLoadAll = nil
Texture.streamingTextureDiscardUnusedMips = nil
Texture.allowThreadedTextureCreation = nil
Texture.GenerateAllMips = nil
---@return IntPtr
function Texture:GetNativeTexturePtr() end
---@return number
function Texture:GetNativeTextureID() end
function Texture:IncrementUpdateCount() end
---@param forcedMin number
---@param globalMax number
function Texture.SetGlobalAnisotropicFilteringLimits(forcedMin, globalMax) end
function Texture.SetStreamingTextureMaterialDebugProperties() end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Texture.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Texture.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Texture.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Texture.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Texture.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Texture.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Texture.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Texture.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Texture.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Texture.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Texture.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Texture.ReferenceEquals(objA, objB) end

---@class Texture2D : Texture @ ---------------------------------------------------------------
local Texture2D = {
    ---@type TextureFormat
    format = nil,
    ---@type boolean
    isReadable = nil,
    ---@type boolean
    vtOnly = nil,
    ---@type boolean
    streamingMipmaps = nil,
    ---@type number
    streamingMipmapsPriority = nil,
    ---@type number
    requestedMipmapLevel = nil,
    ---@type number
    minimumMipmapLevel = nil,
    ---@type number
    calculatedMipmapLevel = nil,
    ---@type number
    desiredMipmapLevel = nil,
    ---@type number
    loadingMipmapLevel = nil,
    ---@type number
    loadedMipmapLevel = nil,
    ---@type boolean
    alphaIsTransparency = nil,
}
Texture2D.whiteTexture = nil
Texture2D.blackTexture = nil
Texture2D.redTexture = nil
Texture2D.grayTexture = nil
Texture2D.linearGrayTexture = nil
Texture2D.normalTexture = nil
---@param highQuality boolean
function Texture2D:Compress(highQuality) end
function Texture2D:ClearRequestedMipmapLevel() end
---@return boolean
function Texture2D:IsRequestedMipmapLevelLoaded() end
function Texture2D:ClearMinimumMipmapLevel() end
---@param nativeTex IntPtr
function Texture2D:UpdateExternalTexture(nativeTex) end
---@return Byte[]
function Texture2D:GetRawTextureData() end
---@return Color[]
---@param x number
---@param y number
---@param blockWidth number
---@param blockHeight number
---@param miplevel number
function Texture2D:GetPixels(x, y, blockWidth, blockHeight, miplevel) end
---@return Color32[]
---@param miplevel number
function Texture2D:GetPixels32(miplevel) end
---@return Rect[]
---@param textures Texture2D[]
---@param padding number
---@param maximumAtlasSize number
---@param makeNoLongerReadable boolean
function Texture2D:PackTextures(textures, padding, maximumAtlasSize, makeNoLongerReadable) end
---@param x number
---@param y number
---@param color Color
---@param mipLevel number
function Texture2D:SetPixel(x, y, color, mipLevel) end
---@param x number
---@param y number
---@param blockWidth number
---@param blockHeight number
---@param colors Color[]
---@param miplevel number
function Texture2D:SetPixels(x, y, blockWidth, blockHeight, colors, miplevel) end
---@return Color
---@param x number
---@param y number
---@param mipLevel number
function Texture2D:GetPixel(x, y, mipLevel) end
---@return Color
---@param u Single
---@param v Single
---@param mipLevel number
function Texture2D:GetPixelBilinear(u, v, mipLevel) end
---@param data IntPtr
---@param size number
function Texture2D:LoadRawTextureData(data, size) end
---@param data T[]
---@param mipLevel number
---@param sourceDataStartIndex number
function Texture2D:SetPixelData(data, mipLevel, sourceDataStartIndex) end
---@return NativeArray
---@param mipLevel number
function Texture2D:GetPixelData(mipLevel) end
---@param updateMipmaps boolean
---@param makeNoLongerReadable boolean
function Texture2D:Apply(updateMipmaps, makeNoLongerReadable) end
---@return boolean
---@param width number
---@param height number
---@param format TextureFormat
---@param hasMipMap boolean
function Texture2D:Resize(width, height, format, hasMipMap) end
---@param source Rect
---@param destX number
---@param destY number
---@param recalculateMipMaps boolean
function Texture2D:ReadPixels(source, destX, destY, recalculateMipMaps) end
---@param x number
---@param y number
---@param blockWidth number
---@param blockHeight number
---@param colors Color32[]
---@param miplevel number
function Texture2D:SetPixels32(x, y, blockWidth, blockHeight, colors, miplevel) end
---@return Texture2D
---@param width number
---@param height number
---@param format TextureFormat
---@param mipChain boolean
---@param linear boolean
---@param nativeTex IntPtr
function Texture2D.CreateExternalTexture(width, height, format, mipChain, linear, nativeTex) end
---@return boolean
---@param sizes Vector2[]
---@param padding number
---@param atlasSize number
---@param results List
function Texture2D.GenerateAtlas(sizes, padding, atlasSize, results) end
---@param forcedMin number
---@param globalMax number
function Texture2D.SetGlobalAnisotropicFilteringLimits(forcedMin, globalMax) end
function Texture2D.SetStreamingTextureMaterialDebugProperties() end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Texture2D.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Texture2D.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Texture2D.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Texture2D.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Texture2D.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Texture2D.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Texture2D.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Texture2D.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Texture2D.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Texture2D.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Texture2D.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Texture2D.ReferenceEquals(objA, objB) end

---@class Shader : Object @ ---------------------------------------------------------------
local Shader = {
    ---@type number
    maximumLOD = nil,
    ---@type boolean
    isSupported = nil,
    ---@type number
    renderQueue = nil,
    ---@type number
    passCount = nil,
}
Shader.globalShaderHardwareTier = nil
Shader.globalMaximumLOD = nil
Shader.globalRenderPipeline = nil
---@return Shader
---@param name string
function Shader:GetDependency(name) end
---@return ShaderTagId
---@param passIndex number
---@param tagName ShaderTagId
function Shader:FindPassTagValue(passIndex, tagName) end
---@return number
function Shader:GetPropertyCount() end
---@return number
---@param propertyName string
function Shader:FindPropertyIndex(propertyName) end
---@return string
---@param propertyIndex number
function Shader:GetPropertyName(propertyIndex) end
---@return number
---@param propertyIndex number
function Shader:GetPropertyNameId(propertyIndex) end
---@return ShaderPropertyType
---@param propertyIndex number
function Shader:GetPropertyType(propertyIndex) end
---@return string
---@param propertyIndex number
function Shader:GetPropertyDescription(propertyIndex) end
---@return ShaderPropertyFlags
---@param propertyIndex number
function Shader:GetPropertyFlags(propertyIndex) end
---@return String[]
---@param propertyIndex number
function Shader:GetPropertyAttributes(propertyIndex) end
---@return Single
---@param propertyIndex number
function Shader:GetPropertyDefaultFloatValue(propertyIndex) end
---@return Vector4
---@param propertyIndex number
function Shader:GetPropertyDefaultVectorValue(propertyIndex) end
---@return Vector2
---@param propertyIndex number
function Shader:GetPropertyRangeLimits(propertyIndex) end
---@return TextureDimension
---@param propertyIndex number
function Shader:GetPropertyTextureDimension(propertyIndex) end
---@return string
---@param propertyIndex number
function Shader:GetPropertyTextureDefaultName(propertyIndex) end
---@return boolean
---@param propertyIndex number
---@param stackName String
---@param layerIndex Int32
function Shader:FindTextureStack(propertyIndex, stackName, layerIndex) end
---@param propertyName string
---@param mode TexGenMode
function Shader.SetGlobalTexGenMode(propertyName, mode) end
---@param propertyName string
---@param matrixName string
function Shader.SetGlobalTextureMatrixName(propertyName, matrixName) end
---@return Shader
---@param name string
function Shader.Find(name) end
---@param keyword string
function Shader.EnableKeyword(keyword) end
---@param keyword string
function Shader.DisableKeyword(keyword) end
---@return boolean
---@param keyword string
function Shader.IsKeywordEnabled(keyword) end
function Shader.WarmupAllShaders() end
---@return number
---@param name string
function Shader.PropertyToID(name) end
---@param name string
---@param value Single
function Shader.SetGlobalFloat(name, value) end
---@param name string
---@param value number
function Shader.SetGlobalInt(name, value) end
---@param name string
---@param value Vector4
function Shader.SetGlobalVector(name, value) end
---@param name string
---@param value Color
function Shader.SetGlobalColor(name, value) end
---@param name string
---@param value Matrix4x4
function Shader.SetGlobalMatrix(name, value) end
---@param name string
---@param value RenderTexture
---@param element RenderTextureSubElement
function Shader.SetGlobalTexture(name, value, element) end
---@param name string
---@param value ComputeBuffer
function Shader.SetGlobalBuffer(name, value) end
---@param name string
---@param value ComputeBuffer
---@param offset number
---@param size number
function Shader.SetGlobalConstantBuffer(name, value, offset, size) end
---@param name string
---@param values List
function Shader.SetGlobalFloatArray(name, values) end
---@param name string
---@param values List
function Shader.SetGlobalVectorArray(name, values) end
---@param name string
---@param values List
function Shader.SetGlobalMatrixArray(name, values) end
---@return Single
---@param name string
function Shader.GetGlobalFloat(name) end
---@return number
---@param name string
function Shader.GetGlobalInt(name) end
---@return Vector4
---@param name string
function Shader.GetGlobalVector(name) end
---@return Color
---@param name string
function Shader.GetGlobalColor(name) end
---@return Matrix4x4
---@param name string
function Shader.GetGlobalMatrix(name) end
---@return Texture
---@param name string
function Shader.GetGlobalTexture(name) end
---@param name string
---@param values List
function Shader.GetGlobalFloatArray(name, values) end
---@param name string
---@param values List
function Shader.GetGlobalVectorArray(name, values) end
---@param name string
---@param values List
function Shader.GetGlobalMatrixArray(name, values) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Shader.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Shader.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Shader.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Shader.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Shader.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Shader.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Shader.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Shader.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Shader.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Shader.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Shader.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Shader.ReferenceEquals(objA, objB) end

---@class Renderer : Component @ ---------------------------------------------------------------
local Renderer = {
    ---@type Vector4
    lightmapTilingOffset = nil,
    ---@type Transform
    lightProbeAnchor = nil,
    ---@type boolean
    castShadows = nil,
    ---@type boolean
    motionVectors = nil,
    ---@type boolean
    useLightProbes = nil,
    ---@type Bounds
    bounds = nil,
    ---@type boolean
    enabled = nil,
    ---@type boolean
    isVisible = nil,
    ---@type ShadowCastingMode
    shadowCastingMode = nil,
    ---@type boolean
    receiveShadows = nil,
    ---@type boolean
    forceRenderingOff = nil,
    ---@type MotionVectorGenerationMode
    motionVectorGenerationMode = nil,
    ---@type LightProbeUsage
    lightProbeUsage = nil,
    ---@type ReflectionProbeUsage
    reflectionProbeUsage = nil,
    ---@type UInt32
    renderingLayerMask = nil,
    ---@type number
    rendererPriority = nil,
    ---@type RayTracingMode
    rayTracingMode = nil,
    ---@type string
    sortingLayerName = nil,
    ---@type number
    sortingLayerID = nil,
    ---@type number
    sortingOrder = nil,
    ---@type boolean
    allowOcclusionWhenDynamic = nil,
    ---@type boolean
    isPartOfStaticBatch = nil,
    ---@type Matrix4x4
    worldToLocalMatrix = nil,
    ---@type Matrix4x4
    localToWorldMatrix = nil,
    ---@type GameObject
    lightProbeProxyVolumeOverride = nil,
    ---@type Transform
    probeAnchor = nil,
    ---@type number
    lightmapIndex = nil,
    ---@type number
    realtimeLightmapIndex = nil,
    ---@type Vector4
    lightmapScaleOffset = nil,
    ---@type Vector4
    realtimeLightmapScaleOffset = nil,
    ---@type Material[]
    materials = nil,
    ---@type Material
    material = nil,
    ---@type Material
    sharedMaterial = nil,
    ---@type Material[]
    sharedMaterials = nil,
}
---@return boolean
function Renderer:HasPropertyBlock() end
---@param properties MaterialPropertyBlock
---@param materialIndex number
function Renderer:SetPropertyBlock(properties, materialIndex) end
---@param properties MaterialPropertyBlock
---@param materialIndex number
function Renderer:GetPropertyBlock(properties, materialIndex) end
---@param m List
function Renderer:GetMaterials(m) end
---@param m List
function Renderer:GetSharedMaterials(m) end
---@param result List
function Renderer:GetClosestReflectionProbes(result) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Renderer.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Renderer.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Renderer.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Renderer.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Renderer.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Renderer.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Renderer.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Renderer.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Renderer.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Renderer.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Renderer.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Renderer.ReferenceEquals(objA, objB) end

---@class WWW : CustomYieldInstruction @ ---------------------------------------------------------------
local WWW = {
    ---@type AssetBundle
    assetBundle = nil,
    ---@type Object
    audioClip = nil,
    ---@type Byte[]
    bytes = nil,
    ---@type Object
    movie = nil,
    ---@type number
    size = nil,
    ---@type number
    bytesDownloaded = nil,
    ---@type string
    error = nil,
    ---@type boolean
    isDone = nil,
    ---@type Object
    oggVorbis = nil,
    ---@type Single
    progress = nil,
    ---@type Dictionary
    responseHeaders = nil,
    ---@type string
    data = nil,
    ---@type string
    text = nil,
    ---@type Texture2D
    texture = nil,
    ---@type Texture2D
    textureNonReadable = nil,
    ---@type ThreadPriority
    threadPriority = nil,
    ---@type Single
    uploadProgress = nil,
    ---@type string
    url = nil,
    ---@type boolean
    keepWaiting = nil,
}
---@param texture Texture2D
function WWW:LoadImageIntoTexture(texture) end
function WWW:Dispose() end
---@return AudioClip
---@param threeD boolean
---@param stream boolean
---@param audioType AudioType
function WWW:GetAudioClip(threeD, stream, audioType) end
---@return AudioClip
---@param threeD boolean
---@param audioType AudioType
function WWW:GetAudioClipCompressed(threeD, audioType) end
---@return MovieTexture
function WWW:GetMovieTexture() end
---@return string
---@param s string
---@param e Encoding
function WWW.EscapeURL(s, e) end
---@return string
---@param s string
---@param e Encoding
function WWW.UnEscapeURL(s, e) end
---@return WWW
---@param url string
---@param version number
---@param crc UInt32
function WWW.LoadFromCacheOrDownload(url, version, crc) end
---@return boolean
---@param objA Object
---@param objB Object
function WWW.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function WWW.ReferenceEquals(objA, objB) end

---@class Screen : Object @ ---------------------------------------------------------------
local Screen = {
}
Screen.width = nil
Screen.height = nil
Screen.dpi = nil
Screen.currentResolution = nil
Screen.resolutions = nil
Screen.fullScreen = nil
Screen.fullScreenMode = nil
Screen.safeArea = nil
Screen.cutouts = nil
Screen.autorotateToPortrait = nil
Screen.autorotateToPortraitUpsideDown = nil
Screen.autorotateToLandscapeLeft = nil
Screen.autorotateToLandscapeRight = nil
Screen.orientation = nil
Screen.sleepTimeout = nil
Screen.brightness = nil
Screen.GetResolution = nil
Screen.showCursor = nil
Screen.lockCursor = nil
---@param width number
---@param height number
---@param fullscreenMode FullScreenMode
---@param preferredRefreshRate number
function Screen.SetResolution(width, height, fullscreenMode, preferredRefreshRate) end
---@return boolean
---@param objA Object
---@param objB Object
function Screen.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Screen.ReferenceEquals(objA, objB) end

---@class AudioClip : Object @ ---------------------------------------------------------------
local AudioClip = {
    ---@type Single
    length = nil,
    ---@type number
    samples = nil,
    ---@type number
    channels = nil,
    ---@type number
    frequency = nil,
    ---@type boolean
    isReadyToPlay = nil,
    ---@type AudioClipLoadType
    loadType = nil,
    ---@type boolean
    preloadAudioData = nil,
    ---@type boolean
    ambisonic = nil,
    ---@type boolean
    loadInBackground = nil,
    ---@type AudioDataLoadState
    loadState = nil,
}
---@return boolean
function AudioClip:LoadAudioData() end
---@return boolean
function AudioClip:UnloadAudioData() end
---@return boolean
---@param data Single[]
---@param offsetSamples number
function AudioClip:GetData(data, offsetSamples) end
---@return boolean
---@param data Single[]
---@param offsetSamples number
function AudioClip:SetData(data, offsetSamples) end
---@return AudioClip
---@param name string
---@param lengthSamples number
---@param channels number
---@param frequency number
---@param _3D boolean
---@param stream boolean
---@param pcmreadercallback PCMReaderCallback
---@param pcmsetpositioncallback PCMSetPositionCallback
function AudioClip.Create(name, lengthSamples, channels, frequency, _3D, stream, pcmreadercallback, pcmsetpositioncallback) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function AudioClip.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function AudioClip.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function AudioClip.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function AudioClip.FindObjectsOfType(type, includeInactive) end
---@param target Object
function AudioClip.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function AudioClip.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function AudioClip.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function AudioClip.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function AudioClip.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function AudioClip.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function AudioClip.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function AudioClip.ReferenceEquals(objA, objB) end

---@class AssetBundle : Object @ ---------------------------------------------------------------
local AssetBundle = {
    ---@type Object
    mainAsset = nil,
    ---@type boolean
    isStreamedSceneAssetBundle = nil,
}
AssetBundle.memoryBudgetKB = nil
---@return boolean
---@param name string
function AssetBundle:Contains(name) end
---@return Object
---@param name string
function AssetBundle:Load(name) end
---@return Object[]
function AssetBundle:LoadAll() end
---@return Object
---@param name string
---@param type Type
function AssetBundle:LoadAsset(name, type) end
---@return AssetBundleRequest
---@param name string
---@param type Type
function AssetBundle:LoadAssetAsync(name, type) end
---@return Object[]
---@param name string
---@param type Type
function AssetBundle:LoadAssetWithSubAssets(name, type) end
---@return AssetBundleRequest
---@param name string
---@param type Type
function AssetBundle:LoadAssetWithSubAssetsAsync(name, type) end
---@return Object[]
---@param type Type
function AssetBundle:LoadAllAssets(type) end
---@return AssetBundleRequest
---@param type Type
function AssetBundle:LoadAllAssetsAsync(type) end
---@return String[]
function AssetBundle:AllAssetNames() end
---@param unloadAllLoadedObjects boolean
function AssetBundle:Unload(unloadAllLoadedObjects) end
---@return String[]
function AssetBundle:GetAllAssetNames() end
---@return String[]
function AssetBundle:GetAllScenePaths() end
---@param unloadAllObjects boolean
function AssetBundle.UnloadAllAssetBundles(unloadAllObjects) end
---@return IEnumerable
function AssetBundle.GetAllLoadedAssetBundles() end
---@return AssetBundleCreateRequest
---@param path string
---@param crc UInt32
---@param offset UInt64
function AssetBundle.LoadFromFileAsync(path, crc, offset) end
---@return AssetBundle
---@param path string
---@param crc UInt32
---@param offset UInt64
function AssetBundle.LoadFromFile(path, crc, offset) end
---@return AssetBundleCreateRequest
---@param binary Byte[]
---@param crc UInt32
function AssetBundle.LoadFromMemoryAsync(binary, crc) end
---@return AssetBundle
---@param binary Byte[]
---@param crc UInt32
function AssetBundle.LoadFromMemory(binary, crc) end
---@return AssetBundleCreateRequest
---@param stream Stream
---@param crc UInt32
---@param managedReadBufferSize UInt32
function AssetBundle.LoadFromStreamAsync(stream, crc, managedReadBufferSize) end
---@return AssetBundle
---@param stream Stream
---@param crc UInt32
---@param managedReadBufferSize UInt32
function AssetBundle.LoadFromStream(stream, crc, managedReadBufferSize) end
---@return AssetBundleRecompressOperation
---@param inputPath string
---@param outputPath string
---@param method BuildCompression
---@param expectedCRC UInt32
---@param priority ThreadPriority
function AssetBundle.RecompressAssetBundleAsync(inputPath, outputPath, method, expectedCRC, priority) end
---@return AssetBundle
---@param path string
function AssetBundle.CreateFromFile(path) end
---@return AssetBundleCreateRequest
---@param binary Byte[]
function AssetBundle.CreateFromMemory(binary) end
---@return AssetBundle
---@param binary Byte[]
function AssetBundle.CreateFromMemoryImmediate(binary) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function AssetBundle.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function AssetBundle.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function AssetBundle.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function AssetBundle.FindObjectsOfType(type, includeInactive) end
---@param target Object
function AssetBundle.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function AssetBundle.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function AssetBundle.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function AssetBundle.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function AssetBundle.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function AssetBundle.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function AssetBundle.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function AssetBundle.ReferenceEquals(objA, objB) end

---@class ParticleSystem : Component @ ---------------------------------------------------------------
local ParticleSystem = {
    ---@type number
    safeCollisionEventSize = nil,
    ---@type Single
    startDelay = nil,
    ---@type boolean
    loop = nil,
    ---@type boolean
    playOnAwake = nil,
    ---@type Single
    duration = nil,
    ---@type Single
    playbackSpeed = nil,
    ---@type boolean
    enableEmission = nil,
    ---@type Single
    emissionRate = nil,
    ---@type Single
    startSpeed = nil,
    ---@type Single
    startSize = nil,
    ---@type Color
    startColor = nil,
    ---@type Single
    startRotation = nil,
    ---@type Vector3
    startRotation3D = nil,
    ---@type Single
    startLifetime = nil,
    ---@type Single
    gravityModifier = nil,
    ---@type number
    maxParticles = nil,
    ---@type ParticleSystemSimulationSpace
    simulationSpace = nil,
    ---@type ParticleSystemScalingMode
    scalingMode = nil,
    ---@type boolean
    automaticCullingEnabled = nil,
    ---@type boolean
    isPlaying = nil,
    ---@type boolean
    isEmitting = nil,
    ---@type boolean
    isStopped = nil,
    ---@type boolean
    isPaused = nil,
    ---@type number
    particleCount = nil,
    ---@type Single
    time = nil,
    ---@type UInt32
    randomSeed = nil,
    ---@type boolean
    useAutoRandomSeed = nil,
    ---@type boolean
    proceduralSimulationSupported = nil,
    ---@type MainModule
    main = nil,
    ---@type EmissionModule
    emission = nil,
    ---@type ShapeModule
    shape = nil,
    ---@type VelocityOverLifetimeModule
    velocityOverLifetime = nil,
    ---@type LimitVelocityOverLifetimeModule
    limitVelocityOverLifetime = nil,
    ---@type InheritVelocityModule
    inheritVelocity = nil,
    ---@type LifetimeByEmitterSpeedModule
    lifetimeByEmitterSpeed = nil,
    ---@type ForceOverLifetimeModule
    forceOverLifetime = nil,
    ---@type ColorOverLifetimeModule
    colorOverLifetime = nil,
    ---@type ColorBySpeedModule
    colorBySpeed = nil,
    ---@type SizeOverLifetimeModule
    sizeOverLifetime = nil,
    ---@type SizeBySpeedModule
    sizeBySpeed = nil,
    ---@type RotationOverLifetimeModule
    rotationOverLifetime = nil,
    ---@type RotationBySpeedModule
    rotationBySpeed = nil,
    ---@type ExternalForcesModule
    externalForces = nil,
    ---@type NoiseModule
    noise = nil,
    ---@type CollisionModule
    collision = nil,
    ---@type TriggerModule
    trigger = nil,
    ---@type SubEmittersModule
    subEmitters = nil,
    ---@type TextureSheetAnimationModule
    textureSheetAnimation = nil,
    ---@type LightsModule
    lights = nil,
    ---@type TrailModule
    trails = nil,
    ---@type CustomDataModule
    customData = nil,
}
---@param position Vector3
---@param velocity Vector3
---@param size Single
---@param lifetime Single
---@param color Color32
function ParticleSystem:Emit(position, velocity, size, lifetime, color) end
---@param particles Particle[]
---@param size number
---@param offset number
function ParticleSystem:SetParticles(particles, size, offset) end
---@return number
---@param particles Particle[]
---@param size number
---@param offset number
function ParticleSystem:GetParticles(particles, size, offset) end
---@param customData List
---@param streamIndex ParticleSystemCustomData
function ParticleSystem:SetCustomParticleData(customData, streamIndex) end
---@return number
---@param customData List
---@param streamIndex ParticleSystemCustomData
function ParticleSystem:GetCustomParticleData(customData, streamIndex) end
---@return PlaybackState
function ParticleSystem:GetPlaybackState() end
---@param playbackState PlaybackState
function ParticleSystem:SetPlaybackState(playbackState) end
---@return Trails
function ParticleSystem:GetTrails() end
---@param trailData Trails
function ParticleSystem:SetTrails(trailData) end
---@param t Single
---@param withChildren boolean
---@param restart boolean
---@param fixedTimeStep boolean
function ParticleSystem:Simulate(t, withChildren, restart, fixedTimeStep) end
---@param withChildren boolean
function ParticleSystem:Play(withChildren) end
---@param withChildren boolean
function ParticleSystem:Pause(withChildren) end
---@param withChildren boolean
---@param stopBehavior ParticleSystemStopBehavior
function ParticleSystem:Stop(withChildren, stopBehavior) end
---@param withChildren boolean
function ParticleSystem:Clear(withChildren) end
---@return boolean
---@param withChildren boolean
function ParticleSystem:IsAlive(withChildren) end
---@param subEmitterIndex number
---@param particle Particle
function ParticleSystem:TriggerSubEmitter(subEmitterIndex, particle) end
function ParticleSystem:AllocateAxisOfRotationAttribute() end
function ParticleSystem:AllocateMeshIndexAttribute() end
---@param stream ParticleSystemCustomData
function ParticleSystem:AllocateCustomDataAttribute(stream) end
function ParticleSystem.ResetPreMappedBufferMemory() end
---@param vertexBuffersCount number
---@param indexBuffersCount number
function ParticleSystem.SetMaximumPreMappedBufferCounts(vertexBuffersCount, indexBuffersCount) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function ParticleSystem.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function ParticleSystem.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function ParticleSystem.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function ParticleSystem.FindObjectsOfType(type, includeInactive) end
---@param target Object
function ParticleSystem.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function ParticleSystem.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function ParticleSystem.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function ParticleSystem.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function ParticleSystem.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function ParticleSystem.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function ParticleSystem.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function ParticleSystem.ReferenceEquals(objA, objB) end

---@class AsyncOperation : YieldInstruction @ ---------------------------------------------------------------
local AsyncOperation = {
    ---@type boolean
    isDone = nil,
    ---@type Single
    progress = nil,
    ---@type number
    priority = nil,
    ---@type boolean
    allowSceneActivation = nil,
}
---@return boolean
---@param objA Object
---@param objB Object
function AsyncOperation.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function AsyncOperation.ReferenceEquals(objA, objB) end

---@class SleepTimeout : Object @ ---------------------------------------------------------------
local SleepTimeout = {
}
SleepTimeout.NeverSleep = nil
SleepTimeout.SystemSetting = nil
---@return boolean
---@param objA Object
---@param objB Object
function SleepTimeout.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function SleepTimeout.ReferenceEquals(objA, objB) end

---@class Animator : Behaviour @ ---------------------------------------------------------------
local Animator = {
    ---@type boolean
    isOptimizable = nil,
    ---@type boolean
    isHuman = nil,
    ---@type boolean
    hasRootMotion = nil,
    ---@type Single
    humanScale = nil,
    ---@type boolean
    isInitialized = nil,
    ---@type Vector3
    deltaPosition = nil,
    ---@type Quaternion
    deltaRotation = nil,
    ---@type Vector3
    velocity = nil,
    ---@type Vector3
    angularVelocity = nil,
    ---@type Vector3
    rootPosition = nil,
    ---@type Quaternion
    rootRotation = nil,
    ---@type boolean
    applyRootMotion = nil,
    ---@type boolean
    linearVelocityBlending = nil,
    ---@type boolean
    animatePhysics = nil,
    ---@type AnimatorUpdateMode
    updateMode = nil,
    ---@type boolean
    hasTransformHierarchy = nil,
    ---@type Single
    gravityWeight = nil,
    ---@type Vector3
    bodyPosition = nil,
    ---@type Quaternion
    bodyRotation = nil,
    ---@type boolean
    stabilizeFeet = nil,
    ---@type number
    layerCount = nil,
    ---@type AnimatorControllerParameter[]
    parameters = nil,
    ---@type number
    parameterCount = nil,
    ---@type Single
    feetPivotActive = nil,
    ---@type Single
    pivotWeight = nil,
    ---@type Vector3
    pivotPosition = nil,
    ---@type boolean
    isMatchingTarget = nil,
    ---@type Single
    speed = nil,
    ---@type Vector3
    targetPosition = nil,
    ---@type Quaternion
    targetRotation = nil,
    ---@type AnimatorCullingMode
    cullingMode = nil,
    ---@type Single
    playbackTime = nil,
    ---@type Single
    recorderStartTime = nil,
    ---@type Single
    recorderStopTime = nil,
    ---@type AnimatorRecorderMode
    recorderMode = nil,
    ---@type RuntimeAnimatorController
    runtimeAnimatorController = nil,
    ---@type boolean
    hasBoundPlayables = nil,
    ---@type Avatar
    avatar = nil,
    ---@type PlayableGraph
    playableGraph = nil,
    ---@type boolean
    layersAffectMassCenter = nil,
    ---@type Single
    leftFeetBottomHeight = nil,
    ---@type Single
    rightFeetBottomHeight = nil,
    ---@type boolean
    logWarnings = nil,
    ---@type boolean
    fireEvents = nil,
    ---@type boolean
    keepAnimatorControllerStateOnDisable = nil,
}
---@return AnimationInfo[]
---@param layerIndex number
function Animator:GetCurrentAnimationClipState(layerIndex) end
---@return AnimationInfo[]
---@param layerIndex number
function Animator:GetNextAnimationClipState(layerIndex) end
function Animator:Stop() end
---@return Single
---@param name string
function Animator:GetFloat(name) end
---@param name string
---@param value Single
---@param dampTime Single
---@param deltaTime Single
function Animator:SetFloat(name, value, dampTime, deltaTime) end
---@return boolean
---@param name string
function Animator:GetBool(name) end
---@param name string
---@param value boolean
function Animator:SetBool(name, value) end
---@return number
---@param name string
function Animator:GetInteger(name) end
---@param name string
---@param value number
function Animator:SetInteger(name, value) end
---@param name string
function Animator:SetTrigger(name) end
---@param name string
function Animator:ResetTrigger(name) end
---@return boolean
---@param name string
function Animator:IsParameterControlledByCurve(name) end
---@return Vector3
---@param goal AvatarIKGoal
function Animator:GetIKPosition(goal) end
---@param goal AvatarIKGoal
---@param goalPosition Vector3
function Animator:SetIKPosition(goal, goalPosition) end
---@return Quaternion
---@param goal AvatarIKGoal
function Animator:GetIKRotation(goal) end
---@param goal AvatarIKGoal
---@param goalRotation Quaternion
function Animator:SetIKRotation(goal, goalRotation) end
---@return Single
---@param goal AvatarIKGoal
function Animator:GetIKPositionWeight(goal) end
---@param goal AvatarIKGoal
---@param value Single
function Animator:SetIKPositionWeight(goal, value) end
---@return Single
---@param goal AvatarIKGoal
function Animator:GetIKRotationWeight(goal) end
---@param goal AvatarIKGoal
---@param value Single
function Animator:SetIKRotationWeight(goal, value) end
---@return Vector3
---@param hint AvatarIKHint
function Animator:GetIKHintPosition(hint) end
---@param hint AvatarIKHint
---@param hintPosition Vector3
function Animator:SetIKHintPosition(hint, hintPosition) end
---@return Single
---@param hint AvatarIKHint
function Animator:GetIKHintPositionWeight(hint) end
---@param hint AvatarIKHint
---@param value Single
function Animator:SetIKHintPositionWeight(hint, value) end
---@param lookAtPosition Vector3
function Animator:SetLookAtPosition(lookAtPosition) end
---@param weight Single
---@param bodyWeight Single
---@param headWeight Single
---@param eyesWeight Single
---@param clampWeight Single
function Animator:SetLookAtWeight(weight, bodyWeight, headWeight, eyesWeight, clampWeight) end
---@param humanBoneId HumanBodyBones
---@param rotation Quaternion
function Animator:SetBoneLocalRotation(humanBoneId, rotation) end
---@return T
function Animator:GetBehaviour() end
---@return StateMachineBehaviour[]
---@param fullPathHash number
---@param layerIndex number
function Animator:GetBehaviours(fullPathHash, layerIndex) end
---@return string
---@param layerIndex number
function Animator:GetLayerName(layerIndex) end
---@return number
---@param layerName string
function Animator:GetLayerIndex(layerName) end
---@return Single
---@param layerIndex number
function Animator:GetLayerWeight(layerIndex) end
---@param layerIndex number
---@param weight Single
function Animator:SetLayerWeight(layerIndex, weight) end
---@return AnimatorStateInfo
---@param layerIndex number
function Animator:GetCurrentAnimatorStateInfo(layerIndex) end
---@return AnimatorStateInfo
---@param layerIndex number
function Animator:GetNextAnimatorStateInfo(layerIndex) end
---@return AnimatorTransitionInfo
---@param layerIndex number
function Animator:GetAnimatorTransitionInfo(layerIndex) end
---@return number
---@param layerIndex number
function Animator:GetCurrentAnimatorClipInfoCount(layerIndex) end
---@return number
---@param layerIndex number
function Animator:GetNextAnimatorClipInfoCount(layerIndex) end
---@param layerIndex number
---@param clips List
function Animator:GetCurrentAnimatorClipInfo(layerIndex, clips) end
---@param layerIndex number
---@param clips List
function Animator:GetNextAnimatorClipInfo(layerIndex, clips) end
---@return boolean
---@param layerIndex number
function Animator:IsInTransition(layerIndex) end
---@return AnimatorControllerParameter
---@param index number
function Animator:GetParameter(index) end
---@param matchPosition Vector3
---@param matchRotation Quaternion
---@param targetBodyPart AvatarTarget
---@param weightMask MatchTargetWeightMask
---@param startNormalizedTime Single
---@param targetNormalizedTime Single
---@param completeMatch boolean
function Animator:MatchTarget(matchPosition, matchRotation, targetBodyPart, weightMask, startNormalizedTime, targetNormalizedTime, completeMatch) end
---@param completeMatch boolean
function Animator:InterruptMatchTarget(completeMatch) end
---@param normalizedTime Single
function Animator:ForceStateNormalizedTime(normalizedTime) end
---@param stateName string
---@param fixedTransitionDuration Single
---@param layer number
---@param fixedTimeOffset Single
---@param normalizedTransitionTime Single
function Animator:CrossFadeInFixedTime(stateName, fixedTransitionDuration, layer, fixedTimeOffset, normalizedTransitionTime) end
function Animator:WriteDefaultValues() end
---@param stateName string
---@param normalizedTransitionDuration Single
---@param layer number
---@param normalizedTimeOffset Single
---@param normalizedTransitionTime Single
function Animator:CrossFade(stateName, normalizedTransitionDuration, layer, normalizedTimeOffset, normalizedTransitionTime) end
---@param stateName string
---@param layer number
---@param fixedTime Single
function Animator:PlayInFixedTime(stateName, layer, fixedTime) end
---@param stateName string
---@param layer number
---@param normalizedTime Single
function Animator:Play(stateName, layer, normalizedTime) end
---@param targetIndex AvatarTarget
---@param targetNormalizedTime Single
function Animator:SetTarget(targetIndex, targetNormalizedTime) end
---@return boolean
---@param transform Transform
function Animator:IsControlled(transform) end
---@return Transform
---@param humanBoneId HumanBodyBones
function Animator:GetBoneTransform(humanBoneId) end
function Animator:StartPlayback() end
function Animator:StopPlayback() end
---@param frameCount number
function Animator:StartRecording(frameCount) end
function Animator:StopRecording() end
---@return boolean
---@param layerIndex number
---@param stateID number
function Animator:HasState(layerIndex, stateID) end
---@param deltaTime Single
function Animator:Update(deltaTime) end
function Animator:Rebind() end
function Animator:ApplyBuiltinRootMotion() end
---@return Vector3
---@param name string
function Animator:GetVector(name) end
---@param name string
---@param value Vector3
function Animator:SetVector(name, value) end
---@return Quaternion
---@param name string
function Animator:GetQuaternion(name) end
---@param name string
---@param value Quaternion
function Animator:SetQuaternion(name, value) end
---@return number
---@param name string
function Animator.StringToHash(name) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Animator.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Animator.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Animator.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Animator.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Animator.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Animator.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Animator.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Animator.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Animator.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Animator.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Animator.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Animator.ReferenceEquals(objA, objB) end

---@class Input : Object @ ---------------------------------------------------------------
local Input = {
}
Input.simulateMouseWithTouches = nil
Input.anyKey = nil
Input.anyKeyDown = nil
Input.inputString = nil
Input.mousePosition = nil
Input.mouseScrollDelta = nil
Input.imeCompositionMode = nil
Input.compositionString = nil
Input.imeIsSelected = nil
Input.compositionCursorPos = nil
Input.eatKeyPressOnTextFieldFocus = nil
Input.mousePresent = nil
Input.touchCount = nil
Input.touchPressureSupported = nil
Input.stylusTouchSupported = nil
Input.touchSupported = nil
Input.multiTouchEnabled = nil
Input.isGyroAvailable = nil
Input.deviceOrientation = nil
Input.acceleration = nil
Input.compensateSensors = nil
Input.accelerationEventCount = nil
Input.backButtonLeavesApp = nil
Input.location = nil
Input.compass = nil
Input.gyro = nil
Input.touches = nil
Input.accelerationEvents = nil
---@return Single
---@param axisName string
function Input.GetAxis(axisName) end
---@return Single
---@param axisName string
function Input.GetAxisRaw(axisName) end
---@return boolean
---@param buttonName string
function Input.GetButton(buttonName) end
---@return boolean
---@param buttonName string
function Input.GetButtonDown(buttonName) end
---@return boolean
---@param buttonName string
function Input.GetButtonUp(buttonName) end
---@return boolean
---@param button number
function Input.GetMouseButton(button) end
---@return boolean
---@param button number
function Input.GetMouseButtonDown(button) end
---@return boolean
---@param button number
function Input.GetMouseButtonUp(button) end
function Input.ResetInputAxes() end
---@return boolean
---@param joystickName string
function Input.IsJoystickPreconfigured(joystickName) end
---@return String[]
function Input.GetJoystickNames() end
---@return Touch
---@param index number
function Input.GetTouch(index) end
---@return AccelerationEvent
---@param index number
function Input.GetAccelerationEvent(index) end
---@return boolean
---@param key KeyCode
function Input.GetKey(key) end
---@return boolean
---@param key KeyCode
function Input.GetKeyUp(key) end
---@return boolean
---@param key KeyCode
function Input.GetKeyDown(key) end
---@return boolean
---@param objA Object
---@param objB Object
function Input.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Input.ReferenceEquals(objA, objB) end

---@class SkinnedMeshRenderer : Renderer @ ---------------------------------------------------------------
local SkinnedMeshRenderer = {
    ---@type SkinQuality
    quality = nil,
    ---@type boolean
    updateWhenOffscreen = nil,
    ---@type boolean
    forceMatrixRecalculationPerRender = nil,
    ---@type Transform
    rootBone = nil,
    ---@type Transform[]
    bones = nil,
    ---@type Mesh
    sharedMesh = nil,
    ---@type boolean
    skinnedMotionVectors = nil,
    ---@type Bounds
    localBounds = nil,
}
---@return Single
---@param index number
function SkinnedMeshRenderer:GetBlendShapeWeight(index) end
---@param index number
---@param value Single
function SkinnedMeshRenderer:SetBlendShapeWeight(index, value) end
---@param mesh Mesh
---@param useScale boolean
function SkinnedMeshRenderer:BakeMesh(mesh, useScale) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function SkinnedMeshRenderer.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function SkinnedMeshRenderer.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function SkinnedMeshRenderer.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function SkinnedMeshRenderer.FindObjectsOfType(type, includeInactive) end
---@param target Object
function SkinnedMeshRenderer.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function SkinnedMeshRenderer.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function SkinnedMeshRenderer.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function SkinnedMeshRenderer.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function SkinnedMeshRenderer.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function SkinnedMeshRenderer.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function SkinnedMeshRenderer.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function SkinnedMeshRenderer.ReferenceEquals(objA, objB) end

---@class BoxCollider : Collider @ ---------------------------------------------------------------
local BoxCollider = {
    ---@type Vector3
    center = nil,
    ---@type Vector3
    size = nil,
    ---@type Vector3
    extents = nil,
}
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function BoxCollider.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function BoxCollider.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function BoxCollider.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function BoxCollider.FindObjectsOfType(type, includeInactive) end
---@param target Object
function BoxCollider.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function BoxCollider.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function BoxCollider.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function BoxCollider.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function BoxCollider.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function BoxCollider.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function BoxCollider.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function BoxCollider.ReferenceEquals(objA, objB) end

---@class MeshCollider : Collider @ ---------------------------------------------------------------
local MeshCollider = {
    ---@type Mesh
    sharedMesh = nil,
    ---@type boolean
    convex = nil,
    ---@type boolean
    inflateMesh = nil,
    ---@type MeshColliderCookingOptions
    cookingOptions = nil,
    ---@type Single
    skinWidth = nil,
    ---@type boolean
    smoothSphereCollisions = nil,
}
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function MeshCollider.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function MeshCollider.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function MeshCollider.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function MeshCollider.FindObjectsOfType(type, includeInactive) end
---@param target Object
function MeshCollider.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function MeshCollider.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function MeshCollider.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function MeshCollider.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function MeshCollider.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function MeshCollider.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function MeshCollider.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function MeshCollider.ReferenceEquals(objA, objB) end

---@class SphereCollider : Collider @ ---------------------------------------------------------------
local SphereCollider = {
    ---@type Vector3
    center = nil,
    ---@type Single
    radius = nil,
}
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function SphereCollider.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function SphereCollider.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function SphereCollider.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function SphereCollider.FindObjectsOfType(type, includeInactive) end
---@param target Object
function SphereCollider.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function SphereCollider.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function SphereCollider.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function SphereCollider.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function SphereCollider.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function SphereCollider.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function SphereCollider.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function SphereCollider.ReferenceEquals(objA, objB) end

---@class CharacterController : Collider @ ---------------------------------------------------------------
local CharacterController = {
    ---@type Vector3
    velocity = nil,
    ---@type boolean
    isGrounded = nil,
    ---@type CollisionFlags
    collisionFlags = nil,
    ---@type Single
    radius = nil,
    ---@type Single
    height = nil,
    ---@type Vector3
    center = nil,
    ---@type Single
    slopeLimit = nil,
    ---@type Single
    stepOffset = nil,
    ---@type Single
    skinWidth = nil,
    ---@type Single
    minMoveDistance = nil,
    ---@type boolean
    detectCollisions = nil,
    ---@type boolean
    enableOverlapRecovery = nil,
}
---@return boolean
---@param speed Vector3
function CharacterController:SimpleMove(speed) end
---@return CollisionFlags
---@param motion Vector3
function CharacterController:Move(motion) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function CharacterController.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function CharacterController.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function CharacterController.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function CharacterController.FindObjectsOfType(type, includeInactive) end
---@param target Object
function CharacterController.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function CharacterController.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function CharacterController.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function CharacterController.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function CharacterController.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function CharacterController.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function CharacterController.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function CharacterController.ReferenceEquals(objA, objB) end

---@class CapsuleCollider : Collider @ ---------------------------------------------------------------
local CapsuleCollider = {
    ---@type Vector3
    center = nil,
    ---@type Single
    radius = nil,
    ---@type Single
    height = nil,
    ---@type number
    direction = nil,
}
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function CapsuleCollider.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function CapsuleCollider.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function CapsuleCollider.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function CapsuleCollider.FindObjectsOfType(type, includeInactive) end
---@param target Object
function CapsuleCollider.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function CapsuleCollider.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function CapsuleCollider.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function CapsuleCollider.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function CapsuleCollider.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function CapsuleCollider.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function CapsuleCollider.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function CapsuleCollider.ReferenceEquals(objA, objB) end

---@class Animation : Behaviour @ ---------------------------------------------------------------
local Animation = {
    ---@type AnimationClip
    clip = nil,
    ---@type boolean
    playAutomatically = nil,
    ---@type WrapMode
    wrapMode = nil,
    ---@type boolean
    isPlaying = nil,
    ---@type AnimationState
    Item = nil,
    ---@type boolean
    animatePhysics = nil,
    ---@type boolean
    animateOnlyIfVisible = nil,
    ---@type AnimationCullingType
    cullingType = nil,
    ---@type Bounds
    localBounds = nil,
}
---@param name string
function Animation:Stop(name) end
---@param name string
function Animation:Rewind(name) end
function Animation:Sample() end
---@return boolean
---@param name string
function Animation:IsPlaying(name) end
---@return boolean
---@param animation string
---@param mode PlayMode
function Animation:Play(animation, mode) end
---@param animation string
---@param fadeLength Single
---@param mode PlayMode
function Animation:CrossFade(animation, fadeLength, mode) end
---@param animation string
---@param targetWeight Single
---@param fadeLength Single
function Animation:Blend(animation, targetWeight, fadeLength) end
---@return AnimationState
---@param animation string
---@param fadeLength Single
---@param queue QueueMode
---@param mode PlayMode
function Animation:CrossFadeQueued(animation, fadeLength, queue, mode) end
---@return AnimationState
---@param animation string
---@param queue QueueMode
---@param mode PlayMode
function Animation:PlayQueued(animation, queue, mode) end
---@param clip AnimationClip
---@param newName string
---@param firstFrame number
---@param lastFrame number
---@param addLoopFrame boolean
function Animation:AddClip(clip, newName, firstFrame, lastFrame, addLoopFrame) end
---@param clip AnimationClip
function Animation:RemoveClip(clip) end
---@return number
function Animation:GetClipCount() end
---@param layer number
function Animation:SyncLayer(layer) end
---@return IEnumerator
function Animation:GetEnumerator() end
---@return AnimationClip
---@param name string
function Animation:GetClip(name) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Animation.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Animation.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Animation.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Animation.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Animation.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Animation.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Animation.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Animation.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Animation.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Animation.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Animation.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Animation.ReferenceEquals(objA, objB) end

---@class AnimationClip : Motion @ ---------------------------------------------------------------
local AnimationClip = {
    ---@type Single
    length = nil,
    ---@type Single
    frameRate = nil,
    ---@type WrapMode
    wrapMode = nil,
    ---@type Bounds
    localBounds = nil,
    ---@type boolean
    legacy = nil,
    ---@type boolean
    humanMotion = nil,
    ---@type boolean
    empty = nil,
    ---@type boolean
    hasGenericRootTransform = nil,
    ---@type boolean
    hasMotionFloatCurves = nil,
    ---@type boolean
    hasMotionCurves = nil,
    ---@type boolean
    hasRootCurves = nil,
    ---@type AnimationEvent[]
    events = nil,
}
---@param go GameObject
---@param time Single
function AnimationClip:SampleAnimation(go, time) end
---@param relativePath string
---@param type Type
---@param propertyName string
---@param curve AnimationCurve
function AnimationClip:SetCurve(relativePath, type, propertyName, curve) end
function AnimationClip:EnsureQuaternionContinuity() end
function AnimationClip:ClearCurves() end
---@param evt AnimationEvent
function AnimationClip:AddEvent(evt) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function AnimationClip.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function AnimationClip.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function AnimationClip.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function AnimationClip.FindObjectsOfType(type, includeInactive) end
---@param target Object
function AnimationClip.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function AnimationClip.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function AnimationClip.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function AnimationClip.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function AnimationClip.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function AnimationClip.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function AnimationClip.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function AnimationClip.ReferenceEquals(objA, objB) end

---@class AnimationState : TrackedReference @ ---------------------------------------------------------------
local AnimationState = {
    ---@type boolean
    enabled = nil,
    ---@type Single
    weight = nil,
    ---@type WrapMode
    wrapMode = nil,
    ---@type Single
    time = nil,
    ---@type Single
    normalizedTime = nil,
    ---@type Single
    speed = nil,
    ---@type Single
    normalizedSpeed = nil,
    ---@type Single
    length = nil,
    ---@type number
    layer = nil,
    ---@type AnimationClip
    clip = nil,
    ---@type string
    name = nil,
    ---@type AnimationBlendMode
    blendMode = nil,
}
---@param mix Transform
---@param recursive boolean
function AnimationState:AddMixingTransform(mix, recursive) end
---@param mix Transform
function AnimationState:RemoveMixingTransform(mix) end
---@return boolean
---@param objA Object
---@param objB Object
function AnimationState.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function AnimationState.ReferenceEquals(objA, objB) end

---@class QualitySettings : Object @ ---------------------------------------------------------------
local QualitySettings = {
}
QualitySettings.currentLevel = nil
QualitySettings.pixelLightCount = nil
QualitySettings.shadows = nil
QualitySettings.shadowProjection = nil
QualitySettings.shadowCascades = nil
QualitySettings.shadowDistance = nil
QualitySettings.shadowResolution = nil
QualitySettings.shadowmaskMode = nil
QualitySettings.shadowNearPlaneOffset = nil
QualitySettings.shadowCascade2Split = nil
QualitySettings.shadowCascade4Split = nil
QualitySettings.lodBias = nil
QualitySettings.anisotropicFiltering = nil
QualitySettings.masterTextureLimit = nil
QualitySettings.maximumLODLevel = nil
QualitySettings.particleRaycastBudget = nil
QualitySettings.softParticles = nil
QualitySettings.softVegetation = nil
QualitySettings.vSyncCount = nil
QualitySettings.antiAliasing = nil
QualitySettings.asyncUploadTimeSlice = nil
QualitySettings.asyncUploadBufferSize = nil
QualitySettings.asyncUploadPersistentBuffer = nil
QualitySettings.realtimeReflectionProbes = nil
QualitySettings.billboardsFaceCameraPosition = nil
QualitySettings.resolutionScalingFixedDPIFactor = nil
QualitySettings.renderPipeline = nil
QualitySettings.blendWeights = nil
QualitySettings.skinWeights = nil
QualitySettings.streamingMipmapsActive = nil
QualitySettings.streamingMipmapsMemoryBudget = nil
QualitySettings.streamingMipmapsRenderersPerFrame = nil
QualitySettings.streamingMipmapsMaxLevelReduction = nil
QualitySettings.streamingMipmapsAddAllCameras = nil
QualitySettings.streamingMipmapsMaxFileIORequests = nil
QualitySettings.maxQueuedFrames = nil
QualitySettings.names = nil
QualitySettings.desiredColorSpace = nil
QualitySettings.activeColorSpace = nil
---@param applyExpensiveChanges boolean
function QualitySettings.IncreaseLevel(applyExpensiveChanges) end
---@param applyExpensiveChanges boolean
function QualitySettings.DecreaseLevel(applyExpensiveChanges) end
---@param index number
---@param applyExpensiveChanges boolean
function QualitySettings.SetQualityLevel(index, applyExpensiveChanges) end
---@return RenderPipelineAsset
---@param index number
function QualitySettings.GetRenderPipelineAssetAt(index) end
---@return number
function QualitySettings.GetQualityLevel() end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function QualitySettings.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function QualitySettings.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function QualitySettings.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function QualitySettings.FindObjectsOfType(type, includeInactive) end
---@param target Object
function QualitySettings.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function QualitySettings.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function QualitySettings.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function QualitySettings.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function QualitySettings.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function QualitySettings.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function QualitySettings.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function QualitySettings.ReferenceEquals(objA, objB) end

---@class RenderSettings : Object @ ---------------------------------------------------------------
local RenderSettings = {
}
RenderSettings.ambientSkyboxAmount = nil
RenderSettings.fog = nil
RenderSettings.fogStartDistance = nil
RenderSettings.fogEndDistance = nil
RenderSettings.fogMode = nil
RenderSettings.fogColor = nil
RenderSettings.fogDensity = nil
RenderSettings.ambientMode = nil
RenderSettings.ambientSkyColor = nil
RenderSettings.ambientEquatorColor = nil
RenderSettings.ambientGroundColor = nil
RenderSettings.ambientIntensity = nil
RenderSettings.ambientLight = nil
RenderSettings.subtractiveShadowColor = nil
RenderSettings.skybox = nil
RenderSettings.sun = nil
RenderSettings.ambientProbe = nil
RenderSettings.customReflection = nil
RenderSettings.reflectionIntensity = nil
RenderSettings.reflectionBounces = nil
RenderSettings.defaultReflectionMode = nil
RenderSettings.defaultReflectionResolution = nil
RenderSettings.haloStrength = nil
RenderSettings.flareStrength = nil
RenderSettings.flareFadeSpeed = nil
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function RenderSettings.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function RenderSettings.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function RenderSettings.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function RenderSettings.FindObjectsOfType(type, includeInactive) end
---@param target Object
function RenderSettings.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function RenderSettings.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function RenderSettings.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function RenderSettings.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function RenderSettings.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function RenderSettings.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function RenderSettings.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function RenderSettings.ReferenceEquals(objA, objB) end

---@class RenderTexture : Texture @ ---------------------------------------------------------------
local RenderTexture = {
    ---@type number
    width = nil,
    ---@type number
    height = nil,
    ---@type TextureDimension
    dimension = nil,
    ---@type GraphicsFormat
    graphicsFormat = nil,
    ---@type boolean
    useMipMap = nil,
    ---@type boolean
    sRGB = nil,
    ---@type VRTextureUsage
    vrUsage = nil,
    ---@type RenderTextureMemoryless
    memorylessMode = nil,
    ---@type RenderTextureFormat
    format = nil,
    ---@type GraphicsFormat
    stencilFormat = nil,
    ---@type boolean
    autoGenerateMips = nil,
    ---@type number
    volumeDepth = nil,
    ---@type number
    antiAliasing = nil,
    ---@type boolean
    bindTextureMS = nil,
    ---@type boolean
    enableRandomWrite = nil,
    ---@type boolean
    useDynamicScale = nil,
    ---@type boolean
    isPowerOfTwo = nil,
    ---@type RenderBuffer
    colorBuffer = nil,
    ---@type RenderBuffer
    depthBuffer = nil,
    ---@type number
    depth = nil,
    ---@type RenderTextureDescriptor
    descriptor = nil,
    ---@type boolean
    generateMips = nil,
    ---@type boolean
    isCubemap = nil,
    ---@type boolean
    isVolume = nil,
}
RenderTexture.active = nil
RenderTexture.enabled = nil
---@return IntPtr
function RenderTexture:GetNativeDepthBufferPtr() end
---@param discardColor boolean
---@param discardDepth boolean
function RenderTexture:DiscardContents(discardColor, discardDepth) end
function RenderTexture:MarkRestoreExpected() end
---@param target RenderTexture
function RenderTexture:ResolveAntiAliasedSurface(target) end
---@param propertyName string
function RenderTexture:SetGlobalShaderProperty(propertyName) end
---@return boolean
function RenderTexture:Create() end
function RenderTexture:Release() end
---@return boolean
function RenderTexture:IsCreated() end
function RenderTexture:GenerateMips() end
---@param equirect RenderTexture
---@param eye MonoOrStereoscopicEye
function RenderTexture:ConvertToEquirect(equirect, eye) end
---@param color Color
function RenderTexture:SetBorderColor(color) end
---@return Vector2
function RenderTexture:GetTexelOffset() end
---@return boolean
---@param rt RenderTexture
function RenderTexture.SupportsStencil(rt) end
---@param temp RenderTexture
function RenderTexture.ReleaseTemporary(temp) end
---@return RenderTexture
---@param width number
---@param height number
---@param depthBuffer number
---@param format RenderTextureFormat
---@param readWrite RenderTextureReadWrite
---@param antiAliasing number
---@param memorylessMode RenderTextureMemoryless
---@param vrUsage VRTextureUsage
---@param useDynamicScale boolean
function RenderTexture.GetTemporary(width, height, depthBuffer, format, readWrite, antiAliasing, memorylessMode, vrUsage, useDynamicScale) end
---@param forcedMin number
---@param globalMax number
function RenderTexture.SetGlobalAnisotropicFilteringLimits(forcedMin, globalMax) end
function RenderTexture.SetStreamingTextureMaterialDebugProperties() end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function RenderTexture.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function RenderTexture.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function RenderTexture.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function RenderTexture.FindObjectsOfType(type, includeInactive) end
---@param target Object
function RenderTexture.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function RenderTexture.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function RenderTexture.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function RenderTexture.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function RenderTexture.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function RenderTexture.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function RenderTexture.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function RenderTexture.ReferenceEquals(objA, objB) end

---@class Resources : Object @ ---------------------------------------------------------------
local Resources = {
}
---@return Object[]
---@param type Type
function Resources.FindObjectsOfTypeAll(type) end
---@return Object
---@param path string
---@param systemTypeInstance Type
function Resources.Load(path, systemTypeInstance) end
---@return ResourceRequest
---@param path string
---@param type Type
function Resources.LoadAsync(path, type) end
---@return Object[]
---@param path string
---@param systemTypeInstance Type
function Resources.LoadAll(path, systemTypeInstance) end
---@return Object
---@param type Type
---@param path string
function Resources.GetBuiltinResource(type, path) end
---@param assetToUnload Object
function Resources.UnloadAsset(assetToUnload) end
---@return AsyncOperation
function Resources.UnloadUnusedAssets() end
---@return Object
---@param instanceID number
function Resources.InstanceIDToObject(instanceID) end
---@param instanceIDs NativeArray
---@param objects List
function Resources.InstanceIDToObjectList(instanceIDs, objects) end
---@return Object
---@param assetPath string
---@param type Type
function Resources.LoadAssetAtPath(assetPath, type) end
---@return boolean
---@param objA Object
---@param objB Object
function Resources.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Resources.ReferenceEquals(objA, objB) end

---@class LuaProfiler : Object @ ---------------------------------------------------------------
local LuaProfiler = {
}
LuaProfiler.list = nil
function LuaProfiler.Clear() end
---@return number
---@param name string
function LuaProfiler.GetID(name) end
---@param id number
function LuaProfiler.BeginSample(id) end
function LuaProfiler.EndSample() end
---@return boolean
---@param objA Object
---@param objB Object
function LuaProfiler.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function LuaProfiler.ReferenceEquals(objA, objB) end

---@class Canvas : Behaviour @ ---------------------------------------------------------------
local Canvas = {
    ---@type RenderMode
    renderMode = nil,
    ---@type boolean
    isRootCanvas = nil,
    ---@type Rect
    pixelRect = nil,
    ---@type Single
    scaleFactor = nil,
    ---@type Single
    referencePixelsPerUnit = nil,
    ---@type boolean
    overridePixelPerfect = nil,
    ---@type boolean
    pixelPerfect = nil,
    ---@type Single
    planeDistance = nil,
    ---@type number
    renderOrder = nil,
    ---@type boolean
    overrideSorting = nil,
    ---@type number
    sortingOrder = nil,
    ---@type number
    targetDisplay = nil,
    ---@type number
    sortingLayerID = nil,
    ---@type number
    cachedSortingLayerValue = nil,
    ---@type AdditionalCanvasShaderChannels
    additionalShaderChannels = nil,
    ---@type string
    sortingLayerName = nil,
    ---@type Canvas
    rootCanvas = nil,
    ---@type Vector2
    renderingDisplaySize = nil,
    ---@type Camera
    worldCamera = nil,
    ---@type Single
    normalizedSortingGridSize = nil,
    ---@type number
    sortingGridNormalizedSize = nil,
}
---@return Material
function Canvas.GetDefaultCanvasTextMaterial() end
---@return Material
function Canvas.GetDefaultCanvasMaterial() end
---@return Material
function Canvas.GetETC1SupportedCanvasMaterial() end
function Canvas.ForceUpdateCanvases() end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Canvas.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Canvas.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Canvas.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Canvas.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Canvas.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Canvas.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Canvas.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Canvas.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Canvas.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Canvas.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Canvas.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Canvas.ReferenceEquals(objA, objB) end

---@class RectTransform : Transform @ ---------------------------------------------------------------
local RectTransform = {
    ---@type Rect
    rect = nil,
    ---@type Vector2
    anchorMin = nil,
    ---@type Vector2
    anchorMax = nil,
    ---@type Vector2
    anchoredPosition = nil,
    ---@type Vector2
    sizeDelta = nil,
    ---@type Vector2
    pivot = nil,
    ---@type Vector3
    anchoredPosition3D = nil,
    ---@type Vector2
    offsetMin = nil,
    ---@type Vector2
    offsetMax = nil,
}
function RectTransform:ForceUpdateRectTransforms() end
---@param fourCornersArray Vector3[]
function RectTransform:GetLocalCorners(fourCornersArray) end
---@param fourCornersArray Vector3[]
function RectTransform:GetWorldCorners(fourCornersArray) end
---@param edge Edge
---@param inset Single
---@param size Single
function RectTransform:SetInsetAndSizeFromParentEdge(edge, inset, size) end
---@param axis Axis
---@param size Single
function RectTransform:SetSizeWithCurrentAnchors(axis, size) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function RectTransform.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function RectTransform.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function RectTransform.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function RectTransform.FindObjectsOfType(type, includeInactive) end
---@param target Object
function RectTransform.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function RectTransform.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function RectTransform.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function RectTransform.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function RectTransform.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function RectTransform.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function RectTransform.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function RectTransform.ReferenceEquals(objA, objB) end

---@class Text : MaskableGraphic @ ---------------------------------------------------------------
local Text = {
    ---@type TextGenerator
    cachedTextGenerator = nil,
    ---@type TextGenerator
    cachedTextGeneratorForLayout = nil,
    ---@type Texture
    mainTexture = nil,
    ---@type Font
    font = nil,
    ---@type string
    text = nil,
    ---@type boolean
    supportRichText = nil,
    ---@type boolean
    resizeTextForBestFit = nil,
    ---@type number
    resizeTextMinSize = nil,
    ---@type number
    resizeTextMaxSize = nil,
    ---@type TextAnchor
    alignment = nil,
    ---@type boolean
    alignByGeometry = nil,
    ---@type number
    fontSize = nil,
    ---@type HorizontalWrapMode
    horizontalOverflow = nil,
    ---@type VerticalWrapMode
    verticalOverflow = nil,
    ---@type Single
    lineSpacing = nil,
    ---@type FontStyle
    fontStyle = nil,
    ---@type Single
    pixelsPerUnit = nil,
    ---@type Single
    minWidth = nil,
    ---@type Single
    preferredWidth = nil,
    ---@type Single
    flexibleWidth = nil,
    ---@type Single
    minHeight = nil,
    ---@type Single
    preferredHeight = nil,
    ---@type Single
    flexibleHeight = nil,
    ---@type number
    layoutPriority = nil,
}
function Text:FontTextureChanged() end
---@return TextGenerationSettings
---@param extents Vector2
function Text:GetGenerationSettings(extents) end
function Text:CalculateLayoutInputHorizontal() end
function Text:CalculateLayoutInputVertical() end
function Text:OnRebuildRequested() end
---@return Vector2
---@param anchor TextAnchor
function Text.GetTextAnchorPivot(anchor) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Text.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Text.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Text.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Text.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Text.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Text.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Text.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Text.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Text.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Text.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Text.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Text.ReferenceEquals(objA, objB) end

---@class Image : MaskableGraphic @ ---------------------------------------------------------------
local Image = {
    ---@type Sprite
    sprite = nil,
    ---@type Sprite
    overrideSprite = nil,
    ---@type Type
    type = nil,
    ---@type boolean
    preserveAspect = nil,
    ---@type boolean
    fillCenter = nil,
    ---@type FillMethod
    fillMethod = nil,
    ---@type Single
    fillAmount = nil,
    ---@type boolean
    fillClockwise = nil,
    ---@type number
    fillOrigin = nil,
    ---@type Single
    eventAlphaThreshold = nil,
    ---@type Single
    alphaHitTestMinimumThreshold = nil,
    ---@type boolean
    useSpriteMesh = nil,
    ---@type Texture
    mainTexture = nil,
    ---@type boolean
    hasBorder = nil,
    ---@type Single
    pixelsPerUnitMultiplier = nil,
    ---@type Single
    pixelsPerUnit = nil,
    ---@type Material
    material = nil,
    ---@type Single
    minWidth = nil,
    ---@type Single
    preferredWidth = nil,
    ---@type Single
    flexibleWidth = nil,
    ---@type Single
    minHeight = nil,
    ---@type Single
    preferredHeight = nil,
    ---@type Single
    flexibleHeight = nil,
    ---@type number
    layoutPriority = nil,
}
Image.defaultETC1GraphicMaterial = nil
function Image:DisableSpriteOptimizations() end
function Image:OnBeforeSerialize() end
function Image:OnAfterDeserialize() end
function Image:SetNativeSize() end
function Image:CalculateLayoutInputHorizontal() end
function Image:CalculateLayoutInputVertical() end
---@return boolean
---@param screenPoint Vector2
---@param eventCamera Camera
function Image:IsRaycastLocationValid(screenPoint, eventCamera) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Image.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Image.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Image.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Image.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Image.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Image.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Image.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Image.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Image.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Image.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Image.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Image.ReferenceEquals(objA, objB) end

---@class RawImage : MaskableGraphic @ ---------------------------------------------------------------
local RawImage = {
    ---@type Texture
    mainTexture = nil,
    ---@type Texture
    texture = nil,
    ---@type Rect
    uvRect = nil,
}
function RawImage:SetNativeSize() end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function RawImage.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function RawImage.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function RawImage.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function RawImage.FindObjectsOfType(type, includeInactive) end
---@param target Object
function RawImage.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function RawImage.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function RawImage.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function RawImage.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function RawImage.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function RawImage.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function RawImage.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function RawImage.ReferenceEquals(objA, objB) end

---@class Button : Selectable @ ---------------------------------------------------------------
local Button = {
    ---@type ButtonClickedEvent
    onClick = nil,
}
---@param eventData PointerEventData
function Button:OnPointerClick(eventData) end
---@param eventData BaseEventData
function Button:OnSubmit(eventData) end
---@return number
---@param selectables Selectable[]
function Button.AllSelectablesNoAlloc(selectables) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Button.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Button.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Button.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Button.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Button.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Button.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Button.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Button.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Button.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Button.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Button.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Button.ReferenceEquals(objA, objB) end

---@class Slider : Selectable @ ---------------------------------------------------------------
local Slider = {
    ---@type RectTransform
    fillRect = nil,
    ---@type RectTransform
    handleRect = nil,
    ---@type Direction
    direction = nil,
    ---@type Single
    minValue = nil,
    ---@type Single
    maxValue = nil,
    ---@type boolean
    wholeNumbers = nil,
    ---@type Single
    value = nil,
    ---@type Single
    normalizedValue = nil,
    ---@type SliderEvent
    onValueChanged = nil,
}
---@param input Single
function Slider:SetValueWithoutNotify(input) end
---@param executing CanvasUpdate
function Slider:Rebuild(executing) end
function Slider:LayoutComplete() end
function Slider:GraphicUpdateComplete() end
---@param eventData PointerEventData
function Slider:OnPointerDown(eventData) end
---@param eventData PointerEventData
function Slider:OnDrag(eventData) end
---@param eventData AxisEventData
function Slider:OnMove(eventData) end
---@return Selectable
function Slider:FindSelectableOnLeft() end
---@return Selectable
function Slider:FindSelectableOnRight() end
---@return Selectable
function Slider:FindSelectableOnUp() end
---@return Selectable
function Slider:FindSelectableOnDown() end
---@param eventData PointerEventData
function Slider:OnInitializePotentialDrag(eventData) end
---@param direction Direction
---@param includeRectLayouts boolean
function Slider:SetDirection(direction, includeRectLayouts) end
---@return number
---@param selectables Selectable[]
function Slider.AllSelectablesNoAlloc(selectables) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Slider.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Slider.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Slider.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Slider.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Slider.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Slider.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Slider.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Slider.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Slider.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Slider.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Slider.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Slider.ReferenceEquals(objA, objB) end

---@class Toggle : Selectable @ ---------------------------------------------------------------
local Toggle = {
    ---@type ToggleGroup
    group = nil,
    ---@type boolean
    isOn = nil,
    ---@type ToggleTransition
    toggleTransition = nil,
    ---@type Graphic
    graphic = nil,
    ---@type ToggleEvent
    onValueChanged = nil,
}
---@param executing CanvasUpdate
function Toggle:Rebuild(executing) end
function Toggle:LayoutComplete() end
function Toggle:GraphicUpdateComplete() end
---@param value boolean
function Toggle:SetIsOnWithoutNotify(value) end
---@param eventData PointerEventData
function Toggle:OnPointerClick(eventData) end
---@param eventData BaseEventData
function Toggle:OnSubmit(eventData) end
---@return number
---@param selectables Selectable[]
function Toggle.AllSelectablesNoAlloc(selectables) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Toggle.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Toggle.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Toggle.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Toggle.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Toggle.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Toggle.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Toggle.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Toggle.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Toggle.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Toggle.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Toggle.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Toggle.ReferenceEquals(objA, objB) end

---@class InputField : Selectable @ ---------------------------------------------------------------
local InputField = {
    ---@type boolean
    shouldHideMobileInput = nil,
    ---@type boolean
    shouldActivateOnSelect = nil,
    ---@type string
    text = nil,
    ---@type boolean
    isFocused = nil,
    ---@type Single
    caretBlinkRate = nil,
    ---@type number
    caretWidth = nil,
    ---@type Text
    textComponent = nil,
    ---@type Graphic
    placeholder = nil,
    ---@type Color
    caretColor = nil,
    ---@type boolean
    customCaretColor = nil,
    ---@type Color
    selectionColor = nil,
    ---@type SubmitEvent
    onEndEdit = nil,
    ---@type OnChangeEvent
    onValueChange = nil,
    ---@type OnChangeEvent
    onValueChanged = nil,
    ---@type OnValidateInput
    onValidateInput = nil,
    ---@type number
    characterLimit = nil,
    ---@type ContentType
    contentType = nil,
    ---@type LineType
    lineType = nil,
    ---@type InputType
    inputType = nil,
    ---@type TouchScreenKeyboard
    touchScreenKeyboard = nil,
    ---@type TouchScreenKeyboardType
    keyboardType = nil,
    ---@type CharacterValidation
    characterValidation = nil,
    ---@type boolean
    readOnly = nil,
    ---@type boolean
    multiLine = nil,
    ---@type Char
    asteriskChar = nil,
    ---@type boolean
    wasCanceled = nil,
    ---@type number
    caretSelectPosition = nil,
    ---@type number
    caretPosition = nil,
    ---@type number
    selectionAnchorPosition = nil,
    ---@type number
    selectionFocusPosition = nil,
    ---@type Single
    minWidth = nil,
    ---@type Single
    preferredWidth = nil,
    ---@type Single
    flexibleWidth = nil,
    ---@type Single
    minHeight = nil,
    ---@type Single
    preferredHeight = nil,
    ---@type Single
    flexibleHeight = nil,
    ---@type number
    layoutPriority = nil,
}
---@param input string
function InputField:SetTextWithoutNotify(input) end
---@param shift boolean
function InputField:MoveTextEnd(shift) end
---@param shift boolean
function InputField:MoveTextStart(shift) end
---@return Vector2
---@param screen Vector2
function InputField:ScreenToLocal(screen) end
---@param eventData PointerEventData
function InputField:OnBeginDrag(eventData) end
---@param eventData PointerEventData
function InputField:OnDrag(eventData) end
---@param eventData PointerEventData
function InputField:OnEndDrag(eventData) end
---@param eventData PointerEventData
function InputField:OnPointerDown(eventData) end
---@param e Event
function InputField:ProcessEvent(e) end
---@param eventData BaseEventData
function InputField:OnUpdateSelected(eventData) end
function InputField:ForceLabelUpdate() end
---@param update CanvasUpdate
function InputField:Rebuild(update) end
function InputField:LayoutComplete() end
function InputField:GraphicUpdateComplete() end
function InputField:ActivateInputField() end
---@param eventData BaseEventData
function InputField:OnSelect(eventData) end
---@param eventData PointerEventData
function InputField:OnPointerClick(eventData) end
function InputField:DeactivateInputField() end
---@param eventData BaseEventData
function InputField:OnDeselect(eventData) end
---@param eventData BaseEventData
function InputField:OnSubmit(eventData) end
function InputField:CalculateLayoutInputHorizontal() end
function InputField:CalculateLayoutInputVertical() end
---@return number
---@param selectables Selectable[]
function InputField.AllSelectablesNoAlloc(selectables) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function InputField.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function InputField.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function InputField.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function InputField.FindObjectsOfType(type, includeInactive) end
---@param target Object
function InputField.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function InputField.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function InputField.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function InputField.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function InputField.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function InputField.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function InputField.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function InputField.ReferenceEquals(objA, objB) end

---@class ScrollRect : UIBehaviour @ ---------------------------------------------------------------
local ScrollRect = {
    ---@type RectTransform
    content = nil,
    ---@type boolean
    horizontal = nil,
    ---@type boolean
    vertical = nil,
    ---@type MovementType
    movementType = nil,
    ---@type Single
    elasticity = nil,
    ---@type boolean
    inertia = nil,
    ---@type Single
    decelerationRate = nil,
    ---@type Single
    scrollSensitivity = nil,
    ---@type RectTransform
    viewport = nil,
    ---@type Scrollbar
    horizontalScrollbar = nil,
    ---@type Scrollbar
    verticalScrollbar = nil,
    ---@type ScrollbarVisibility
    horizontalScrollbarVisibility = nil,
    ---@type ScrollbarVisibility
    verticalScrollbarVisibility = nil,
    ---@type Single
    horizontalScrollbarSpacing = nil,
    ---@type Single
    verticalScrollbarSpacing = nil,
    ---@type ScrollRectEvent
    onValueChanged = nil,
    ---@type Vector2
    velocity = nil,
    ---@type Vector2
    normalizedPosition = nil,
    ---@type Single
    horizontalNormalizedPosition = nil,
    ---@type Single
    verticalNormalizedPosition = nil,
    ---@type Single
    minWidth = nil,
    ---@type Single
    preferredWidth = nil,
    ---@type Single
    flexibleWidth = nil,
    ---@type Single
    minHeight = nil,
    ---@type Single
    preferredHeight = nil,
    ---@type Single
    flexibleHeight = nil,
    ---@type number
    layoutPriority = nil,
}
---@param executing CanvasUpdate
function ScrollRect:Rebuild(executing) end
function ScrollRect:LayoutComplete() end
function ScrollRect:GraphicUpdateComplete() end
---@return boolean
function ScrollRect:IsActive() end
function ScrollRect:StopMovement() end
---@param data PointerEventData
function ScrollRect:OnScroll(data) end
---@param eventData PointerEventData
function ScrollRect:OnInitializePotentialDrag(eventData) end
---@param eventData PointerEventData
function ScrollRect:OnBeginDrag(eventData) end
---@param eventData PointerEventData
function ScrollRect:OnEndDrag(eventData) end
---@param eventData PointerEventData
function ScrollRect:OnDrag(eventData) end
function ScrollRect:CalculateLayoutInputHorizontal() end
function ScrollRect:CalculateLayoutInputVertical() end
function ScrollRect:SetLayoutHorizontal() end
function ScrollRect:SetLayoutVertical() end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function ScrollRect.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function ScrollRect.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function ScrollRect.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function ScrollRect.FindObjectsOfType(type, includeInactive) end
---@param target Object
function ScrollRect.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function ScrollRect.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function ScrollRect.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function ScrollRect.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function ScrollRect.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function ScrollRect.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function ScrollRect.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function ScrollRect.ReferenceEquals(objA, objB) end

---@class HorizontalLayoutGroup : HorizontalOrVerticalLayoutGroup @ ---------------------------------------------------------------
local HorizontalLayoutGroup = {
}
function HorizontalLayoutGroup:CalculateLayoutInputHorizontal() end
function HorizontalLayoutGroup:CalculateLayoutInputVertical() end
function HorizontalLayoutGroup:SetLayoutHorizontal() end
function HorizontalLayoutGroup:SetLayoutVertical() end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function HorizontalLayoutGroup.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function HorizontalLayoutGroup.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function HorizontalLayoutGroup.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function HorizontalLayoutGroup.FindObjectsOfType(type, includeInactive) end
---@param target Object
function HorizontalLayoutGroup.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function HorizontalLayoutGroup.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function HorizontalLayoutGroup.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function HorizontalLayoutGroup.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function HorizontalLayoutGroup.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function HorizontalLayoutGroup.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function HorizontalLayoutGroup.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function HorizontalLayoutGroup.ReferenceEquals(objA, objB) end

---@class VerticalLayoutGroup : HorizontalOrVerticalLayoutGroup @ ---------------------------------------------------------------
local VerticalLayoutGroup = {
}
function VerticalLayoutGroup:CalculateLayoutInputHorizontal() end
function VerticalLayoutGroup:CalculateLayoutInputVertical() end
function VerticalLayoutGroup:SetLayoutHorizontal() end
function VerticalLayoutGroup:SetLayoutVertical() end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function VerticalLayoutGroup.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function VerticalLayoutGroup.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function VerticalLayoutGroup.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function VerticalLayoutGroup.FindObjectsOfType(type, includeInactive) end
---@param target Object
function VerticalLayoutGroup.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function VerticalLayoutGroup.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function VerticalLayoutGroup.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function VerticalLayoutGroup.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function VerticalLayoutGroup.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function VerticalLayoutGroup.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function VerticalLayoutGroup.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function VerticalLayoutGroup.ReferenceEquals(objA, objB) end

---@class LayoutRebuilder : Object @ ---------------------------------------------------------------
local LayoutRebuilder = {
    ---@type Transform
    transform = nil,
}
---@return boolean
function LayoutRebuilder:IsDestroyed() end
---@param executing CanvasUpdate
function LayoutRebuilder:Rebuild(executing) end
function LayoutRebuilder:LayoutComplete() end
function LayoutRebuilder:GraphicUpdateComplete() end
---@return number
function LayoutRebuilder:GetHashCode() end
---@return boolean
---@param obj Object
function LayoutRebuilder:Equals(obj) end
---@return string
function LayoutRebuilder:ToString() end
---@param layoutRoot RectTransform
function LayoutRebuilder.ForceRebuildLayoutImmediate(layoutRoot) end
---@param rect RectTransform
function LayoutRebuilder.MarkLayoutForRebuild(rect) end
---@return boolean
---@param objA Object
---@param objB Object
function LayoutRebuilder.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function LayoutRebuilder.ReferenceEquals(objA, objB) end

---@class PlayerPrefs : Object @ ---------------------------------------------------------------
local PlayerPrefs = {
}
---@param key string
---@param value number
function PlayerPrefs.SetInt(key, value) end
---@return number
---@param key string
---@param defaultValue number
function PlayerPrefs.GetInt(key, defaultValue) end
---@param key string
---@param value Single
function PlayerPrefs.SetFloat(key, value) end
---@return Single
---@param key string
---@param defaultValue Single
function PlayerPrefs.GetFloat(key, defaultValue) end
---@param key string
---@param value string
function PlayerPrefs.SetString(key, value) end
---@return string
---@param key string
---@param defaultValue string
function PlayerPrefs.GetString(key, defaultValue) end
---@return boolean
---@param key string
function PlayerPrefs.HasKey(key) end
---@param key string
function PlayerPrefs.DeleteKey(key) end
function PlayerPrefs.DeleteAll() end
function PlayerPrefs.Save() end
---@return boolean
---@param objA Object
---@param objB Object
function PlayerPrefs.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function PlayerPrefs.ReferenceEquals(objA, objB) end

---@class MessageCenter : Object @ ---------------------------------------------------------------
local MessageCenter = {
}
---@param msgEnum MsgEnum
---@param callback Action
function MessageCenter.Add(msgEnum, callback) end
---@param msgEnum MsgEnum
---@param callback Action
function MessageCenter.Remove(msgEnum, callback) end
---@param msgEnum MsgEnum
function MessageCenter.Clear(msgEnum) end
function MessageCenter.ClearAll() end
---@param msgEnum MsgEnum
---@param args Object[]
function MessageCenter.Dispatch(msgEnum, args) end
---@return boolean
---@param objA Object
---@param objB Object
function MessageCenter.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function MessageCenter.ReferenceEquals(objA, objB) end

---@class LuaManager : MonoBehaviour @ ---------------------------------------------------------------
local LuaManager = {
}
LuaManager.instance = nil
function LuaManager:StartLua() end
---@param filename string
function LuaManager:DoFile(filename) end
---@param funcName string
---@param param1 Object
---@param param2 Object
---@param param3 Object
---@param param4 Object
---@param param5 Object
function LuaManager:CallFunction(funcName, param1, param2, param3, param4, param5) end
---@return LuaFunction
---@param funcName string
function LuaManager:GetFunction(funcName) end
function LuaManager:LuaGC() end
function LuaManager:Close() end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function LuaManager.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function LuaManager.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function LuaManager.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function LuaManager.FindObjectsOfType(type, includeInactive) end
---@param target Object
function LuaManager.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function LuaManager.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function LuaManager.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function LuaManager.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function LuaManager.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function LuaManager.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function LuaManager.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function LuaManager.ReferenceEquals(objA, objB) end

---@class ResManager : MonoBehaviour @ ---------------------------------------------------------------
local ResManager = {
}
ResManager.instance = nil
function ResManager:StartUpdateABOnStartup() end
---@return boolean
---@param abName string
function ResManager:IsABLoaded(abName) end
---@param abNames String[]
---@param onFinish Action
function ResManager:UpdateABsByNames(abNames, onFinish) end
---@param unloadAllLoadedObjects boolean
function ResManager:UnloadAllAssetBundles(unloadAllLoadedObjects) end
---@param bundleName string
---@param unloadABAfterAllSpawnDestroy boolean
function ResManager:OnSpawnDestroy(bundleName, unloadABAfterAllSpawnDestroy) end
function ResManager:ClearMemory() end
---@param assetBundlePaths String[]
---@param onProgress LuaFunction
function ResManager.PreloadLocalAssetBundles(assetBundlePaths, onProgress) end
---@return GameObject
---@param prefabPath string
---@param parent Transform
---@param unloadABAfterSpawn boolean
---@param unloadABAfterAllSpawnDestroy boolean
function ResManager.SpawnPrefab(prefabPath, parent, unloadABAfterSpawn, unloadABAfterAllSpawnDestroy) end
---@param prefabPath string
---@param parent Transform
---@param callback LuaFunction
---@param unloadABAfterSpawn boolean
---@param unloadABAfterAllSpawnDestroy boolean
function ResManager.SpawnPrefabAsyn(prefabPath, parent, callback, unloadABAfterSpawn, unloadABAfterAllSpawnDestroy) end
---@return T
---@param assetPath string
---@param unloadABAfterSpawn boolean
function ResManager.LoadAssetSyn(assetPath, unloadABAfterSpawn) end
---@param assetPath string
---@param callback Action
---@param unloadABAfterSpawn boolean
function ResManager.LoadAssetAsyn(assetPath, callback, unloadABAfterSpawn) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function ResManager.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function ResManager.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function ResManager.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function ResManager.FindObjectsOfType(type, includeInactive) end
---@param target Object
function ResManager.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function ResManager.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function ResManager.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function ResManager.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function ResManager.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function ResManager.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function ResManager.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function ResManager.ReferenceEquals(objA, objB) end

---@class UIManager : MonoBehaviour @ ---------------------------------------------------------------
local UIManager = {
}
UIManager.instance = nil
---@param prefabPath string
---@param parent Transform
---@param callback LuaFunction
---@param isUIStack boolean
---@param keepActive boolean
---@param isFloat boolean
---@param unloadABAfterSpawn boolean
---@param unloadABAfterAllSpawnDestroy boolean
function UIManager:SpawnUIAsyn(prefabPath, parent, callback, isUIStack, keepActive, isFloat, unloadABAfterSpawn, unloadABAfterAllSpawnDestroy) end
---@param go GameObject
function UIManager:ResumeUI(go) end
function UIManager:ClearAllUI() end
---@param behaviour LuaBehaviour
function UIManager:OnUIDestroy(behaviour) end
---@return GameObject
---@param prefabPath string
---@param parent Transform
---@param isUIStack boolean
---@param keepActive boolean
---@param isFloat boolean
---@param unloadABAfterSpawn boolean
---@param unloadABAfterAllSpawnDestroy boolean
function UIManager.SpawnUI(prefabPath, parent, isUIStack, keepActive, isFloat, unloadABAfterSpawn, unloadABAfterAllSpawnDestroy) end
function UIManager.RefreshStack() end
---@param trans Transform
function UIManager.RefreshSortObjects(trans) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function UIManager.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function UIManager.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function UIManager.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function UIManager.FindObjectsOfType(type, includeInactive) end
---@param target Object
function UIManager.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function UIManager.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function UIManager.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function UIManager.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function UIManager.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function UIManager.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function UIManager.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function UIManager.ReferenceEquals(objA, objB) end

---@class SoundManager : MonoBehaviour @ ---------------------------------------------------------------
local SoundManager = {
}
SoundManager.instance = nil
---@param clipPath string
---@param volume Single
---@param loopTimes number
---@param loopID string
function SoundManager.PlaySound(clipPath, volume, loopTimes, loopID) end
---@param loopID string
function SoundManager.StopSound(loopID) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function SoundManager.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function SoundManager.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function SoundManager.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function SoundManager.FindObjectsOfType(type, includeInactive) end
---@param target Object
function SoundManager.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function SoundManager.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function SoundManager.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function SoundManager.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function SoundManager.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function SoundManager.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function SoundManager.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function SoundManager.ReferenceEquals(objA, objB) end

---@class HttpManager : MonoBehaviour @ ---------------------------------------------------------------
local HttpManager = {
}
HttpManager.instance = nil
---@param url string
---@param callback LuaFunction
function HttpManager.Get(url, callback) end
---@param url string
---@param data LuaTable
---@param callback LuaFunction
---@param dataType string
function HttpManager.Post(url, data, callback, dataType) end
---@return string
---@param str string
function HttpManager.UrlEncode(str) end
---@return string
---@param str string
function HttpManager.UrlDecode(str) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function HttpManager.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function HttpManager.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function HttpManager.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function HttpManager.FindObjectsOfType(type, includeInactive) end
---@param target Object
function HttpManager.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function HttpManager.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function HttpManager.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function HttpManager.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function HttpManager.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function HttpManager.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function HttpManager.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function HttpManager.ReferenceEquals(objA, objB) end

---@class LuaBehaviour : MonoBehaviour @ ---------------------------------------------------------------
local LuaBehaviour = {
    ---@type boolean
    IsSetedOrder = nil,
    ---@type string
    assetBundleName = nil,
    ---@type string
    prefabPath = nil,
    ---@type boolean
    isUIStack = nil,
    ---@type boolean
    keepActive = nil,
    ---@type boolean
    isFloat = nil,
    ---@type boolean
    unloadABAfterAllSpawnDestroy = nil,
    ---@type List
    sortObjects = nil,
}
---@param order number
function LuaBehaviour:SetOrders(order) end
function LuaBehaviour:AddCanvas() end
---@param lua LuaTable
---@param onEnable LuaFunction
---@param start LuaFunction
---@param onDisable LuaFunction
---@param onAppFocus LuaFunction
---@param onDestroy LuaFunction
function LuaBehaviour:AddLuaClass(lua, onEnable, start, onDisable, onAppFocus, onDestroy) end
---@param lua LuaTable
function LuaBehaviour:RemoveLuaClass(lua) end
---@param trans Transform
function LuaBehaviour:RefreshSortObjects(trans) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function LuaBehaviour.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function LuaBehaviour.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function LuaBehaviour.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function LuaBehaviour.FindObjectsOfType(type, includeInactive) end
---@param target Object
function LuaBehaviour.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function LuaBehaviour.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function LuaBehaviour.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function LuaBehaviour.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function LuaBehaviour.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function LuaBehaviour.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function LuaBehaviour.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function LuaBehaviour.ReferenceEquals(objA, objB) end

---@class LButton : MonoBehaviour @ ---------------------------------------------------------------
local LButton = {
    ---@type Object
    param = nil,
    ---@type LuaTable
    self = nil,
    ---@type Single
    canTriggerInterval = nil,
}
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function LButton.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function LButton.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function LButton.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function LButton.FindObjectsOfType(type, includeInactive) end
---@param target Object
function LButton.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function LButton.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function LButton.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function LButton.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function LButton.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function LButton.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function LButton.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function LButton.ReferenceEquals(objA, objB) end

---@class LButtonEffect : MonoBehaviour @ ---------------------------------------------------------------
local LButtonEffect = {
    ---@type Image
    targetImg = nil,
    ---@type RawImage
    targetRawImg = nil,
    ---@type boolean
    scale = nil,
    ---@type boolean
    color = nil,
    ---@type boolean
    texture = nil,
    ---@type Single
    pressScale = nil,
    ---@type Color
    changeColor = nil,
    ---@type Texture2D
    changeTexture = nil,
}
---@param eventData PointerEventData
function LButtonEffect:OnPointerDown(eventData) end
---@param eventData PointerEventData
function LButtonEffect:OnPointerUp(eventData) end
---@param sacle Vector3
function LButtonEffect:SetDefaultScale(sacle) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function LButtonEffect.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function LButtonEffect.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function LButtonEffect.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function LButtonEffect.FindObjectsOfType(type, includeInactive) end
---@param target Object
function LButtonEffect.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function LButtonEffect.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function LButtonEffect.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function LButtonEffect.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function LButtonEffect.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function LButtonEffect.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function LButtonEffect.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function LButtonEffect.ReferenceEquals(objA, objB) end

---@class LTimer : MonoBehaviour @ ---------------------------------------------------------------
local LTimer = {
}
---@param action Action
---@param delay Single
---@param interval Single
---@param loopTimes Single
---@param loopID string
function LTimer.Invoke(action, delay, interval, loopTimes, loopID) end
---@param loopID string
function LTimer.InvokeCancel(loopID) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function LTimer.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function LTimer.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function LTimer.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function LTimer.FindObjectsOfType(type, includeInactive) end
---@param target Object
function LTimer.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function LTimer.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function LTimer.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function LTimer.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function LTimer.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function LTimer.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function LTimer.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function LTimer.ReferenceEquals(objA, objB) end

---@class BTween : Object @ ---------------------------------------------------------------
local BTween = {
}
---@return Double
---@param t Double
---@param b Double
---@param c Double
---@param d Double
function BTween:Linear(t, b, c, d) end
---@return Double
---@param t Double
---@param b Double
---@param c Double
---@param d Double
function BTween:Ease(t, b, c, d) end
---@param delay Single
---@param trans Transform
---@param toPos Vector3
---@param height Single
---@param delta Single
---@param worldSpace boolean
---@param elasticity Single
---@param OnCollisionEvent Action
---@param OnCollisionEventWithParam TweenEvent
---@param OnEndEvent Action
---@param OnEndEventWithParam TweenEvent
function BTween.Parabola(delay, trans, toPos, height, delta, worldSpace, elasticity, OnCollisionEvent, OnCollisionEventWithParam, OnEndEvent, OnEndEventWithParam) end
---@param trans Transform
function BTween.StopParabola(trans) end
---@param delay Single
---@param trans Transform
---@param offsetAngle Single
---@param speed Single
---@param time Single
---@param useDamping boolean
---@param endEvent Action
---@param endEventWithParam TweenEvent
function BTween.Swing(delay, trans, offsetAngle, speed, time, useDamping, endEvent, endEventWithParam) end
---@param trans Transform
function BTween.StopSwing(trans) end
---@return ValueUpdate
---@param delay Single
---@param startValue Single
---@param toValue Single
---@param time Single
---@param method BEaseType
---@param updateEvent Action
---@param finishEvent Action
function BTween.Value(delay, startValue, toValue, time, method, updateEvent, finishEvent) end
---@return boolean
---@param objA Object
---@param objB Object
function BTween.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function BTween.ReferenceEquals(objA, objB) end

---@class LMD5 : Object @ ---------------------------------------------------------------
local LMD5 = {
}
---@return string
---@param inputStr string
---@param upperCase boolean
function LMD5.StirngToMD5(inputStr, upperCase) end
---@return string
---@param inputBytes Byte[]
---@param upperCase boolean
function LMD5.BytesToMD5(inputBytes, upperCase) end
---@return string
---@param filePath string
---@param upperCase boolean
function LMD5.FileToMD5(filePath, upperCase) end
---@return boolean
---@param objA Object
---@param objB Object
function LMD5.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function LMD5.ReferenceEquals(objA, objB) end

---@class LAES : Object @ ---------------------------------------------------------------
local LAES = {
}
---@return string
---@param content string
---@param key string
---@param iv string
function LAES.Encrypt(content, key, iv) end
---@return string
---@param content string
---@param key string
---@param iv string
function LAES.Decrypt(content, key, iv) end
---@return boolean
---@param objA Object
---@param objB Object
function LAES.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function LAES.ReferenceEquals(objA, objB) end

---@class AudioBehaviour : Behaviour @ ---------------------------------------------------------------
local AudioBehaviour = {
}
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function AudioBehaviour.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function AudioBehaviour.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function AudioBehaviour.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function AudioBehaviour.FindObjectsOfType(type, includeInactive) end
---@param target Object
function AudioBehaviour.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function AudioBehaviour.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function AudioBehaviour.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function AudioBehaviour.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function AudioBehaviour.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function AudioBehaviour.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function AudioBehaviour.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function AudioBehaviour.ReferenceEquals(objA, objB) end

---@class MaskableGraphic : Graphic @ ---------------------------------------------------------------
local MaskableGraphic = {
    ---@type CullStateChangedEvent
    onCullStateChanged = nil,
    ---@type boolean
    maskable = nil,
    ---@type boolean
    isMaskingGraphic = nil,
}
---@return Material
---@param baseMaterial Material
function MaskableGraphic:GetModifiedMaterial(baseMaterial) end
---@param clipRect Rect
---@param validRect boolean
function MaskableGraphic:Cull(clipRect, validRect) end
---@param clipRect Rect
---@param validRect boolean
function MaskableGraphic:SetClipRect(clipRect, validRect) end
---@param clipSoftness Vector2
function MaskableGraphic:SetClipSoftness(clipSoftness) end
function MaskableGraphic:ParentMaskStateChanged() end
function MaskableGraphic:RecalculateClipping() end
function MaskableGraphic:RecalculateMasking() end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function MaskableGraphic.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function MaskableGraphic.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function MaskableGraphic.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function MaskableGraphic.FindObjectsOfType(type, includeInactive) end
---@param target Object
function MaskableGraphic.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function MaskableGraphic.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function MaskableGraphic.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function MaskableGraphic.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function MaskableGraphic.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function MaskableGraphic.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function MaskableGraphic.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function MaskableGraphic.ReferenceEquals(objA, objB) end

---@class Graphic : UIBehaviour @ ---------------------------------------------------------------
local Graphic = {
    ---@type Color
    color = nil,
    ---@type boolean
    raycastTarget = nil,
    ---@type Vector4
    raycastPadding = nil,
    ---@type number
    depth = nil,
    ---@type RectTransform
    rectTransform = nil,
    ---@type Canvas
    canvas = nil,
    ---@type CanvasRenderer
    canvasRenderer = nil,
    ---@type Material
    defaultMaterial = nil,
    ---@type Material
    material = nil,
    ---@type Material
    materialForRendering = nil,
    ---@type Texture
    mainTexture = nil,
}
Graphic.defaultGraphicMaterial = nil
function Graphic:SetAllDirty() end
function Graphic:SetLayoutDirty() end
function Graphic:SetVerticesDirty() end
function Graphic:SetMaterialDirty() end
function Graphic:OnCullingChanged() end
---@param update CanvasUpdate
function Graphic:Rebuild(update) end
function Graphic:LayoutComplete() end
function Graphic:GraphicUpdateComplete() end
function Graphic:OnRebuildRequested() end
function Graphic:SetNativeSize() end
---@return boolean
---@param sp Vector2
---@param eventCamera Camera
function Graphic:Raycast(sp, eventCamera) end
---@return Vector2
---@param point Vector2
function Graphic:PixelAdjustPoint(point) end
---@return Rect
function Graphic:GetPixelAdjustedRect() end
---@param targetColor Color
---@param duration Single
---@param ignoreTimeScale boolean
---@param useAlpha boolean
---@param useRGB boolean
function Graphic:CrossFadeColor(targetColor, duration, ignoreTimeScale, useAlpha, useRGB) end
---@param alpha Single
---@param duration Single
---@param ignoreTimeScale boolean
function Graphic:CrossFadeAlpha(alpha, duration, ignoreTimeScale) end
---@param action UnityAction
function Graphic:RegisterDirtyLayoutCallback(action) end
---@param action UnityAction
function Graphic:UnregisterDirtyLayoutCallback(action) end
---@param action UnityAction
function Graphic:RegisterDirtyVerticesCallback(action) end
---@param action UnityAction
function Graphic:UnregisterDirtyVerticesCallback(action) end
---@param action UnityAction
function Graphic:RegisterDirtyMaterialCallback(action) end
---@param action UnityAction
function Graphic:UnregisterDirtyMaterialCallback(action) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Graphic.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Graphic.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Graphic.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Graphic.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Graphic.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Graphic.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Graphic.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Graphic.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Graphic.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Graphic.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Graphic.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Graphic.ReferenceEquals(objA, objB) end

---@class UIBehaviour : MonoBehaviour @ ---------------------------------------------------------------
local UIBehaviour = {
}
---@return boolean
function UIBehaviour:IsActive() end
---@return boolean
function UIBehaviour:IsDestroyed() end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function UIBehaviour.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function UIBehaviour.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function UIBehaviour.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function UIBehaviour.FindObjectsOfType(type, includeInactive) end
---@param target Object
function UIBehaviour.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function UIBehaviour.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function UIBehaviour.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function UIBehaviour.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function UIBehaviour.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function UIBehaviour.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function UIBehaviour.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function UIBehaviour.ReferenceEquals(objA, objB) end

---@class Selectable : UIBehaviour @ ---------------------------------------------------------------
local Selectable = {
    ---@type Navigation
    navigation = nil,
    ---@type Transition
    transition = nil,
    ---@type ColorBlock
    colors = nil,
    ---@type SpriteState
    spriteState = nil,
    ---@type AnimationTriggers
    animationTriggers = nil,
    ---@type Graphic
    targetGraphic = nil,
    ---@type boolean
    interactable = nil,
    ---@type Image
    image = nil,
    ---@type Animator
    animator = nil,
}
Selectable.allSelectablesArray = nil
Selectable.allSelectableCount = nil
Selectable.allSelectables = nil
---@return boolean
function Selectable:IsInteractable() end
---@return Selectable
---@param dir Vector3
function Selectable:FindSelectable(dir) end
---@return Selectable
function Selectable:FindSelectableOnLeft() end
---@return Selectable
function Selectable:FindSelectableOnRight() end
---@return Selectable
function Selectable:FindSelectableOnUp() end
---@return Selectable
function Selectable:FindSelectableOnDown() end
---@param eventData AxisEventData
function Selectable:OnMove(eventData) end
---@param eventData PointerEventData
function Selectable:OnPointerDown(eventData) end
---@param eventData PointerEventData
function Selectable:OnPointerUp(eventData) end
---@param eventData PointerEventData
function Selectable:OnPointerEnter(eventData) end
---@param eventData PointerEventData
function Selectable:OnPointerExit(eventData) end
---@param eventData BaseEventData
function Selectable:OnSelect(eventData) end
---@param eventData BaseEventData
function Selectable:OnDeselect(eventData) end
function Selectable:Select() end
---@return number
---@param selectables Selectable[]
function Selectable.AllSelectablesNoAlloc(selectables) end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function Selectable.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function Selectable.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function Selectable.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function Selectable.FindObjectsOfType(type, includeInactive) end
---@param target Object
function Selectable.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function Selectable.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function Selectable.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function Selectable.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function Selectable.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function Selectable.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function Selectable.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function Selectable.ReferenceEquals(objA, objB) end

---@class HorizontalOrVerticalLayoutGroup : LayoutGroup @ ---------------------------------------------------------------
local HorizontalOrVerticalLayoutGroup = {
    ---@type Single
    spacing = nil,
    ---@type boolean
    childForceExpandWidth = nil,
    ---@type boolean
    childForceExpandHeight = nil,
    ---@type boolean
    childControlWidth = nil,
    ---@type boolean
    childControlHeight = nil,
    ---@type boolean
    childScaleWidth = nil,
    ---@type boolean
    childScaleHeight = nil,
    ---@type boolean
    reverseArrangement = nil,
}
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function HorizontalOrVerticalLayoutGroup.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function HorizontalOrVerticalLayoutGroup.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function HorizontalOrVerticalLayoutGroup.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function HorizontalOrVerticalLayoutGroup.FindObjectsOfType(type, includeInactive) end
---@param target Object
function HorizontalOrVerticalLayoutGroup.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function HorizontalOrVerticalLayoutGroup.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function HorizontalOrVerticalLayoutGroup.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function HorizontalOrVerticalLayoutGroup.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function HorizontalOrVerticalLayoutGroup.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function HorizontalOrVerticalLayoutGroup.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function HorizontalOrVerticalLayoutGroup.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function HorizontalOrVerticalLayoutGroup.ReferenceEquals(objA, objB) end

---@class LayoutGroup : UIBehaviour @ ---------------------------------------------------------------
local LayoutGroup = {
    ---@type RectOffset
    padding = nil,
    ---@type TextAnchor
    childAlignment = nil,
    ---@type Single
    minWidth = nil,
    ---@type Single
    preferredWidth = nil,
    ---@type Single
    flexibleWidth = nil,
    ---@type Single
    minHeight = nil,
    ---@type Single
    preferredHeight = nil,
    ---@type Single
    flexibleHeight = nil,
    ---@type number
    layoutPriority = nil,
}
function LayoutGroup:CalculateLayoutInputHorizontal() end
function LayoutGroup:CalculateLayoutInputVertical() end
function LayoutGroup:SetLayoutHorizontal() end
function LayoutGroup:SetLayoutVertical() end
---@return Object
---@param original Object
---@param position Vector3
---@param rotation Quaternion
---@param parent Transform
function LayoutGroup.Instantiate(original, position, rotation, parent) end
---@param obj Object
---@param t Single
function LayoutGroup.Destroy(obj, t) end
---@param obj Object
---@param allowDestroyingAssets boolean
function LayoutGroup.DestroyImmediate(obj, allowDestroyingAssets) end
---@return Object[]
---@param type Type
---@param includeInactive boolean
function LayoutGroup.FindObjectsOfType(type, includeInactive) end
---@param target Object
function LayoutGroup.DontDestroyOnLoad(target) end
---@param obj Object
---@param t Single
function LayoutGroup.DestroyObject(obj, t) end
---@return Object[]
---@param type Type
function LayoutGroup.FindSceneObjectsOfType(type) end
---@return Object[]
---@param type Type
function LayoutGroup.FindObjectsOfTypeIncludingAssets(type) end
---@return Object
---@param type Type
---@param includeInactive boolean
function LayoutGroup.FindObjectOfType(type, includeInactive) end
---@return Object[]
---@param type Type
function LayoutGroup.FindObjectsOfTypeAll(type) end
---@return boolean
---@param objA Object
---@param objB Object
function LayoutGroup.Equals(objA, objB) end
---@return boolean
---@param objA Object
---@param objB Object
function LayoutGroup.ReferenceEquals(objA, objB) end
