local raid = GlobalEvent("Arachir_The_Ancient_One_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Beware of Arachir the Ancient One!", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    Game.createMonster("Arachir the Ancient One", Position(32965, 32400, 12))
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(initialWave, 1000)
    return true
end

--raid:register()