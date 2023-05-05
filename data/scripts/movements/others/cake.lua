local cake = MoveEvent()
function cake.onAddItem(moveitem, tileitem, position)
	if moveitem:getId() == 2048 then -- lit candlestick
		tileitem:transform(6280) -- party cake
		tileitem:decay()
		moveitem:remove(1)
		position:sendMagicEffect(CONST_ME_MAGIC_GREEN)
	end
	return true
end

cake:id(6279) -- decorated cake
cake:tileItem(true)
cake:register()
