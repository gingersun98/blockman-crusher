local determind = self:child("determind")
local actorWindow = self:child("actorWindow")
local Score = self:child("NumberCrush")
local victory = self:child("victory")

local actor = { [1] = 'g2038_pet_02_3.actor', [2] = 'g2038_pet_01_3.actor', [3] = 'Big Dog.actor' }

function self:refreshPlayer(sum)

    Score:setText(sum)
end


PackageHandlers:Receive("CrushScore", function(player, packet)
    local crush = packet.CrushScore
end)
PackageHandlers:Receive("Death", function(player, packet)
    local death = packet.a
    local win = packet.b
    if death = 2 then
      victory.Text = "LOSSER"
      actorWindow:setActorName("Big Dog.actor")
      actorWindow:setPosition(Lib.v3(0,-60,1))
      Score.Text = crush
    end
    if win = 3 then
      victory.Text = "WINNER"
      Score.Text = crush
    end
end)

determind.onMouseClick = function()
  UI:closeWindow('Winner')
end
function M:onOpen()
  initText()
  warrior:setSelected(true)
end