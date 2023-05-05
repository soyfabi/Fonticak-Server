local config = {
    [2183] = {
        maxRewards = 2;
        rewards = {
            {item = {{"fire sword", 1}}, chance = 10};
            {item = {{"health potion", 10}, {"mana potion", 10}}, chance = 40};
            {item = {{"ham", 15}}, chance = 50};
        }
    }
}

local surpriseBag = Action()
function surpriseBag.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local rewards = {}
    local chance = math.random(1, 100)
    for i, v in pairs(config) do
        if item:getId() == i then
            for i = 1, #v.rewards do
                if chance <= v.rewards[i].chance then
                    for j = 1, #v.rewards[i].item do
                        local itemType, subType = ItemType(v.rewards[i].item[j][1]), v.rewards[i].item[j][2]
                        print(itemType:getName())
                        if itemType then
                            rewards[#rewards + 1] = subType.." "..itemType:getName()
                            player:addItem(itemType:getId(), subType)
                        end
                    end
                end
                if #rewards >= v.maxRewards then
                    break
                end
            end
            break
        end
    end
    -- remove item
    --item:remove(1)

    if #rewards == 0 then
        return player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You didnt receive any reward.")
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You have received "..table.concat(rewards, ", "):gsub("(.*),", "%1 and")..".")
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
    return false
end

for k, _ in pairs(config) do
    surpriseBag:id(k)
end
surpriseBag:register()