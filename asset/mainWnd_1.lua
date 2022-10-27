print("startup ui")
local Txt_power = self:GetChildByName('Txt_power')
local Btn_add = self:GetChildByName('Btn_add')
local Btn_allRank = self:GetChildByName('Btn_allRank')
local Btn_currentServerRank = self:GetChildByName('Btn_currentServerRank')

--Send a request to the server to increase the power
local event1 = Btn_add:GetEvent("OnClick")
event1:Bind(function()
    PackageHandlers:SendToServer("AddPower")
end)

--Request ranking data
local event2 = Btn_allRank:GetEvent("OnClick")
event2:Bind(function()
    PackageHandlers:SendToServer("RequestAllRank")
end)

local event = Btn_currentServerRank:GetEvent("OnClick")
event:Bind(function()
    PackageHandlers:SendToServer("RequestCurrentServerRank")
end)

--Set the current power value
PackageHandlers:Receive("SetCurrentPower", function(player, packet)
    Txt_power.Text = packet.power
end)

