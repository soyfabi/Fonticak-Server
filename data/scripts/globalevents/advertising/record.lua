local Reminder_Password = GlobalEvent("Reminder_Password")
function Reminder_Password.onTime(interval)
	addEvent(Game.broadcastMessage, 150, "[Password Security]\nKeep in mind your account insurance, always have your password written down in case you forget it and I advise you never to use the same password in the ots, they could easily hack you and that would no longer be the Admin's fault. It also generates a Recovery Key to have an account recovery. Good luck!", MESSAGE_STATUS_WARNING)
	return true
end
Reminder_Password:interval(3000000)
--Reminder_Password:register()

local Reminder_VIP = GlobalEvent("Reminder_VIP")
function Reminder_VIP.onTime(interval)
	addEvent(Game.broadcastMessage, 150, "[VIP INFO]\nBeing a VIP player, it grants a 10% EXP bonus, that's not all, it even gives a lot of advantages such as:\n - Access New Citys\n - Access Warzone (5, 6, 7, 8)\n - Gain +1 Stamina each Minute (For Player Normal is each 2 Minute).\n And much more, for more details: Sv-Fonticak.com.", MESSAGE_EVENT_ADVANCE)
	return true
end
Reminder_VIP:interval(3000000)
--Reminder_VIP:register()

local Reminder_Lottery = GlobalEvent("Reminder_Lottery")
function Reminder_Lottery.onTime(interval)
	addEvent(Game.broadcastMessage, 150, "[Lottery INFO]\nI just wanted to tell you that we have a Lottery system, every 2 hours, what happens every 2 hours? We raffle a few items randomly among all the players that are connected. There will be 3 winners. Good luck!", MESSAGE_EVENT_ADVANCE)
	return true
end
Reminder_Lottery:interval(3000000)
--Reminder_Lottery:register()

local CastleWar_Reminder = GlobalEvent("CastleWar_Reminder")
function CastleWar_Reminder.onTime(interval)
	addEvent(Game.broadcastMessage, 150, "[Castle War INFO]\nIn case you didn't know, there is a type of event that we call Castle War, basically they fight to dominate the Castle, that is, it is a very valuable event since by dominating it it gives them 12% EXP, and not only that, they also have NPCs inside. With which you can sell or buy items more effectively, the Castle lasts a full day. Good Luck!", MESSAGE_EVENT_ADVANCE)
	return true
end
CastleWar_Reminder:interval(5000)
--CastleWar_Reminder:register()

local GuildBalance_Reminder = GlobalEvent("GuildBalance_Reminder")
function GuildBalance_Reminder.onTime(interval)
	addEvent(Game.broadcastMessage, 150, "[Guild Balance INFO]\nMembers of a guild can deposit money into the guild account, that is, you can withdraw money and transfer with the guild's money. For more details go to NPC Banker (Sanyte).", MESSAGE_EVENT_ADVANCE)
	return true
end
GuildBalance_Reminder:interval(5000)
--GuildBalance_Reminder:register()
