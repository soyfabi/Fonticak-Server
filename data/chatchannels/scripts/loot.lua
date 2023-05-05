local STORAGEVALUE_LOOT = 8914
function onSpeak(player, type, message)	
	return false
end

function onJoin(player)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "[Loot Channel]\nYou have opened the channel, now you will receive the loot in this Channel.")
	player:setStorageValue(STORAGEVALUE_LOOT, 1)
	return true
end

function onLeave(player)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "[Loot Channel]\nYou have closed the channel, now you will receive the loot in Server Log.")
	player:setStorageValue(STORAGEVALUE_LOOT, 0)
	return true
end
