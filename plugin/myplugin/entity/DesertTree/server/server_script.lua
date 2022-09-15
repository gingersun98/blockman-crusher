Trigger.addHandler(this:cfg(), "ENTITY_DIE", function(context)
    local entity = context.obj1
    local pos = entity:getFrontPos(1)                                --Get the front coordinates
    local params = {
        item = Item.CreateItem("myplugin/04a84085-ad2d-4a65-a785-0feeaeb07d12", 1),
        map = entity.map,
        pos = pos
    }
    local dropItem = DropItemServer.Create(params)
end)