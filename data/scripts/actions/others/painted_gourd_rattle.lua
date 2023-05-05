local paintedGourdRattle = Action()

local exhaust = {}
local exhaustTime = 2

function paintedGourdRattle.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local playerId = player:getId()
    local currentTime = os.time()
    if exhaust[playerId] and exhaust[playerId] > currentTime then
		player:sendCancelMessage("You are on cooldown, wait (0." .. exhaust[playerId] - currentTime .. "s).")
		return true
	end
	
	if math.random(5) == 1 then
		player:getPosition():sendMagicEffect(CONST_ME_YALAHARIGHOST)
		exhaust[playerId] = currentTime + exhaustTime
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You're shaking the gourd rattle. It clatters and suddenly you feel strange. Have you annoyed the spirits?")
	else
		exhaust[playerId] = currentTime + exhaustTime
		player:getPosition():sendMagicEffect(CONST_ME_SOUND_RED)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You're shaking the gourd rattle. It clatters, yet nothing else happens.")
	end
	return true
end

paintedGourdRattle:id(24846)
paintedGourdRattle:register()
