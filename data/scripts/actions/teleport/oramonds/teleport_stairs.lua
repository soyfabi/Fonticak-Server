local teleportNorth = Action()

function teleportNorth.onUse(cid, item, fromPosition, itemEx, toPosition)
	fromPosition.z = fromPosition.z - 1
	doTeleportThing(cid, fromPosition, FALSE)
	return TRUE
end

teleportNorth:id(20578)
teleportNorth:register()

local teleportWest = Action()

function teleportWest.onUse(cid, item, fromPosition, itemEx, toPosition)
	fromPosition.z = fromPosition.z - 1
	doTeleportThing(cid, fromPosition, FALSE)
	return TRUE
end

teleportWest:id(20573)
teleportWest:register()
