local ClickPlayer = params.Clicker

local PlayerSceneUI = Instance.new("SceneUI", ClickPlayer)
PlayerSceneUI.Layout = "UIKills.layout"
PlayerSceneUI.AlwaysOnTop = true
PlayerSceneUI.AlwaysFaceCamera = true
PlayerSceneUI.LocalPosition = Vector3.new(0,2,0)