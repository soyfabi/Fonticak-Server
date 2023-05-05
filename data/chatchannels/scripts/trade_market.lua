local TRADE_MARKET_CHANNEL = 7

local muted = Condition(CONDITION_CHANNELMUTEDTICKS, CONDITIONID_DEFAULT)
muted:setParameter(CONDITION_PARAM_SUBID, TRADE_MARKET_CHANNEL)
muted:setParameter(CONDITION_PARAM_TICKS, 2000) --/ 2 SECONDS

function onSpeak(player, type, message)

	local playerAccountType = player:getAccountType()
	if player:getLevel() < 100 and playerAccountType < ACCOUNT_TYPE_GAMEMASTER then
		player:sendCancelMessage("You may not speak into channels as long as you are on level 100.")
		return false
	end
	
	if player:getCondition(CONDITION_CHANNELMUTEDTICKS, CONDITIONID_DEFAULT, TRADE_MARKET_CHANNEL) then
		player:sendCancelMessage("You may only place one offer in two minutes.")
		player:sendChannelMessage("", "You may only place one offer in two minutes.", TALKTYPE_CHANNEL_R1, TRADE_MARKET_CHANNEL)
		return false
	end
	
	

	if playerAccountType < ACCOUNT_TYPE_GAMEMASTER then
	player:addCondition(muted)
		return true
	end

	type = TALKTYPE_CHANNEL_R1
	
	
	return type
end

function onJoin(player)
	addEvent(function()player:sendChannelMessage("[BOT]", "Dedicated channel to trade with players, an example is: SELL FALCON HELMET FOR 25KKS / PM FAST.", TALKTYPE_CHANNEL_O, TRADE_MARKET_CHANNEL) end, 300)
	return true
end
