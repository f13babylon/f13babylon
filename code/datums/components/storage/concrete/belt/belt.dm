/datum/component/storage/concrete/belt/small
	max_items = 4
	max_combined_w_class = WEIGHT_CLASS_SMALL * 4

/datum/component/storage/concrete/belt/durathread
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 7

/datum/component/storage/concrete/belt/tools
	max_items = 14
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 7 + WEIGHT_CLASS_SMALL * 7

/datum/component/storage/concrete/belt/tools/Initialize()
	. = ..()
	can_hold = GLOB.typecache_tool_storage

/datum/component/storage/concrete/belt/tools/durathread/Initialize()
	. = ..()
	can_hold_extra = typecacheof(list(
		/obj/item/extinguisher,
		/obj/item/lightreplacer,
		/obj/item/rcd_ammo,
		/obj/item/construction,
		/obj/item/stack/rods,
		/obj/item/stack/tile/plasteel,
		/obj/item/grenade/chem_grenade/metalfoam,
		/obj/item/grenade/chem_grenade/smart_metal_foam
	))

/datum/component/storage/concrete/belt/medical
	max_items = 14
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 7 + WEIGHT_CLASS_SMALL * 7

/datum/component/storage/concrete/belt/medical/Initialize()
	. = ..()
	can_hold = GLOB.typecache_medical_storage

/datum/component/storage/concrete/belt/medical/medolier
	max_items = 14
	max_w_class = WEIGHT_CLASS_SMALL
	max_combined_w_class = WEIGHT_CLASS_SMALL * 14
	display_numerical_stacking = TRUE
	allow_quick_gather = TRUE
	allow_quick_empty = TRUE
	click_gather = TRUE

/datum/component/storage/concrete/belt/medical/medolier/Initialize()
	. = ..()
	CANHOLD_STATIC(src, typecacheof(list(
		/obj/item/reagent_containers/syringe/dart,
		/obj/item/storage/pill_bottle,
		/obj/item/reagent_containers/medspray,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/hypospray,
		/obj/item/reagent_containers/syringe,
	)))

/datum/component/storage/concrete/belt/security
	max_items = 5
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 5

/datum/component/storage/concrete/belt/security/Initialize()
	. = ..()
	CANHOLD_STATIC(src, typecacheof(list(
		/obj/item/melee/baton,
		/obj/item/melee/classic_baton,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash/handheld,
		/obj/item/clothing/glasses,
		/obj/item/ammo_casing/shotgun,
		/obj/item/ammo_box,
		/obj/item/reagent_containers/food/snacks/donut,
		/obj/item/melee/onehanded/knife/hunting,
		/obj/item/flashlight/seclite,
		/obj/item/radio,
		/obj/item/clothing/gloves,
		/obj/item/restraints/legcuffs/bola
	)))

/datum/component/storage/concrete/belt/mining
	max_items = 6
	max_w_class = WEIGHT_CLASS_BULKY
	max_combined_w_class = 	WEIGHT_CLASS_BULKY * 6

/datum/component/storage/concrete/belt/mining/Initialize()
	. = ..()
	CANHOLD_STATIC(src, typecacheof(list(
		/obj/item/crowbar,
		/obj/item/screwdriver,
		/obj/item/weldingtool,
		/obj/item/wirecutters,
		/obj/item/wrench,
		/obj/item/multitool,
		/obj/item/flashlight,
		/obj/item/stack/cable_coil,
		/obj/item/analyzer,
		/obj/item/extinguisher/mini,
		/obj/item/radio,
		/obj/item/clothing/gloves,
		/obj/item/resonator,
		/obj/item/mining_scanner,
		/obj/item/pickaxe,
		/obj/item/stack/sheet/animalhide,
		/obj/item/stack/sheet/sinew,
		/obj/item/stack/sheet/bone,
		/obj/item/lighter,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/reagent_containers/food/drinks/bottle,
		/obj/item/stack/medical,
		/obj/item/kitchen/knife,
		/obj/item/reagent_containers/hypospray,
		/obj/item/gps,
		/obj/item/storage/bag/ore,
		/obj/item/survivalcapsule,
		/obj/item/t_scanner/adv_mining_scanner,
		/obj/item/reagent_containers/pill,
		/obj/item/storage/pill_bottle,
		/obj/item/stack/ore,
		/obj/item/reagent_containers/food/drinks,
		/obj/item/organ/regenerative_core,
		/obj/item/wormhole_jaunter,
		/obj/item/storage/bag/plants,
		/obj/item/stack/marker_beacon,
		/obj/item/melee/baton,
		/obj/item/melee/classic_baton,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash/handheld,
		/obj/item/clothing/glasses,
		/obj/item/ammo_casing/shotgun,
		/obj/item/ammo_box,
		/obj/item/reagent_containers/food/snacks/donut,
		/obj/item/flashlight/seclite,
		/obj/item/melee/classic_baton/telescopic,
		/obj/item/radio,
		/obj/item/clothing/gloves,
		/obj/item/restraints/legcuffs/bola,
	)))

/datum/component/storage/concrete/belt/champion
	max_items = 1

/datum/component/storage/concrete/belt/champion/Initialize()
	. = ..()
	CANHOLD_STATIC(src, typecacheof(list(
		/obj/item/clothing/mask
	)))

