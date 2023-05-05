local raid = GlobalEvent("Lesser_Undead_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("There is a slight uneven energy in the ghostlands west of Carlin. Something is going to happen soon.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Skeletons appeared in the ghostlands. Something is wrong there!", MESSAGE_STATUS_WARNING)
end

local function threeWarning()
    Game.broadcastMessage("Now the ghostlands are full of ghouls! Seems like there is a massive outburst of negative energy there!", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    local from, to, z = {x=32230, y=31702}, {x=32264, y=31733}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Skeleton", Position(x, y, z))
		Game.createMonster("Ghoul", Position(x, y, z))
		Game.createMonster("Ghost", Position(x, y, z))
		Game.createMonster("Demon Skeleton", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 20000)
	addEvent(threeWarning, 120000)
    addEvent(finalWave, 20000)
    return true
end

--raid:register()