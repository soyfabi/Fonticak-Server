local raid = GlobalEvent("Undead_Darashia_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Sightings of undead, west of Darashia! Imminent invasion is suspected!", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("The undead are attacking Darashia!", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=33156, y=32414}, {x=33182, y=32458}, 7
    for _ = 1, math.random(6, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Vampire", Position(x, y, z))
		Game.createMonster("Stalker", Position(x, y, z))
		Game.createMonster("Skeleton", Position(x, y, z))
		Game.createMonster("Demon Skeleton", Position(x, y, z))
		Game.createMonster("Bonelord", Position(x, y, z))
		Game.createMonster("Necromancer", Position(x, y, z))
		Game.createMonster("Bonebeast", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 10000)
	addEvent(initialWave, 11000)
    return true
end

--raid:register()