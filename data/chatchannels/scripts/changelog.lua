local ChangeLog = 8

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
	addEvent(function()player:sendChannelMessage("[BOT]", "Here will be all the changes that arise with the server, as well as bugs, events, items, bosses, etc. I suggest you also take a look at the page in the Changelog section that will also be there.", TALKTYPE_CHANNEL_R1, ChangeLog) end, 300)
	return true
end
