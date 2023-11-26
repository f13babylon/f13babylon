// ---------------------------
// STIMPAK FLUID REAGENT

/datum/reagent/medicine/stimpak
	name = "Stimpak fluid"
	description = "A pre-war cocktail of healing agents and stimulants which bolster the body's natural regenerative abilities. Injecting this leads to a swift recovery from most injuries."
	reagent_state = LIQUID
	color = "#df341f"
	taste_description = "grossness"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 31
	addiction_threshold = 25
	value = REAGENT_VALUE_RARE
	ghoulfriendly = TRUE
	var/list/reagent_blacklist = list(/datum/reagent/medicine/bitterdrink, /datum/reagent/medicine/healingpoultice, /datum/reagent/medicine/healingpowder, /datum/reagent/medicine/stimpak/imitation)
	var/affecting_intolerant_mob = FALSE	//If it is affecting a mob with TRAIT_STIM_INTOLERANCE
	var/damage_offset = 3	//Value to offset damage by
	var/inhale_toxloss_factor = 3.5	//Value to adjust toxloss by when inhaled/ingested
	var/clot_rate = 0.35	//35% as effective as Hydra at clotting bleeding wounds

/datum/reagent/medicine/stimpak/reaction_mob(mob/living/carbon/M, method, reac_volume, show_message = 1)
	if(iscarbon(M) && M.stat != DEAD)
		if(method in list(INGEST, VAPOR))
			M.adjustToxLoss(inhale_toxloss_factor * reac_volume * REAGENTS_EFFECT_MULTIPLIER)
			if(show_message)
				to_chat(M, "<span class='warning'>You don't feel so good...</span>")
	..()

/datum/reagent/medicine/stimpak/on_mob_add(mob/living/carbon/M)
	if(M.mind)
		var/datum/job/job = SSjob.GetJob(M.mind.assigned_role)
		if(istype(job))
			if(job.faction == FACTION_LEGION)
				SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "betrayed caesar", /datum/mood_event/betrayed_caesar, name)
	if(HAS_TRAIT(M, TRAIT_STIM_INTOLERANCE))
		affecting_intolerant_mob = TRUE
		to_chat(M, "<span class='userdanger'>You feel sick from the stimpak fluid in your body!</span>")
	..()

/datum/reagent/medicine/stimpak/on_mob_life(mob/living/carbon/M)
	var/is_blocked = FALSE
	if(M.reagents)
		for(var/iter_blacklisted_reagent in reagent_blacklist)
			if(M.reagents.has_reagent(iter_blacklisted_reagent))
				is_blocked = TRUE
				break
	if(!is_blocked)
		//Clotting properties for pierce/slash wounds
		if(current_cycle > 0 && current_cycle % 6 == 0 && M.all_wounds && M.all_wounds.len >= 1)	//Every 6th cycle, reduce blood_flow for all pierce/slash wounds by clot_rate.
			for(var/datum/wound/iter_wound in M.all_wounds)
				var/affected_limb_name = iter_wound.limb.name
				switch(iter_wound.severity)
					if (WOUND_SEVERITY_CRITICAL)
						if (iter_wound.wound_type == WOUND_PIERCE)
							iter_wound.blood_flow -= clot_rate
							M.visible_message("<span class='notice'>The bleeding hole in [M]'s [affected_limb_name] fills with fresh tissue!</span>", \
											  "<span class='notice'>You feel the cavity in your [affected_limb_name] weaving back together.</span>")
						else if (iter_wound.wound_type == WOUND_SLASH)
							iter_wound.blood_flow -= clot_rate
							M.visible_message("<span class='notice'>The deep gashes on [M]'s [affected_limb_name] close up!</span>", \
											  "<span class='notice'>You feel the deep gashes on your [affected_limb_name] close up.</span>")
					if (WOUND_SEVERITY_SEVERE)
						if (iter_wound.wound_type == WOUND_PIERCE)
							iter_wound.blood_flow -= clot_rate
							M.visible_message("<span class='notice'>The puncture wound on [M]'s [affected_limb_name] shrinks!</span>", \
											  "<span class='notice'>You feel the puncture wound on your [affected_limb_name] shrinking.</span>")
						else if (iter_wound.wound_type == WOUND_SLASH)
							iter_wound.blood_flow -= clot_rate
							M.visible_message("<span class='notice'>The large cuts on [M]'s [affected_limb_name] mend!</span>", \
											  "<span class='notice'>You feel the large cuts on your [affected_limb_name] mending.</span>")
					if (WOUND_SEVERITY_MODERATE)
						if (iter_wound.wound_type == WOUND_PIERCE || iter_wound.wound_type == WOUND_SLASH)
							iter_wound.blood_flow -= clot_rate

		//Actual healing part starts here
		M.adjustBruteLoss(-damage_offset * REAGENTS_EFFECT_MULTIPLIER, FALSE)	//100% of damage_offset (3)
		M.adjustFireLoss(-damage_offset * 0.75 * REAGENTS_EFFECT_MULTIPLIER, FALSE)	//75% of damage_offset (2.25)
		M.adjustOxyLoss(-damage_offset * 0.66 * REAGENTS_EFFECT_MULTIPLIER, FALSE)	//66% of damage_offset (2)
		M.AdjustStun(-damage_offset * 0.66 * REAGENTS_EFFECT_MULTIPLIER, FALSE)	//66% of damage_offset (2)
		M.AdjustKnockdown(-damage_offset * 0.66 * REAGENTS_EFFECT_MULTIPLIER, FALSE)	//66% of damage_offset (2)
		M.adjustStaminaLoss(-damage_offset * 0.66 * REAGENTS_EFFECT_MULTIPLIER, FALSE)	//66% of damage_offset (2)
		M.heal_bodypart_damage(damage_offset, damage_offset * 0.75, only_robotic = TRUE, only_organic = FALSE)	//100% / 75% damage_offset (3/2.25)
		. = TRUE

	//Debuffs applied to people with TRAIT_STIM_INTOLERANCE
	if(affecting_intolerant_mob)
		if(M.jitteriness + 15 <= 300)
			M.jitteriness += 15
		if(M.disgust + 2.5 <= DISGUST_LEVEL_DISGUSTED)
			M.disgust += 2.5
		if(M.dizziness + 0.75 <= 15)
			M.dizziness += 0.75
		if(M.confused + 0.5 <= 10)
			M.confused += 0.5
		M.hallucination = 15
		M.druggy = 15
	..()

/datum/reagent/medicine/stimpak/overdose_process(mob/living/carbon/M)
	M.adjustToxLoss(damage_offset * 0.5 * REAGENTS_EFFECT_MULTIPLIER, FALSE)	//50% of damage_offset (1.5)
	M.adjustOxyLoss((damage_offset * 0.75 + damage_offset * 0.66) * REAGENTS_EFFECT_MULTIPLIER, FALSE)	//75% of damage_offset + base oxyloss offset (2.25)
	if(M.jitteriness + 15 <= 300)
		M.jitteriness += 15
	if(M.disgust + 2.5 <= DISGUST_LEVEL_DISGUSTED)
		M.disgust += 2.5
	if(M.dizziness + 0.75 <= 15)
		M.dizziness += 0.75
	if(M.confused + 0.5 <= 10)
		M.confused += 0.5
	M.hallucination = 15
	M.druggy = 15
	. = TRUE

