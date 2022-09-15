local Survivor = self:child("Survivor")

local playerCount = Game.GetAllPlayersCount()


function M:onOpen()

  Survivor.Text = playerCount
  initText()
end

