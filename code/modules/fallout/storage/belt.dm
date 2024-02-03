// --------------------------------------------------------
// FALLOUT BELTS

/obj/item/storage/belt/utility/smith
	name = "smithing toolbelt"

/obj/item/storage/belt/utility/smith/PopulateContents()
	new /obj/item/crowbar(src)
	new /obj/item/wrench(src)
	new /obj/item/screwdriver/basic(src)
	new /obj/item/weldingtool/basic(src)
	new /obj/item/wirecutters/basic(src)
	new /obj/item/melee/smith/hammer/premade(src)

// Gardener belt. Hold farming stuff thats small, also flasks (think hip flasks, not bottles as such)
/obj/item/storage/belt/utility/gardener
	name = "gardeners toolbelt"
	desc = "Leather belt with straps for various smaller farming equipment, bags and hip flasks."
	icon = 'icons/fallout/clothing/belts.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'
	icon_state = "gardener"
	component_type = /datum/component/storage/concrete/belt/gardener

// Primitive medical belt, meant to be part of a ghetto surgery improvement at some point
/obj/item/storage/belt/medical/primitive
	name = "primitive medical toolbelt"
	desc = "This might look a bit like a toolbelt for a carpenter, but the items inside are meant to be used in surgery. No really."
	content_overlays = FALSE

/obj/item/storage/belt/medical/primitive/PopulateContents()
	new /obj/item/surgical_drapes(src)
	new /obj/item/scalpel (src)
	new /obj/item/handsaw(src)
	new /obj/item/retractor(src)
	new /obj/item/hemostat(src)
	new /obj/item/weldingtool/basic(src)
	new /obj/item/bonesetter(src)

// ---------------------------------------------
// BANDOLIER
/obj/item/storage/belt/bandolier
	name = "shotgun bandolier"
	desc = "A bandolier for holding shotgun ammo."
	icon_state = "bandolier"
	item_state = "bandolier"
	component_type = /datum/component/storage/concrete/belt/shotgun

/obj/item/storage/belt/military/assault/legion
	name = "legionary marching belt"
	desc = "Sturdy leather belt with a red decorative sash."
	icon = 'icons/fallout/clothing/belts.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'
	icon_state = "belt_legion"
	item_state = "belt_legion"

/obj/item/storage/belt/military/assault/enclave
	name = "old style army belt"
	desc = "Prewar army utility belt design."
	icon = 'icons/fallout/clothing/belts.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'
	icon_state = "belt_enclave"
	item_state = "belt_enclave"

/obj/item/storage/belt/military/assault/ncr
	name = "\improper NCR patrol belt"
	desc = "A standard issue robust duty belt for the NCR."
	icon = 'icons/fallout/clothing/belts.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'
	icon_state = "belt_ncr"
	item_state = "belt_ncr"

/obj/item/storage/belt/military/assault/ncr/engineer/PopulateContents()
	new /obj/item/screwdriver(src)
	new /obj/item/wrench(src)
	new /obj/item/weldingtool(src)
	new /obj/item/crowbar(src)
	new /obj/item/wirecutters(src)
	new /obj/item/multitool(src)
	new /obj/item/stack/cable_coil(src,30,pick("red","yellow","orange"))

/obj/item/storage/belt/military/reconbandolier
	name = "\improper NCR recon ranger bandolier"
	desc = "A belt with many pockets, now at an angle."
	icon = 'icons/fallout/clothing/belts.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'
	icon_state = "bandolier_recon"
	item_state = "bandolier_recon"

/obj/item/storage/belt/military/NCR_Bandolier
	name = "\improper NCR bandolier"
	desc = "A standard issue NCR bandolier."
	icon = 'icons/fallout/clothing/belts.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'
	icon_state = "bandolier_ncr"
	item_state = "bandolier_ncr"

/obj/item/storage/belt/military/ammo/big
	name = "large ammo storage belt"
	desc = "A belt with large pouches for holding cumbersome ammunition."
	icon = 'icons/fallout/clothing/belts.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'
	icon_state = "ammo_big"
	item_state = "ammo_big"
	component_type = /datum/component/storage/concrete/belt/ammo/big

/obj/item/storage/belt/holster
	name = "shoulder holster"
	desc = "A holster to carry a handgun and ammo. WARNING: Badasses only."
	icon = 'icons/fallout/clothing/belts.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'
	icon_state = "holster_shoulder"
	item_state = "holster_shoulder"
	alternate_worn_layer = UNDER_SUIT_LAYER
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_NECK
	component_type = /datum/component/storage/concrete/belt/holster

/obj/item/storage/belt/holster/examine(mob/user)
	. = ..()
	if(contents.len)
		var/obj/item/gun/G = locate() in contents
		if(G)
			. += "<span class='notice'>Alt-click it to quickly draw \the [G].</span>"
		else
			var/obj/item/I = locate() in contents
			. += "<span class='notice'>Alt-click it to quickly draw \the [I].</span>"

/obj/item/storage/belt/holster/full/PopulateContents()
	new /obj/item/gun/ballistic/revolver/detective(src)
	new /obj/item/ammo_box/c38(src)
	new /obj/item/ammo_box/c38(src)

/obj/item/storage/belt/holster/ranger44/PopulateContents()
	new /obj/item/gun/ballistic/revolver/revolver44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)

/obj/item/storage/belt/holster/ranger357/PopulateContents()
	new /obj/item/gun/ballistic/revolver/colt357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)

