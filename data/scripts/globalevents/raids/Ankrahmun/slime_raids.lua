local raid = GlobalEvent("Slime_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("There is something slimy going on in the Ankrahmun tombs.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Slime attack in the Ankrahmun tombs!", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    local from, to, z = {x=33133, y=32707}, {x=33201, y=32746}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Slime", Position(x, y, z))
    end
end

function raid.onTime(interval)
    addEvent(initialWarning, 1000)
	addEvent(secondWarning, 120000)
    addEvent(finalWave, 120000)
    return true
end

--raid:register()