local raid = GlobalEvent("Zulazza_The_Corruptor_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("A massive orc force is gathering at the gates of Zzaion.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Orc reinforcements have arrived at the gates of Zzaion! The gates are under heavy attack!", MESSAGE_STATUS_WARNING)
end

local function threeWarning()
    Game.broadcastMessage("More orc reinforcements have arrived at the gates of Zzaion! The gates are under heavy attack!", MESSAGE_STATUS_WARNING)
end

local function fourWarning()
    Game.broadcastMessage("The gates to Zzaion have been breached! Orcs are invading the city!", MESSAGE_STATUS_WARNING)
end

local function fiveWarning()
    Game.broadcastMessage("More orcs have arrived in Zzaion! The city is under attack! Strong lizard leaders have come to defend the city.", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    Game.createMonster("Zulazza the Corruptor", Position(33348, 31611, 1))
end

local function finalWave()
    Game.createMonster("Chizzoron the Distorter", Position(33343, 31608, 2))
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 30000)
	addEvent(threeWarning, 60000)
	addEvent(fourWarning, 90000)
	addEvent(fiveWarning, 120000)	
	addEvent(initialWave, 120000)
	addEvent(finalWave, 120000)
    return true
end

--raid:register()