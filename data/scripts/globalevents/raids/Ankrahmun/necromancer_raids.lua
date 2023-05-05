local raid = GlobalEvent("Necromancer_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Necromancer attack in the Ankrahmun Omruc tombs!", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    local from, to, z = {x=33112, y=31694}, {x=33123, y=31705}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Necromancer", Position(x, y, z))
    end
end

function raid.onTime(interval)
    addEvent(initialWarning, 1000)
    addEvent(finalWave, 1000)
    return true
end

--raid:register()