local raid = GlobalEvent("Undead_Army_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("The dead of the plains of havoc are becoming restless!", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("A veritable army of undead is amassing in the plains of havoc, beware!", MESSAGE_STATUS_WARNING)
end

local function threeWarning()
    Game.broadcastMessage("The dreaded banshee lead their undead minions to claim the plains of havoc!", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=32789, y=32277}, {x=32836, y=32299}, 7
    for _ = 1, math.random(6, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Skeleton", Position(x, y, z))
		Game.createMonster("Banshee", Position(x, y, z))
		Game.createMonster("Ghoul", Position(x, y, z))
		Game.createMonster("Demon Skeleton", Position(x, y, z))
		Game.createMonster("Vampire", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 20000)
	addEvent(threeWarning, 60000)
	addEvent(initialWave, 60000)
    return true
end

--raid:register()