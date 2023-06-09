if configManager.getBoolean(configKeys.LOAD_OUTFITS_FROM_LUA) == false then
	return
end

loadOutfits({
	{sex = PLAYERSEX_MALE, lookType = 128, name = "Citizen", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 129, name = "Hunter", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 130, name = "Mage", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 131, name = "Knight", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 132, name = "Nobleman", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 133, name = "Summoner", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 134, name = "Warrior", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 143, name = "Barbarian", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 144, name = "Druid", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 145, name = "Wizard", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 146, name = "Oriental", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 151, name = "Pirate", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 152, name = "Assassin", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 153, name = "Beggar", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 154, name = "Shaman", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 251, name = "Norseman", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 268, name = "Nightmare", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 273, name = "Jester", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 278, name = "Brotherhood", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 289, name = "Demon Hunter", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 325, name = "Yalaharian", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 328, name = "Newly Wed", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 335, name = "Warmaster", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 367, name = "Wayfarer", premium = false, unlocked = true, enabled = true},
	
	
	
	
	
	
	
	
	
	{sex = PLAYERSEX_MALE, lookType = 430, name = "Afflicted", premium = false, unlocked = false, enabled = true},
	--[[{sex = PLAYERSEX_MALE, lookType = 432, name = "Elementalist", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 463, name = "Deepling", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 465, name = "Insectoid", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 472, name = "Entrepreneur", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 512, name = "Crystal Warlord", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 516, name = "Soil Guardian", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 541, name = "Demon Outfit", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 574, name = "Cave Explorer", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 577, name = "Dream Warden", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 610, name = "Glooth Engineer", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 619, name = "Jersey", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 633, name = "Champion", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 634, name = "Conjurer", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 637, name = "Beastmaster", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 665, name = "Chaos Acolyte", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 667, name = "Death Herald", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 684, name = "Ranger", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 695, name = "Ceremonial Garb", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 697, name = "Puppeteer", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 699, name = "Spirit Caller", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 725, name = "Evoker", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 733, name = "Seaweaver", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 746, name = "Recruiter", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 750, name = "Sea Dog", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 760, name = "Royal Pumpkin", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 846, name = "Rift Warrior", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 853, name = "Winter Warden", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 873, name = "Philosopher", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 884, name = "Arena Champion", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_MALE, lookType = 899, name = "Lupine Warden", premium = false, unlocked = false, enabled = true},]]

	--FEMALE TYPE

	--[[{sex = PLAYERSEX_FEMALE, lookType = 136, name = "Citizen", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 137, name = "Hunter", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 138, name = "Mage", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 139, name = "Knight", premium = false, unlocked = true, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 140, name = "Noblewoman", premium = true, unlocked = true, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 141, name = "Summoner", premium = true, unlocked = true, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 142, name = "Warrior", premium = true, unlocked = true, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 147, name = "Barbarian", premium = true, unlocked = true, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 148, name = "Druid", premium = true, unlocked = true, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 149, name = "Wizard", premium = true, unlocked = true, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 150, name = "Oriental", premium = true, unlocked = true, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 155, name = "Pirate", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 156, name = "Assassin", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 157, name = "Beggar", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 158, name = "Shaman", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 252, name = "Norsewoman", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 269, name = "Nightmare", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 270, name = "Jester", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 279, name = "Brotherhood", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 288, name = "Demon Hunter", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 324, name = "Yalaharian", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 329, name = "Newly Wed", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 336, name = "Warmaster", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 366, name = "Wayfarer", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 431, name = "Afflicted", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 433, name = "Elementalist", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 464, name = "Deepling", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 466, name = "Insectoid", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 471, name = "Entrepreneur", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 513, name = "Crystal Warlord", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 514, name = "Soil Guardian", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 542, name = "Demon Outfit", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 575, name = "Cave Explorer", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 578, name = "Dream Warden", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 618, name = "Glooth Engineer", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 620, name = "Jersey", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 632, name = "Champion", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 635, name = "Conjurer", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 636, name = "Beastmaster", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 664, name = "Chaos Acolyte", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 666, name = "Death Herald", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 683, name = "Ranger", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 694, name = "Ceremonial Garb", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 696, name = "Puppeteer", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 698, name = "Spirit Caller", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 724, name = "Evoker", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 732, name = "Seaweaver", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 745, name = "Recruiter", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 749, name = "Sea Dog", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 759, name = "Royal Pumpkin", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 845, name = "Rift Warrior", premium = true, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 852, name = "Winter Warden", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 874, name = "Philosopher", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 885, name = "Arena Champion", premium = false, unlocked = false, enabled = true},
	{sex = PLAYERSEX_FEMALE, lookType = 900, name = "Lupine Warden", premium = false, unlocked = false, enabled = true}]]
})