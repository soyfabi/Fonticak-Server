local raid = GlobalEvent("Rats_Thais_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Rat Plague in Thais!", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=32331, y=32182}, {x=32426, y=32261}, 7
    for _ = 1, math.random(6, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Rat", Position(x, y, z))
		Game.createMonster("Cave Rat", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(initialWave, 1000)
    return true
end

--raid:register()