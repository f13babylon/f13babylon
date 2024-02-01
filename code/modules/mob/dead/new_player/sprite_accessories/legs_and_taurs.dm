/datum/sprite_accessory/legs 	//legs are a special case, they aren't actually sprite_accessories but are updated with them. -- OR SO THEY USED TO BE
	icon = null					//These datums exist for selecting legs on preference, and little else

/******************************************
***************** Leggy *******************
*******************************************/

/datum/sprite_accessory/legs/none
	name = "Plantigrade"

/datum/sprite_accessory/legs/digitigrade_lizard
	name = "Digitigrade"

/datum/sprite_accessory/legs/digitigrade_bird
	name = "Avian"


/******************************************
************** Taur Bodies ****************
*******************************************/

/datum/sprite_accessory/taur
	icon = 'modular_citadel/icons/mob/mam_taur.dmi'
	center = TRUE
	dimension_x = 64
	color_src = MATRIXED
	recommended_species = list("human", "lizard", "insect", "mammal", "xeno", "jelly", "slimeperson", "podweak", "synthanthro", "ghoulanthro")
	relevant_layers = list(BODY_ADJ_UPPER_LAYER, BODY_FRONT_LAYER)
	var/taur_mode = NONE //Must be a single specific tauric suit variation bitflag. Don't do FLAG_1|FLAG_2
	var/alt_taur_mode = NONE //Same as above.
	var/hide_legs = USE_QUADRUPED_CLIP_MASK
	mutant_part_string = "taur"

/datum/sprite_accessory/taur/is_not_visible(mob/living/carbon/human/H, tauric)
	return (!tauric || (H.wear_suit && (H.wear_suit.flags_inv & HIDETAUR)))

/datum/sprite_accessory/taur/New()
	switch(hide_legs)
		if(USE_QUADRUPED_CLIP_MASK)
			alpha_mask_state = "taur_mask_def"
		if(USE_SNEK_CLIP_MASK)
			alpha_mask_state = "taur_mask_naga"

/datum/sprite_accessory/taur/none
	name = "None"
	icon_state = "None"
	dimension_x = 32
	center = FALSE
	recommended_species = null
	relevant_layers = null
	hide_legs = FALSE

/datum/sprite_accessory/taur/drider
	name = "Spider"
	icon_state = "drider"
	color_src = MUTCOLORS
	extra = TRUE

/datum/sprite_accessory/taur/naga
	name = "Snake"
	icon_state = "naga"
	taur_mode = STYLE_SNEK_TAURIC
	hide_legs = USE_SNEK_CLIP_MASK
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/taur/tentacle
	name = "Tentacle"
	icon_state = "tentacle"
	taur_mode = STYLE_SNEK_TAURIC
	color_src = MUTCOLORS
	hide_legs = USE_SNEK_CLIP_MASK
