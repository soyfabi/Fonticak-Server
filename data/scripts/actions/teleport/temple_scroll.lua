local templeScroll = Action()

function templeScroll.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player:isPzLocked() and not player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
		player:teleportTo(getTownTemplePosition(player:getTown():getId()))
		item:remove()
		Position(toPosition):sendMagicEffect(CONST_ME_TELEPORT)
		player:say("Teleported to your destination.")
		player:getPosition():sendMagicEffect(CONST_ME_TEAR_SACRED)
	else
		player:sendCancelMessage("You can't use this when you're in a fight.")
		Position(fromPosition):sendMagicEffect(CONST_ME_POFF)
	end
	return true
end

templeScroll:id(25718)
templeScroll:register()
