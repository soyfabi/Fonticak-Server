local raid = GlobalEvent("The_Old_Widow_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("The mating season of the giant spiders is at hand. Leave the plains of havoc as fast as you can.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Giant spiders have gathered on the plains of havoc for their mating season. Beware!", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=32760, y=32292}, {x=32796, y=32306}, 7
    for _ = 1, math.random(8, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Giant Spider", Position(x, y, z))
    end
end

local function finalWave()
    Game.createMonster("The Old Widow", Position(32776, 32296, 7))
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 180000)
	addEvent(initialWave, 170000)
	addEvent(finalWave, 180000)
    return true
end

--raid:register()