local raid = GlobalEvent("Morgaroth_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("The ancient volcano on Goroma slowly becomes active once again.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("There is an evil presence at the volcano of Goroma.", MESSAGE_STATUS_WARNING)
end

local function threeWarning()
    Game.broadcastMessage("Evil Cultists have called an ancient evil into the volcano on Goroma. Beware of its power mortals.", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    Game.createMonster("Morgaroth", Position(32063, 32612, 14))
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 30000)
	addEvent(threeWarning, 60000)
	addEvent(finalWave, 60000)
    return true
end

--raid:register()