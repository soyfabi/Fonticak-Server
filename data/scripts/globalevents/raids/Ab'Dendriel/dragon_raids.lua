local raid = GlobalEvent("Dragon_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("There are dragons rising in Draconia!", MESSAGE_STATUS_WARNING)
end



local function initialWave()
    local from, to, z = {x=32780, y=31581}, {x=32783, y=31587}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Dragon", Position(x, y, z))
		Game.createMonster("Dragon Hatchling", Position(x, y, z))
    end
end

local function secondWave()
    local from, to, z = {x=32780, y=31600}, {x=32787, y=31610}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Dragon", Position(x, y, z))
		Game.createMonster("Dragon Hatchling", Position(x, y, z))
    end
end

local function threeWave()
    local from, to, z = {x=32801, y=31604}, {x=32816, y=31612}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Dragon", Position(x, y, z))
		Game.createMonster("Dragon Hatchling", Position(x, y, z))
    end
end

local function fourWave()
    local from, to, z = {x=32819, y=31584}, {x=32823, y=31596}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Dragon", Position(x, y, z))
		Game.createMonster("Dragon Hatchling", Position(x, y, z))
    end
end

local function fiveWave()
    local from, to, z = {x=32794, y=31557}, {x=32815, y=31570}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Dragon", Position(x, y, z))
		Game.createMonster("Dragon Lord", Position(x, y, z))
    end
end

function raid.onTime(interval)
    addEvent(initialWarning, 1000)
	addEvent(initialWave, 1000)
    addEvent(secondWave, 2000)
	addEvent(threeWave, 3000)
	addEvent(fourWave, 4000)
	addEvent(fiveWave, 4000)
    return true
end

--raid:register()