local raid = GlobalEvent("Wasp_Bear_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Forrest animals spread out close to Ab'Dendriel!", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    local from, to, z = {x=32600, y=31712}, {x=32634, y=31739}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Wasp", Position(x, y, z))
		Game.createMonster("Bear", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
    addEvent(finalWave, 1300)
    return true
end

--raid:register()