function Creature:onChangeOutfit(outfit)
	if hasEvent.onChangeMount then
		if not Event.onChangeMount(self, outfit.lookMount) then
			return false
		end
	end
	if hasEvent.onChangeOutfit then
		return Event.onChangeOutfit(self, outfit)
	else
		return true
	end
end

function Creature:onAreaCombat(tile, isAggressive)
	if hasEvent.onAreaCombat then
		return Event.onAreaCombat(self, tile, isAggressive)
	else
		return RETURNVALUE_NOERROR
	end
end

function Creature:onTargetCombat(target)
	if hasEvent.onTargetCombat then
		return Event.onTargetCombat(self, target)
	else
		return RETURNVALUE_NOERROR
	end
end

function Creature:onHear(speaker, words, type)
	if hasEvent.onHear then
		Event.onHear(self, speaker, words, type)
	end
end

function Creature:onChangeZone(fromZone, toZone)
	if hasEvent.onChangeZone then
		Event.onChangeZone(self, fromZone, toZone)
	end
end

