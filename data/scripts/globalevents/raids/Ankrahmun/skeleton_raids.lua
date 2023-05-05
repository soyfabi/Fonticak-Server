local raid = GlobalEvent("Skeleton_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Some skeletons are assembling north of Ankrahmun!.", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    local from, to, z = {x=33159, y=32565}, {x=33191, y=32577}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Ghoul", Position(x, y, z))
		Game.createMonster("Ghost", Position(x, y, z))
		Game.createMonster("Goblin", Position(x, y, z))
		Game.createMonster("Skeleton", Position(x, y, z))
    end
end

function raid.onTime(interval)
    addEvent(initialWarning, 1000)
    addEvent(finalWave, 1000)
    return true
end

--raid:register()