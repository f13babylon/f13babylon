/datum/reagent/drug/jet
	name = "Jet Inhalant"
	description = "A chemical used to induce a euphoric high derived from brahmin dung. Fast-acting, powerful, and highly addictive."
	color = "#60A584" // rgb: 96, 165, 132
	overdose_threshold = 20
	addiction_threshold = 12.5
	ghoulfriendly = TRUE
	var/affecting_straight_edge_mob = FALSE

/datum/reagent/drug/jet/on_mob_add(mob/living/carbon/M)
	if(M.mind)
		var/datum/job/job = SSjob.GetJob(M.mind.assigned_role)
		if(istype(job))
			switch(job.faction)
				if(FACTION_NCR, FACTION_ENCLAVE, FACTION_BROTHERHOOD)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "used drugs", /datum/mood_event/used_drugs, name)
				if(FACTION_LEGION)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "betrayed caesar", /datum/mood_event/betrayed_caesar, name)
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "jet euphoria", /datum/mood_event/jet_euphoria, name)
	if(HAS_TRAIT(M, TRAIT_STRAIGHT_EDGE))
		affecting_straight_edge_mob = TRUE
		to_chat(M, "<span class='userdanger'>You feel sick from the chems in your body!</span>")
	else
		to_chat(M, "<span class='notice'>You feel an incredible high! You just absolutely love life in this moment!</span>")
	..()

/datum/reagent/drug/jet/on_mob_delete(mob/living/carbon/M)
	if(isliving(M))
		to_chat(M, "<span class='notice'>You come down from your high. The wild ride is unfortunately over...</span>")
		M.confused += 2
	..()

/datum/reagent/drug/jet/on_mob_life(mob/living/carbon/M)
	M.adjustStaminaLoss(-20, updating_health = FALSE)
	M.set_drugginess(20)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !isspaceturf(M.loc) && prob(10))
		step(M, pick(GLOB.cardinals))
	if(prob(12))
		M.emote(pick("twitch","drool","moan","giggle"))

	//Debuffs applied to people with TRAIT_STRAIGHT_EDGE
	if(affecting_straight_edge_mob)
		if(M.jitteriness + 15 <= 300)
			M.jitteriness += 15
		if(M.disgust + 2.5 <= DISGUST_LEVEL_DISGUSTED + 10)
			M.disgust += 2.5
		if(M.dizziness + 0.75 <= 15)
			M.dizziness += 0.75
		if(M.confused + 0.5 <= 10)
			M.confused += 0.5
		M.hallucination = 15
		M.druggy = 15
	. = TRUE
	..()

/datum/reagent/drug/jet/overdose_start(mob/living/carbon/M)
	to_chat(M, "<span class='userdanger'>You start tripping hard!</span>")
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)

/datum/reagent/drug/jet/overdose_process(mob/living/carbon/M)
	if(M.hallucination < volume && prob(20))
		M.hallucination += 10
		M.adjustToxLoss(10, updating_health = FALSE)
		M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 60)
	..()

/datum/reagent/drug/jet/addiction_act_stage1(mob/living/carbon/M)
	if(prob(20))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/jet/addiction_act_stage2(mob/living/carbon/M)
	M.Dizzy(5)
	M.adjustToxLoss(1, updating_health = FALSE)
	if(prob(30))
		M.emote(pick("twitch","drool","moan"))
	..()
	return TRUE // update health at end of tick

/datum/reagent/drug/jet/addiction_act_stage3(mob/living/carbon/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 4, i++)
			step(M, pick(GLOB.cardinals))
	M.adjustToxLoss(3, updating_health = FALSE)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5)
	M.set_disgust(60)
	M.Dizzy(10)
	if(prob(40))
		M.emote(pick("twitch","drool","moan"))
	..()
	return TRUE // update health at end of tick

/datum/reagent/drug/jet/addiction_act_stage4(mob/living/carbon/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 8, i++)
			step(M, pick(GLOB.cardinals))
	M.adjustToxLoss(5, updating_health = FALSE)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	M.set_disgust(100)
	M.Dizzy(15)
	if(prob(50))
		M.emote(pick("twitch","drool","moan"))
	. = TRUE
	..()

/datum/reagent/drug/turbo
	name = "Turbo Inhalant"
	description = "A chemical compound that, when inhaled, vastly increases the user's reflexes and slows their perception of time. Carries a risk of addiction and extreme nausea and toxin damage if overdosed."
	reagent_state = LIQUID
	color = "#FAFAFA"
	overdose_threshold = 14
	addiction_threshold = 9
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	ghoulfriendly = TRUE
	var/affecting_straight_edge_mob = FALSE

