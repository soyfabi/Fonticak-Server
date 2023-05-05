local crowbar = Action()
function crowbar.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return onUseCrowbar(player, item, fromPosition, target, toPosition, isHotkey)
end
crowbar:id(2416)
crowbar:register()

local machete = Action()
function machete.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return onUseMachete(player, item, fromPosition, target, toPosition, isHotkey)
end
machete:id(2420, 2442)
machete:register()

local pick = Action()
function pick.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return onUsePick(player, item, fromPosition, target, toPosition, isHotkey)
end
pick:id(2553)
pick:register()

local rope = Action()
function rope.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return onUseRope(player, item, fromPosition, target, toPosition, isHotkey)
end
rope:id(2120, 7731)
rope:register()

local saw = Action()
function saw.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if target.itemid ~= 5901 then -- wood
		return false
	end
	
	target:transform(10033) -- wooden ties
	return true
end

saw:id(2558)
saw:register()

local scythe = Action()
function scythe.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return onUseScythe(player, item, fromPosition, target, toPosition, isHotkey)
end
scythe:id(2550)
scythe:register()

local shovel = Action()
function shovel.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return onUseShovel(player, item, fromPosition, target, toPosition, isHotkey)
end
shovel:id(2554, 5710)
shovel:register()

local kitchen_knife = Action()
function kitchen_knife.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return onUseKitchenKnife(player, item, fromPosition, target, toPosition, isHotkey)
end
kitchen_knife:id(2566)
kitchen_knife:register()

