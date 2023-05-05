-- TELEPORT / TEXT / EFFECT / DIRECTION / LEVEL --
local exhaust = {}
local tile_tp = {
	[20000] = {position = Position(946, 1312, 8), text = "You have entered in Zone True.", effect = CONST_ME_TELEPORT, direction = DIRECTION_EAST, level = 120, exhaustTime = 3,},
	[20001] = {position = Position(1019, 1285, 2), text = "You left the Zone True.", effect = CONST_ME_TELEPORT, direction = DIRECTION_SOUTH, level = 0, exhaustTime = 3,},
}

local movements = MoveEvent()
movements:type("stepin")
function movements.onStepIn(player, item, position, fromPosition)
	if not player then
		return false
	end
	
	local playerId = player:getId()
	local currentTime = os.time()
	
	
	if exhaust[playerId] and exhaust[playerId] > currentTime then
		player:sendCancelMessage("You are on cooldown, wait (0." .. exhaust[playerId] - currentTime .. "s).")
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
	
	local tiles = tile_tp[item.actionid]
	
	if tiles.level then
		if player:getLevel() >= tiles.level then
			player:teleportTo(tiles.position, true)
			player:setDirection(tiles.direction)
			player:getPosition():sendMagicEffect(tiles.effect)
			player:sendTextMessage(MESSAGE_INFO_DESCR, tiles.text)
		else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You need to be Level "..tiles.level..", to enter.")
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		end
	end
	
	exhaust[playerId] = currentTime + tiles.exhaustTime
	
	return true
end

for itemId, _ in pairs(tile_tp) do
	movements:aid(itemId)
end
movements:register()