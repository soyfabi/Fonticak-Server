local raid = GlobalEvent("Orc_SamBP_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("An Orc with a red Backpack has appeared in Orc Fortress.", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    Game.createMonster("Orc Sambackpack", Position(32981, 31739, 7))
end

local function secondWave()
    Game.createMonster("Orc Sambackpack", Position(32981, 31750, 7))
end

local function threeWave()
    Game.createMonster("Orc Sambackpack", Position(32961, 31720, 7))
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(initialWave, 2000)
	addEvent(secondWave, 3000)
	addEvent(threeWave, 4000)
    return true
end

--raid:register()