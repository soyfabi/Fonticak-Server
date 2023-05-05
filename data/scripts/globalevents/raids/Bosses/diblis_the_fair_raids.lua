local raid = GlobalEvent("Diblis_The_Fair_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Beware of Diblis The Fair!", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    Game.createMonster("Diblis The Fair", Position(32009, 32795, 10))
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(initialWave, 1000)
    return true
end

--raid:register()