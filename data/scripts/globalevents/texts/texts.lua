local texts_delay = GlobalEvent("Text_Delay_2000")
function texts_delay.onThink(interval)
    local effects = {
	  -----EASY ZONE LVL 25-100 TEXT DISPLAY-----
	 {position = Position(866, 964, 4), text = "Back", say = false, color = math.random(210,210)},
	 {position = Position(874, 964, 4), text = "Back", say = false, color = math.random(210,210)},
	 {position = Position(934, 804, 5), text = "Temple", say = false, color = math.random(132,140)},
	 {position = Position(952, 804, 5), text = "Temple", say = false, color = math.random(132,140)},
	 {position = Position(939, 773, 5), text = "Back", effect = 32, say = false, color = math.random(192,192)},
	 {position = Position(947, 773, 5), text = "Back", effect = 32, say = false, color = math.random(192,192)},
	 {position = Position(7764, 8020, 7), text = "Dragon", effect = 32, say = false, color = math.random(192,192)},
}
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 100, 100, 100, 100)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    if settings.say then
                        spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                    else
                        Game.sendAnimatedText(settings.text, settings.position, settings.color)
                    end
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end
texts_delay:interval(2000)
texts_delay:register()

----------------------------------------------------------------------------------------------
local texts_delay2 = GlobalEvent("Text_Delay_5000")
function texts_delay2.onThink(interval)
    local effects = {
	  -----TEMPLE TEXT DISPLAY-----
	 {position = Position(1000, 1002, 5), text = "Super", effect = 40, say = false, color = math.random(140,140)},
}
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 100, 100, 100, 100)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    if settings.say then
                        spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                    else
                        Game.sendAnimatedText(settings.text, settings.position, settings.color)
                    end
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end
texts_delay2:interval(5000)
texts_delay2:register()
-----------------------------------------------------------------------
local texts_delay3 = GlobalEvent("Text_Delay_8000")
function texts_delay3.onThink(interval)
    local effects = {
	  -----TEMPLE TEXT DISPLAY-----
	 {position = Position(937, 799, 5), text = "[Level]\n[1-100]", effect = 40, say = true, color = math.random(140,140)},
	 {position = Position(943, 799, 5), text = "[Level]\n[100-150]", effect = 40, say = true, color = math.random(140,140)},
	 {position = Position(949, 799, 5), text = "[Level]\n[150-200]", effect = 40, say = true, color = math.random(140,140)},
	 {position = Position(936, 773, 5), text = "[Quests]", effect = 40, say = true, color = math.random(140,140)},
	 {position = Position(950, 773, 5), text = "[Quests]", effect = 40, say = true, color = math.random(140,140)},
}
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 100, 100, 100, 100)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    if settings.say then
                        spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                    else
                        Game.sendAnimatedText(settings.text, settings.position, settings.color)
                    end
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end
texts_delay3:interval(4000)
texts_delay3:register()
