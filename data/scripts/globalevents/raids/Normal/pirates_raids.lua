local raid = GlobalEvent("Priestesses_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Pillage and plunder! Pirates have been sighted north of Darashia!", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=33275, y=32324}, {x=33316, y=32360}, 7
    for _ = 1, math.random(6, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Pirate Buccaneer", Position(x, y, z))
		Game.createMonster("Pirate Cutthroat", Position(x, y, z))
		Game.createMonster("Pirate Marauder", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(initialWave, 20000)
    return true
end

--raid:register()