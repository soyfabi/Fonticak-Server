local raid = GlobalEvent("Sir_Valorcrest_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Beware of Sir Valorcrest!", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    Game.createMonster("Sir Valorcrest", Position(33264, 31768, 10))
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(finalWave, 1000)
    return true
end

--raid:register()