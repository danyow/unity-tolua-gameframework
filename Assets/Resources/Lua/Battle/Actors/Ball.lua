local LuaBehaviour = require "Core.LuaBehaviour"
local Ball = class("Ball", LuaBehaviour)

function Ball:getPrefabPath()
    return "Prefabs/Battle/Actors/Ball"
end

function Ball:onAwake()
    
end

return Ball
