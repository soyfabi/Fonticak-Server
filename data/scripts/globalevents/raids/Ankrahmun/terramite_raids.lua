local raid = GlobalEvent("Terramite_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Something is moving under the surface in the sand north of Ankrahmun!", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Terramites north of Ankrahmun!", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    local from, to, z = {x=33134, y=32697}, {x=33189, y=32742}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Terramite", Position(x, y, z))
    end
end

function raid.onTime(interval)
    addEvent(initialWarning, 1000)
	addEvent(secondWarning, 120000)
    addEvent(finalWave, 120000)
    return true
end

--raid:register()