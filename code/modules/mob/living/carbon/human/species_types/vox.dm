//Nobody tell Ducky Momo.

/datum/species/vox
	name = "Anthromorphic Maniraptoran"
	id = "vox"
	default_color = "4B4B4B"
	say_mod = "screeches"
	species_traits = list(MUTCOLORS,EYECOLOR,HAIR,FACEHAIR,HAS_FLESH,HAS_BONE)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	mutant_bodyparts = list("mcolor" = "FFFFFF","mcolor2" = "FFFFFF","mcolor3" = "FFFFFF", "mam_snouts" = "Maniraptoran", "mam_tail" = "Maniraptoran", "mam_body_markings" = "None", "legs" = "Avian", "taur" = "None")

	attack_verb = "claw"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'

	meat = /obj/item/reagent_containers/food/snacks/meat/slab/chicken

	// resistant to the cold
	coldmod = 0.8
	heatmod = 1.2

	limbs_id = "vox"
	tail_type = "mam_tail"
	wagging_type = "mam_waggingtail"
	species_type = "vox"
	eye_type = "vox"