// ---------------------------
// IMITATION STIMPAK FLUID REAGENT (75% as effective as regular stimpak fluid)

/datum/reagent/medicine/stimpak/imitation
	name = "Imitation stimpak fluid"
	description = "A chemical which aims to replicate the effects of the fluid found in pre-war stimpaks, albeit less effective."
	color = "#df5342"
	value = REAGENT_VALUE_UNCOMMON
	reagent_blacklist = list(/datum/reagent/medicine/bitterdrink, /datum/reagent/medicine/healingpoultice, /datum/reagent/medicine/healingpowder, /datum/reagent/medicine/stimpak, /datum/reagent/medicine/stimpak/imitation)
	damage_offset = 2.25	//How much damage will be offset in one tick
	inhale_toxloss_factor = 2.625	//How much toxloss is multiplied by the volume of the chemical if ingested/inhaled
	clot_rate = 0.26	//26% as effective as Hydra at clotting bleeding wounds

// ---------------------------
// SUPER STIMPAK FLUID REAGENT (225% as effective as regular stimpak fluid)

/datum/reagent/medicine/stimpak/super
	name = "Super stimpak fluid"
	description = "A powerful pre-war cocktail of healing agents and stimulants which bolster the body's natural regenerative abilities. Injecting this leads to near instant recovery from most injuries."
	value = REAGENT_VALUE_VERY_RARE
	reagent_blacklist = list(/datum/reagent/medicine/bitterdrink, /datum/reagent/medicine/healingpoultice, /datum/reagent/medicine/healingpowder, /datum/reagent/medicine/stimpak/superimitation, /datum/reagent/medicine/stimpak, /datum/reagent/medicine/stimpak/imitation)
	damage_offset = 6.75	//How much damage will be offset in one tick
	inhale_toxloss_factor = 5.25	//How much toxloss is multiplied by the volume of the chemical if ingested/inhaled
	clot_rate = 0.65	//65% as effective as Hydra at clotting bleeding wounds

// ---------------------------
// IMITATION SUPER STIMPAK FLUID REAGENT (166% as effective as regular stimpak fluid / 75% as effective as regular super stimpak fluid)

/datum/reagent/medicine/stimpak/superimitation
	name = "Imitation super stimpak fluid"
	description = "A chemical which aims to replicate the effects of the fluid found in pre-war super stimpaks, albeit less effective."
	color = "#df5342"
	reagent_blacklist = list(/datum/reagent/medicine/bitterdrink, /datum/reagent/medicine/healingpoultice, /datum/reagent/medicine/healingpowder, /datum/reagent/medicine/stimpak, /datum/reagent/medicine/stimpak/imitation)
	value = REAGENT_VALUE_RARE
	damage_offset = 5	//How much damage will be offset in one tick
	inhale_toxloss_factor = 4	//How much toxloss is multiplied by the volume of the chemical if ingested/inhaled
	clot_rate = 0.49	//49% as effective as Hydra at clotting bleeding wounds

// ---------------------------
// LONGPORK STEW REAGENT

/datum/reagent/medicine/longpork_stew
	name = "Longpork stew"
	description = "A dish sworn by some to have unusual healing properties. To most it just tastes disgusting. What even is longpork anyways?..."
	reagent_state = LIQUID
	color =  "#915818"
	taste_description = "oily water, with bits of raw-tasting tender meat."
	metabolization_rate = 0.15 * REAGENTS_METABOLISM //slow, weak heal that lasts a while. Metabolizies much faster if you are not hurt.
	overdose_threshold = 50 //If you eat too much you get poisoned from all the human flesh you're eating
	var/longpork_hurting = 0
	var/longpork_lover_healing = -2
	ghoulfriendly = TRUE

/datum/reagent/medicine/longpork_stew/on_mob_life(mob/living/carbon/M)
	var/is_longporklover = FALSE
	if(HAS_TRAIT(M, TRAIT_LONGPORKLOVER))
		is_longporklover = TRUE
	if(M.getBruteLoss() == 0 && M.getFireLoss() == 0)
		metabolization_rate = 3 * REAGENTS_METABOLISM //metabolizes much quicker if not injured
	var/longpork_heal_rate = (is_longporklover ? longpork_lover_healing : longpork_hurting) * REAGENTS_EFFECT_MULTIPLIER
	if(!M.reagents.has_reagent(/datum/reagent/medicine/stimpak) && !M.reagents.has_reagent(/datum/reagent/medicine/healingpowder))
		M.adjustFireLoss(longpork_heal_rate)
		M.adjustBruteLoss(longpork_heal_rate)
		M.adjustToxLoss(is_longporklover ? 0 : 3)
		. = TRUE
		..()

/datum/reagent/medicine/longpork_stew/overdose_process(mob/living/carbon/M)
	M.adjustToxLoss(2*REAGENTS_EFFECT_MULTIPLIER)
	..()
	. = TRUE


/datum/reagent/medicine/berserker_powder
	name = "Berserker powder"
	description = "a combination of psychadelic mushrooms and tribal drugs used by the legion. Induces a trancelike state, allowing them much greater pain resistance. Extremely dangerous, even for those who are trained to use it. It's a really bad idea to use this if you're not initiated in the rites of the berserker. Even if you are, taking it for too long causes extreme symptoms when the trance ends."
	reagent_state = SOLID
	color =  "#7f7add"
	taste_description = "heaven."
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 30 //hard to OD on, besides if you use too much it kills you when it wears off
	var/list/reagent_blacklist = list(/datum/reagent/medicine/stimpak/super, /datum/reagent/medicine/stimpak/superimitation ,/datum/reagent/medicine/stimpak, /datum/reagent/medicine/stimpak/imitation)

