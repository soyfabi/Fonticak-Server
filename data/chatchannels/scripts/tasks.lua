local STORAGEVALUE_TASK = 8915
function onSpeak(player, type, message)	
if player:getLevel() == 999 then
		player:sendCancelMessage("You can't talk on this channel.")
		return false
	end
	return true
end

function onJoin(player)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "[Task Channel]\nYou have opened the channel, now you will receive the Count Task in this Channel.")
	player:setStorageValue(STORAGEVALUE_TASK, 1)
	return true
end

function onLeave(player)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "[Task Channel]\nYou have closed the channel, now you will receive the Count Task in Server Log.")
	player:setStorageValue(STORAGEVALUE_TASK, 0)
	return true
end
