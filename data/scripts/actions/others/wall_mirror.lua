local messages = {
	"You could win a beauty contest today!",
	"You rarely looked better.",
	"Well, you can't look good every day.",
	"You should think about a makeover.",
	"Is that the indication of a potbelly looming under your clothes?",
	"You look irresistible.",
	"You look tired.",
	"You look awesome!",
	"You nearly don't recognize yourself.",
	"You look fabulous.",
	"Surprise, surprise, you don't see yourself."
}

local wall_mirror = Action()
function wall_mirror.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(658324) <= os.time() then
		player:say(messages[math.random(1, #messages)], TALKTYPE_MONSTER_SAY)
		player:setStorageValue(658324, os.time() + 20 * 60 * 60)
		player:addAchievementProgress("Vanity", 300)
	else
		player:say("Don't be so vain about your appearance.", TALKTYPE_MONSTER_SAY)
	end
	return true
end
wall_mirror:id(1816, 1817, 1843, 1844, 1846, 1847, 1849, 1850)
wall_mirror:register()