/datum/reagent/medicine/berserker_powder/on_mob_life(mob/living/carbon/M)
	if(HAS_TRAIT(M, TRAIT_BERSERKER))
		var/is_blocked = FALSE
		if(M.reagents)
			for(var/iter_blacklisted_reagent in reagent_blacklist)
				if(M.reagents.has_reagent(iter_blacklisted_reagent))
					is_blocked = TRUE
					break
		if(!is_blocked)
			M.AdjustStun(-2*REAGENTS_EFFECT_MULTIPLIER, 0)
			M.AdjustKnockdown(-5*REAGENTS_EFFECT_MULTIPLIER, 0)
			M.AdjustUnconscious(-2*REAGENTS_EFFECT_MULTIPLIER, 0)
			M.adjustStaminaLoss(-2*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	else
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 8)
		M.adjustToxLoss(5*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
		M.adjustOxyLoss(5*REAGENTS_EFFECT_MULTIPLIER, updating_health = FALSE)
	..()
	. = TRUE

/datum/reagent/medicine/berserker_powder/on_mob_add(mob/living/carbon/human/M)
	..()
	if(isliving(M))
		to_chat(M, "<span class='notice'>The veil breaks, and the heavens spill out! The spirits of Mars float down from the heavens, and the deafining beat of the holy legion's wardrums fills your ears. Their ethereal forms are guiding you in battle!</span>")
		M.maxHealth += 25
		M.health += 25
		ADD_TRAIT(M, TRAIT_IGNOREDAMAGESLOWDOWN, "[type]")

/datum/reagent/medicine/berserker_powder/on_mob_delete(mob/living/carbon/human/M)
	if(isliving(M))
		to_chat(M, "<span class='notice'>The veil comes back, blocking out the heavenly visions. You breathe a sigh of relief...</span>")
		M.maxHealth -= 25
		M.health -= 25
		REMOVE_TRAIT(M, TRAIT_IGNOREDAMAGESLOWDOWN, "[type]")

	switch(current_cycle)
		if(1 to 30)
			M.confused += 10
			M.blur_eyes(20)
			to_chat(M, "<span class='notice'>Your head is pounding. You feel like screaming. The visions beckon you to go further, to split the veil forever and cross over. You know you shouldn't. </span>")
		if(30 to 55)
			M.confused +=20
			M.blur_eyes(30)
			M.losebreath += 8
			M.set_disgust(12)
			M.adjustStaminaLoss(30*REAGENTS_EFFECT_MULTIPLIER)
			to_chat(M, "<span class='danger'>Your stomach churns, you vomit, and the blurring of your vision doesn't go away. The visions beckon you further, you're so close.... </span>")
		if(55 to INFINITY)
			M.confused +=40
			M.blur_eyes(30)
			M.losebreath += 10
			M.set_disgust(25)
			M.adjustStaminaLoss(40*REAGENTS_EFFECT_MULTIPLIER)
			M.vomit(30, 1, 1, 5, 0, 0, 0, 60)
			M.Jitter(1000)
			M.playsound_local(M, 'sound/effects/singlebeat.ogg', 100, 0)
			M.visible_message("<span class='userdanger'>[M] grabs at their throat and vomits violently onto the ground, screaming as they have a seizure! They need medical attention immediately!</span>")
			to_chat(M, "<span class='userdanger'>The sky splits in half, rays of golden light piercing down towards you. Mars reaches out of the sky above, the holy aura causing you to fall to your knees. He beckoning you to heaven, and you take his hand. Your whole body begins to seize up as you go in a glorious rapture. </span>")

/datum/reagent/medicine/berserker_powder/overdose_process(mob/living/carbon/M)
	M.adjustToxLoss(5*REAGENTS_EFFECT_MULTIPLIER)
	return TRUE

// ---------------------------
// BITTER DRINK REAGENT	(180% as effective as regular stimpak fluid for tribals / 133% for non-tribals)

/datum/reagent/medicine/bitterdrink
	name = "Bitter drink"
	description = "An herbal healing concoction which enables wounded soldiers and travelers to tend to their wounds without stopping during journeys. It derives its name from curing the wounds but leaving the 'bitter' pain from them."
	reagent_state = LIQUID
	color = "#773c00"
	taste_description = "unbearable herbal bitterness"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 31
	value = REAGENT_VALUE_VERY_RARE
	ghoulfriendly = TRUE
	var/list/reagent_blacklist = list(/datum/reagent/medicine/healingpoultice, /datum/reagent/medicine/healingpowder,  /datum/reagent/medicine/stimpak/super, /datum/reagent/medicine/stimpak/superimitation ,/datum/reagent/medicine/stimpak, /datum/reagent/medicine/stimpak/imitation)
	var/damage_offset = 0
	var/affecting_tribal = FALSE

/datum/reagent/medicine/bitterdrink/reaction_mob(mob/living/M, method, reac_volume, show_message = 1)
	if(iscarbon(M) && M.stat != DEAD)
		if(method in list(INGEST, VAPOR, INJECT))
			M.adjustToxLoss(2 * reac_volume * REAGENTS_EFFECT_MULTIPLIER)
			M.adjustOxyLoss(2 * reac_volume * REAGENTS_EFFECT_MULTIPLIER)
			if(show_message)
				to_chat(M, "<span class='warning'>You don't feel so good...</span>")
	..()

/datum/reagent/medicine/bitterdrink/on_mob_add(mob/living/carbon/M)
	if(HAS_TRAIT(M, TRAIT_HERBAL_AFFINITY))
		damage_offset =  5.4 * REAGENTS_EFFECT_MULTIPLIER
		affecting_tribal = TRUE
	else
		damage_offset = 4 * REAGENTS_EFFECT_MULTIPLIER
	..()

/datum/reagent/medicine/bitterdrink/on_mob_life(mob/living/carbon/M)
	var/is_blocked = FALSE
	if(M.reagents)
		for(var/iter_blacklisted_reagent in reagent_blacklist)
			if(M.reagents.has_reagent(iter_blacklisted_reagent))
				is_blocked = TRUE
				break
	if(!is_blocked)
		//Extra healing for each bodypart affected by wounds
		if(affecting_tribal)
			if(M.all_wounds && M.all_wounds.len >= 1)
				var/added_damage_offset = 3
				for(var/obj/item/bodypart/iter_bodypart in M.bodyparts)
					if(iter_bodypart.wounds && iter_bodypart.wounds.len >= 1)
						M.adjustBruteLoss(-added_damage_offset, FALSE)
						M.adjustFireLoss(-added_damage_offset * 0.75, FALSE)	//75% of added_damage_offset
						added_damage_offset *= 0.5	//Reduce the added_damage_offset by half for each wounded bodypart to keep the offset from getting too ridiculous

		//Actual healing part starts here
		M.adjustBruteLoss(-damage_offset, FALSE)	//100% of damage_offset (5.4 / 4)
		M.adjustFireLoss(-damage_offset * 0.75, FALSE)	//75% of damage_offset (4 / 3)
		M.adjustToxLoss(-damage_offset * 0.33, FALSE)	//33% of damage_offset (1.8 / 1.35)
		M.adjustOxyLoss(-damage_offset * 0.33, FALSE)	//33% of damage_offset (1.8 / 1.35)
		M.AdjustStun(-damage_offset * 0.66, FALSE)	//66% of damage_offset (3.6 / 2.64)
		M.AdjustKnockdown(-damage_offset * 0.66, FALSE)	//66% of damage_offset (3.6 / 2.64)
		M.adjustStaminaLoss(-damage_offset * 0.66, FALSE)	//66% of damage_offset (3.6 / 2.64)
		. = TRUE

	//Debuffs applied to people without TRAIT_HERBAL_AFFINITY
	if(!affecting_tribal)
		if(M.jitteriness + 15 <= 300)
			M.jitteriness += 15
		if(M.disgust + 2.5 <= DISGUST_LEVEL_DISGUSTED)	//"When you drink it, down it all in one shot, or your stomach's not going to want to keep going after the second drink."
			M.disgust += 2.5
		if(M.dizziness + 0.75 <= 15)
			M.dizziness += 0.75
		if(M.confused + 0.5 <= 10)
			M.confused += 0.5
		M.hallucination = 15
	..()

/datum/reagent/medicine/bitterdrink/overdose_process(mob/living/carbon/M)
	M.adjustToxLoss((5.4 * 0.33  + 5.4 * 0.33) * REAGENTS_EFFECT_MULTIPLIER, FALSE)	//100% of toxloss offset + base toxloss offset (3.6)
	M.adjustOxyLoss((5.4 * 0.33 * 1.5 + 5.4 * 0.33) * REAGENTS_EFFECT_MULTIPLIER, FALSE)	//150% of oxyloss offset + base oxyloss offset (4.46)
	if(M.jitteriness + 15 <= 300)
		M.jitteriness += 15
	if(M.disgust + 2.5 <= DISGUST_LEVEL_DISGUSTED)	//"When you drink it, down it all in one shot, or your stomach's not going to want to keep going after the second drink."
		M.disgust += 2.5
	if(M.dizziness + 0.75 <= 15)
		M.dizziness += 0.75
	if(M.confused + 0.5 <= 10)
		M.confused += 0.5
	M.hallucination = 15
	M.druggy = 15
	. = TRUE

// ---------------------------
// HEALING POWDER REAGENT (75% as effective as regular stimpak fluid for tribals / 55% for non-tribals)

/datum/reagent/medicine/healingpowder
	name = "Healing powder"
	description = "A healing powder derived from a mix of ground broc flowers and xander roots, commonly used by tribals and Legionaries. Applied on skin, it has an additional oxygenating effect."
	reagent_state = SOLID
	color = "#b88b5d"
	taste_description = "weak herbal bitterness"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 31
	value = REAGENT_VALUE_COMMON
	ghoulfriendly = TRUE
	var/list/reagent_blacklist = list(/datum/reagent/medicine/stimpak/super, /datum/reagent/medicine/stimpak/superimitation ,/datum/reagent/medicine/stimpak, /datum/reagent/medicine/stimpak/imitation)
	var/damage_offset = 0
	var/affecting_tribal = FALSE

/datum/reagent/medicine/healingpowder/reaction_mob(mob/living/M, method, reac_volume, show_message = 1)
	if(iscarbon(M) && M.stat != DEAD)
		if(method in list(INGEST, VAPOR, INJECT))
			M.adjustToxLoss(4 * reac_volume * REAGENTS_EFFECT_MULTIPLIER)
			if(show_message)
				to_chat(M, "<span class='warning'>You don't feel so good...</span>")
	..()

/datum/reagent/medicine/healingpowder/on_mob_add(mob/living/carbon/M)
	if(HAS_TRAIT(M, TRAIT_HERBAL_AFFINITY))
		damage_offset =  2.25 * REAGENTS_EFFECT_MULTIPLIER
		affecting_tribal = TRUE
	else
		damage_offset = 1.7 * REAGENTS_EFFECT_MULTIPLIER
	..()

/datum/reagent/medicine/healingpowder/on_mob_life(mob/living/carbon/M)
	var/is_blocked = FALSE
	if(M.reagents)
		for(var/iter_blacklisted_reagent in reagent_blacklist)
			if(M.reagents.has_reagent(iter_blacklisted_reagent))
				is_blocked = TRUE
				break

	if(!is_blocked)
		//Extra healing for each bodypart affected by wounds
		if(affecting_tribal)
			if(M.all_wounds && M.all_wounds.len >= 1)
				var/added_damage_offset = 1
				for(var/obj/item/bodypart/iter_bodypart in M.bodyparts)
					if(iter_bodypart.wounds && iter_bodypart.wounds.len >= 1)
						M.adjustBruteLoss(-added_damage_offset, FALSE)
						M.adjustFireLoss(-added_damage_offset * 0.75, FALSE)	//75% of added_damage_offset
						added_damage_offset *= 0.5	//Reduce the added_damage_offset by half for each wounded bodypart to keep the offset from getting too ridiculous

		//Actual healing part starts here
		M.adjustBruteLoss(-damage_offset, FALSE)	//100% of damage_offset (2.25 / 1.7)
		M.adjustFireLoss(-damage_offset * 0.75, FALSE)	//75% of damage_offset (1.7 / 1.3)
		M.adjustOxyLoss(affecting_tribal ? -6.75 : -5, FALSE)	//6.75, same as super stim base damage_offset (5, same as 75% of super stim base damage_offset)
		M.AdjustStun(-damage_offset * 0.66, FALSE)	//66% of damage_offset (1.5 / 1.1)
		M.AdjustKnockdown(-damage_offset * 0.66, FALSE)	//66% of damage_offset (1.5 / 1.1)
		M.adjustStaminaLoss(-damage_offset * 0.66, FALSE)	//66% of damage_offset (1.5 / 1.1)
		. = TRUE

	//Debuffs applied to people without TRAIT_HERBAL_AFFINITY
	if(!affecting_tribal)
		if(M.jitteriness + 6 <= 300)
			M.jitteriness += 6
		if(M.dizziness + 0.3 <= 15)
			M.dizziness += 0.3
		if(M.confused + 0.2 <= 10)
			M.confused += 0.2
		M.hallucination = 15
	..()

/datum/reagent/medicine/healingpowder/overdose_process(mob/living/carbon/M)
	M.adjustToxLoss(6.75 * 0.3 * REAGENTS_EFFECT_MULTIPLIER, FALSE)	//30% of oxyloss offset (2)
	if(M.jitteriness + 6 <= 300)
		M.jitteriness += 6
	if(M.dizziness + 0.3 <= 15)
		M.dizziness += 0.3
	if(M.confused + 0.2 <= 10)
		M.confused += 0.2
	M.hallucination = 15
	M.druggy = 15
	. = TRUE
	..()

// ---------------------------
// HEALING POULTICE REAGENT (115% as effectve as regular stimpak fluid for tribals / 87.5% for non-tribals)

/datum/reagent/medicine/healingpoultice
	name = "Healing poultice"
	description = "A healing poultice derived from an assortment of medicinal plants, commonly used by tribals and Legionaries. Applied on skin, it has as additional antitoxin and radiation-treating effect, purging Bitter drink from the body."
	reagent_state = SOLID
	color = "#9f9350"
	taste_description = "herbal bitterness"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 31
	value = REAGENT_VALUE_RARE
	ghoulfriendly = TRUE
	var/list/reagent_blacklist = list(/datum/reagent/medicine/healingpowder, /datum/reagent/medicine/stimpak/super, /datum/reagent/medicine/stimpak/superimitation ,/datum/reagent/medicine/stimpak, /datum/reagent/medicine/stimpak/imitation)
	var/damage_offset = 0
	var/affecting_tribal = FALSE

/datum/reagent/medicine/healingpoultice/reaction_mob(mob/living/M, method, reac_volume, show_message = 1)
	if(iscarbon(M) && M.stat != DEAD)
		if(method in list(INGEST, VAPOR, INJECT))
			M.adjustOxyLoss(4 * reac_volume * REAGENTS_EFFECT_MULTIPLIER)
			if(show_message)
				to_chat(M, "<span class='warning'>You don't feel so good...</span>")
	..()

/datum/reagent/medicine/healingpoultice/on_mob_add(mob/living/carbon/M)
	if(HAS_TRAIT(M, TRAIT_HERBAL_AFFINITY))
		damage_offset =  3.5 * REAGENTS_EFFECT_MULTIPLIER
		affecting_tribal = TRUE
	else
		damage_offset = 2.6 * REAGENTS_EFFECT_MULTIPLIER //75% of damage_offset for mobs with TRAIT_HERBAL_AFFINITY
	..()

/datum/reagent/medicine/healingpoultice/on_mob_life(mob/living/carbon/M)
	var/is_blocked = FALSE
	if(M.reagents)
		for(var/iter_blacklisted_reagent in reagent_blacklist)
			if(M.reagents.has_reagent(iter_blacklisted_reagent))
				is_blocked = TRUE
				break
         if(M.reagents.has_reagent(/datum/reagent/medicine/bitterdrink))	//Turns Bitter drink into water at a rate of 1u Poultice per 3u Bitter drink
			M.reagents.remove_reagent(/datum/reagent/medicine/bitterdrink, 3)
			M.reagents.remove_reagent(src, 1)
			M.reagents.add_reagent(/datum/reagent/water, 3)
	if(!is_blocked)
		//Extra healing for each bodypart affected by wounds
		if(affecting_tribal)
			if(M.all_wounds && M.all_wounds.len >= 1)
				var/added_damage_offset = 2
				for(var/obj/item/bodypart/iter_bodypart in M.bodyparts)
					if(iter_bodypart.wounds && iter_bodypart.wounds.len >= 1)
						M.adjustBruteLoss(-added_damage_offset, FALSE)
						M.adjustFireLoss(-added_damage_offset * 0.75, FALSE)	//75% of added_damage_offset
						added_damage_offset *= 0.5	//Reduce the added_damage_offset by half for each wounded bodypart to keep the offset from getting too ridiculous

		//Actual healing part starts here
		M.adjustBruteLoss(-damage_offset, FALSE)	//100% of damage_offset (3.5 / 2.6)
		M.adjustFireLoss(-damage_offset * 0.75, FALSE)	//75% of damage_offset (2.6 / 1.95)
		M.adjustToxLoss(affecting_tribal ? -6.75 : -5, FALSE)	//6.75, same as super stim base damage_offset (5, same as 75% of super stim base damage_offset)
		if(M.radiation > 0)
			M.radiation -= affecting_tribal ? -6.75 : -5	//6.75, same as super stim base damage_offset (5, same as 75% of super stim base damage_offset)
		M.AdjustStun(-damage_offset * 0.66, FALSE)	//66% of damage_offset (2.3 / 1.7)
		M.AdjustKnockdown(-damage_offset * 0.66, FALSE)	//66% of damage_offset (2.3 / 1.7)
		M.adjustStaminaLoss(-damage_offset * 0.66, FALSE)	//66% of damage_offset (2.3 / 1.7)
		. = TRUE

	//Debuffs applied to people without TRAIT_HERBAL_AFFINITY
	if(!affecting_tribal)
		if(M.jitteriness + 10 <= 300)
			M.jitteriness += 10
		if(M.dizziness + 0.5 <= 15)
			M.dizziness += 0.5
		if(M.confused + 0.33 <= 10)
			M.confused += 0.33
		M.hallucination = 15
	..()

/datum/reagent/medicine/healingpoultice/overdose_process(mob/living/carbon/M)
	M.adjustOxyLoss(6.75 * 0.45 * REAGENTS_EFFECT_MULTIPLIER, FALSE)	//45% of toxloss offset (3)
	if(M.jitteriness + 10 <= 300)
		M.jitteriness += 10
	if(M.dizziness + 0.5 <= 15)
		M.dizziness += 0.5
	if(M.confused + 0.33 <= 10)
		M.confused += 0.33
	M.hallucination = 15
	M.druggy = 15
	. = TRUE

// ---------------------------
// RAD-X REAGENT

/datum/reagent/medicine/radx
	name = "Rad-X"

	description = "Reduces massive amounts of radiation and some toxin damage."
	reagent_state = LIQUID
	color = "#ff6100"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	ghoulfriendly = TRUE

/datum/reagent/medicine/radx/on_mob_life(mob/living/carbon/M)
	if(M.radiation > 0)
		M.radiation -= min(M.radiation, 8)
	M.adjustToxLoss(-0.5*REAGENTS_EFFECT_MULTIPLIER)
	. = TRUE
	..()

// ---------------------------
// RADAWAY REAGENT

/datum/reagent/medicine/radaway
	name = "Radaway"

	description = "A potent anti-toxin drug."
	reagent_state = LIQUID
	color = "#ff7200"
	metabolization_rate = 2 * REAGENTS_METABOLISM
	ghoulfriendly = TRUE

/datum/reagent/medicine/radaway/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-3*REAGENTS_EFFECT_MULTIPLIER)
	M.radiation -= min(M.radiation, 16)
	if(ishuman(M) && prob(7))
		var/mob/living/carbon/human/H = M
		H.confused = max(M.confused, 3)
	. = TRUE
	..()