/datum/reagent/drug/turbo/on_mob_add(mob/living/carbon/M)
	if(M.mind)
		var/datum/job/job = SSjob.GetJob(M.mind.assigned_role)
		if(istype(job))
			switch(job.faction)
				if(FACTION_NCR, FACTION_ENCLAVE, FACTION_BROTHERHOOD)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "used drugs", /datum/mood_event/used_drugs, name)
				if(FACTION_LEGION)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "betrayed caesar", /datum/mood_event/betrayed_caesar, name)
	ADD_TRAIT(M, TRAIT_IGNOREDAMAGESLOWDOWN, "[type]")
	if(HAS_TRAIT(M, TRAIT_STRAIGHT_EDGE))
		affecting_straight_edge_mob = TRUE
		to_chat(M, "<span class='userdanger'>You feel sick from the chems in your body!</span>")
	..()

/datum/reagent/drug/turbo/on_mob_delete(mob/living/carbon/M)
	REMOVE_TRAIT(M, TRAIT_IGNOREDAMAGESLOWDOWN, "[type]")
	..()

/datum/reagent/drug/turbo/on_mob_life(mob/living/carbon/M)
	var/high_message = pick("You feel hyper.", "You feel like you need to go faster.", "You feel like you can run the world.")
	if(prob(5))
		to_chat(M, "<span class='notice'>[high_message]</span>")
	M.Jitter(2)
	if(prob(5))
		M.emote(pick("twitch", "shiver"))

	//Debuffs applied to people with TRAIT_STRAIGHT_EDGE
	if(affecting_straight_edge_mob)
		if(M.jitteriness + 15 <= 300)
			M.jitteriness += 15
		if(M.disgust + 2.5 <= DISGUST_LEVEL_DISGUSTED + 10)
			M.disgust += 2.5
		if(M.dizziness + 0.75 <= 15)
			M.dizziness += 0.75
		if(M.confused + 0.5 <= 10)
			M.confused += 0.5
		M.hallucination = 15
		M.druggy = 15
	. = TRUE
	..()

/datum/reagent/drug/turbo/overdose_process(mob/living/carbon/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i in 1 to 4)
			step(M, pick(GLOB.cardinals))
	if(prob(20))
		M.emote("laugh")
	if(prob(33))
		M.visible_message("<span class='danger'>[M]'s hands flip out and flail everywhere!</span>")
		M.drop_all_held_items()
	M.adjustToxLoss(2, updating_health = FALSE)
	. = TRUE
	..()

/datum/reagent/drug/turbo/addiction_act_stage1(mob/living/carbon/M)
	M.Jitter(5)
	if(prob(20))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/turbo/addiction_act_stage2(mob/living/carbon/M)
	M.Jitter(10)
	M.Dizzy(10)
	if(prob(30))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/turbo/addiction_act_stage3(mob/living/carbon/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 4, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(15)
	M.Dizzy(15)
	if(prob(40))
		M.emote(pick("twitch","drool","moan"))
	..()

/datum/reagent/drug/turbo/addiction_act_stage4(mob/living/carbon/M)
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 8, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(20)
	M.Dizzy(20)
	M.adjustToxLoss(6, updating_health = FALSE)
	if(prob(50))
		M.emote(pick("twitch","drool","moan"))
	. = TRUE
	..()

/datum/reagent/drug/psycho
	name = "Psycho Fluid"
	description = "Makes the user hit harder and shrug off slight stuns, but causes slight brain damage and carries a risk of addiction."
	reagent_state = LIQUID
	color = "#FF0000"
	overdose_threshold = 15
	addiction_threshold = 12.5
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage
	ghoulfriendly = TRUE
	var/affecting_straight_edge_mob = FALSE

/datum/reagent/drug/psycho/on_mob_add(mob/living/carbon/M)
	if(M.mind)
		var/datum/job/job = SSjob.GetJob(M.mind.assigned_role)
		if(istype(job))
			switch(job.faction)
				if(FACTION_NCR, FACTION_ENCLAVE, FACTION_BROTHERHOOD)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "used drugs", /datum/mood_event/used_drugs, name)
				if(FACTION_LEGION)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "betrayed caesar", /datum/mood_event/betrayed_caesar, name)
	ADD_TRAIT(M, TRAIT_SLEEPIMMUNE, "[type]")
	rage = new()
	M.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	if(HAS_TRAIT(M, TRAIT_STRAIGHT_EDGE))
		affecting_straight_edge_mob = TRUE
		to_chat(M, "<span class='userdanger'>You feel sick from the chems in your body!</span>")
	..()

