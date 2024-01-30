/datum/component/storage/concrete/pockets
	max_items = 2
	max_w_class = WEIGHT_CLASS_SMALL
	max_combined_w_class = 50
	rustle_sound = FALSE

/datum/component/storage/concrete/pockets/handle_item_insertion(obj/item/I, prevent_warning, mob/user)
	. = ..()
	if(. && silent && !prevent_warning)
		if(quickdraw)
			to_chat(user, "<span class='notice'>You discreetly slip [I] into [parent]. Alt-click [parent] to remove it.</span>")
		else
			to_chat(user, "<span class='notice'>You discreetly slip [I] into [parent].</span>")

/datum/component/storage/concrete/pockets/huge
	max_w_class = WEIGHT_CLASS_NORMAL

/datum/component/storage/concrete/pockets/small
	max_items = 1
	attack_hand_interact = FALSE

/datum/component/storage/concrete/pockets/small/collar
	max_items = 1

/datum/component/storage/concrete/pockets/small/collar/Initialize()
	. = ..()
	can_hold = typecacheof(list(
	/obj/item/reagent_containers/food/snacks/cookie,
	/obj/item/reagent_containers/food/snacks/sugarcookie))

/datum/component/storage/concrete/pockets/small/collar/locked/Initialize()
	. = ..()
	can_hold = typecacheof(list(
	/obj/item/reagent_containers/food/snacks/cookie,
	/obj/item/reagent_containers/food/snacks/sugarcookie,
	/obj/item/key/collar))

/datum/component/storage/concrete/pockets/binocular
	max_items = 1

/datum/component/storage/concrete/pockets/binocular/Initialize()
	. = ..()
	can_hold = GLOB.storage_binocular_can_hold


/datum/component/storage/concrete/pockets/treasurer
	max_items = 4

/datum/component/storage/concrete/pockets/treasurer/Initialize()
	. = ..()
	can_hold = GLOB.storage_treasurer_can_hold


/datum/component/storage/concrete/pockets/bartender
	max_items = 2

/datum/component/storage/concrete/pockets/bartender/Initialize()
	. = ..()
	can_hold = GLOB.storage_bartender_can_hold


/datum/component/storage/concrete/pockets/kitchen
	max_items = 2

/datum/component/storage/concrete/pockets/kitchen/Initialize()
	. = ..()
	can_hold = GLOB.storage_kitchen_can_hold


/datum/component/storage/concrete/pockets/crafter
	max_items = 2

/datum/component/storage/concrete/pockets/crafter/Initialize()
	. = ..()
	can_hold = GLOB.storage_crafter_can_hold


/datum/component/storage/concrete/pockets/medical
	max_items = 2

/datum/component/storage/concrete/pockets/medical/Initialize()
	. = ..()
	can_hold = GLOB.storage_medical_can_hold


/datum/component/storage/concrete/pockets/tiny
	max_items = 1
	max_w_class = WEIGHT_CLASS_TINY
	attack_hand_interact = FALSE

/datum/component/storage/concrete/pockets/small/detective
	attack_hand_interact = TRUE // so the detectives would discover pockets in their hats

/datum/component/storage/concrete/pockets/shoes
	attack_hand_interact = FALSE
	quickdraw = TRUE
	silent = TRUE

/datum/component/storage/concrete/pockets/shoes/Initialize()
	. = ..()
	cant_hold = typecacheof(list(/obj/item/screwdriver/power,
								/obj/item/screwdriver/hightech,
								/obj/item/kitchen/knife/butcher,
								/obj/item/reagent_containers/pill/patch/bitterdrink,
								/obj/item/reagent_containers/pill/patch/healingpoultice,
								/obj/item/reagent_containers/pill/patch/healingpowder,
								/obj/item/reagent_containers/pill/patch/hydra,
								/obj/item/reagent_containers/pill/patch/turbo,
								/obj/item/reagent_containers/hypospray/combat,
								/obj/item/reagent_containers/hypospray/magillitis))
	can_hold = GLOB.storage_shoes_can_hold

/datum/component/storage/concrete/pockets/pocketprotector
	max_items = 3
	max_w_class = WEIGHT_CLASS_TINY
	var/atom/original_parent

