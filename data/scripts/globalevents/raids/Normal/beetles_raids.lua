local raid = GlobalEvent("Beetles_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Lancer beetles troop up in Farmine. Beware!", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("A pack of lancer beetles heads towards the coast!", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=33204, y=31184}, {x=33235, y=31212}, 7
    for _ = 1, math.random(6, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Lancer Beetle", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 20000)
	addEvent(initialWave, 20000)
    return true
end

--raid:register()