local raid = GlobalEvent("Zevelon_Duskbringer_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Beware of Zevelon Duskbringer!", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    Game.createMonster("Zevelon Duskbringer", Position(32754, 31578, 11))
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(finalWave, 1000)
    return true
end

--raid:register()