local raid = GlobalEvent("Pirate_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Pirates are launching a surprise attack on Liberty Bay! Take care, they seem to be everywhere.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Pirates have invaded the city.", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=32261, y=32771}, {x=32345, y=32854}, 7
    for _ = 1, math.random(6, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Pirate Corsair", Position(x, y, z))
		Game.createMonster("Pirate Buccaneer", Position(x, y, z))
		Game.createMonster("Pirate Cutthroat", Position(x, y, z))
		Game.createMonster("Pirate Marauder", Position(x, y, z))
		Game.createMonster("Smuggler", Position(x, y, z))
    end
end

local function secondWave()
    Game.createMonster("Deadeye Devious", Position(32349, 32841, 7))
end

local function threeWave()
    Game.createMonster("Ron the Ripper", Position(32247, 32839, 7))
end

local function fourWave()
    Game.createMonster("Brutus Bloodbeard", Position(32302, 32879, 7))
end

local function fiveWave()
    Game.createMonster("Lethal Lissy", Position(32300, 32774, 7))
end


function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 10000)
	addEvent(initialWave, 10000)
	addEvent(secondWave, 11000)
	addEvent(threeWave, 1000)
	addEvent(fourWave, 1000)
	addEvent(fiveWave, 1000)
    return true
end

--raid:register()