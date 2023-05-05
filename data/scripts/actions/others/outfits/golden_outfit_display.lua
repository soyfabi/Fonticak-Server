local transformDisplay = {
	[36345] = 36337,
	[36337] = 36341,
	[36341] = 36349,
	[36349] = 36345,
	[36347] = 36339,
	[36339] = 36343,
	[36343] = 36351,
	[36351] = 36347,	
	[36346] = 36338,
	[36338] = 36342,
	[36342] = 36350,
	[36350] = 36346,
	[36344] = 36336,
	[36336] = 36340,
	[36340] = 36348,
	[36348] = 36344
}

local goldenOutfitDisplay = Action()

local exhaust = {}
local exhaustTime = 2

function goldenOutfitDisplay.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	local playerId = player:getId()
    local currentTime = os.time()
    if exhaust[playerId] and exhaust[playerId] > currentTime then
		player:sendCancelMessage("You are on cooldown, wait (0." .. exhaust[playerId] - currentTime .. "s).")
		return true
	end
	
	local transformIds = transformDisplay[item:getId()]
	if not transformIds then
		return false
	end

	if player:getStorageValue(PlayerStorageKeys.goldenOutfit) == 3 then
		item:transform(transformIds)
		item:getPosition():sendMagicEffect(CONST_ME_LIGHTNING)
		exhaust[playerId] = currentTime + exhaustTime
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need Full Golden Outfit to use it.")
		item:getPosition():sendMagicEffect(CONST_ME_POFF)
		exhaust[playerId] = currentTime + exhaustTime
	end
	return true
end

for index, value in pairs(transformDisplay) do
	goldenOutfitDisplay:id(index)
end

goldenOutfitDisplay:register()
