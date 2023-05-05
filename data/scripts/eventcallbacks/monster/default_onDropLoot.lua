local STORAGEVALUE_LOOT = 8914

local event = Event()
event.onDropLoot = function(self, corpse)

	local mType = self:getType()
    if mType:isRewardBoss() then
        local timestamp = os.time()
        local rewardContainer = Game.createItem(ITEM_REWARD_CONTAINER)
        rewardContainer:setAttribute(ITEM_ATTRIBUTE_DATE, timestamp)
        corpse:setAttribute(ITEM_ATTRIBUTE_DATE, timestamp)
        corpse:addItemEx(rewardContainer)
        corpse:setAttribute(ITEM_ATTRIBUTE_CORPSEOWNER, 0xFFFFFFFF)
		corpse:registerReward()
        corpse:decay()
        return
    end
	
	if configManager.getNumber(configKeys.RATE_LOOT) == 0 then
		return
	end

	local player = Player(corpse:getCorpseOwner())
	local mType = self:getType()
	if not player or player:getStamina() > 840 then
		local monsterLoot = mType:getLoot()
		for i = 1, #monsterLoot do
			local item = corpse:createLootItem(monsterLoot[i])
			if not item then
				print('[Warning] DropLoot:', 'Could not add loot item to corpse.')
			end
		end
		
		
	
		if player then
			local text = ("Loot of %s: %s."):format(mType:getNameDescription(), corpse:getContentDescription())
			local party = player:getParty()
			if party then
				party:broadcastPartyLoot(text)
			else
				if player:getStorageValue(STORAGEVALUE_LOOT) == 1 then
					player:sendChannelMessage("",""..text.."", TALKTYPE_CHANNEL_Y, 5)
				else
					player:sendTextMessage(MESSAGE_INFO_DESCR, text)
				end
			end
		end
	else
		local text = ("Loot of %s: nothing (due to low stamina)"):format(mType:getNameDescription())
		local party = player:getParty()
		if party then
			party:broadcastPartyLoot(text)
		else
			if player:getStorageValue(STORAGEVALUE_LOOT) == 1 then
				player:sendChannelMessage("",""..text.."", TALKTYPE_CHANNEL_Y, 5)
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, text)
			end
		end
	end
end

event:register()
