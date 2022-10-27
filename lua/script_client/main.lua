local bindableEvent = Event:GetEvent("OnClientInitDone")
bindableEvent:Bind(function()
    Blockman.Instance().gameSettings:setCurQualityLevel(0)
end)

World.Timer(10, function()
    --local guiMgr = GUIManager:Instance()
    UI:openWindow("seleceHeroWnd")
end)
require "script_client.rankMgr"









