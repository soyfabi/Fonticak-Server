local raid = GlobalEvent("Cobra_Raids")
raid:type("timer")
raid:interval(3000)

local function initialWarning()
    Game.broadcastMessage("There's something sizzling in the Ankrahmun Dipthrah tombs.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Even more sizzling in the Ankrahmun Dipthrah tombs.", MESSAGE_STATUS_WARNING)
end

local function threeWarning()
    Game.broadcastMessage("Poison overflow in the Ankrahmun Dipthrah tombs!", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    local from, to, z = {x=33129, y=32569}, {x=33156, y=32598}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Cobra", Position(x, y, z))
    end
end

function raid.onTime(interval)
    addEvent(initialWarning, 1000)
	addEvent(secondWarning, 20000)
	addEvent(threeWarning, 30000)
    addEvent(finalWave, 40000)
    return true
end

--raid:register()