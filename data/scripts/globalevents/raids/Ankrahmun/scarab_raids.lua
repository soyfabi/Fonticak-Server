local raid = GlobalEvent("Scarab_Raids")
raid:type("timer")
raid:interval(10000)

local function initialWarning()
    Game.broadcastMessage("Unusual frequent scarab sightings at the gates of Ankrahmun.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Ancient scarabs are leading an attack on Ankrahmun.", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    local from, to, z = {x=33073, y=32748}, {x=33253, y=32761}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Larva", Position(x, y, z))
		Game.createMonster("Scarab", Position(x, y, z))
		Game.createMonster("Ancient Scarab", Position(x, y, z))
    end

end

function raid.onTime(interval)
    addEvent(initialWarning, 1000)
	addEvent(secondWarning, 60000)
    addEvent(finalWave, 60000)
    return true
end

--raid:register()