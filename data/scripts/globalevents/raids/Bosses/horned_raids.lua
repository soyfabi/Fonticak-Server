local raid = GlobalEvent("Horned_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Beware of The horned Fox!", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    Game.createMonster("Minotaur mage", Position(32466, 31955, 4))
end

local function finalWave()
    Game.createMonster("the Horned Fox", Position(32463, 31954, 4))
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(initialWave, 2000)
	addEvent(finalWave, 20000)
    return true
end

--raid:register()