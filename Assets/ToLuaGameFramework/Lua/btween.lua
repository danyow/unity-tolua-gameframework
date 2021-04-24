BEaseType = {}

BEaseType.Linear = ToLuaGameFramework.BTween.BEaseType.Linear
BEaseType.ExpoIn = ToLuaGameFramework.BTween.BEaseType.ExpoIn
BEaseType.ExpoOut = ToLuaGameFramework.BTween.BEaseType.ExpoOut
BEaseType.ExpoInOut = ToLuaGameFramework.BTween.BEaseType.ExpoInOut
BEaseType.SineIn = ToLuaGameFramework.BTween.BEaseType.SineIn
BEaseType.SineOut = ToLuaGameFramework.BTween.BEaseType.SineOut
BEaseType.SineInOut = ToLuaGameFramework.BTween.BEaseType.SineInOut
BEaseType.ElasticIn = ToLuaGameFramework.BTween.BEaseType.ElasticIn
BEaseType.ElasticOut = ToLuaGameFramework.BTween.BEaseType.ElasticOut
BEaseType.ElasticInOut = ToLuaGameFramework.BTween.BEaseType.ElasticInOut
BEaseType.BackIn = ToLuaGameFramework.BTween.BEaseType.BackIn
BEaseType.BackOut = ToLuaGameFramework.BTween.BEaseType.BackOut
BEaseType.BackInOut = ToLuaGameFramework.BTween.BEaseType.BackInOut
BEaseType.BounceIn = ToLuaGameFramework.BTween.BEaseType.BounceIn
BEaseType.BounceOut = ToLuaGameFramework.BTween.BEaseType.BounceOut
BEaseType.BounceInOut = ToLuaGameFramework.BTween.BEaseType.BounceInOut

BTween = {}

--开始模拟抛物线动画（height:距离初始点的高度  duration：0-1的分段数）-----------------------------------------------------------------------------
function BTween.StartParabola(delay, trans, toPos, height, delta, elasticity, onCollision, onStop, worldSpace)
    ToLuaGameFramework.BTween.StartParabola(delay, trans, toPos, height, delta, worldSpace, elasticity, nil, onCollision, nil, onStop)
end

--终止抛物线动画
function BTween.StopParabola(trans)
    ToLuaGameFramework.BTween.StopParabola(trans)
end

--开始对单个数值进行Tween运算(onUpdate:返回实时数值 onFinish：不返回值)------------------------------------------------------------------------------
function BTween.Value(delay, startValue, toValue, duration, easeType, onUpdate, onFinish)
    ToLuaGameFramework.BTween.Value(delay, startValue, toValue, duration, easeType, onUpdate, onFinish)
end
