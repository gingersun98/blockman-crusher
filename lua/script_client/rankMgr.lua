
local sceneUIList = {}
local MainNum = 0
local RankNum = 0



local bindableEvent = Event:GetEvent("OnClientInitDone")
bindableEvent:Bind(function()
    MainNum = MainNum + 1


end)





--Open the leaderboard UI and set data
PackageHandlers:Receive("OpenRankWnd", function(player, packet)
    RankNum = RankNum + 1
    local wnd = UI:CreateGUIWindow('rankWnd','rankWnd'..RankNum)
    UI.Root:AddChild(wnd)
    wnd:Init(packet)
    wnd:GetChildByName('Btn_close').Visible = true
end)