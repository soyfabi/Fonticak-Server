local raid = GlobalEvent("Halloween_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Beware! Beware of the Halloween Hare!.", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    Game.createMonster("The Halloween Hare", Position(32369, 32228, 7))
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(finalWave, 1000)
    return true
end

--raid:register()