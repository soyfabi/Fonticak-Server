local raid = GlobalEvent("Orc_Woods_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Some Orcs are assembling in the woods between Carlin and Northport.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Orcs attacking Carlin from the north-east!", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=32404, y=31604}, {x=32436, y=31642}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc", Position(x, y, z))
    end
end

local function finalWave()
    local from, to, z = {x=32404, y=31604}, {x=32436, y=31642}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Berserker", Position(x, y, z))
		Game.createMonster("Orc Leader", Position(x, y, z))
		Game.createMonster("Orc Shaman", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 40000)
    addEvent(initialWave, 20000)
	addEvent(finalWave, 20000)
    return true
end

--raid:register()