/obj/item/storage/belt/holster/ranger45/PopulateContents()
	new /obj/item/gun/ballistic/revolver/revolver45(src)
	new /obj/item/ammo_box/c45rev(src)
	new /obj/item/ammo_box/c45rev(src)
	new /obj/item/ammo_box/c45rev(src)

/obj/item/storage/belt/holster/ranger4570/PopulateContents()
	new /obj/item/gun/ballistic/revolver/hunting/sequoia(src)
	new /obj/item/ammo_box/c4570(src)
	new /obj/item/ammo_box/c4570(src)
	new /obj/item/ammo_box/c4570(src)

/obj/item/storage/belt/holster/ranger4570bayonet/PopulateContents()
	new /obj/item/gun/ballistic/revolver/hunting/sequoia/bayonet(src)
	new /obj/item/ammo_box/c4570(src)
	new /obj/item/ammo_box/c4570(src)
	new /obj/item/ammo_box/c4570(src)

/obj/item/storage/belt/holster/sheriff/PopulateContents()
	new /obj/item/gun/ballistic/revolver/revolver44/sheriff(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)
	new /obj/item/ammo_box/m44(src)

/obj/item/storage/belt/holster/regulator/PopulateContents()
	new /obj/item/gun/energy/laser/complianceregulator(src)
	new /obj/item/stock_parts/cell/ammo/ec(src)
	new /obj/item/stock_parts/cell/ammo/ec(src)
	new /obj/item/stock_parts/cell/ammo/ec(src)

/obj/item/storage/belt/holster/paladincape
	name = "short shoulder cape"
	desc = "A short, red cape with a holster attached to carry a handgun and ammo."
	icon_state = "newboscape"
	item_state = "newboscape"

/obj/item/storage/belt/holster/paladinlongcape
	name = "long shoulder cape"
	desc = "A long, red cape with a holster attached to carry a handgun and ammo."
	icon_state = "newboslcape"
	item_state = "newboslcape"

/obj/item/storage/belt/holster/legholster
	name = "leg holster"
	desc = "A holster to carry a handgun and ammo worn on the leg."
	icon_state = "holster_leg"
	item_state = "holster_leg"

/obj/item/storage/belt/holster/legholster/police/PopulateContents()
	new /obj/item/gun/ballistic/revolver/police(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)
	new /obj/item/ammo_box/a357(src)

/obj/item/storage/belt/holster/double
	name = "double holster"
	desc = "A double holster to carry two handguns at the same time. WARNING: Akimbo badasses only."
	icon_state = "holster_double"
	item_state = "holster_double"
	component_type = /datum/component/storage/concrete/belt/holster/double

/obj/item/storage/belt/holster/large
	name = "sidearm holster belt"
	desc = "A belt with a holster for a sidearm and additional pouches to store ammo for it."
	icon_state = "holster_belt"
	item_state = "holster_belt"
	slot_flags = ITEM_SLOT_BELT
	component_type = /datum/component/storage/concrete/belt/holster/large

/obj/item/storage/belt/sabre/heavy
	name = "heavy-duty sheath"
	desc = "A rugged set of leather straps and metal tips to comfortably carry a large variety of blades (and even blunt objects) on your side."
	icon = 'icons/fallout/clothing/belts.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'
	icon_state = "sheath_sword"
	item_state = "sheath_sword"
	component_type = /datum/component/storage/concrete/belt/sheath/heavy

/obj/item/storage/belt/sabre/heavy/PopulateContents()
	return

// Twin Sheath
/obj/item/storage/belt/sabre/twin
	name = "twin sheath"
	desc = "A pair of sheathes for carrying two weapons at once. One of the sheaths is smaller than the other."
	icon = 'icons/fallout/clothing/belts.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/belt.dmi'
	icon_state = "sheath_twin"
	item_state = "sheath_twin"
	component_type = /datum/component/storage/concrete/belt/sheath/twin

/obj/item/storage/belt/sabre/twin/PopulateContents()
	return

/obj/item/storage/belt/military/alt
	icon_state = "explorer2"
	item_state = "explorer2"

/obj/item/storage/belt/military/army/military/followers/PopulateContents()
	new /obj/item/reagent_containers/spray/pepper(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/melee/classic_baton(src)
	new /obj/item/melee/onehanded/knife/hunting(src)
	update_icon()

//Regular Quiver
/obj/item/storage/belt/tribe_quiver
	name = "tribal quiver"
	desc = "A simple leather quiver designed for holding arrows."
	icon_state = "tribal_quiver"
	item_state = "tribal_quiver"
	component_type = /datum/component/storage/concrete/belt/quiver

/obj/item/storage/belt/tribe_quiver/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/caseless/arrow(src)

/obj/item/storage/belt/tribe_quiver/examine(mob/user)
	. = ..()
	if(contents.len)
		. += "<span class='notice'>Alt-click it to quickly draw an arrow.</span>"

//Bone Arrow Quiver
/obj/item/storage/belt/tribe_quiver/bone
	name = "hunters quiver"
	desc = "A simple leather quiver designed for holding arrows, this one seems to hold deadlier arrows for hunting."
	icon_state = "tribal_quiver"
	item_state = "tribal_quiver"

/obj/item/storage/belt/tribe_quiver/bone/PopulateContents()
	for(var/i in 1 to 14)
		new /obj/item/ammo_casing/caseless/arrow/bone(src)
