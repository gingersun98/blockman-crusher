--You can use 'params.parameter name' to get the parameters defined in the node. 					
--For example, if a parameter named 'entity' is defined in the node, you can use 'params.entity' to get the value of the parameter.
local ClickPlayer = params.Clicker
local PlayerName = ClickPlayer.name
local PlayerScore = ClickPlayer:getValue("score")

local playerPowerData = Engine.DataService:GetRankDataStore("ClickRank")

PlayerScore = PlayerScore + 1
ClickPlayer:setValue("score",PlayerScore)

playerPowerData:SetData(PlayerName,PlayerScore)
playerPowerData:RequestRangeData(1, 5, function(DataList)
  PackageHandlers:SendToAllClients("UpdateRank", DataList)
end)