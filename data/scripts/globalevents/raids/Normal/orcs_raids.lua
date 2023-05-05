local raid = GlobalEvent("Priestesses_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Some Orcs are assembling north of Thais.", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=32376, y=32082}, {x=32405, y=32104}, 7
    for _ = 1, math.random(6, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc", Position(x, y, z))
		Game.createMonster("Orc Rider", Position(x, y, z))
		Game.createMonster("Orc Warrior", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(initialWave, 20000)
    return true
end

--raid:register()