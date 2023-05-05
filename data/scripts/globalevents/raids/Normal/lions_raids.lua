local raid = GlobalEvent("Lions_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("There are more lions than usual west of Darashia.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Even more lions west of Darashia!", MESSAGE_STATUS_WARNING)
end

local function threeWarning()
    Game.broadcastMessage("Zomba, the king of lions is roaming the Darashia desert!", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=33123, y=32398}, {x=33186, y=32466}, 7
    for _ = 1, math.random(6, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Lion", Position(x, y, z))
    end
end

local function secondWave()
    local from, to, z = {x=33123, y=32398}, {x=33186, y=32466}, 7
    for _ = 1, math.random(6, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Lion", Position(x, y, z))
    end
end

local function threeWave()
    local from, to, z = {x=33123, y=32398}, {x=33186, y=32466}, 7
    for _ = 1, math.random(6, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Zomba", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 20000)
	addEvent(threeWarning, 120000)
	addEvent(initialWave, 1000)
	addEvent(secondWave, 20000)
	addEvent(threeWave, 120000)
    return true
end

--raid:register()