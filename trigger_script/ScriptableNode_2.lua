local ClickPlayer = params.Clicker
local crushScore = params.Damage
local PlayerID = tostring(ClickPlayer.platformUserId)
local PlayerScore = ClickPlayer:getValue("score")

local playerPowerData = Engine.DataService:GetRankDataStore("Crush Score")

PlayerScore = PlayerScore + crushScore
ClickPlayer:setValue("score",PlayerScore)

playerPowerData:SetData(PlayerID,PlayerScore)
playerPowerData:RequestRangeData(1, 5, function(DataList)
  PackageHandlers:SendToAllClients("UpdateRank", DataList)
end)
