local config = {
	positionChest = Position(894, 845, 4),
	teleport = Position(887, 848, 2),
	teleportBack = Position(894, 849, 4)
}

local exhaust = {}
local exhaustTime = 2

local chest_tp = Action()
function chest_tp.onUse(player, item, itemEx, fromPosition, toPosition, isHotkey)

	local playerId = player:getId()
    local currentTime = os.time()
    if exhaust[playerId] and exhaust[playerId] > currentTime then
        player:sendCancelMessage("Still on cooldown. (0." .. exhaust[playerId] - currentTime .. "s).")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

	if item:getPosition() == config.positionChest then
		player:teleportTo(config.teleport)
		player:setDirection(DIRECTION_WEST)
		player:getPosition():sendMagicEffect(CONST_ME_HITAREA)
		exhaust[playerId] = currentTime + exhaustTime
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:teleportTo(config.teleportBack)
		player:setDirection(DIRECTION_SOUTH)
		player:getPosition():sendMagicEffect(CONST_ME_HITAREA)
	end

	return true
end

chest_tp:aid(30000)
chest_tp:register()

local config = {
	positionChest2 = Position(829, 901, 4),
	teleport2 = Position(806, 887, 4),
	teleportBack2 = Position(830, 897, 4)
}

local exhaust = {}
local exhaustTime = 2

local chest_tp2 = Action()
function chest_tp2.onUse(player, item, itemEx, fromPosition, toPosition, isHotkey)

	local playerId = player:getId()
    local currentTime = os.time()
    if exhaust[playerId] and exhaust[playerId] > currentTime then
        player:sendCancelMessage("Still on cooldown. (0." .. exhaust[playerId] - currentTime .. "s).")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

	if item:getPosition() == config.positionChest2 then
		player:teleportTo(config.teleport2)
		player:setDirection(DIRECTION_NORTH)
		player:getPosition():sendMagicEffect(CONST_ME_HITAREA)
		exhaust[playerId] = currentTime + exhaustTime
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:teleportTo(config.teleportBack2)
		player:setDirection(DIRECTION_NORTH)
		player:getPosition():sendMagicEffect(CONST_ME_HITAREA)
	end

	return true
end

chest_tp2:aid(30001)
chest_tp2:register()