// ---------------------------
// MED-X REAGENT

/datum/reagent/medicine/medx
	name = "Med-X"
	description = "A potent painkiller, allowing users to withstand high amounts of pain and continue functioning. Addictive. Prolonged presence in the body can cause seizures and organ damage."
	reagent_state = LIQUID
	color = "#6D6374"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = 16
	addiction_threshold = 6
	var/affecting_straight_edge_mob = FALSE

/datum/reagent/medicine/medx/on_mob_add(mob/living/carbon/human/M)
	if(M.mind)
		var/datum/job/job = SSjob.GetJob(M.mind.assigned_role)
		if(istype(job))
			if(job.faction == FACTION_LEGION)
				SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "betrayed caesar", /datum/mood_event/betrayed_caesar, name)
	if(HAS_TRAIT(M, TRAIT_STRAIGHT_EDGE))
		affecting_straight_edge_mob = TRUE
		to_chat(M, "<span class='userdanger'>You feel sick from the chems in your body!</span>")
	else
		to_chat(M, "<span class='notice'>You feel tougher, able to shrug off pain more easily.</span>")
	M.maxHealth += 50
	M.health += 50
	..()

/datum/reagent/medicine/medx/on_mob_delete(mob/living/carbon/human/M)
	if(isliving(M))
		to_chat(M, "<span class='notice'>You feel as vulnerable to pain as a normal person.</span>")
		M.maxHealth -= 50
		M.health -= 50
	switch(current_cycle)
		if(1 to 40)
			M.confused += 10
			M.blur_eyes(20)
			to_chat(M, "<span class='notice'>Your head is pounding. Med-X is hard on the body. </span>")
		if(41 to 80)
			M.confused +=20
			M.blur_eyes(30)
			M.losebreath += 8
			M.set_disgust(12)
			M.adjustStaminaLoss(30*REAGENTS_EFFECT_MULTIPLIER)
			to_chat(M, "<span class='danger'>Your stomach churns, your eyes cloud and you're pretty sure you just popped a lung. You shouldn't take so much med-X at once. </span>")
		if(81 to 120)
			M.confused +=40
			M.blur_eyes(30)
			M.losebreath += 10
			M.adjustOrganLoss(ORGAN_SLOT_EYES, 3)
			M.set_disgust(25)
			M.adjustStaminaLoss(40*REAGENTS_EFFECT_MULTIPLIER)
			M.vomit(30, 1, 1, 5, 0, 0, 0, 60)
			M.Jitter(1000)
			M.playsound_local(M, 'sound/effects/singlebeat.ogg', 100, 0)
			M.visible_message("<span class='userdanger'>[M] clutches their stomach and vomits violently onto the ground, bloody froth covering their lips!</span>")
			to_chat(M, "<span class='userdanger'>You throw up everything you've eaten in the past week and some blood to boot. You're pretty sure your heart just stopped for a second, too. </span>")
		if(121 to INFINITY)
			M.adjustOrganLoss(ORGAN_SLOT_EYES, 3)
			M.Unconscious(400)
			M.Jitter(1000)
			M.set_heartattack(TRUE)
			M.visible_message("<span class='userdanger'>[M] clutches at their chest as if their heart stopped!</span>")
			to_chat(M, "<span class='danger'>Your vision goes black and your heart stops beating as the amount of drugs in your system shut down your organs one by one. Say hello to Elvis in the afterlife. </span>")
	..()

