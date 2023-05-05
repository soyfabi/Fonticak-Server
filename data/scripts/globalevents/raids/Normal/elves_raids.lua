local raid = GlobalEvent("Elves_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Elf Scouts have been sighted near Venore!", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("The elves attack from shadowthorn!", MESSAGE_STATUS_WARNING)
end

local function threeWarning()
    Game.broadcastMessage("Venore is under attack!", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=32853, y=32123}, {x=32861, y=32130}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Elf", Position(x, y, z))
		Game.createMonster("Elf Scout", Position(x, y, z))
		Game.createMonster("Elf Arcanist", Position(x, y, z))
    end
end

local function secondWave()
    local from, to, z = {x=32932, y=32158}, {x=32944, y=32168}, 7
    for _ = 1, math.random(2, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Elf", Position(x, y, z))
		Game.createMonster("Elf Scout", Position(x, y, z))
		Game.createMonster("Elf Arcanist", Position(x, y, z))
    end
end

local function finalWave()
    local from, to, z = {x=32853, y=32025}, {x=32868, y=32034}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Elf", Position(x, y, z))
		Game.createMonster("Elf Scout", Position(x, y, z))
		Game.createMonster("Elf Arcanist", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 20000)
	addEvent(threeWarning, 60000)
	addEvent(initialWave, 60000)
	addEvent(secondWave, 60000)
	addEvent(finalWave, 60000)
    return true
end

--raid:register()