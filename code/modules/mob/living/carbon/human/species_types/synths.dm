/datum/species/synth
	name = "Synthetic"
	id = "synth"
	default_color = "FFFFFF"

	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,MUTCOLORS_PARTSONLY,WINGCOLOR,HAS_FLESH,HAS_BONE,NOTRANSSTING,ROBOTIC_LIMBS)
	inherent_traits = list(TRAIT_VIRUSIMMUNE,TRAIT_NODISMEMBER,TRAIT_NOLIMBDISABLE,TRAIT_NOHUNGER)
	inherent_biotypes = MOB_ROBOTIC|MOB_HUMANOID|MOB_SYNTH
	mutant_bodyparts = list("mcolor" = "FFFFFF", "mcolor2" = "FFFFFF","mcolor3" = "FFFFFF","tail_human" = "None", "mam_ears" = "None", "taur" = "None", "deco_wings" = "None", "legs" = "Plantigrade", "mam_body_markings" = list())
	use_skintones = USE_SKINTONES_GRAYSCALE_CUSTOM
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/ipc
	gib_types = list(/obj/effect/gibspawner/ipc, /obj/effect/gibspawner/ipc/bodypartless)
	disliked_food = GROSS | RAW | LONGPORK
	liked_food = JUNKFOOD | FRIED

	tail_type = "tail_human"
	wagging_type = "waggingtail_human"
	species_type = "robotic"

	//Just robo looking parts.
	mutant_heart = /obj/item/organ/heart/ipc
	mutantlungs = /obj/item/organ/lungs/ipc
	mutantliver = /obj/item/organ/liver/ipc
	mutantstomach = /obj/item/organ/stomach/ipc
	mutanteyes = /obj/item/organ/eyes/ipc
	mutantears = /obj/item/organ/ears/ipc
	mutanttongue = /obj/item/organ/tongue/robot/ipc
	mutant_brain = /obj/item/organ/brain/ipc

	//special cybernetic organ for getting power from apcs
	mutant_organs = list(/obj/item/organ/cyberimp/arm/power_cord)

	exotic_bloodtype = "S"
	exotic_blood_color = BLOOD_COLOR_OIL

/datum/species/synth/spec_life(mob/living/carbon/human/H)
	if(H.nutrition < NUTRITION_LEVEL_FED)
		H.nutrition = NUTRITION_LEVEL_FED
	if(H.nutrition > NUTRITION_LEVEL_FED)
		H.nutrition = NUTRITION_LEVEL_FED
	if(H.water < THIRST_LEVEL_FULL)
		H.water = THIRST_LEVEL_FULL
	if(H.water > THIRST_LEVEL_FULL)
		H.water = THIRST_LEVEL_FULL

/datum/species/synth/proc/assume_disguise(datum/species/S, mob/living/carbon/human/H)
	return //placeholder

/datum/species/synth/military
	name = "Military Synth"
	id = "military_synth"
	armor = 25
	punchdamagelow = 10
	punchdamagehigh = 19
	punchstunthreshold = 14
