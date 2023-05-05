local tile_tp = MoveEvent()
tile_tp:type("stepin")

local tile_tps = {
	[50000] = {position = Position(1011, 765, 5), direction = DIRECTION_SOUTH, level = 1, effect = 11, text = "You have entered the Easy Hunts Zone."},
	[50001] = {position = Position(971, 760, 5), direction = DIRECTION_SOUTH, level = 1, effect = 11, text = "You have entered the Medium Hunts Zone."},
	[50002] = {position = Position(1058, 785, 5), direction = DIRECTION_NORTH, level = 1, effect = 11, text = "You have entered the Medium-Hard Hunts Zone."},
	--------------------------> Exit
	[50003] = {position = Position(1005, 793, 5), direction = DIRECTION_SOUTH, level = 1, effect = 11, text = "You have Left the Easy Hunts Zone."},
	[50004] = {position = Position(1011, 793, 5), direction = DIRECTION_SOUTH, level = 1, effect = 11, text = "You have Left the Medium Hunts Zone."},
	[50005] = {position = Position(1017, 793, 5), direction = DIRECTION_SOUTH, level = 1, effect = 11, text = "You have Left the Medium-Hard Hunts Zone."},
	
	[50006] = {position = Position(943, 773, 5), direction = DIRECTION_SOUTH, level = 1, effect = 11},
	[50007] = {position = Position(8194, 8112, 8), direction = DIRECTION_SOUTH, level = 1, effect = 11},
	[50008] = {position = Position(8194, 8122, 6), direction = DIRECTION_SOUTH, level = 1, effect = 11},
	[50009] = {position = Position(7771, 8218, 7), direction = DIRECTION_NORTH, level = 1, effect = 11},
	[50010] = {position = Position(7763, 8020, 7), direction = DIRECTION_WEST, level = 1, effect = 11},
	[50011] = {position = Position(7921, 7751, 7), direction = DIRECTION_SOUTH, level = 1, effect = 11},
	[50012] = {position = Position(7914, 7758, 7), direction = DIRECTION_SOUTH, level = 1, effect = 11},
	--------------------------> Exit Quests Crown
	[50013] = {position = Position(943, 773, 6), direction = DIRECTION_SOUTH, level = 1, effect = 11},
	[50014] = {position = Position(903, 768, 5), direction = DIRECTION_SOUTH, level = 1, effect = 11},
}

function tile_tp.onStepIn(player, item, position, fromPosition)
	if not player then
		return false
	end
	local zeroSTG = tile_tps[item.actionid]
	if not zeroSTG then
		return false
	end
	
	if zeroSTG.level then
		if player:getLevel() >= zeroSTG.level then
			if zeroSTG.text then
			player:sendTextMessage(MESSAGE_INFO_DESCR, zeroSTG.text)
				end
			end
		end
	if zeroSTG.level then
		if player:getLevel() >= zeroSTG.level then
		player:teleportTo(zeroSTG.position, true)
		player:setDirection(zeroSTG.direction)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You need to be Level "..zeroSTG.level..", to enter.")
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
			end
		end
	
	if not zeroSTG.level then
		player:teleportTo(zeroSTG.position, true)
		player:setDirection(zeroSTG.direction)
	end
	if zeroSTG.level then
		if player:getLevel() >= zeroSTG.level then
			if zeroSTG.effect then
		zeroSTG.position:sendMagicEffect(zeroSTG.effect)
		end
	end
end
	return true
end


tile_tp:aid(50000,50001,50002,50003,50004,50005,50006,50007,50008,50009,50010,50011,50012,50013,50014)
tile_tp:register()
