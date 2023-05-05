local raid = GlobalEvent("Barbarian_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Scouts report a barbarian army gathering near Svargrond.", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Some invaders might try to access Svargrond via the ice to the North.", MESSAGE_STATUS_WARNING)
end

local function threeWarning()
    Game.broadcastMessage("Raiders are attacking Svargrond!", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    local from, to, z = {x=32199, y=31063}, {x=32251, y=31084}, 5
    for _ = 1, math.random(7, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Barbarian Bloodwalker", Position(x, y, z))
		Game.createMonster("Barbarian Brutetamer", Position(x, y, z))
		Game.createMonster("Barbarian Headsplitter", Position(x, y, z))
		Game.createMonster("Barbarian Skullhunter", Position(x, y, z))
		Game.createMonster("Ice Witch", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 4000)
	addEvent(threeWarning, 8000)
	addEvent(finalWave, 10000)
    return true
end

--raid:register()