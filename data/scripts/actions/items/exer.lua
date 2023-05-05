local skills = {
    [32384] = {id=SKILL_SWORD,voc=4}, -- KNIGHT
    [32385] = {id=SKILL_AXE,voc=4}, -- KNIGHT
    [32386] = {id=SKILL_CLUB,voc=4}, -- KNIGHT
    [32387] = {id=SKILL_DISTANCE,voc=3,range=CONST_ANI_SIMPLEARROW}, -- PALADIN
    [32388] = {id=SKILL_MAGLEVEL,voc=2,range=CONST_ANI_SMALLICE}, -- DRUID
    [32389] = {id=SKILL_MAGLEVEL,voc=1,range=CONST_ANI_FIRE}, -- SORCERER
   
    [32124] = {id=SKILL_SWORD,voc=4}, -- KNIGHT
    [32125] = {id=SKILL_AXE,voc=4}, -- KNIGHT
    [32126] = {id=SKILL_CLUB,voc=4}, -- KNIGHT
    [32127] = {id=SKILL_DISTANCE,voc=3,range=CONST_ANI_SIMPLEARROW}, -- PALADIN
    [32128] = {id=SKILL_MAGLEVEL,voc=2,range=CONST_ANI_SMALLICE}, -- DRUID
    [32129] = {id=SKILL_MAGLEVEL,voc=1,range=CONST_ANI_FIRE}, -- SORCERER
   
    [41857] = {id=SKILL_SWORD,voc=4}, -- KNIGHT
    [41858] = {id=SKILL_AXE,voc=4}, -- KNIGHT
    [41859] = {id=SKILL_CLUB,voc=4}, -- KNIGHT
    [41860] = {id=SKILL_DISTANCE,voc=3,range=CONST_ANI_SIMPLEARROW}, -- PALADIN
    [41861] = {id=SKILL_MAGLEVEL,voc=2,range=CONST_ANI_SMALLICE}, -- DRUID
    [41862] = {id=SKILL_MAGLEVEL,voc=1,range=CONST_ANI_FIRE}, -- SORCERER
   
    [41863] = {id=SKILL_SWORD,voc=4}, -- KNIGHT
    [41864] = {id=SKILL_AXE,voc=4}, -- KNIGHT
    [41865] = {id=SKILL_CLUB,voc=4}, -- KNIGHT
    [41866] = {id=SKILL_DISTANCE,voc=3,range=CONST_ANI_SIMPLEARROW}, -- PALADIN
    [41867] = {id=SKILL_MAGLEVEL,voc=2,range=CONST_ANI_SMALLICE}, -- DRUID
    [41868] = {id=SKILL_MAGLEVEL,voc=1,range=CONST_ANI_FIRE} -- SORCERER
   

}

local houseDummies = {32143, 32144, 32145, 32146, 32147, 32148}
local freeDummies = {32142, 32149}



local function start_train(pid,start_pos,itemid,fpos, bonusDummy, dummyId)
    local player = Player(pid)
    if player ~= nil then

    local skillRate = 1
    local magicRate = 1

    if skills[itemid].id == SKILL_MAGLEVEL then
		magicRate = (configManager.getNumber(configKeys.RATE_MAGIC)* 3)
    else
        --skillRate = getSkillStage(player:getSkillLevel(skills[itemid].id))
		skillRate = (configManager.getNumber(configKeys.RATE_SKILL)* 5)
    end

    if Tile(fpos):getItemById(dummyId) then
        local pos_n = player:getPosition()
        if start_pos:getDistance(pos_n) == 0 and getTilePzInfo(pos_n) then
            if player:getItemCount(itemid) >= 1 then
                local exercise = player:getItemById(itemid,true)
                if exercise:isItem() then
                    if exercise:hasAttribute(ITEM_ATTRIBUTE_CHARGES) then
                        local charges_n = exercise:getAttribute(ITEM_ATTRIBUTE_CHARGES)
                        if charges_n >= 1 then
                            exercise:setAttribute(ITEM_ATTRIBUTE_CHARGES,(charges_n-1))

                            local voc = player:getVocation()

                            if skills[itemid].id == SKILL_MAGLEVEL then
                                if not bonusDummy then
                                    player:addManaSpent(math.ceil(650*magicRate))
                                else
                                    player:addManaSpent(math.ceil(650*magicRate)*1.1) -- 10%
                                end
                            else
                                if not bonusDummy then
                                    player:addSkillTries(skills[itemid].id, 2*skillRate)
                                else
                                    player:addSkillTries(skills[itemid].id, (2*skillRate)*1.1) -- 10%
                                end
                            end
                                fpos:sendMagicEffect(CONST_ME_GROUNDSHAKER)
                            if skills[itemid].range then
                                pos_n:sendDistanceEffect(fpos, skills[itemid].range)
                            end
                           
                            local training = addEvent(start_train, voc:getAttackSpeed(), pid,start_pos,itemid,fpos,bonusDummy,dummyId)
                            player:setStorageValue(34532,1)
                        else
                            exercise:remove(1)
                            player:sendTextMessage(MESSAGE_INFO_DESCR, "Your training weapon vanished.")
                            stopEvent(training)
                            player:setStorageValue(34532,0)
                        end
                    end
                end
            end
        else
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Your training has stopped.")
            stopEvent(training)
            player:setStorageValue(34532,0)
        end
    else
    stopEvent(training)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Your training has stopped.")
            player:setStorageValue(34532, 0)
            end
            else
        stopEvent(training)
        if player then
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Your training has stopped.")
            player:setStorageValue(34532,0)
        end
    end
 
    return true
end


local exer = Action()
function exer.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local start_pos = player:getPosition()
    if player:getStorageValue(34532) == 1 then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You are already training.")
        return false
    end
    if target:isItem() then
        if isInArray(houseDummies,target:getId()) then
            if not skills[item.itemid].range and (start_pos:getDistance(target:getPosition()) > 1) then
                player:sendTextMessage(MESSAGE_INFO_DESCR, "Get closer to the dummy.")
                stopEvent(training)
                return true
            end
            player:sendTextMessage(MESSAGE_INFO_DESCR, "You started training.")
            start_train(player:getId(),start_pos,item.itemid,target:getPosition(), true, target:getId())
       
        elseif isInArray(freeDummies, target:getId()) then
            if not skills[item.itemid].range and (start_pos:getDistance(target:getPosition()) > 1) then
                player:sendTextMessage(MESSAGE_INFO_DESCR, "Get closer to the dummy.")
                stopEvent(training)
                return true
            end
            player:sendTextMessage(MESSAGE_INFO_DESCR, "You started training.")
            start_train(player:getId(),start_pos,item.itemid,target:getPosition(), false, target:getId())
        end
    end
    return true
end

exer:id(32388)
exer:register()