/datum/reagent/medicine/medx/on_mob_life(mob/living/carbon/M)
	M.AdjustStun(-30*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.AdjustKnockdown(-30*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.AdjustUnconscious(-30*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.adjustStaminaLoss(-5*REAGENTS_EFFECT_MULTIPLIER, 0)

	//Debuffs applied to people with TRAIT_STRAIGHT_EDGE
	if(affecting_straight_edge_mob)
		if(M.jitteriness + 15 <= 300)
			M.jitteriness += 15
		if(M.disgust + 2.5 <= DISGUST_LEVEL_DISGUSTED)
			M.disgust += 2.5
		if(M.dizziness + 0.75 <= 15)
			M.dizziness += 0.75
		if(M.confused + 0.5 <= 10)
			M.confused += 0.5
		M.hallucination = 15
		M.druggy = 15
	..()

/datum/reagent/medicine/medx/overdose_process(mob/living/carbon/human/M)
	M.set_blurriness(30)
	M.Unconscious(400)
	M.Jitter(1000)
	M.drop_all_held_items()
	M.Dizzy(2)
	M.visible_message("<span class='userdanger'>[M] suddenly passes out!</span>")
	if(prob(10))
		to_chat(M, "<span class='userdanger'>Too much med-x! </span>")
	..()

/datum/reagent/medicine/medx/addiction_act_stage1(mob/living/carbon/M)
	if(prob(33))
		M.drop_all_held_items()
		M.Jitter(2)
	..()

/datum/reagent/medicine/medx/addiction_act_stage2(mob/living/carbon/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(1*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
		M.Dizzy(3)
		M.Jitter(3)
	..()

/datum/reagent/medicine/medx/addiction_act_stage3(mob/living/carbon/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(2*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
		M.Dizzy(4)
		M.Jitter(4)
	..()

/datum/reagent/medicine/medx/addiction_act_stage4(mob/living/carbon/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(3*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
		M.Dizzy(5)
		M.Jitter(5)
	..()

/datum/reagent/medicine/naturalpainkiller
	name = "Natural painkiller"
	description = "A yellow powder made from mixing toxic cactus fruit and cave fungus. Rubbed into the skin, it provides a powerful numbing effect."
	reagent_state = SOLID
	color = "#6D6374"
	metabolization_rate = 0.7 * REAGENTS_METABOLISM
	overdose_threshold = 14
	var/list/reagent_blacklist = list(/datum/reagent/medicine/stimpak/super, /datum/reagent/medicine/stimpak/superimitation ,/datum/reagent/medicine/stimpak, /datum/reagent/medicine/stimpak/imitation)

/datum/reagent/medicine/naturalpainkiller/on_mob_add(mob/M)
	if(isliving(M))
		var/mob/living/carbon/L = M
		L.hal_screwyhud = SCREWYHUD_HEALTHY
		ADD_TRAIT(L, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_GENERIC)
	..()

/datum/reagent/medicine/naturalpainkiller/on_mob_delete(mob/M)
	if(isliving(M))
		var/mob/living/carbon/L = M
		L.hal_screwyhud = SCREWYHUD_NONE
		REMOVE_TRAIT(M, TRAIT_IGNOREDAMAGESLOWDOWN, TRAIT_GENERIC)
	..()

/datum/reagent/medicine/naturalpainkiller/on_mob_life(mob/living/carbon/M)
	var/is_blocked = FALSE
	if(M.reagents)
		for(var/iter_blacklisted_reagent in reagent_blacklist)
			if(M.reagents.has_reagent(iter_blacklisted_reagent))
				is_blocked = TRUE
				break
	if(!is_blocked)
		M.AdjustStun(-20*REAGENTS_EFFECT_MULTIPLIER, 0)
		M.AdjustKnockdown(-20*REAGENTS_EFFECT_MULTIPLIER, 0)
		M.AdjustUnconscious(-20*REAGENTS_EFFECT_MULTIPLIER, 0)
		M.adjustStaminaLoss(-3*REAGENTS_EFFECT_MULTIPLIER, 0)
	. = TRUE
	..()

/datum/reagent/medicine/naturalpainkiller/overdose_process(mob/living/carbon/M)
	if(prob(33))
		M.drop_all_held_items()
		M.Dizzy(2)
		M.Jitter(2)
	..()

/datum/reagent/medicine/naturalpainkiller/addiction_act_stage1(mob/living/carbon/M)
	if(prob(33))
		M.drop_all_held_items()
		M.Jitter(2)
	..()

/datum/reagent/medicine/naturalpainkiller/addiction_act_stage2(mob/living/carbon/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(1*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
		M.Dizzy(3)
		M.Jitter(3)
	..()

/datum/reagent/medicine/naturalpainkiller/addiction_act_stage3(mob/living/carbon/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(2*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
		M.Dizzy(4)
		M.Jitter(4)
	..()

/datum/reagent/medicine/naturalpainkiller/addiction_act_stage4(mob/living/carbon/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(3*REAGENTS_EFFECT_MULTIPLIER)
		. = TRUE
		M.Dizzy(5)
		M.Jitter(5)
	..()

// ---------------------------
// MENTAT REAGENT

/datum/reagent/medicine/mentat
	name = "Mentat Powder"

	description = "A powerful drug that heals and increases the perception and intelligence of the user."
	color = "#C8A5DC"
	reagent_state = SOLID
	overdose_threshold = 25
	addiction_threshold = 15
	ghoulfriendly = TRUE

/datum/reagent/medicine/mentat/on_mob_life(mob/living/carbon/M)
	M.adjustOxyLoss(-3*REAGENTS_EFFECT_MULTIPLIER)
	var/obj/item/organ/eyes/eyes = M.getorganslot(ORGAN_SLOT_EYES)
	if (!eyes)
		return
	if(M.getOrganLoss(ORGAN_SLOT_BRAIN) == 0)
		M.cure_all_traumas(TRAUMA_RESILIENCE_SURGERY)
/*	if(HAS_TRAIT(M, TRAIT_BLIND, TRAIT_GENERIC))
		if(prob(20))
			to_chat(M, "<span class='warning'>Your vision slowly returns...</span>")
			M.cure_blind(EYE_DAMAGE)
			M.cure_nearsighted(EYE_DAMAGE)
			M.blur_eyes(35)
	else if(HAS_TRAIT(M, TRAIT_NEARSIGHT, TRAIT_GENERIC))
		to_chat(M, "<span class='warning'>The blackness in your peripheral vision fades.</span>")
		M.cure_nearsighted(EYE_DAMAGE)
		M.blur_eyes(10)*/
	else if(M.eye_blind || M.eye_blurry)
		M.set_blindness(0)
		M.set_blurriness(0)
		to_chat(M, "<span class='warning'>Your vision slowly returns to normal...</span>")
//	else if(eyes.eye_damage > 0)
//		M.adjust_eye_damage(-1)
//	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -2)
	if (prob(5))
		to_chat(M, "<span class='notice'>You feel way more intelligent!</span>")
	..()
	. = TRUE

/datum/reagent/medicine/mentat/overdose_process(mob/living/carbon/M)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 15)
	if(prob(33))
		M.Dizzy(2)
		M.Jitter(2)
	..()

/datum/reagent/medicine/mentat/addiction_act_stage1(mob/living/carbon/M)
	if(prob(33))
		M.Jitter(2)
	..()

/datum/reagent/medicine/mentat/addiction_act_stage2(mob/living/carbon/M)
	if(prob(33))
		. = TRUE
		M.Dizzy(3)
		M.Jitter(3)
	..()

/datum/reagent/medicine/mentat/addiction_act_stage3(mob/living/carbon/M)
	if(prob(33))
		M.adjustToxLoss(1*REAGENTS_EFFECT_MULTIPLIER)
//		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
//		. = TRUE
		M.Dizzy(4)
		M.Jitter(4)
	..()

/datum/reagent/medicine/mentat/addiction_act_stage4(mob/living/carbon/M)
	if(prob(33))
		M.drop_all_held_items()
		M.adjustToxLoss(2*REAGENTS_EFFECT_MULTIPLIER)
//		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 4)
//		. = TRUE
		M.Dizzy(5)
		M.Jitter(5)
	..()

// ---------------------------
// FIXER REAGENT

/datum/reagent/medicine/fixer
	name = "Fixer Powder"

	description = "Treats addictions while also purging other chemicals from the body. Side effects include nausea."
	reagent_state = SOLID
	color = "#C8A5DC"
	ghoulfriendly = TRUE

/datum/reagent/medicine/fixer/on_mob_life(mob/living/carbon/M)
//	for(var/datum/reagent/R in M.reagents.reagent_list)
//		if(R != src)
//			M.reagents.remove_reagent(R.id,2)
	for(var/datum/reagent/R in M.reagents.addiction_list)
		M.reagents.addiction_list.Remove(R)
		to_chat(M, "<span class='notice'>You feel like you've gotten over your need for [R.name].</span>")
	M.confused = max(M.confused, 4)
	if(ishuman(M) && prob(5))
		var/mob/living/carbon/human/H = M
		H.vomit(10)
	..()
	. = TRUE

// ---------------------------
// GAIA EXTRACT REAGENT

/datum/reagent/medicine/gaia
	name = "Gaia Extract"

	description = "Liquid extracted from a gaia branch. Provides a slow but reliable healing effect"
	reagent_state = LIQUID
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	taste_description = "deliciousness"
	overdose_threshold = 30
	color = "##DBCE18"
	ghoulfriendly = TRUE

/datum/reagent/medicine/gaia/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-0.75*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.adjustOxyLoss(-0.75*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.adjustBruteLoss(-0.75*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.adjustFireLoss(-0.75*REAGENTS_EFFECT_MULTIPLIER, 0)
	..()

/datum/reagent/medicine/gaia/overdose_start(mob/living/carbon/M)
	metabolization_rate = 15 * REAGENTS_METABOLISM
	..()

// ---------------------------
// HYDRA - Anti-wound medicine made by Legion.

/datum/reagent/medicine/hydra
	name = "Hydra"
	description = "Hydra is a drug developed from radscorpion poison glands and cave fungus. Due to the Legion's disapproval of using modern medicine, some Legionaries attempted to develop a different means to help them heal damaged limbs."
	reagent_state = LIQUID
	color = "#6D6374"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = 21
	self_consuming = TRUE
	var/list/reagent_blacklist = list(/datum/reagent/medicine/stimpak/super, /datum/reagent/medicine/stimpak/superimitation ,/datum/reagent/medicine/stimpak, /datum/reagent/medicine/stimpak/imitation)
	var/clot_rate = 0	//The rate at which blood_flow will be reduced for pierce/slash wounds
	var/affecting_tribal = FALSE
	var/nth_cycle = 0	//On which cycle should Hydra trigger its effects

/datum/reagent/medicine/hydra/on_mob_add(mob/living/carbon/M)
	if(HAS_TRAIT(M, TRAIT_HERBAL_AFFINITY))
		affecting_tribal = TRUE
		clot_rate =  1
		nth_cycle = 5
	else
		clot_rate = 0.35
		nth_cycle = 8
	..()

/datum/reagent/medicine/hydra/on_mob_life(mob/living/carbon/M)
	var/is_blocked = FALSE
	if(M.reagents)
		for(var/iter_blacklisted_reagent in reagent_blacklist)
			if(M.reagents.has_reagent(iter_blacklisted_reagent))
				is_blocked = TRUE
				break
	if(!is_blocked && current_cycle > 0 && current_cycle % nth_cycle == 0 && M.all_wounds && M.all_wounds.len >= 1) //Every 5th (8th) cycle, reduce burn/bone wound severity by 1 tier, for puncture/slash wounds decrease blood_flow by clot_rate
		for(var/datum/wound/iter_wound in M.all_wounds)
			var/affected_limb_name = iter_wound.limb.name
			switch(iter_wound.severity)
				if (WOUND_SEVERITY_CRITICAL)
					if (iter_wound.wound_type == WOUND_BLUNT)
						iter_wound.replace_wound(/datum/wound/blunt/severe)
						M.visible_message("<span class='notice'>The exposed bones on [M]'s [affected_limb_name] snap back together!</span>", \
										  "<span class='notice'>You feel the fractured bones in your [affected_limb_name] snap back together.</span>")
					else if (iter_wound.wound_type == WOUND_BURN)
						iter_wound.replace_wound(/datum/wound/burn/severe)
						M.visible_message("<span class='notice'>The charred tissue on [M]'s [affected_limb_name] bubbles before regenerating!</span>", \
										  "<span class='notice'>You feel the catastrophic burns on your [affected_limb_name] rapidly regenerate.</span>")
					else if (iter_wound.wound_type == WOUND_PIERCE)
						iter_wound.blood_flow -= clot_rate
						M.visible_message("<span class='notice'>The bleeding hole in [M]'s [affected_limb_name] rapidly fills with fresh tissue!</span>", \
										  "<span class='notice'>You feel the cavity in your [affected_limb_name] rapidly weaving back together.</span>")
					else
						iter_wound.blood_flow -= clot_rate
						M.visible_message("<span class='notice'>The deep gashes on [M]'s [affected_limb_name] rapidly close up!</span>", \
										  "<span class='notice'>You feel the deep gashes on your [affected_limb_name] rapidly close up.</span>")
				if (WOUND_SEVERITY_SEVERE)
					if (iter_wound.wound_type == WOUND_BLUNT)
						iter_wound.replace_wound(/datum/wound/blunt/moderate)
						M.visible_message("<span class='notice'>The broken bones on [M]'s [affected_limb_name] fuse together!</span>", \
										  "<span class='notice'>You feel the broken bones on your [affected_limb_name] fuse together</span>")
					else if (iter_wound.wound_type == WOUND_BURN)
						iter_wound.replace_wound(/datum/wound/burn/moderate)
						M.visible_message("<span class='notice'>The burns on [M]'s [affected_limb_name] scar over!</span>", \
										  "<span class='notice'>You feel the burns on your [affected_limb_name] scar over.</span>")
					else if (iter_wound.wound_type == WOUND_PIERCE)
						iter_wound.blood_flow -= clot_rate
						M.visible_message("<span class='notice'>The puncture wound on [M]'s [affected_limb_name] quickly shrinks!</span>", \
										  "<span class='notice'>You feel the puncture wound on your [affected_limb_name] quickly shrinking.</span>")
					else
						iter_wound.blood_flow -= clot_rate
						M.visible_message("<span class='notice'>The large cuts on [M]'s [affected_limb_name] quickly mend!</span>", \
										  "<span class='notice'>You feel the large cuts on your [affected_limb_name] quickly mending.</span>")
				if (WOUND_SEVERITY_MODERATE)
					if (iter_wound.wound_type == WOUND_BLUNT)
						iter_wound.remove_wound()
						to_chat(M, "<span class='green'>You feel the bones in your [affected_limb_name] pop back into place.</span>")
					else if (iter_wound.wound_type == WOUND_BURN)
						iter_wound.remove_wound()
						to_chat(M, "<span class='green'>You feel the last burns on your [affected_limb_name] fade.</span>")
					else if (iter_wound.wound_type == WOUND_PIERCE || iter_wound.wound_type == WOUND_SLASH)
						iter_wound.blood_flow -= clot_rate

	//Debuffs applied to people without TRAIT_HERBAL_AFFINITY
	if(!affecting_tribal)
		if(M.jitteriness + 15 <= 300)
			M.jitteriness += 15
		if(M.dizziness + 0.75 <= 15)
			M.dizziness += 0.75
		if(M.confused + 0.5 <= 10)
			M.confused += 0.5
		M.hallucination = 15
	..()

/datum/reagent/medicine/hydra/overdose_process(mob/living/carbon/M)
	if(current_cycle > 0 && current_cycle % 3 == 0 && M.all_wounds && M.all_wounds.len >= 1) //Reverse effect, makes wounds worse twice as fast
		clot_rate = 1
		for(var/datum/wound/iter_wound in M.all_wounds)
			switch(iter_wound.severity)
				if (WOUND_SEVERITY_MODERATE)
					if (iter_wound.wound_type == WOUND_BLUNT)
						iter_wound.replace_wound(/datum/wound/blunt/severe)
					else if (iter_wound.wound_type == WOUND_BURN)
						iter_wound.replace_wound(/datum/wound/burn/severe)
					else if (iter_wound.wound_type == WOUND_PIERCE)
						if(iter_wound.blood_flow >= 2.25)
							iter_wound.replace_wound(/datum/wound/pierce/severe)
						else
							iter_wound.blood_flow += clot_rate
					else
						if(iter_wound.blood_flow >= 2.4375)
							iter_wound.replace_wound(/datum/wound/slash/severe)
						else
							iter_wound.blood_flow += clot_rate
				if (WOUND_SEVERITY_SEVERE)
					if (iter_wound.wound_type == WOUND_BLUNT)
						iter_wound.replace_wound(/datum/wound/blunt/critical)
					else if (iter_wound.wound_type == WOUND_BURN)
						iter_wound.replace_wound(/datum/wound/burn/critical)
					else if (iter_wound.wound_type == WOUND_PIERCE)
						if(iter_wound.blood_flow >= 3)
							iter_wound.replace_wound(/datum/wound/pierce/critical)
						else
							iter_wound.blood_flow += clot_rate
					else
						if(iter_wound.blood_flow >= 3.1875)
							iter_wound.replace_wound(/datum/wound/slash/critical)
						else
							iter_wound.blood_flow += clot_rate

	if(M.jitteriness + 15 <= 300)
		M.jitteriness += 15
	if(M.dizziness + 0.75 <= 15)
		M.dizziness += 0.75
	if(M.confused + 0.5 <= 10)
		M.confused += 0.5
	M.hallucination = 15
	M.druggy = 15

/datum/reagent/medicine/hydra/addiction_act_stage1(mob/living/carbon/M)
	if(prob(33))
		M.drop_all_held_items()
		M.Jitter(2)
	..()

/datum/reagent/medicine/hydra/addiction_act_stage2(mob/living/carbon/M)
	if(prob(33))
		M.drop_all_held_items()
		M.Dizzy(3)
		M.Jitter(3)
	..()

/datum/reagent/medicine/hydra/addiction_act_stage3(mob/living/carbon/M)
	if(prob(33))
		M.drop_all_held_items()
		M.Dizzy(4)
		M.Jitter(4)
	..()

/datum/reagent/medicine/hydra/addiction_act_stage4(mob/living/carbon/M)
	if(prob(33))
		M.drop_all_held_items()
		M.Dizzy(5)
		M.Jitter(5)
	..()
