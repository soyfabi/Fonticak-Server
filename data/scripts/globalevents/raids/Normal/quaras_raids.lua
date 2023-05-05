local raid = GlobalEvent("Quaras_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Something is moving in the depths of the sea around Liberty Bay.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Numerous Quara fins have been sighted in the seas around Liberty Bay.", MESSAGE_STATUS_WARNING)
end

local function threeWarning()
    Game.broadcastMessage("Quara emerged from the sea to attack Liberty Bay.", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=32306, y=32705}, {x=32319, y=32731}, 7
    for _ = 1, math.random(6, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Quara Mantassin Scout", Position(x, y, z))
		Game.createMonster("Quara Constrictor Scout", Position(x, y, z))
		Game.createMonster("Quara Hydromancer Scout", Position(x, y, z))
		Game.createMonster("Quara Pincher Scout", Position(x, y, z))
		Game.createMonster("Quara Predator Scout", Position(x, y, z))
    end
end


function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 20000)
	addEvent(threeWarning, 60000)
	addEvent(initialWave, 60000)
    return true
end

--raid:register()