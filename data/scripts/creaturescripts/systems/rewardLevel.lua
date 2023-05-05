local table = {
	[20] = {type = "item", id = {2160, 2}, msg = "For reaching level 20 we give you a coin with 2 crystal coins, take advantage of it."},
	[50] = {type = "item", id = {2160, 5}, msg = "For reaching level 50, another 5 crystal coins, so you can buy potions and runes."},
	[200] = {type = "item", id = {9693, 1}, msg = "Você ganhou um addon doll por alcançar o level 200!"},
	[400] = {type = "addon", id = {154, 158}, msg = "Você ganhou p addon Shaman Full por alcançar o level 400!"},
}

local storage = 15000
local rewardlevel = CreatureEvent("RewardLevel")
function rewardlevel.onAdvance(player, skill, oldLevel, newLevel)

	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	for level, _ in pairs(table) do
		if newLevel >= level and player:getStorageValue(storage) < level then
			if table[level].type == "item" then
				player:addItem(table[level].id[1], table[level].id[2])
			elseif table[level].type == "bank" then
				player:setBankBalance(player:getBankBalance() + table[level].id[1])
			elseif table[level].type == "addon" then
				player:addOutfitAddon(table[level].id[1], 3)
				player:addOutfitAddon(table[level].id[2], 3)
			else
				return false
			end

			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, table[level].msg)
			player:setStorageValue(storage, level)
		end
	end

	player:save()

	return true
end
rewardlevel:register()


local event = CreatureEvent("RewardLevel")
function event.onLogin(player)
player:registerEvent("RewardLevel")
	return true
end

event:register()
