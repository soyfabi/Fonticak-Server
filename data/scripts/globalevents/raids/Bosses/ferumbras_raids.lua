local raid = GlobalEvent("Ferumbras_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("The seals on Ferumbras old cidatel are glowing. Prepare for HIS return mortals.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Ferumbras return is at hand. The Edron Academy calls for Heroes to fight that evil.", MESSAGE_STATUS_WARNING)
end

local function threeWarning()
    Game.broadcastMessage("Ferumbras has returned to his citadel once more. Stop him before its too late.", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    Game.createMonster("Ferumbras", Position(32121, 32681, 4))
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 50000)
	addEvent(threeWarning, 60000)
	addEvent(finalWave, 60000)
    return true
end

--raid:register()