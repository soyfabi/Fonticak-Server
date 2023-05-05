local raid = GlobalEvent("Necropharus_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Beware of Necropharus!", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    Game.createMonster("Necropharus", Position(33044, 32401, 10))
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(finalWave, 1000)
    return true
end

--raid:register()