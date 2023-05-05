local raid = GlobalEvent("Gargoyle_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("There is something stony moving down in the Ankrahmun Rahemos tombs.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Gargoyle attack in the Ankrahmun Rahemos tombs!", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    local from, to, z = {x=33141, y=32680}, {x=33173, y=32699}, 12
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Gargoyle", Position(x, y, z))
    end
end

function raid.onTime(interval)
    addEvent(initialWarning, 1000)
	addEvent(secondWarning, 20000)
    addEvent(finalWave, 20000)
    return true
end

--raid:register()