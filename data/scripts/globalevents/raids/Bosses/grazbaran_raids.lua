local raid = GlobalEvent("Grazbaran_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("An ancient evil is awakening in the mines beneath Hrodmir.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Demonic entities are entering the mortal realm in the Hrodmir mines.", MESSAGE_STATUS_WARNING)
end

local function threeWarning()
    Game.broadcastMessage("The demonic master has revealed itself in the mines of Hrodmir.", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=32208, y=31149}, {x=32242, y=31165}, 15
    for _ = 1, math.random(7, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Deathslicer", Position(x, y, z))
    end
end

local function secondWave()
    local from, to, z = {x=32208, y=31149}, {x=32242, y=31165}, 15
    for _ = 1, math.random(3, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Juggernaut", Position(x, y, z))
    end
end

local function threeWave()
    local from, to, z = {x=32208, y=31149}, {x=32242, y=31165}, 15
    for _ = 1, math.random(5, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Fury", Position(x, y, z))
    end
end

local function fourWave()
    local from, to, z = {x=32208, y=31149}, {x=32242, y=31165}, 15
    for _ = 1, math.random(5, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Demon", Position(x, y, z))
    end
end

local function finalWave()
    Game.createMonster("Ghazbaran", Position(32227, 31150, 15))
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 30000)
	addEvent(threeWarning, 60000)
	addEvent(initialWave, 53000)
	addEvent(secondWave, 55000)
	addEvent(threeWave, 56000)
	addEvent(fourWave, 58000)
	addEvent(finalWave, 60000)
    return true
end

--raid:register()