function onSpeak(player, type, message)

	local playerAccountType = player:getAccountType()
	if player:getLevel() < 999 and playerAccountType < ACCOUNT_TYPE_GAMEMASTER then
		player:sendCancelMessage("You can't talk on this channel.")
		return false
	end
	
	type = TALKTYPE_CHANNEL_R1
	
	return type
end

function onJoin(player)
	addEvent(function()player:sendChannelMessage("[BOT]", "Here will be all the notices that the GM will be giving, so keep an eye on this channel.", TALKTYPE_CHANNEL_R1, 3) end, 300)
	return true
end
