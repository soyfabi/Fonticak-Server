local raid = GlobalEvent("Badger_Raids")
raid:type("timer")
raid:interval(1)

local function finalWave()
    local from, to, z = {x=32633, y=31645}, {x=32715, y=31708}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Badger", Position(x, y, z))
    end
end

function raid.onTime(interval)
    addEvent(finalWave, 1000)
    return true
end

--raid:register()