local water_pipe = Action()
function water_pipe.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if math.random(3) == 1 then
		item:getPosition():sendMagicEffect(CONST_ME_POFF)
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	end
	return true
end
water_pipe:id(2093, 2099)
water_pipe:register()
