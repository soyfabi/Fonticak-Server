--[Guild Level Kill]--
local guild_level = CreatureEvent("GuildLevel")
function guild_level.onKill(creature, target)

	local player = creature:getPlayer()
	
	if target:isMonster() then
		return false
	end

	if not player:getGuild() or not target:getGuild() then
		return false
	end

	if player:getLevel() < GuildLevel.minLevelBonus or target:getLevel() < GuildLevel.minLevelBonus then
		return false
	end

	local guild1 = player:getGuild()
	local guild2 = target:getGuild()
	
	if guild1:getId() == guild2:getId() then
		return false
	end

	local max = math.max(5, guild2:getLevel() - guild1:getLevel() + (isInWar(player, target) and 20 or 16))
	local xp = math.random(4, max)
    guild1:addExperience(xp)
	guild2:addExperience(- math.ceil(xp / 1.25))
	addEvent(function()player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You added ".. xp .." of experience to your guild for kill the player ".. target:getName() ..".") end, 200)
	addEvent(function()player:sendCancelMessage("You added ".. xp .." of experience to your guild for kill the player ".. target:getName() ..".") end, 200)
	sendGuildChannelMessage(guild1:getId(), TALKTYPE_CHANNEL_O, string.format("%s (%d) just added ".. xp .." of experience to the guild for kill the player ".. target:getName() .."(".. target:getLevel() ..") [Guild: ".. guild2:getName() .."].", player:getName(), player:getLevel()))
	return true
end
guild_level:register()

--[Guild Login]--
local guild_login = CreatureEvent("Guild_Register")
function guild_login.onLogin(player)
	player:registerEvent("GuildLevel")
	return true
end
guild_login:register()

--[Guild Outfit]--
local guild_outfit = TalkAction("!guildoutfit")
local timer = 5 * 60 * 1000
function guild_outfit.onSay(player, words, param)
    if not player:getGuild() then
        player:sendCancelMessage("You don't have a guild.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    if player:getStorageValue(98714) >= os.time() then
        player:sendCancelMessage("You need to wait for the cooldown to end.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    if player:getGuildLevel() == 1 then
        player:sendCancelMessage("You need to be a Vice-Leader or a Leader to change guild outfit.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    local guild = player:getGuild()
    local outfit = player:getOutfit()

    for _, members in ipairs(guild:getMembersOnline()) do
        local newOutfit = outfit
        if(not members:hasOutfit(outfit.lookType, outfit.lookAddons)) then
            local tmpOutfit = members:getOutfit()
            newOutfit.lookAddons = 0
            if(not members:hasOutfit(outfit.lookType, 0)) then
                newOutfit.lookType = tmpOutfit.lookType
            end
        end

        members:getPosition():sendMagicEffect(45)
		members:setOutfit(newOutfit)
        members:sendTextMessage(MESSAGE_STATUS_BLUE_LIGHT, "The player {".. player:getName().. "} change the Outfit of the guild.")
    end

    player:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
    player:setStorageValue(98714, os.time() + timer)
    return true
end
guild_outfit:register()