/datum/component/storage/concrete/pockets/pocketprotector/Initialize()
	original_parent = parent
	. = ..()
	can_hold = typecacheof(list( //Same items as a PDA
		/obj/item/pen,
		/obj/item/toy/crayon,
		/obj/item/lipstick,
		/obj/item/flashlight/pen,
		/obj/item/clothing/mask/cigarette))

/datum/component/storage/concrete/pockets/pocketprotector/real_location()
	// if the component is reparented to a jumpsuit, the items still go in the protector
	return original_parent

/datum/component/storage/concrete/pockets/small/rushelmet
	max_items = 1
	quickdraw = TRUE

/datum/component/storage/concrete/pockets/small/rushelmet/Initialize()
	. = ..()
	can_hold = GLOB.storage_hat_can_hold

/datum/component/storage/concrete/pockets/small/holdout
	max_items = 1
	attack_hand_interact = TRUE
	max_w_class = WEIGHT_CLASS_NORMAL
	quickdraw = TRUE
	can_hold = GLOB.storage_holdout_can_hold

/datum/component/storage/concrete/pockets/holster
	max_items = 4
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL + WEIGHT_CLASS_TINY * 3		//At most, 1 NORMAL-sized pistol and 3 magazines for it (Or 3 small pistols, 4 tiny pistols, etc.)
	can_hold = GLOB.storage_holster_can_hold

/datum/component/storage/concrete/pockets/bulletbelt
	max_items = 4
	max_w_class = WEIGHT_CLASS_SMALL
	can_hold = GLOB.storage_bulletbelt_can_hold

GLOBAL_LIST_INIT(storage_bartender_can_hold, typecacheof(list(
	/obj/item/kitchen,
	/obj/item/reagent_containers/food/drinks/bottle,
	/obj/item/gun/ballistic/revolver/detective,
	/obj/item/gun/ballistic/revolver/m29/snub,
	)))

GLOBAL_LIST_INIT(storage_kitchen_can_hold, typecacheof(list(
	/obj/item/kitchen,
	/obj/item/reagent_containers/food/condiment,
	)))

GLOBAL_LIST_INIT(storage_crafter_can_hold, typecacheof(list(
	/obj/item/crowbar,
	/obj/item/wrench,
	/obj/item/screwdriver,
	/obj/item/multitool,
	/obj/item/wirecutters,
	)))

GLOBAL_LIST_INIT(storage_medical_can_hold, typecacheof(list(
	/obj/item/clothing/mask/surgical,
	/obj/item/clothing/gloves/color/latex,
	/obj/item/clothing/gloves/f13/crudemedical,
	/obj/item/healthanalyzer,
	/obj/item/reagent_containers/dropper,
	/obj/item/reagent_containers/glass/bottle,
	/obj/item/reagent_containers/pill,
	/obj/item/reagent_containers/syringe,
	/obj/item/reagent_containers/medspray,
	/obj/item/storage/pill_bottle,
	/obj/item/stack/medical,
	/obj/item/reagent_containers/hypospray,
	/obj/item/hypospray,
	/obj/item/surgical_drapes,
	/obj/item/scalpel,
	/obj/item/bonesetter,
	/obj/item/retractor,
	/obj/item/cautery,
	/obj/item/hemostat,
	/obj/item/clothing/neck/stethoscope,
	/obj/item/storage/bag/chemistry,
	/obj/item/storage/bag/bio,
	/obj/item/reagent_containers/blood,
	/obj/item/reagent_containers/chem_pack,
	)))

GLOBAL_LIST_INIT(storage_shoes_can_hold, typecacheof(list(
	/obj/item/melee/onehanded/knife,
	/obj/item/melee/smith/dagger,
	/obj/item/melee/smith/throwingknife,
	/obj/item/smithing/daggerblade,
	/obj/item/smithing/throwingknife,
	/obj/item/smithing/knifeblade,
	/obj/item/nullrod/tribal_knife,
	/obj/item/kitchen/fork,
	/obj/item/kitchen/knife,
	/obj/item/scalpel,
	/obj/item/screwdriver,
	/obj/item/weldingtool/mini,
	/obj/item/pen,
	/obj/item/reagent_containers/syringe,
	/obj/item/reagent_containers/hypospray,
	/obj/item/reagent_containers/dropper,
	/obj/item/reagent_containers/pill,
	/obj/item/reagent_containers/medspray,
	/obj/item/gun/ballistic/revolver/detective,
	/obj/item/gun/ballistic/revolver/hobo/knifegun,
	)))