/datum/component/storage/concrete/belt/snack/Initialize()
	. = ..()
	CANHOLD_STATIC(src, typecacheof(list(
		/obj/item/reagent_containers/food/snacks,
		/obj/item/reagent_containers/food/drinks,
	)))

/datum/component/storage/concrete/belt/grenade
	max_items = 11
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 11

/datum/component/storage/concrete/belt/grenade/Initialize()
	. = ..()
	can_hold = GLOB.typecache_grenade_storage

/datum/component/storage/concrete/belt/janitor
	max_items = 6
	max_w_class = WEIGHT_CLASS_BULKY
	max_combined_w_class = WEIGHT_CLASS_BULKY * 6

/datum/component/storage/concrete/belt/janitor/Initialize()
	. = ..()
	CANHOLD_STATIC(src, typecacheof(list(
		/obj/item/grenade/chem_grenade,
		/obj/item/lightreplacer,
		/obj/item/flashlight,
		/obj/item/reagent_containers/glass/beaker,
		/obj/item/reagent_containers/glass/bottle,
		/obj/item/reagent_containers/spray,
		/obj/item/soap,
		/obj/item/holosign_creator,
		/obj/item/forcefield_projector,
		/obj/item/key/janitor,
		/obj/item/clothing/gloves,
		/obj/item/melee/flyswatter,
		/obj/item/broom,
		/obj/item/paint/paint_remover,
		/obj/item/assembly/mousetrap,
		/obj/item/screwdriver,
		/obj/item/stack/cable_coil
	)))

/datum/component/storage/concrete/belt/sheath
	max_items = 1
	max_w_class = WEIGHT_CLASS_BULKY
	max_combined_w_class = WEIGHT_CLASS_BULKY * 1
	quickdraw = TRUE

/datum/component/storage/concrete/belt/sheath/Initialize()
	. = ..()
	CANHOLD_STATIC(src, typecacheof(list(
		/obj/item/melee/sabre,
		/obj/item/melee/rapier,
		/obj/item/melee/baton/stunsword,
	)))

/datum/component/storage/concrete/belt/sheath/heavy/Initialize()
	. = ..()
	can_hold_extra = typecacheof(list(
		/obj/item/melee/smith/twohand,
		/obj/item/crowbar/smithedunitool,
		/obj/item/melee/smith/sword,
		/obj/item/melee/smith/dagger,
		/obj/item/melee/smith/machete,
		/obj/item/melee/smith/wakizashi,
		/obj/item/melee/smith/mace,
		/obj/item/melee/smith/javelin,
		/obj/item/melee/smith/throwingknife,
		/obj/item/melee/onehanded,
		/obj/item/throwing_star/spear,
		/obj/item/melee/classic_baton,
		/obj/item/shovel/trench,
		/obj/item/twohanded,
		/obj/item/melee/powered/ripper,
		/obj/item/melee/bokken,
	))
	CANTHOLD_STATIC(src, typecacheof(list(
		/obj/item/twohanded/thermic_lance,
		/obj/item/twohanded/inquis_spear,
		/obj/item/twohanded/sledgehammer/atomsjudgement,
		/obj/item/twohanded/steelsaw/autoaxe,
	)))

/datum/component/storage/concrete/belt/sheath/twin
	max_items = 2
	max_w_class = WEIGHT_CLASS_BULKY
	max_combined_w_class = WEIGHT_CLASS_BULKY + WEIGHT_CLASS_NORMAL

/datum/component/storage/concrete/belt/sheath/twin/Initialize()
	. = ..()
	can_hold_extra = typecacheof(list(
		/obj/item/melee/smith/twohand/katana,
		/obj/item/melee/smith/sword,
		/obj/item/melee/smith/dagger,
		/obj/item/melee/smith/machete,
		/obj/item/melee/smith/wakizashi,
		/obj/item/melee/smith/mace,
		/obj/item/melee/smith/throwingknife,
		/obj/item/melee/onehanded,
		/obj/item/melee/classic_baton,
		/obj/item/shovel/trench,
		/obj/item/melee/bokken,
	))

/datum/component/storage/concrete/belt/gardener
	max_items = 14
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 7 + WEIGHT_CLASS_SMALL * 7

/datum/component/storage/concrete/belt/gardener/Initialize()
	. = ..()
	can_hold = GLOB.typecache_botany_storage

/datum/component/storage/concrete/belt/shotgun
	max_items = 11
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 11

/datum/component/storage/concrete/belt/shotgun/Initialize()
	. = ..()
	can_hold = GLOB.typecache_shotgun_ammo_storage

/datum/component/storage/concrete/belt/ammo/big
	max_items = 4
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 4

/datum/component/storage/concrete/belt/ammo/big/Initialize()
	. = ..()
	can_hold = GLOB.typecache_ammo_storage

/datum/component/storage/concrete/belt/quiver
	max_items = 14
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 14
	display_numerical_stacking = TRUE
	allow_quick_gather = TRUE
	allow_quick_empty = TRUE
	click_gather = TRUE
	quickdraw = TRUE

/datum/component/storage/concrete/belt/quiver/Initialize()
	. = ..()
	CANHOLD_STATIC(src, typecacheof(list(
		/obj/item/ammo_casing/caseless/arrow,
	)))
