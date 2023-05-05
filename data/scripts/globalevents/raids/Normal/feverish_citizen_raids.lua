local raid = GlobalEvent("Feverish_Citizen_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Elf Scouts have been sighted near Venore!", MESSAGE_STATUS_WARNING)
end

local function finalWave()
    local from, to, z = {x=33012, y=32052}, {x=32861, y=32126}, 6
    for _ = 1, math.random(7, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Feverish Citizen", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(finalWave, 1000)
    return true
end

--raid:register()