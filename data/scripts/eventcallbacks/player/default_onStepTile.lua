local event = Event()
event.onStepTile = function(self, fromPosition, toPosition)
	--self:say("test")
	return true
end

event:register()