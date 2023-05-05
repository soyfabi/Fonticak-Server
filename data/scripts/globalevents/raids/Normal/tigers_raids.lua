local raid = GlobalEvent("Tigers_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Majestic creatures with stripes roam the small desert at Meriana.", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=32287, y=32541}, {x=32386, y=32618}, 7
    for _ = 1, math.random(6, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Tiger", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(initialWave, 120000)
    return true
end

--raid:register()