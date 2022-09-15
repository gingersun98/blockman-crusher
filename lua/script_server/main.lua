print('script_server:hello world')


local heroWeapon = { [1] = 'myplugin/epee', [2] = 'myplugin/The magic book', [3] = 'myplugin/The_wizard_rod' }
local skin = {[1] = 'warrior',[2] = 'master', [3] = 'warlock' }
local actor = { [1] = 'g2038_pet_02_3.actor', [2] = 'g2038_pet_01_3.actor', [3] = 'Big Dog.actor' }
local jurus1 = { [1] = 'myplugin/Shield_royal', [2] = 'myplugin/ray', [3] = 'myplugin/ice' }
local jurus2 = { [1] = 'myplugin/Blasting_gas', [2] = 'myplugin/Invicible', [3] = 'myplugin/blow' }
local shop = { [1] = 'myplugin/2615e7dd-633f-4acd-a274-6db85e524cab', [2] = 'myplugin/987b24fd-dab2-49d7-8f81-fb7169ebb5aa', [3] = 'myplugin/7581b61b-7f5c-462a-becd-73b1ce1602bf' }



PackageHandlers.registerServerHandler("buyShop", function(player, packet)
    local index = packet.index
    Game.GetService("PayHelper"):payMoney(player, 1, 100, function(ret)
        if ret then
            player:addItem(shop[packet.index], 1, nil, 'gift')
        end
    end)  
  end)
--Determine Occupation Sending Weapons
PackageHandlers.registerServerHandler("seleWeapon", function(player, packet)
    local index = packet.index

    player:addSkill(jurus1[packet.index], 1, nil, 'gift')
    player:addSkill(jurus2[packet.index], 1, nil, 'gift')
    local skinData = {
        def = skin[index]
    }

    player:changeSkin(skinData)
    player:changeActor(actor[packet.index])
    player:setData('job',packet.index)
    local packet = index
    PackageHandlers:SendToAllClients("HERO", packet)
end)



Trigger.addHandler(Entity.GetCfg('myplugin/player1'), "ENTER_MAP", function(context)

    local player = context.obj1
    local map = context.map
    local iscopy = 'MapArena'== map.name

end)



