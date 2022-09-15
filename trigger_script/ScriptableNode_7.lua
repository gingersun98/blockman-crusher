--You can use 'params.parameter name' to get the parameters defined in the node. 					
--For example, if a parameter named 'entity' is defined in the node, you can use 'params.entity' to get the value of the parameter.
CheckRefreshRank = function(score,name)
  RedisHandler:ZRange(rankName, 0, 4, function(success, data)     
    if not success then
      print('Failed to get data')
    else
      local rankTB = SplitRankData(data)                            --Cutting data
      if rankTB[5] ==nil or rankTB[5].score < score then            
        RefreshRank(score,name,rankTB)                              --Update leaderboard
      end
    end
  end)
end