/datum/reagent/drug/psycho/on_mob_delete(mob/living/carbon/M)
	REMOVE_TRAIT(M, TRAIT_SLEEPIMMUNE, "[type]")
	if(rage)
		QDEL_NULL(rage)
	..()

/datum/reagent/drug/psycho/on_mob_life(mob/living/carbon/M)
	var/high_message = pick("<br><font color='#FF0000'><b>FUCKING KILL!</b></font>", "<br><font color='#FF0000'><b>RAAAAR!</b></font>", "<br><font color='#FF0000'><b>BRING IT!</b></font>")
	if(prob(20))
		to_chat(M, "<span class='notice'>[high_message]</span>")
	M.AdjustStun(-25, 0)
	M.AdjustKnockdown(-25, 0)
	M.AdjustUnconscious(-25, 0)
	M.adjustStaminaLoss(-5, updating_health = FALSE)
	M.Jitter(2)

	//Debuffs applied to people with TRAIT_STRAIGHT_EDGE
	if(affecting_straight_edge_mob)
		if(M.jitteriness + 15 <= 300)
			M.jitteriness += 15
		if(M.disgust + 2.5 <= DISGUST_LEVEL_DISGUSTED + 10)
			M.disgust += 2.5
		if(M.dizziness + 0.75 <= 15)
			M.dizziness += 0.75
		if(M.confused + 0.5 <= 10)
			M.confused += 0.5
		M.hallucination = 15
		M.druggy = 15
	. = TRUE
	..()

/datum/reagent/drug/psycho/overdose_process(mob/living/carbon/M)
	M.hallucination += 20
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 8, i++)
			step(M, pick(GLOB.cardinals))
	if(prob(20))
		M.emote(pick("twitch","scream","laugh"))
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
	M.set_heartattack(TRUE)
	M.visible_message("<span class='userdanger'>[M] clutches at their chest as if their heart stopped!</span>")
	to_chat(M, "<span class='danger'>Your vision goes black and your heart stops beating as the amount of drugs in your system shut down your organs one by one. Say hello to Elvis in the afterlife. </span>")
	..()

/datum/reagent/drug/psycho/addiction_act_stage1(mob/living/carbon/M)
	M.hallucination += 10
	M.Jitter(5)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1)
	if(prob(20))
		M.emote(pick("twitch","scream","laugh"))
	..()

/datum/reagent/drug/psycho/addiction_act_stage2(mob/living/carbon/M)
	M.hallucination += 20
	M.Jitter(10)
	M.Dizzy(10)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1)
	if(prob(30))
		M.emote(pick("twitch","scream","laugh"))
	..()

/datum/reagent/drug/psycho/addiction_act_stage3(mob/living/carbon/M)
	M.hallucination += 30
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 2, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(15)
	M.Dizzy(15)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)
	if(prob(40))
		M.emote(pick("twitch","scream","laugh"))
	..()

/datum/reagent/drug/psycho/addiction_act_stage4(mob/living/carbon/M)
	M.hallucination += 40
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !ismovableatom(M.loc) && !isspaceturf(M.loc))
		for(var/i = 0, i < 4, i++)
			step(M, pick(GLOB.cardinals))
	M.Jitter(50)
	M.Dizzy(50)
	M.adjustToxLoss(5)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 15)
	if(prob(50))
		M.emote(pick("twitch","scream","laugh"))
	..()

/datum/reagent/drug/buffout
	name = "Buffout Powder"
	description = "A powerful steroid which increases the user's strength and endurance."
	color = "#FF9900"
	reagent_state = SOLID
	overdose_threshold = 20
	addiction_threshold = 11
	metabolization_rate = 1.25 * REAGENTS_METABOLISM
	var/datum/brain_trauma/special/psychotic_brawling/bath_salts/rage
	ghoulfriendly = TRUE
	var/affecting_straight_edge_mob = FALSE

