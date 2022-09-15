--You can use 'params.parameter name' to get the parameters defined in the node. 					
--For example, if a parameter named 'entity' is defined in the node, you can use 'params.entity' to get the value of the parameter.
local ClickPlayer = params.Clicker

local PlayerSceneScore = Instance.new("SceneScore", ClickPlayer)
PlayerSceneScore.Layout = "DefeatEntity.layout"
PlayerSceneScore.AlwaysOnTop = true
PlayerSceneScore.AlwaysFaceCamera = true
PlayerSceneScore.LocalPosition = Vector3.new(0,2,0)
PlayerSceneScore.ScaleWithDistance = false
PlayerSceneScore.LockWorldRotation = true