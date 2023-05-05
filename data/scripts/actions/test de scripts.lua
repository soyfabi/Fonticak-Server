
local chestStorage = 1430

local action = Action()
function action.onUse(player, item, itemEx, fromPosition, toPosition, isHotkey)
	
	--[[if player:getStorageValue(chestStorage) >= 1 then
		return player:sendCancelMessage("You have already opened this chest!")
	end

	local letter = Game.createItem(2597, 1)
	letter:setAttribute(ITEM_ATTRIBUTE_ACTIONID, 3000)
	--player:setStorageValue(chestStorage, -0)
	local oldDescription = letter:getAttribute("description") == "" and ItemType(2597):getDescription() or letter:getAttribute("description")
	local newDescription = oldDescription .."\n[Owner: ".. player:getName() .."]"
	letter:setAttribute('description', newDescription);
	player:addItemEx(letter)
	player:say("hola")
	--local speed = math.random(500, 1000) -- its in miliseconds
	--letter:setAttribute(ITEM_ATTRIBUTE_ATTACK_SPEED, speed)]]
	player:clearStorageValue(1131)
	player:say("Clear Storage!")
	return true
end

action:id(2345)
action:register()

local action = Action()
function action.onUse(player, item, itemEx, fromPosition, toPosition, isHotkey)

	if item.actionid == 3000 then
        local itemDesc = item:getDescription()
        if itemDesc:match(player:getName()) then
			player:say("hola")
			return true
        else
            return player:sendCancelMessage("This scroll exp is not yours!") -- Cuando no es el dueño.
        end
    else
        return player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Error: Item does not have an ActionID.") -- esto no debe aparecer.
    end


	player:say("hola")
	return true
end

action:aid(3000)
action:register()








--[[local lista = {"Movie"}
	
	if isInArray(lista, player:getName()) then
		return true
	end]]
	
	--[[local inbox = player:getInbox()
	local receipt = Game.createItem(2152)
	inbox:addItemEx(receipt, INDEX_WHEREEVER, FLAG_NOLIMIT)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "El dinero fue enviado al Inbox")]]
	
	
	

local item_move = MoveEvent()
function item_move.onEquip(player, item, slot)
	return true
end

item_move:type("equip")
item_move:id(10310)
item_move:level(100)


local item_move = MoveEvent()
function item_move.onDeEquip(player, item, slot)
	return true
end

item_move:type("deequip")
item_move:id()
--item_move:register()
















local movements = MoveEvent()
function movements.onStepIn(creature, item, position, fromPosition)
	return true
end


movements:id()
movements:type("stepin")

local movements = MoveEvent()

function movements.onStepOut(creature, item, position, fromPosition)
	return true
end

movements:type("stepout")
--movements:register()

