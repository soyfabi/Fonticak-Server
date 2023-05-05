local raid = GlobalEvent("Orshaabal_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Orshabaal's minions are working on his return to the World. LEAVE Edron at once, mortals!", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Orshabaal is about to make his way into the mortal realm. Run for your lives!", MESSAGE_STATUS_WARNING)
end

local function threeWarning()
    Game.broadcastMessage("Orshabaal has been summoned from hell to plague the lands of mortals once again.", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    Game.createMonster("Orshabaal", Position(33207, 31719, 7))
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 20000)
	addEvent(threeWarning, 60000)
	addEvent(finalWave, 60000)
    return true
end

--raid:register()