local function RefreshRankingUI(RankingWnd,packet)
    local line, name,score
    for i=1,5 do
        line = RankingWnd:child('TxtName'..i)       --Get interface controls
        if packet[i] then                           --Update when data is available
            name = packet[i].name
            score = packet[i].score
            line:setText(name)
            line.Score:setText(score)
        else                                        --No data is set as default
            line:setText('---')
            line.Score:setText('---')
        end
    end
end