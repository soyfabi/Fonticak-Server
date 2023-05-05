local raid = GlobalEvent("Nomad_Raids")
raid:type("timer")
raid:interval(1800)

local function initialWarning()
    Game.broadcastMessage("Nomad scouts have been sighted close to the gates to Ankrahmun!", MESSAGE_STATUS_WARNING)
end

local function firstWave()
    local center, radius, z = {x=33152, y=32741}, 5, 7
    for _ = 1, 3 do
        local x, y = math.random(center.x - radius, center.x + radius), math.random(center.y - radius, center.y + radius)
        Game.createMonster("Nomad", Position(x, y, z))
    end
end

local function bossSpawn()
    Game.createMonster("Nomad (Female)", Position(33138, 32731, 7))
end

local function finalWarning()
    Game.broadcastMessage("The desert nomads are launching a full scale attack on Ankrahmun. Some might even have slipped through the defences.", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    local from, to, z = {x=33073, y=32748}, {x=33253, y=32761}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Nomad", Position(x, y, z))
		Game.createMonster("Nomad (Female)", Position(x, y, z))
    end

    Game.createMonster("Banshee", Position(33131, 32746, 7))
    Game.createMonster("Banshee", Position(33166, 32753, 7))
end

function raid.onTime(interval)
    addEvent(initialWarning, 1000)
    addEvent(firstWave, 2000)
    addEvent(bossSpawn, 15000)
    addEvent(finalWarning, 25000)
    addEvent(finalWave, 30000)
    return true
end

--raid:register()