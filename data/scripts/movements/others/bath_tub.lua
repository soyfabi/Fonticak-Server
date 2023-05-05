local bathtubEnter = MoveEvent()
local playerBathTub = 29323

--BATHTUB_EMPTY = 29312

function bathtubEnter.onStepIn(creature, item, toPosition, fromPosition)

	if not creature:isPlayer() then
		return false
	end

	local condition = Condition(CONDITION_OUTFIT)
	condition:setOutfit({lookTypeEx = playerBathTub})
	condition:setTicks(-1)

	position:sendMagicEffect(CONST_ME_WATERSPLASH)
	item:transform(29336)
	creature:addCondition(condition)
	return true
end

bathtubEnter:id(29313)
bathtubEnter:register()

local bathtubExit = MoveEvent()
function bathtubExit.onStepOut(creature, item, position, fromPosition)

	if not creature:isPlayer() then
		return false
	end

	item:transform(29313)
	creature:removeCondition(CONDITION_OUTFIT)
	return true
end

bathtubExit:id(29336)
bathtubExit:register()
