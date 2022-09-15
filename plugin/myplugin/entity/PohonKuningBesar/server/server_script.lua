local randomList = { [1] = 'myplugin/04a84085-ad2d-4a65-a785-0feeaeb07d12', [2] = 'myplugin/15a5078e-f6aa-45f1-aba7-6f7b4ecefce0', [3] = 'myplugin/15a5078e-f6aa-45f1-aba7-6f7b4ecefce0', [4] = 'myplugin/15a5078e-f6aa-45f1-aba7-6f7b4ecefce0', [5] = 'myplugin/547b7be6-2cb9-4e37-9bc4-bd58f37fb3a1', [6] = 'myplugin/547b7be6-2cb9-4e37-9bc4-bd58f37fb3a1', [7] = 'myplugin/d9575c4c-95cd-44fe-ad35-b44d9b19d730', [8] = 'myplugin/epee', [9] = 'myplugin/33f3159c-becb-45a8-8b7b-f7db3000af7d', [10] = 'myplugin/951529d8-99cc-4dbe-9dc3-cbb0a4eef98f' }



Trigger.addHandler(this:cfg(), "ENTITY_DIE", function(context)
    local entity = context.obj1
    local pos = entity:getFrontPos(1)                                --Get the front coordinates
    local params = {
        item = Item.CreateItem("myplugin/ce6802e2-dfff-47b3-a5cd-b0479715f636", 1),
        map = entity.map,
        pos = pos
    }
    local dropItem = DropItemServer.Create(params)
end)