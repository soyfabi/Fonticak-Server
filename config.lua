-- Server General --
-- npcsUsingBankMoney / Use money of bank.
worldType = "pvp"
hotkeyAimbotEnabled = true
removeChargesFromRunes = true
removeChargesFromPotions = false
removeWeaponAmmunition = true
removeWeaponCharges = true
experienceByKillingPlayers = false
expFromPlayersLevelRange = 75
pzLockSkullAttacker = false
npcsUsingBankMoney = true


-- Player Config --
pushCruzado = true
pushDelayInCreatureDistance = 100  -- Time to push the creatures, players of (Far)
pushDelayOfShort = 700 -- Time to push the creatures, players of (SHORT)
pushDelayInItem = 0 -- Time to push the item.
protectionLevel = 50
killsToRedSkull = 200
killsToBlackSkull = 300
pzLocked = 1000
timeToDecreaseFrags = 24 * 60 * 60
whiteSkullTime = 1 * 0
stairJumpExhaustion = 2000
guildLeaderSquare = true
showExivaMonster = true
allowWalkthrough = true

-- Magic Wall Sprite --
magicWallId = 2129 -- magic wall
oldMagicWallId = 12124 -- magic wall old
magicWallStorage = 90000 -- Storage Wall

-- Connection Config
-- MySQL
mysqlHost = "127.0.0.1"
mysqlUser = "root"
mysqlPass = "123"
mysqlDatabase = "1Project860"
mysqlPort = 3306
mysqlSock = ""
-------------------
ip = "192.168.0.112"
bindOnlyGlobalAddress = false
loginProtocolPort = 7171
gameProtocolPort = 7172
statusProtocolPort = 7171
maxPlayers = 1000
motd = "Welcome to The Baiak Fonticak"
onePlayerOnlinePerAccount = false
allowClones = false
serverName = "Fonticak"
statusTimeout = 5000
replaceKickOnLogin = true
maxPacketsPerSecond = 300

-- NOTE: true will allow the /reload command to be used
allowReload = true

-- Deaths
-- NOTE: Leave deathLosePercent as -1 if you want to use the default
-- death penalty formula. For the old formula, set it to 10. For
-- no skill/experience loss, set it to 0.
deathLosePercent = -1

-- Houses
-- NOTE: set housePriceEachSQM to -1 to disable the ingame buy house functionality
-- NOTE: valid values for houseRentPeriod are: "daily", "weekly", "monthly", "yearly"
-- use any other value to disable the rent system
housePriceEachSQM = 1000
houseRentPeriod = "never"
houseOwnedByAccount = false
houseDoorShowPrice = true
onlyInvitedCanMoveHouseItems = true

-- Item Usage
timeBetweenActions = 0
timeBetweenExActions = 0

-- Map
-- NOTE: set mapName WITHOUT .otbm at the end
mapName = "otservbr"
mapAuthor = "Fabián Marzán"

-- checkDuplicateStorageKeys checks the values stored in the variables for duplicates.
-- Market
marketOfferDuration = 30 * 24 * 60 * 60
premiumToCreateMarketOffer = true
checkExpiredMarketOffersEachMinutes = 60
maxMarketOffersAtATimePerPlayer = 100



-- Misc.
-- NOTE: classicAttackSpeed set to true makes players constantly attack at regular
-- intervals regardless of other actions such as item (potion) use. This setting
-- may cause high CPU usage with many players and potentially affect performance!
-- NOTE: forceMonsterTypesOnLoad loads all monster types on startup to validate them.
-- You can disable it to save some memory if you don't see any errors at startup.
-- checkDuplicateStorageKeys checks the values stored in the variables for duplicates.
lotterySystem = false
allowChangeOutfit = true
freePremium = false
kickIdlePlayerAfterMinutes = 15
maxMessageBuffer = 4
emoteSpells = true
classicEquipmentSlots = true
classicAttackSpeed = true
showScriptsLogInConsole = false
showOnlineStatusInCharlist = false
yellMinimumLevel = 2
yellAlwaysAllowPremium = false
minimumLevelToSendPrivate = 25
premiumToSendPrivate = false
forceMonsterTypesOnLoad = true
cleanProtectionZones = false
luaItemDesc = false
loadOutfitsFromLua = true
showPlayerLogInConsole = true
regenerationPZ = true -- Regeneration on PZ /Health and Mana.
checkDuplicateStorageKeys = false

-- VIP and Depot limits
-- NOTE: you can set custom limits per group in data/XML/groups.xml
vipFreeLimit = 20
vipPremiumLimit = 100
depotFreeLimit = 2000
depotPremiumLimit = 10000

-- World Light
-- NOTE: if defaultWorldLight is set to true the world light algorithm will
-- be handled in the sources. set it to false to avoid conflicts if you wish
-- to make use of the function setWorldLight(level, color)
defaultWorldLight = true

-- Server Save
-- NOTE: serverSaveNotifyDuration in minutes
serverSaveNotifyMessage = true
serverSaveNotifyDuration = 5
serverSaveCleanMap = false
serverSaveClose = false
serverSaveShutdown = true

-- Experience stages
-- NOTE: to use a flat experience multiplier, set experienceStages to nil
-- minlevel and multiplier are MANDATORY
-- maxlevel is OPTIONAL, but is considered infinite by default
-- to disable stages, create a stage with minlevel 1 and no maxlevel
experienceStages = {
	{ minlevel = 1, maxlevel = 50, multiplier = 250},
	{ minlevel = 51, maxlevel = 70, multiplier = 215},
	{ minlevel = 71, maxlevel = 80, multiplier = 200},
	{ minlevel = 81, maxlevel = 100, multiplier = 120},
	{ minlevel = 101, maxlevel = 120, multiplier = 50},
	{ minlevel = 121, maxlevel = 140, multiplier = 20},
	{ minlevel = 141, maxlevel = 175, multiplier = 8},
	{ minlevel = 176, maxlevel = 180, multiplier = 2},
	{ minlevel = 181, maxlevel = 200, multiplier = 1.5},
	{ minlevel = 201, maxlevel = 500, multiplier = 1}
}

-- Rates
-- NOTE: rateExp is not used if you have enabled stages above
-- rateMultiplier multiple for Players Online. Default = 1.
rateExp = 0
rateSkill = 10
rateLoot = 6
rateMagic = 3
rateSpellCooldown = 1
spawnMultiplier = 1

monsterBonusHealth = 0.5
monsterBonusSpeed = 0.02
monsterBonusDamage = 0.02

-- Monster Despawn Config
-- despawnRange is the amount of floors a monster can be from its spawn position
-- despawnRadius is how many tiles away it can be from its spawn position
-- removeOnDespawn will remove the monster if true or teleport it back to its spawn position if false
-- walkToSpawnRadius is the allowed distance that the monster will stay away from spawn position when left with no targets, 0 to disable
deSpawnRange = 2
deSpawnRadius = 50
removeOnDespawn = true
walkToSpawnRadius = 15

-- Stamina
staminaSystem = true
timeToRegenMinuteStamina = 3 * 60
timeToRegenMinutePremiumStamina = 10 * 60

-- Scripts
warnUnsafeScripts = true
convertUnsafeScripts = true

-- Startup
-- NOTE: defaultPriority only works on Windows and sets process
-- priority, valid values are: "normal", "above-normal", "high"
defaultPriority = "high"
startupDatabaseOptimization = false
blockLogin = false
blockLoginText = "Server is closed for bug fixing."

-- Status Server Information
ownerName = "Onwer"
ownerEmail = "info"
url = "https://retro/"
location = "USA"
