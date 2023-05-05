local lvl_protec = CreatureEvent("lvl_protec")
function lvl_protec.onLogin(player)
	local freeBlessMaxLevel = 1
	if player:getLevel() < freeBlessMaxLevel then
		local bless = 5
		for i = 1, bless do
			player:addBlessing(i)
		end
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'You received free blessings for you to be level less than ' .. freeBlessMaxLevel .. '!')
	end
	return true
end
lvl_protec:register()
