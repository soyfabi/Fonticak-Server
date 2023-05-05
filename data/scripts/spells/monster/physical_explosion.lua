local condition = Condition(COMBAT_PHYSICALDAMAGE)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(3, 10000, -25)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, 6)
combat:setArea(createCombatArea(AREA_SQUARE1X1))
combat:addCondition(condition)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:name("physical explosion")
spell:words("###8044")
spell:needLearn(true)
spell:cooldown("2000")
spell:isSelfTarget(true)
spell:register()
