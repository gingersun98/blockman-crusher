local playerPowerData = Engine.DataService:GetRankDataStore("PlayerPower")

--Remove illegal characters
local function CullIllegalChar(name)
    local tempName = ''
    local array = Lib.splitString(name, "#")
    for _, line in pairs(array) do
        local arr = Lib.splitString(line, ":")
        for _, word in pairs(arr) do
            tempName = tempName .. word
        end
    end
    return tempName
end

--Obtain leaderboard data excluding specified players
local function GetCurrentServerRank(excludePlayer)
    local playerList = Game.GetAllPlayers()
    local powerDataList = {}
    --Iterate over all players and store the data in the table
    for id, player in pairs(playerList) do
        if not excludePlayer or player ~= excludePlayer then
            table.insert(powerDataList, { key = CullIllegalChar(player.name), value = player:getValue('power'), timeIndex = player:getValue('timeIndex') })
        end
    end
    --The data table is sorted by first comparing the magnitude of the values, and if the values are equal, then sorting by time
    table.sort(powerDataList, function(data1, data2)
        if data1.value > data2.value or (data1.value == data2.value and data1.timeIndex < data2.timeIndex)  then
            return true
        end
    end)
    return powerDataList
end

--Refresh all scenes UI
local function RefreshAllSceneUI()
    PackageHandlers:SendToAllClients("RefreshRankSceneUI", {powerDataList = GetCurrentServerRank(), rankName = 'CurrentServerRank'})
    playerPowerData:RequestRangeData(1, 10, function(powerDataList)
        PackageHandlers:SendToAllClients("RefreshRankSceneUI", {powerDataList = powerDataList, rankName = 'AllRank'})
    end)
end

--Set the player's power value and update the leaderboard and your own UI display
local function SetPowerData(player, power)
    local name = CullIllegalChar(player.name)
    player:setValue('power', power)
    player:setValue('timeIndex', os.time())
    playerPowerData:SetData(name, power)
    PackageHandlers:SendToClient(player, "SetCurrentPower", { power = power })
    RefreshAllSceneUI()
end

local event = Event:GetEvent("OnEntityAdded")
event:Bind(function(entity)
    if entity:cfg().fullName == 'myplugin/player1' and entity.isPlayer then
        local power = entity:getValue('power')
        --Players enter the game, determine whether their power value is zero, zero means it is the first time they entered the game, set his power value to the leaderboard
        if power == 0 then
            SetPowerData(entity, 1)
        else
            --If it is not the first time to enter the game, then directly refresh the scene leaderboard
            PackageHandlers:SendToClient(entity, "SetCurrentPower", { power = power })
            RefreshAllSceneUI()
        end
    end
end)

local event = Event:GetEvent("OnEntityRemoved")
event:Bind(function(entity)
    if entity:cfg().fullName == 'myplugin/player1' and entity.isPlayer then
        --Players leave the game and need to refresh the current server scene leaderboard, to exclude their data
        PackageHandlers:SendToAllClients("RefreshRankSceneUI", {powerDataList = GetCurrentServerRank(entity), rankName = 'CurrentServerRank'})
    end
end)

--Increase power value
PackageHandlers:Receive("AddPower", function(player, packet)
    SetPowerData(player, player:getValue('power') + 1)
end)

--Request global leaderboard data
PackageHandlers:Receive("RequestAllRank", function(player, packet)
    playerPowerData:RequestRangeData(1, 10, function(powerDataList)
        if player and player:IsValid() then
            PackageHandlers:SendToClient(player, "OpenRankWnd", {powerDataList = powerDataList, rankName = 'AllRank'})
        end
    end)
end)

--Request current server leaderboard data
PackageHandlers:Receive("RequestCurrentServerRank", function(player, packet)
    PackageHandlers:SendToClient(player, "OpenRankWnd", {powerDataList = GetCurrentServerRank(), rankName = 'CurrentServerRank'})
end)
