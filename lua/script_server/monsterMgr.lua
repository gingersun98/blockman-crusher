local wave = 1          --The current wave of monsters
local monsterCount = -1 --Current number of monsters
local index = 1


--Generate the location point of the portal
local portalPos = Lib.v3(11.828, 8.549, 10.891)

--The weapon configuration name corresponding to the occupation
local weaponTb = {

    'myplugin/951529d8-99cc-4dbe-9dc3-cbb0a4eef98f',

    'myplugin/057d4d1d-889a-4777-837d-f94a974babac',

    'myplugin/b771344e-32e8-4488-a0f3-7d87111c3590',
}

PackageHandlers.sendServerHandlerToAll("showOrHideWnd", { isShow = false })

    --Special monster drop equipment handling
    if name == 'BotMage' or name == 'BotWarrior' or name == 'BotWarriorA' then
        local itemName = weaponTb[player:data('job')]
        local params = {
            item = Item.CreateItem(itemName, 1),
            map = player.map,
            pos = entity:getPosition()
        }
        local dropItem = DropItemServer.Create(params)
    end


