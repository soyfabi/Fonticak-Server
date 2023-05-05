local raid = GlobalEvent("Orc_Thais_Raids")
raid:type("timer")
raid:interval(1)

local function initialWarning()
    Game.broadcastMessage("Orc activity near Thais reported! Beware!", MESSAGE_STATUS_WARNING)
end

local function secondWarning()
    Game.broadcastMessage("Thais is under attack!", MESSAGE_STATUS_WARNING)
end

local function initialWave()
    local from, to, z = {x=32358, y=32161}, {x=32374, y=32173}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Shaman", Position(x, y, z))
    end
end

local function secondWave()
    local from, to, z = {x=32360, y=32161}, {x=32374, y=32173}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Berserker", Position(x, y, z))
    end
end

local function threeWave()
    local from, to, z = {x=32360, y=32161}, {x=32374, y=32173}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Warlord", Position(x, y, z))
    end
end

local function fourWave()
    local from, to, z = {x=32359, y=32161}, {x=32374, y=32173}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Rider", Position(x, y, z))
    end
end

local function fiveWave()
    local from, to, z = {x=32360, y=32161}, {x=32374, y=32173}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc", Position(x, y, z))
    end
end

local function sixWave()
    local from, to, z = {x=32358, y=32161}, {x=32374, y=32173}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Shaman", Position(x, y, z))
    end
end

local function sevenWave()
    local from, to, z = {x=32452, y=32235}, {x=32437, y=32220}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Shaman", Position(x, y, z))
		Game.createMonster("Orc", Position(x, y, z))
		Game.createMonster("Orc Warlord", Position(x, y, z))
		Game.createMonster("Orc Rider", Position(x, y, z))
		Game.createMonster("Orc Berserker", Position(x, y, z))
    end
end

local function eightWave()
    local from, to, z = {x=32348, y=32286}, {x=32335, y=32297}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Shaman", Position(x, y, z))
		Game.createMonster("Orc", Position(x, y, z))
		Game.createMonster("Orc Warlord", Position(x, y, z))
		Game.createMonster("Orc Rider", Position(x, y, z))
		Game.createMonster("Orc Berserker", Position(x, y, z))
    end
end

local function nineWave()
    local from, to, z = {x=32261, y=32271}, {x=32287, y=32297}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Shaman", Position(x, y, z))
		Game.createMonster("Orc", Position(x, y, z))
		Game.createMonster("Orc Warlord", Position(x, y, z))
		Game.createMonster("Orc Rider", Position(x, y, z))
		Game.createMonster("Orc Berserker", Position(x, y, z))
    end
end

local function tenWave()
    local from, to, z = {x=32358, y=32161}, {x=32374, y=32173}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Shaman", Position(x, y, z))
    end
end

local function elevenWave()
    local from, to, z = {x=32360, y=32161}, {x=32374, y=32173}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Berserker", Position(x, y, z))
    end
end

local function twelveWave()
    local from, to, z = {x=32360, y=32161}, {x=32374, y=32173}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Warlord", Position(x, y, z))
    end
end

local function thirteenWave()
    local from, to, z = {x=32359, y=32161}, {x=32374, y=32173}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Rider", Position(x, y, z))
    end
end

local function fourteenWave()
    local from, to, z = {x=32360, y=32161}, {x=32374, y=32173}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc", Position(x, y, z))
    end
end

local function fiveteenWave()
    local from, to, z = {x=32359, y=32161}, {x=32374, y=32173}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Shaman", Position(x, y, z))
		Game.createMonster("Orc", Position(x, y, z))
		Game.createMonster("Orc Warlord", Position(x, y, z))
		Game.createMonster("Orc Rider", Position(x, y, z))
		Game.createMonster("Orc Berserker", Position(x, y, z))
    end
end

local function sixteenWave()
    local from, to, z = {x=32359, y=32161}, {x=32374, y=32173}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Shaman", Position(x, y, z))
		Game.createMonster("Orc", Position(x, y, z))
		Game.createMonster("Orc Warlord", Position(x, y, z))
		Game.createMonster("Orc Rider", Position(x, y, z))
		Game.createMonster("Orc Berserker", Position(x, y, z))
    end
end

local function eightteenWave()
    local from, to, z = {x=32359, y=32161}, {x=32374, y=32173}, 7
    for _ = 1, math.random(4, 10) do
        local x, y = math.random(from.x, to.x), math.random(from.y, to.y)
        Game.createMonster("Orc Shaman", Position(x, y, z))
		Game.createMonster("Orc", Position(x, y, z))
		Game.createMonster("Orc Warlord", Position(x, y, z))
		Game.createMonster("Orc Rider", Position(x, y, z))
		Game.createMonster("Orc Berserker", Position(x, y, z))
    end
end

function raid.onTime(interval)
	addEvent(initialWarning, 1000)
	addEvent(secondWarning, 60000)
	addEvent(initialWave, 60000)
	addEvent(secondWave, 60000)
	addEvent(threeWave, 60000)
	addEvent(fourWave, 60000)
	addEvent(fiveWave, 60000)
	addEvent(sixWave, 60000)
	addEvent(sevenWave, 60000)
	addEvent(eightWave, 60000)
	addEvent(nineWave, 60000)
	addEvent(tenWave, 120000)
	addEvent(elevenWave, 120000)
	addEvent(twelveWave, 120000)
	addEvent(thirteenWave, 120000)
	addEvent(fourteenWave, 120000)
	addEvent(fiveteenWave, 120000)
	addEvent(sixteenWave, 120000)
	addEvent(eightteenWave, 120000)
    return true
end

--raid:register()