local max = 5
local RankList = self:GetChildByName("ScrollableView"):GetChildByName("VerticalLayoutContainer")
local NameTxt
local ScoreTxt
local PID
local PName
local PScore

PackageHandlers:Receive("UpdateRank", function(player, DataList)

  max = #DataList
  
  for i = 1,max do
    NameTxt = RankList:GetChildByName("Num"..i):GetChildByName("NameText")
    ScoreTxt = RankList:GetChildByName("Num"..i):GetChildByName("ScoreText")
    PID = tonumber(DataList[i].key)
    UserInfoCache.LoadCacheByUserIds({PID}, function()
        local InfoList = UserInfoCache.GetCache(PID)
        PName = InfoList.name
        NameTxt.Text = PName
    end)
    PScore = DataList[i].value
    ScoreTxt.Text = PScore
  end
end)