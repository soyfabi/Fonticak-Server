-- Boss teleport spawn.

local teleportToPosition = Position(1000, 1000, 5)
--local teleportCreatePosition = Position(988, 1007, 7) -- Teleport Particular.
local bossName = "Dragon"
local time = 2 -- (2 seconds) Time of Portal

-- Function that will remove the teleport after a given time
local function removeTeleport(position)
    local teleportItem = Tile(position):getItemById(1387)
    if teleportItem then
        teleportItem:remove()
        position:sendMagicEffect(CONST_ME_POFF)
    end
end

local event = CreatureEvent("BossKill")

function event.onKill(creature, target)
    if target:isPlayer() or target:getMaster()  or target:getName():lower() ~= bossName:lower() then
        return true
    end

    local position = target:getPosition()
    position:sendMagicEffect(CONST_ME_TELEPORT)
    local item = Game.createItem(1387, 1, position)
	--local item = Game.createItem(1387, 1, teleportCreatePosition) -- Ubication in Particular

    if item:isTeleport() then
        item:setDestination(teleportToPosition)
    end

    target:say("You have killed a ".. bossName .."! A teleport has been created but is will disappear in ".. time .." seconds.", TALKTYPE_MONSTER_SAY, 0, 0, position)
	
    -- Remove portal after 5 minutes
    addEvent(removeTeleport, 1000* time , position)
	--addEvent(removeTeleport, 1000* time , teleportCreatePosition) -- Ubication in Particular

    return true
end

event:register()

local login = CreatureEvent("RegisterBossKill")

function login.onLogin(player)
    player:registerEvent("BossKill")
    return true
end

login:register()