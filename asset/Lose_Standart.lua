print("startup ui")

local Btn_allRank = self:GetChildByName('Btn_allRank')
local Btn_currentServerRank = self:GetChildByName('Btn_currentServerRank')



--Request ranking data
local event2 = Btn_allRank:GetEvent("OnClick")
event2:Bind(function()
    PackageHandlers:SendToServer("RequestAllRank")
end)

local event = Btn_currentServerRank:GetEvent("OnClick")
event:Bind(function()
    PackageHandlers:SendToServer("RequestCurrentServerRank")
end)





