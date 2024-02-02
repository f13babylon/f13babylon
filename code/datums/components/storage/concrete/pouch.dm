/datum/component/storage/concrete/pouch/ammo
	max_items = 4
	max_w_class = WEIGHT_CLASS_SMALL
	max_combined_w_class = WEIGHT_CLASS_SMALL * 4

/datum/component/storage/concrete/pouch/ammo/Initialize()
	. = ..()
	can_hold = GLOB.typecache_ammo_storage

/datum/component/storage/concrete/pouch/ammo/shotgun
	max_items = 5
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 4

/datum/component/storage/concrete/pouch/ammo/shotgun/Initialize()
	. = ..()
	can_hold = GLOB.typecache_shotgun_ammo_storage
	cant_hold = typecacheof(list(
		/obj/item/ammo_box/magazine/m12g,
		/obj/item/ammo_box/magazine/d12g,
	))

/datum/component/storage/concrete/pouch/ammo/big
	max_items = 2
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 2

/datum/component/storage/concrete/pouch/grenade
	max_items = 5
	max_w_class = WEIGHT_CLASS_SMALL
	max_combined_w_class = WEIGHT_CLASS_SMALL * 5

/datum/component/storage/concrete/pouch/grenade/Initialize()
	. = ..()
	can_hold = GLOB.typecache_grenade_storage

/datum/component/storage/concrete/pouch/tool
	max_items = 7
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 7

/datum/component/storage/concrete/pouch/tool/Initialize()
	. = ..()
	can_hold = GLOB.typecache_tool_storage

/datum/component/storage/concrete/pouch/medical
	max_items = 7
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 7
	display_numerical_stacking = TRUE
	allow_quick_gather = TRUE
	allow_quick_empty = TRUE
	click_gather = TRUE

/datum/component/storage/concrete/pouch/medical/Initialize()
	. = ..()
	can_hold = GLOB.typecache_medical_storage
	cant_hold = typecacheof(list(
		/obj/item/surgical_drapes,
		/obj/item/scalpel,
		/obj/item/circular_saw,
		/obj/item/bonesetter,
		/obj/item/surgicaldrill,
		/obj/item/retractor,
		/obj/item/cautery,
		/obj/item/hemostat,
	))

/datum/component/storage/concrete/pouch/medical/advanced
	max_items = 10
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 7 + WEIGHT_CLASS_SMALL * 3