/datum/reagent/drug/buffout/on_mob_add(mob/living/carbon/M)
	if(M.mind)
		var/datum/job/job = SSjob.GetJob(M.mind.assigned_role)
		if(istype(job))
			switch(job.faction)
				if(FACTION_NCR, FACTION_ENCLAVE, FACTION_BROTHERHOOD)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "used drugs", /datum/mood_event/used_drugs, name)
				if(FACTION_LEGION)
					SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "betrayed caesar", /datum/mood_event/betrayed_caesar, name)
	ADD_TRAIT(M, TRAIT_BUFFOUT_BUFF, "buffout")
	ADD_TRAIT(M, TRAIT_PERFECT_ATTACKER, "buffout")
	M.maxHealth += 25
	M.health += 25
	if(HAS_TRAIT(M, TRAIT_STRAIGHT_EDGE))
		affecting_straight_edge_mob = TRUE
		to_chat(M, "<span class='userdanger'>You feel sick from the chems in your body!</span>")
	else
		to_chat(M, "<span class='notice'>You feel stronger, and like you're able to endure more.</span>")
	..()

/datum/reagent/drug/buffout/on_mob_delete(mob/living/carbon/M)
	REMOVE_TRAIT(M, TRAIT_BUFFOUT_BUFF, "buffout")
	REMOVE_TRAIT(M, TRAIT_PERFECT_ATTACKER, "buffout")
	M.maxHealth -= 25
	M.health -= 25
	to_chat(M, "<span class='notice'>You feel weaker.</span>")
	..()

/datum/reagent/drug/buffout/on_mob_life(mob/living/carbon/M)
	M.AdjustStun(-10*REAGENTS_EFFECT_MULTIPLIER, 0)
	M.AdjustKnockdown(-10*REAGENTS_EFFECT_MULTIPLIER, 0)

	//Debuffs applied to people with TRAIT_STRAIGHT_EDGE
	if(affecting_straight_edge_mob)
		if(M.jitteriness + 15 <= 300)
			M.jitteriness += 15
		if(M.disgust + 2.5 <= DISGUST_LEVEL_DISGUSTED + 10)
			M.disgust += 2.5
		if(M.dizziness + 0.75 <= 15)
			M.dizziness += 0.75
		if(M.confused + 0.5 <= 10)
			M.confused += 0.5
		M.hallucination = 15
		M.druggy = 15
	. = TRUE
	..()

/datum/reagent/drug/buffout/overdose_process(mob/living/carbon/M)
	rage = new()
	M.gain_trauma(rage, TRAUMA_RESILIENCE_ABSOLUTE)
	var/datum/disease/D = new /datum/disease/heart_failure
	M.ForceContractDisease(D)
	if(prob(33))
		M.visible_message("<span class='danger'>[M]'s muscles spasm, making them drop what they were holding!</span>")
		M.drop_all_held_items()
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
	..()

/datum/reagent/drug/buffout/addiction_act_stage1(mob/living/carbon/M)
	to_chat(M, "<span class='notice'>Your muscles ache slightly.</span>")
	M.adjustBruteLoss(1.5)
	if(prob(15))
		M.emote(pick("twitch"))
	..()

/datum/reagent/drug/buffout/addiction_act_stage2(mob/living/carbon/M)
	to_chat(M, "<span class='notice'>Your muscles feel incredibly sore.</span>")
	M.adjustBruteLoss(4)
	if(prob(30))
		to_chat(M, "<span class='notice'>Your muscles spasm, making you drop what you were holding.</span>")
		M.drop_all_held_items()
		M.emote(pick("twitch"))
	..()

/datum/reagent/drug/buffout/addiction_act_stage3(mob/living/carbon/M)
	to_chat(M, "<span class='notice'>Your muscles start to hurt badly, and everything feels like it hurts more.</span>")
	M.adjustBruteLoss(7.5)
	M.maxHealth -= 1.5
	M.health -= 1.5
	if(prob(50))
		to_chat(M, "<span class='notice'>Your muscles spasm, making you drop what you were holding. You're not even sure if you can control your arms!</span>")
		M.drop_all_held_items()
		M.emote(pick("twitch"))
	..()

/datum/reagent/drug/buffout/addiction_act_stage4(mob/living/carbon/M)
	to_chat(M, "<span class='danger'>Your muscles are in incredible pain! When will it stop!?</span>")
	M.adjustBruteLoss(12.5)
	M.maxHealth -= 5
	M.health -= 5
	if(prob(90))
		to_chat(M, "<span class='danger'>You can't even keep control of your muscles anymore!</span>")
		M.drop_all_held_items()
		M.emote(pick("twitch"))
	if(CHECK_MOBILITY(M, MOBILITY_MOVE) && !isspaceturf(M.loc) && prob(25))
		step(M, pick(GLOB.cardinals))
	M.adjustOrganLoss(ORGAN_SLOT_HEART, 20)
	..()
