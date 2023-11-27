/* FEV diseases */
// Main code

/datum/disease/fev1 //You die from mutations.
	form = "Forced Evolutionary Virus"
	name = "FEV-I Toxin Strain"
	max_stages = 4
	cures = list(/datum/reagent/medicine/mutadone)
	spread_text = "Blood"
	cure_text = "Mutadone."
	cure_chance = 40 // Yeah.
	desc = "A megavirus, with a protein sheath reinforced by ionized hydrogen. This virus is capable of mutating the affected into something horrifying..."
	viable_mobtypes = list(/mob/living/carbon/human)
	severity = DISEASE_SEVERITY_MEDIUM
	spread_flags = DISEASE_SPREAD_BLOOD
	bypasses_immunity = FALSE // This can be cured!
	var/FEV1trait = FALSE

/datum/disease/fev1/stage_act()
	..()
	switch(stage)
		if(2)
			if (prob(8))
				to_chat(affected_mob, "<span class='danger'>You feel weird...</span>")
				affected_mob.easy_randmut(NEGATIVE+MINOR_NEGATIVE)
		if(3)
			if(prob(2))
				affected_mob.easy_randmut(NEGATIVE+MINOR_NEGATIVE)
		if(4)
			if (prob(20))
				to_chat(affected_mob, "<span class='danger'>The pain is unbearable! Your skin keeps ripping itself apart!</span>")
				affected_mob.adjust_blindness(5)
				affected_mob.adjustBruteLoss(5,0)
				affected_mob.emote("cry")
				affected_mob.blur_eyes(15)
				affected_mob.Jitter(4)
				affected_mob.vomit(50, 1, 1, 0, 1, 1)
				affected_mob.easy_randmut(NEGATIVE)
			if (prob(15))
				to_chat(affected_mob, "<span class='danger'>Your skin begins to shift, hurting like hell!</span>")
				affected_mob.adjustToxLoss(5)
				affected_mob.adjustBruteLoss(25,0)
				affected_mob.emote("scream")
				affected_mob.blur_eyes(15)
				affected_mob.Jitter(4)
				affected_mob.vomit(50, 1, 1, 0, 1, 1)
				affected_mob.easy_randmut(NEGATIVE+MINOR_NEGATIVE)
			if (prob(6))
				to_chat(affected_mob, "<span class='danger'>Your body shuts down for a moment!</span>")
				affected_mob.adjust_blindness(5)
				affected_mob.adjustToxLoss(15,0)
				affected_mob.emote("scream")
				affected_mob.blur_eyes(15)
				affected_mob.Jitter(4)
				affected_mob.vomit(50, 1, 1, 0, 1, 1)
				affected_mob.easy_randmut(NEGATIVE)
				affected_mob.Unconscious(10)
			if(!FEV1trait) //You need to cure it past this point; unlike FEV-II, FEV-I is unstable and will continue mutating you until you're dead.
				if(affected_mob.radiation < 500) //FEV-I canonically kills you if you're too radioactive.
					to_chat(affected_mob, "<span class='danger'>Your skin twitches and swells...</span>")
					affected_mob.Jitter(3)
					affected_mob.add_quirk(/datum/quirk/fev)
					affected_mob.easy_randmut(NEGATIVE+MINOR_NEGATIVE)
					FEV1trait = TRUE
				else
					affected_mob.adjustToxLoss(50) //Ouch
					affected_mob.adjustBruteLoss(65,0) //ouch
					affected_mob.adjustCloneLoss(50,0) //YEOWCH
					affected_mob.emote("scream")

/datum/disease/fev2 //You die from mutations.
	form = "Forced Evolutionary Virus"
	name = "FEV-II Stable Strain"
	max_stages = 4
	cures = list(/datum/reagent/medicine/mutadone, /datum/reagent/medicine/spaceacillin)
	cure_text = "Mutadone and Spaceallin."
	cure_chance = 5 // Nonlethal.
	spread_text = "Blood"
	desc = "A megavirus, with a protein sheath reinforced by ionized hydrogen, which has been however, affected by radiation. This will mutate the host into something less... Horrifying."
	viable_mobtypes = list(/mob/living/carbon/human)
	severity = DISEASE_SEVERITY_MEDIUM
	spread_flags = DISEASE_SPREAD_BLOOD
	bypasses_immunity = FALSE // This can be cured!
	var/FEV2trait = FALSE

/datum/disease/fev2/stage_act()
	..()
	switch(stage)
		if(2)
			if(prob(15))
				to_chat(affected_mob, "<span class='danger'>You see four of everything...</span>")
				affected_mob.Dizzy(5)
			if(prob(20))
				to_chat(affected_mob, "<span class='danger'>You can't breathe!</span>")
				affected_mob.adjustOxyLoss(15)
				affected_mob.emote("gasp")
			if(prob(2))
				to_chat(affected_mob, "<span class='danger'>You feel your skin burn, parts of it even fall off...")
				affected_mob.adjustFireLoss(6,0)
			if(prob(10))
				affected_mob.vomit(10)
			if(prob(16))
				to_chat(affected_mob, "<span class='danger'>You feel like you should lie down. Everything aches...</span>")
				affected_mob.adjustStaminaLoss(10)
		if(3)
			if(prob(2))
				to_chat(affected_mob, "<span class='danger'>You see four of everything...</span>")
				affected_mob.Dizzy(5)
			if(prob(3))
				to_chat(affected_mob, "<span class='danger'>You feel a sharp pain from your lower chest!</span>")
				affected_mob.adjustOxyLoss(6)
				affected_mob.emote("gasp")
			if(prob(3))
				to_chat(affected_mob, "<span class='danger'>It hurts like hell! Make it stop!")
				affected_mob.adjustBruteLoss(6,0)
			if(prob(3))
				affected_mob.vomit(10)
			if(prob(4))
				to_chat(affected_mob, "<span class='danger'>Your head feels dizzy...</span>")
				affected_mob.adjustStaminaLoss(10)
		if(4)
			if(!FEV2trait)
				to_chat(affected_mob, "<span class='reallybig hypnophrase'>Simple! Efficient! Glorious!</span>")
				to_chat(affected_mob, "<span class='reallybig redtext'>Your body tries to give up and die!</span>")
				affected_mob.adjustToxLoss(50) //Ouch
				affected_mob.adjustBruteLoss(65,0) //ouch
				affected_mob.adjustCloneLoss(50,0) //YEOWCH
				affected_mob.emote("scream")
				affected_mob.blur_eyes(15)
				affected_mob.Jitter(4)
				affected_mob.vomit(50, 1, 1, 0, 1, 1)
				affected_mob.easy_randmut(NEGATIVE+MINOR_NEGATIVE)
				var/datum/component/mood/mood = affected_mob.GetComponent(/datum/component/mood)
				mood.setSanity(SANITY_INSANE) // You're happy, aren't you?
				affected_mob.add_quirk(/datum/quirk/fevII)
				FEV2trait = TRUE //Stops spam
				affected_mob.emote("screams")
				affected_mob.Unconscious(400) //You aren't waking up without help.
			if(prob(0.1))
				to_chat(affected_mob, "<span class='danger'>You feel the lingering effects of the virus in your blood...</span>") //Warning that you're still able to infect others via blood to blood transmission
