local raid = GlobalEvent("Bonebeast_Raids")
raid:type("timer")
raid:interval(6000)

local function initialWarning()
    Game.broadcastMessage("Bonebeasts are rattling down in the Ankrahmun Dipthrah tombs.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Bonebeasts roaming around in the Ankrahmun Dipthrah tombs.", MESSAGE_STATUS_WARNING)
end


local function finalWave()
    local from, to, z = {x=33129, y=32568}, {x=33156, y=32597}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Bonebeast", Position(x, y, z))
    end
end

function raid.onTime(interval)
    addEvent(initialWarning, 1000)
	addEvent(secondWarning, 20000)
    addEvent(finalWave, 30000)
    return true
end

--raid:register()