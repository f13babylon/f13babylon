/obj/item/reagent_containers/pill/patch
	name = "chemical patch"
	desc = "A chemical patch for touch based applications."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bandaid"
	item_state = "bandaid"
	possible_transfer_amounts = list()
	volume = 40
	apply_type = PATCH
	apply_method = "apply"
	self_delay = 30		// three seconds
	dissolvable = FALSE

/obj/item/reagent_containers/pill/patch/attack(mob/living/L, mob/user)
	if(ishuman(L))
		var/obj/item/bodypart/affecting = L.get_bodypart(check_zone(user.zone_selected))
		if(!affecting)
			to_chat(user, "<span class='warning'>The limb is missing!</span>")
			return
		if(!L.can_inject(user, TRUE, user.zone_selected, FALSE, TRUE)) //stopped by clothing, not by species immunity.
			return
		if(affecting.status != BODYPART_ORGANIC)
			to_chat(user, "<span class='notice'>Medicine won't work on a robotic limb!</span>")
			return
	..()

/obj/item/reagent_containers/pill/patch/canconsume(mob/eater, mob/user)
	if(!iscarbon(eater))
		return 0
	return 1 // Masks were stopping people from "eating" patches. Thanks, inheritance.

/obj/item/reagent_containers/pill/patch/styptic
	name = "brute patch"
	desc = "Helps with brute injuries."
	icon = 'icons/obj/chemical.dmi'
	list_reagents = list(/datum/reagent/medicine/styptic_powder = 20)
	icon_state = "bandaid_brute"

/obj/item/reagent_containers/pill/patch/silver_sulf
	name = "burn patch"
	desc = "Helps with burn injuries."
	icon = 'icons/obj/chemical.dmi'
	list_reagents = list(/datum/reagent/medicine/silver_sulfadiazine = 20)
	icon_state = "bandaid_burn"

/obj/item/reagent_containers/pill/patch/get_belt_overlay()
	return mutable_appearance('icons/obj/clothing/belt_overlays.dmi', "pouch")

// ---------------------------------
// JET

/obj/item/reagent_containers/pill/patch/jet
	name = "Jet"
	desc = "A highly addictive meta-amphetamine that produces a fast-acting, intense euphoric high on the user."
	list_reagents = list(/datum/reagent/drug/jet = 10)
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_jet"

// ---------------------------------
// TURBO

/obj/item/reagent_containers/pill/patch/turbo
	name = "Turbo"
	desc = "A chem that vastly increases the user's reflexes and slows their perception of time."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_turbo"
	list_reagents = list(/datum/reagent/drug/turbo = 5)

// ---------------------------------
// HEALING POWDER

/obj/item/reagent_containers/pill/patch/healingpowder
	name = "healing powder"
	desc = "A bag filled with coarse brown powder derived from a mix of ground broc flowers and xander roots, commonly used by tribals and Legionaries. Applied on skin, it has an additional oxygenating effect."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_healingpowder"
	list_reagents = list(/datum/reagent/medicine/healingpowder = 10)
	self_delay = 5

// ---------------------------------
// HEALING POULTICE

/obj/item/reagent_containers/pill/patch/healingpoultice
	name = "healing poultice"
	desc = "A bag filled with a olive-colored poultice derived from an assortment of medicinal plants. Applied on skin, it has as additional antitoxin and radiation-treating effect."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	list_reagents = list(/datum/reagent/medicine/healingpoultice = 10)
	icon_state = "patch_healingpoultice"
	self_delay = 10

// ---------------------------------
// CUSTOM POWDER

/obj/item/reagent_containers/pill/patch/healingpowder/custom
	name = "homebrew powder"
	desc = "A bag filled with a mysterious mix of powders."
	list_reagents = null
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_healingpowder"
	color = COLOR_PALE_GREEN_GRAY

// ---------------------------------
// BITTER DRINK

/obj/item/reagent_containers/pill/patch/bitterdrink
	name = "bitter drink"
	desc = "A bottle filled with a strong medicinal drink, known for its bitterness. It derives its name from curing the wounds but leaving the 'bitter' pain from them."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_bitterdrink"
	list_reagents = list(/datum/reagent/medicine/bitter_drink = 15)
	self_delay = 15

// ---------------------------------
// HYDRA

/obj/item/reagent_containers/pill/patch/hydra
	name = "Hydra"
	desc = "A fruit drink bottle with three sealed glass vials taped around the middle. It is filled with Hydra, a powerful wound-mending agent."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_hydra"
	list_reagents = list(/datum/reagent/medicine/hydra = 10)

// ---------------------------------
// BERSERKER POWDER

/obj/item/reagent_containers/pill/patch/healingpowder/berserker
	name = "berserker powder"
	desc = "A combination of psychadelic mushrooms and tribal drugs used by legion berserkers. Induces a trancelike state, allowing them much greater pain resistance. Extremely dangerous, even for those who are trained to use it. It's a really bad idea to use this if you're not a berserker. Even if you are, taking it for too long causes extreme symptoms when the trance ends."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	list_reagents = list(/datum/reagent/medicine/berserker_powder = 10)
	icon_state = "patch_berserkerpowder"

// ---------------------------------
// Natural Painkiller

/obj/item/reagent_containers/pill/patch/healingpowder/naturalpainkiller
	name = "natural painkiller"
	desc = "A bag filled with foul-smelling yellow powder made from mixing toxic cactus fruit and cave fungus. Rubbed into the skin, it provides a powerful numbing effect."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	list_reagents = list(/datum/reagent/medicine/naturalpainkiller = 10)
	icon_state = "patch_naturalpainkiller"
