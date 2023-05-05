local checkInbox = GlobalEvent("checkinbox")
function checkInbox.onThink(interval, lastExecution)

	for _, player in ipairs(Game.getPlayers()) do
	-- Inbox Notice --
	local inboxItems = player:getInbox():getItemHoldingCount()
	if inboxItems > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Check the inbox, you have "..inboxItems.." item" .. (inboxItems > 1 and "s." or "."))
		end
	end

	return true
end

checkInbox:interval(2000)
--checkInbox:register()
