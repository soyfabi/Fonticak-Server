local raid = GlobalEvent("Priestesses_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("The priestesses in Drefia are preparing a black celebration.", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=32984, y=32404}, {x=33009, y=32430}, 7
    for _ = 1, math.random(6, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Terror Bird", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(initialWave, 1000)
    return true
end

--raid:register()