local ClickPlayer = params.Clicker
local PlayerID = tostring(ClickPlayer.platformUserId)
local PlayerScore = ClickPlayer:getValue("score")

local playerPowerData = Engine.DataService:GetRankDataStore("ClickRank03")

PlayerScore = PlayerScore + 1
ClickPlayer:setValue("score",PlayerScore)

playerPowerData:SetData(PlayerID,PlayerScore)
playerPowerData:RequestRangeData(1, 5, function(DataList)
  PackageHandlers:SendToAllClients("UpdateRank", DataList)
end)