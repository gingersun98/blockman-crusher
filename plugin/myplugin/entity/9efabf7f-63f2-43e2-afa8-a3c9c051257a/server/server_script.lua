local randomList = { [1] = 'myplugin/15a5078e-f6aa-45f1-aba7-6f7b4ecefce0', [2] = 'myplugin/547b7be6-2cb9-4e37-9bc4-bd58f37fb3a1', [3] = 'myplugin/d9575c4c-95cd-44fe-ad35-b44d9b19d730' }


Trigger.addHandler(this:cfg(), "ENTITY_DIE", function(context)
    local entity = context.obj1
    local pos = entity:getFrontPos(1)                                --Get the front coordinates
    local params = {
        item = Item.CreateItem( randomList[ math.random( #randomList ) ], 1),
        map = entity.map,
        pos = pos
    }
    local dropItem = DropItemServer.Create(params)
end)