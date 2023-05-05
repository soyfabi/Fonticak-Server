-- Dodge System
local config = {
    -- Dodge Stone Setting
    maxDodgeChance = 100,
    maxDodgeAmount = 800,
    maxLevel = 10,

    -- Buy Dodge Stone Settings
    dodgeItemId = 11106,
    dodgeItemCount = 1,
    price = 100 * 10000, -- 100 Crystal Coins
    leverActionId = 9999
}

local function getPlayerDodge(player)
    local chance, amount = 0, 0
    for i = 0, 10 do
        local item = player:getSlotItem(i)
        if item then
            chance = chance + (item:getCustomAttribute("dodgeChance") or 0)
            amount = amount + (item:getCustomAttribute("dodgeAmount") or 0)
        end
    end
    return math.min(chance, 100), math.min(amount / 100, 1)
end

local function getItemLevel(item)
    local chance = (item:getCustomAttribute("dodgeChance") or 0)
    local amount = (item:getCustomAttribute("dodgeAmount") or 0)
    return math.ceil(math.min((chance / config.maxDodgeChance) * config.maxLevel, (amount / config.maxDodgeAmount)  * config.maxLevel))
end

local dodgeHealth = CreatureEvent("DodgeHealthEvent")
local dodgeSayDelay = 0

function dodgeHealth.onHealthChange(player, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not attacker or not attacker:isPlayer() then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    if attacker ~= player then
        local chance, amount = getPlayerDodge(player)
        if chance > 0 and amount > 0 then
            if chance >= math.random(100) then
                if dodgeSayDelay <= os.mtime() then
                    player:say("Dodge!")
                    dodgeSayDelay = os.mtime() + 3000
                end
                if amount >= 1 then
                    player:getPosition():sendMagicEffect(CONST_ME_DODGE)
                end
                return primaryDamage - (amount * primaryDamage), primaryType, secondaryDamage - (amount * secondaryDamage), secondaryType
            end
        end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

dodgeHealth:register()

local dodgeMana = CreatureEvent("DodgeManaEvent")

function dodgeMana.onManaChange(player, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not attacker or not attacker:isPlayer() then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    
    if attacker ~= player then
        local chance, amount = getPlayerDodge(player)
        if chance > 0 and amount > 0 then
            if chance >= math.random(100) then
                if dodgeSayDelay <= os.mtime() then
                    player:say("Dodge!")
                    dodgeSayDelay = os.mtime() + 3000
                end
                if amount >= 1 then
                    player:getPosition():sendMagicEffect(CONST_ME_DODGE)
                end
                return primaryDamage - (amount * primaryDamage), primaryType, secondaryDamage - (amount * secondaryDamage), secondaryType
            end
        end
    end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

dodgeMana:register()

local function isDodgeItem(iType)
    local weaponType = iType:getWeaponType()
    return weaponType ~= WEAPON_NONE or iType:getAttack() ~= 0 or iType:getDefense() ~= 0 or iType:getExtraDefense() ~= 0 or iType:getHitChance() ~= 0
end

local dodgeStone = Action()

function dodgeStone.onUse(player, item, fromPos, target, toPos, isHotkey)
    if not target or target.uid == 0 or target:isCreature() then
        player:sendCancelMessage("This item only works on items.")
        return true
    end

    if not isDodgeItem(target:getType()) then
        player:sendCancelMessage("Only items with base attributes can be upgraded.")
        return true
    end

    if getItemLevel(target) >= config.maxLevel then
        player:sendCancelMessage("This item is already fully upgraded.")
        return true
    end

    target:setCustomAttribute("dodgeChance", (target:getCustomAttribute("dodgeChance") or 0) + (config.maxDodgeChance / config.maxLevel))
    target:setCustomAttribute("dodgeAmount", (target:getCustomAttribute("dodgeAmount") or 0) + (config.maxDodgeAmount / config.maxLevel))
    target:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
    local itemLevel = getItemLevel(target)
    player:say(string.format("DodgeSuccess +%d!", itemLevel))
    player:sendCancelMessage(string.format("The %s o has been upgraded to level %d!", target:getName(), itemLevel))
    return true
end

dodgeStone:id(config.dodgeItemId)
dodgeStone:register()

local dodgeBuy = Action()

function dodgeBuy.onUse(player, item, fromPos, target, toPos, isHotkey)
    if not player:removeMoney(config.price) then
        player:sendCancelMessage(string.format("You don't have enough money, you need %s crystal coins.", config.price / 10000))
        return true
    end

    local dodgeItem = player:addItem(config.dodgeItemId, config.dodgeItemCount)
    if not dodgeItem then
        player:sendCancelMessage("You have no space, free up your inventory.")
        return true
    end

    local position = player:getPosition()
    fromPos:sendDistanceEffect(position, CONST_ANI_SMALLSTONE)
    player:say("DodgeBuySuccess!")
    position:sendMagicEffect(CONST_ME_STUN)

    local itemId = item:getId()
    if itemId == 1945 or itemId == 1946 then
        item:transform(itemId == 1945 and 1946 or 1945)
    end
    return true
end

dodgeBuy:aid(config.leverActionId)
dodgeBuy:register()

local dodgeLook = Event()

function dodgeLook.onLook(player, thing, position, distance, description)
    if thing:isItem() then
        local chance = (thing:getCustomAttribute("dodgeChance") or 0)
        local amount = (thing:getCustomAttribute("dodgeAmount") or 0)
        if chance ~= 0 and amount ~= 0 then
            description = string.format("%s\n[ Dodge Chance: %s%%, Amount: %s%% ]", description, chance, amount)
        end
    elseif thing:isPlayer() then
        local chance, amount = getPlayerDodge(player)
        if chance ~= 0 and amount ~= 0 then
            description = string.format("%s\n[ Dodge Chance: %s%%, Amount: %s%% ]", description, chance, amount * 100)
        end
    end
    return description
end

dodgeLook:register(2)

local dodgeLogin = CreatureEvent("DodgeLogin")

function dodgeLogin.onLogin(player)
    player:registerEvent("DodgeHealthEvent")
    player:registerEvent("DodgeManaEvent")
    return true
end

dodgeLogin:register()