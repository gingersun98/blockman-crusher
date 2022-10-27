print("startup ui")
local master = self:child("master")
local warrior = self:child("warrior")
local warlock = self:child("warlock")
local determind = self:child("determind")
local actorWindow = self:child("actorWindow") 
local actorWindow2 = self:child("actorWindow2") 
local introduceText = self:child("introduceText")
local index

actorWindow:setActorName(Me:getActorName())

local heroActor = {
  [1] = 'custom_hand_1',
  [2] = 'custom_hand_11',
  [3] = 'custom_hand_12' 
}

local function initText()
  introduceText:setText(Lang:toText('UI_introduce'))



  determind.Text:setText(Lang:toText('UI_determind'))
end

warrior.onSelectStateChanged = function()
  if warrior:isSelected() then
    index =  1
    actorWindow2.Image = "asset/Texture/GingersunUI/warior.png"
    actorWindow:setSkillName("idle")
    actorWindow:setSkillName("hi")
    actorWindow:useBodyPart("custom_hand",heroActor[index])
    actorWindow:useBodyPart("def",'warrior')
    actorWindow:setActorName("g2038_pet_02_3.actor")
    actorWindow:setPosition(Lib.v3(0,0,1))
    UI:closeWindow("UICrossHair")
  end
end

master.onSelectStateChanged = function()
  if master:isSelected() then
    index =  2
    actorWindow:setSkillName("idle")
    actorWindow:setSkillName("hi")
    actorWindow:useBodyPart("custom_hand",heroActor[index])
    actorWindow:useBodyPart("def",'master')
    actorWindow:setActorName("g2038_pet_01_3.actor")
    actorWindow:setPosition(Lib.v3(0,0,1))
    actorWindow2.Image = "asset/Texture/GingersunUI/RangerA.png"
    UI:openWindow("UICrossHair")
  end
end

warlock.onSelectStateChanged = function()
  if warlock:isSelected() then
    index =  3
    actorWindow:setSkillName("idle")
    actorWindow:setSkillName("hi")
    actorWindow:useBodyPart("custom_hand",heroActor[index])
    actorWindow:useBodyPart("def",'warlock')
    actorWindow:setActorName("Big Dog.actor")
    actorWindow:setPosition(Lib.v3(0,-60,1))
    actorWindow2.Image = "asset/Texture/GingersunUI/mage.png"
    UI:openWindow("UICrossHair")
  end
end

determind.onMouseClick = function()
  PackageHandlers.sendClientHandler("seleWeapon", {index =index}, function(...)
      UI:closeWindow('seleceHeroWnd')
    end)
end

function M:onOpen()
  initText()
  warrior:setSelected(true)
end