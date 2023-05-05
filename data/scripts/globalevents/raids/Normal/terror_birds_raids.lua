local raid = GlobalEvent("Terror_Birds_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Terrorbirds have been sighted in Trapwood south-east of Port Hope!", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=32700, y=32771}, {x=32746, y=32810}, 7
    for _ = 1, math.random(6, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Terror Bird", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(initialWave, 120000)
    return true
end

--raid:register()