local RedisHandler = require "redishandler"
local rankName = World.CurWorld.GameName..'Main Map'
local CheckRefreshRank,RefreshRank,GetRankSendClient,SplitRankData    

local function checkName (str)
    local line = Lib.splitString(str, ":")
    local _str = ''
    for i, v in ipairs(line) do
        local _line = Lib.splitString(v, "#")
        for i, _v in ipairs(_line) do
            _str = _str .. _v
        end
    end
    return _str
end

RefreshRank = function(score,name,rankTB)                              --Update the leaderboard method
  name = checkName(name)
  local canRefresh = true                                              
  local isAlreadyHave = false                                          
  for _, line in pairs(rankTB) do
    if line.name == name then                                          
      isAlreadyHave = true
      if line.score > score then                                       --The data of the same key will not be updated if the score is lower than the leaderboard this time
        canRefresh = false
      end
    end
  end
  if canRefresh then
    RedisHandler:ZAdd(rankName, name, score)                             --Add new data to the database leaderboard
  end
  if #rankTB == 5 and isAlreadyHave == false then                      
    RedisHandler:ZRemove(rankName, rankTB[5].name)                       --Remove the fifth data
  end
  RedisHandler:trySendZIncBy(true)
end