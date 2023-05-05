--[[ Find on sources (Game.cpp): int32_t realManaChange = targetPlayer->getMana();
	Bellow of: realManaChange = targetPlayer->getMana() - realManaChange;
	Add: if (realManaChange > 0 && !targetPlayer->isInGhostMode()) {
		addAnimatedText(fmt::format("+{:d}", realManaChange), targetPlayer->getPosition(), TEXTCOLOR_DARKPURPLE);
		}
]]--

local exhaust = {}
local potions = {
	-- Mana Potion --
	[7620] = {vocations = {1,2,3,4,5,6,7,8}, exhaustTime = 700, manaMin = 120, manaMax = 220, healthMin = 0, healthMax = 0},
	-- Strong Mana Potion --
	[7589] = {vocations = {1,2,3,5,6,7}, exhaustTime = 700, manaMin = 275, manaMax = 325, healthMin = 0, healthMax = 0},
	-- Great Mana Potion --
	[7590] = {vocations = {1,2,5,6}, exhaustTime = 700, manaMin = 385, manaMax = 455, healthMin = 0, healthMax = 0},
	-- Health Potion --
	[7618] = {vocations = {1,2,3,4,5,6,7,8}, exhaustTime = 700, manaMin = 0, manaMax = 0, healthMin = 80, healthMax = 130},
	-- Strong Health Potion --
	[7588] = {vocations = {3,4,7,8}, exhaustTime = 700, manaMin = 0, manaMax = 0, healthMin = 245, healthMax = 325},
	-- Great Health Potion --
	[7591] = {vocations = {4,8}, exhaustTime = 700, manaMin = 0, manaMax = 0, healthMin = 360, healthMax = 410},
	-- Ultimate Health Potion --
	[8473] = {vocations = {4,8}, exhaustTime = 700, manaMin = 0, manaMax = 0, healthMin = 455, healthMax = 530},
	-- Great Spirit Potion --
	[8472] = {vocations = {3,7}, exhaustTime = 700, manaMin = 280, manaMax = 315, healthMin = 390, healthMax = 480},
}

---- Potions ---
local mana_potion = Action()
function mana_potion.onUse(cid, item, fromPosition, target, toPosition, isHotkey)
	
	local player = Player(cid)
	local playerId = player:getId()
	local currentTime = os.mtime()
	
	if exhaust[playerId] and exhaust[playerId] > currentTime then
		player:sendCancelMessage("Your potions are still on cooldown. (MS:" .. exhaust[playerId] - currentTime .. ")")
		return true
	end
	
	local potion = potions[item:getId()]
	
	if not isInArray(potion.vocations, getPlayerVocation(cid)) then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You are not the necessary vocation to use this potion.")
		return true
	end
	
	targetPlayer = Player(target)
	if not targetPlayer then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You may only use this on players!")
		return true
	end
	
	if potion.healthMin > 0 then
		local health_add = math.random(potion.healthMin, potion.healthMax) 
		targetPlayer:addHealth(health_add)
		targetPlayer:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
	end
	
	if potion.manaMin > 0 then
		local mana_add = math.random(potion.manaMin, potion.manaMax) 
		targetPlayer:addMana(mana_add)
		targetPlayer:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
	
	exhaust[playerId] = currentTime + potion.exhaustTime
	
	if not configManager.getBoolean(configKeys.REMOVE_POTION_CHARGES) then
		return true
	end
	item:remove(1)
	return true
end

for itemId, _ in pairs(potions) do
	mana_potion:id(itemId)
end
mana_potion:register()