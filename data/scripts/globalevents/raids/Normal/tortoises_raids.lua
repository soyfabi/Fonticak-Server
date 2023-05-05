local raid = GlobalEvent("Tortoises_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Slowly but steady, the population of tortoises grows on liberty island.", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=32208, y=32724}, {x=32248, y=32750}, 7
    for _ = 1, math.random(6, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Tortoise", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(initialWave, 120000)
    return true
end

--raid:register()