GLOBAL_LIST_INIT(storage_holster_can_hold, typecacheof(list(
	/obj/item/gun/ballistic/automatic/pistol,
	/obj/item/ammo_box/magazine/m22,
	/obj/item/ammo_box/magazine/zipgun,
	/obj/item/ammo_box/magazine/m9mm,
	/obj/item/ammo_box/magazine/m9mmds,
	/obj/item/ammo_box/magazine/m10mm,
	/obj/item/ammo_box/magazine/m45,
	/obj/item/ammo_box/magazine/m45exp,
	/obj/item/ammo_box/magazine/m44,
	/obj/item/ammo_box/magazine/automag,
	/obj/item/ammo_box/magazine/m14mm,
	/obj/item/gun/ballistic/revolver,
	/obj/item/ammo_box/c38,
	/obj/item/ammo_box/a357,
	/obj/item/ammo_box/l10mm,
	/obj/item/ammo_box/m44,
	/obj/item/ammo_box/c45rev,
	/obj/item/ammo_box/a45lcrev,
	/obj/item/ammo_box/c4570,
	/obj/item/ammo_box/needle,
	/obj/item/ammo_box/shotgun,
	/obj/item/gun/energy/laser/pistol,
	/obj/item/gun/energy/laser/wattz,
	/obj/item/gun/energy/laser/complianceregulator,
	/obj/item/gun/energy/laser/plasma/pistol,
	/obj/item/gun/energy/laser/plasma/glock,
	/obj/item/stock_parts/cell/ammo/ec,
)))

GLOBAL_LIST_INIT(storage_hat_can_hold, typecacheof(list(
	/obj/item/storage/fancy/cigarettes,
	/obj/item/toy/cards/deck,
	/obj/item/ammo_casing,
	)))

GLOBAL_LIST_INIT(storage_binocular_can_hold, typecacheof(list(
	/obj/item/binoculars,
	)))

GLOBAL_LIST_INIT(storage_treasurer_can_hold, typecacheof(list(
	/obj/item/stack/f13Cash,
	/obj/item/key,
	/obj/item/melee/onehanded/knife,
	/obj/item/paper,
	/obj/item/folder,
	/obj/item/storage/bag/money/small,
	/obj/item/binoculars,
	/obj/item/lipstick,
	/obj/item/pen,
	/obj/item/melee/smith/dagger,
	)))

GLOBAL_LIST_INIT(storage_holdout_can_hold, typecacheof(list(
	/obj/item/gun/ballistic/automatic/pistol,
	/obj/item/gun/ballistic/revolver,
	/obj/item/gun/energy/laser/pistol,
	/obj/item/gun/energy/laser/wattz,
	/obj/item/gun/energy/laser/complianceregulator,
	/obj/item/gun/energy/laser/plasma/pistol,
	/obj/item/gun/energy/laser/plasma/glock,
)))

GLOBAL_LIST_INIT(storage_bulletbelt_can_hold, typecacheof(list(
	/obj/item/ammo_box/magazine,
	/obj/item/ammo_box/tube,
	/obj/item/ammo_box/c38,
	/obj/item/ammo_box/l10mm,
	/obj/item/ammo_box/a357,
	/obj/item/ammo_box/m44,
	/obj/item/ammo_box/c45rev,
	/obj/item/ammo_box/c4570,
	/obj/item/ammo_box/shotgun,
	/obj/item/ammo_box/a762mm,
	/obj/item/ammo_box/a308,
	/obj/item/ammo_box/a556mm/stripper,
	/obj/item/ammo_box/needle,
	/obj/item/ammo_box/a50MG,
	/obj/item/stock_parts/cell/ammo,
)))
