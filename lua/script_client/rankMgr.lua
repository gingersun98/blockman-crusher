
local sceneUIList = {}
local MainNum = 0
local RankNum = 0

--Set the parent of the scene window
local function SetSceneUIParent(name, sceneUI)
    local parent = Me.map.Root:FindFirstChild(name)
    --The parent might not be loaded yet, so you need to delay a few frames and set it again
    if not parent then
        Timer.new(3, function()
            SetSceneUIParent(name, sceneUI)
        end) :Start()
        return
    end
    sceneUI.Parent = parent
    sceneUI.LocalPosition = Vector3.new(0, 0, -0.16)
end

local bindableEvent = Event:GetEvent("OnClientInitDone")
bindableEvent:Bind(function()
    MainNum = MainNum + 1


end)



PackageHandlers:Receive("RefreshRankSceneUI", function(player, packet)
    local rankName = packet.rankName

    --When setting the scene UI data, if the scene UI does not exist, then a scene UI will be generated first
    if not sceneUIList[rankName] then
        sceneUIList[rankName] = Instance.new("SceneUI")
        sceneUIList[rankName].Layout = "rankWnd.layout"
        sceneUIList[rankName].AlwaysFaceCamera = false
        sceneUIList[rankName].AlwaysOnTop = false
        --The parent here is based on the name of the ranking passed from the server, plus 'SceneUIParent', for example: AllRankSceneUIParent, which needs to match in the editor
        SetSceneUIParent(rankName..'SceneUIParent', sceneUIList[rankName])
    end
    sceneUIList[rankName].Window:SetRank(packet)
end)

--Open the leaderboard UI and set data
PackageHandlers:Receive("OpenRankWnd", function(player, packet)
    RankNum = RankNum + 1
    local wnd = UI:CreateGUIWindow('rankWnd','rankWnd'..RankNum)
    UI.Root:AddChild(wnd)
    wnd:Init(packet)
    wnd:GetChildByName('Btn_close').Visible = true
end)