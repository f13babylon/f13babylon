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
	if(L == user)
		L.visible_message("<span class='danger'>[user] attempts to use [src] on themselves.</span>", \
							"<span class='notice'>You attempt to use [src] on yourself.</span>")
	else
		L.visible_message("<span class='danger'>[user] attempts to use [src] on [L].</span>", \
							"<span class='userdanger'>[user] attempts to use [src] on you.</span>")
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
	self_delay = 10

// ---------------------------------
// TURBO

/obj/item/reagent_containers/pill/patch/turbo
	name = "Turbo"
	desc = "A chem that vastly increases the user's reflexes and slows their perception of time."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_turbo"
	list_reagents = list(/datum/reagent/drug/turbo = 5)
	self_delay = 10

// ---------------------------------
// HEALING POWDER

/obj/item/reagent_containers/pill/patch/healingpowder
	name = "healing powder"
	desc = "A bag which contains a coarse brown powder derived from broc flowers and xander roots. Applied on skin, it additionally alleviates poisoning and purges Bitter drink from the system."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_healingpowder"
	list_reagents = list(/datum/reagent/medicine/healingpowder = 10)
	self_delay = 0

// ---------------------------------
// HEALING POULTICE

/obj/item/reagent_containers/pill/patch/healingpoultice
	name = "healing poultice"
	desc = "A bag which contains an olive-colored poultice derived from an assortment of medicinal plants. Applied on skin, it has an additional oxygenating effect."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	list_reagents = list(/datum/reagent/medicine/healingpoultice = 10)
	icon_state = "patch_healingpoultice"
	self_delay = 0

// ---------------------------------
// CUSTOM POWDER

/obj/item/reagent_containers/pill/patch/healingpowder/custom
	name = "homebrew powder"
	desc = "A bag which contains a mysterious mix of powders."
	list_reagents = null
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_healingpowder"
	color = COLOR_PALE_GREEN_GRAY
	self_delay = 0

// ---------------------------------
// BITTER DRINK

/obj/item/reagent_containers/pill/patch/bitterdrink
	name = "bitter drink"
	desc = "A bottle filled with a strong medicinal drink, known for its bitterness. It derives its name from curing the wounds but leaving the 'bitter' pain from them."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_bitterdrink"
	list_reagents = list(/datum/reagent/medicine/bitterdrink = 15)
	self_delay = 0

// ---------------------------------
// HYDRA

/obj/item/reagent_containers/pill/patch/hydra
	name = "Hydra"
	desc = "A fruit drink bottle with three sealed glass vials taped around the middle. It is filled with Hydra, a powerful wound-mending agent, derived from venomous radscorpion glands."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	icon_state = "patch_hydra"
	list_reagents = list(/datum/reagent/medicine/hydra = 10)
	self_delay = 10

// ---------------------------------
// BERSERKER POWDER

/obj/item/reagent_containers/pill/patch/healingpowder/berserker
	name = "berserker powder"
	desc = "A combination of psychadelic mushrooms and tribal drugs used by legion berserkers. Induces a trancelike state, allowing them much greater pain resistance. Extremely dangerous, even for those who are trained to use it. It's a really bad idea to use this if you're not a berserker. Even if you are, taking it for too long causes extreme symptoms when the trance ends."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	list_reagents = list(/datum/reagent/medicine/berserker_powder = 10)
	icon_state = "patch_berserkerpowder"
	self_delay = 0

// ---------------------------------
// Natural Painkiller

/obj/item/reagent_containers/pill/patch/healingpowder/naturalpainkiller
	name = "natural painkiller"
	desc = "A bag filled with foul-smelling yellow powder made from mixing toxic cactus fruit and cave fungus. Rubbed into the skin, it provides a powerful numbing effect."
	icon = 'icons/fallout/objects/medicine/drugs.dmi'
	list_reagents = list(/datum/reagent/medicine/naturalpainkiller = 10)
	icon_state = "patch_naturalpainkiller"
	self_delay = 0
