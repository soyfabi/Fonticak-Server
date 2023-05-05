local config = {
    seconds = 10, -- 1 hour
    eventInterval = 1000, -- 1 second
    checkIP = true,
    checkAccount = true,
    allowMCs = 3,
    storageKey = 73106,
    rewards = {
        -- if chance is not set, then chance = 100
		{ itemId = 2160, count = 1, chance= 100 }, -- crystal coin, chance 10%
        { name = "coins online", itemDb = 'accounts', value = 'coins_online', count = 100 }
    }
}

local onlineTimeRewards = GlobalEvent("onlineTimeRewards")

function onlineTimeRewards.onThink(interval)
    local duplicateIps = {}
    local duplicateAccounts = {}
    for _, player in pairs(Game.getPlayers()) do repeat
        local ip = player:getIp()
        if config.checkIP and ip == 0 or (duplicateIps[ip] or 0) >= config.allowMCs then
            break
        end
        duplicateIps[ip] = duplicateIps[ip] and duplicateIps[ip] + 1 or 1
        local accountId = player:getAccountId()
        if config.checkAccount and (duplicateAccounts[accountId] or 0) >= config.allowMCs then
            break
        end
        duplicateAccounts[accountId] = duplicateAccounts[accountId] and duplicateAccounts[accountId] + 1 or 1
        local seconds = math.max(player.storage[storageKey], 0) + math.ceil(interval/1000)
        if seconds >= config.seconds then
            player.storage[storageKey] = 0
            local rewards = {}
            for _, reward in pairs(config.rewards) do
                if reward.itemDb then
                    if db.query(string.format("UPDATE `%s` SET `%s` = `%s` + %d WHERE `id` = %d", reward.itemDb, reward.value, reward.value, reward.count, accountId)) then
                        rewards[#rewards + 1] = string.format('%s x%d', reward.name, reward.count)
                    else
                        print(string.format("[onlineTimeRewards] Error while rewarding player %s.", player:getName()))
                    end
                else
                    local random = math.random(1,100)
					if not reward.chance or random <= reward.chance then
						local item = player:addItem(reward.itemId, reward.count)
						if item then
							rewards[#rewards + 1] = string.format('%s x%d', item:getName(), reward.count)
						end
					end
                end
            end
            if rewards[1] then
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You have received the following reward(s): " .. table.concat(rewards, ', '))
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You haven't received any reward...\nBetter luck next time.")
			end
            break
        end
        player.storage[storageKey] = seconds
    until true end
    return true
end

onlineTimeRewards:interval(config.eventInterval)
--onlineTimeRewards:register()