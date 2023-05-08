local playerLogout = CreatureEvent("PlayerLogout")
function playerLogout.onLogout(player)
	local playerId = player:getId()
	if nextUseStaminaTime[playerId] then
		nextUseStaminaTime[playerId] = nil
	end
	
	if onExerciseTraining[playerId] then
		stopEvent(onExerciseTraining[playerId].event)
		onExerciseTraining[playerId] = nil
		--player:setTraining(false)
	end
	
	return true
end
playerLogout:register()
