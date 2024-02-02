/datum/component/storage/concrete/box/Initialize()
	. = ..()
	CANTHOLD_STATIC(src, GLOB.typecache_noncombat_storage)

/datum/component/storage/concrete/box/donk/Initialize()
	. = ..()
	CANHOLD_STATIC(src, typecacheof(list(
		/obj/item/reagent_containers/food/snacks/donkpocket,
	)))

/datum/component/storage/concrete/box/monkey/Initialize()
	. = ..()
	CANHOLD_STATIC(src, typecacheof(list(
		/obj/item/reagent_containers/food/snacks/cube/monkey,
	)))

/datum/component/storage/concrete/box/snappop
	max_items = 8

/datum/component/storage/concrete/box/snappop/Initialize()
	. = ..()
	CANHOLD_STATIC(src, typecacheof(list(
		/obj/item/toy/snappop,
	)))

/datum/component/storage/concrete/box/match
	max_items = 10

/datum/component/storage/concrete/box/match/Initialize()
	. = ..()
	CANHOLD_STATIC(src, typecacheof(list(
		/obj/item/match,
	)))

/datum/component/storage/concrete/box/lights
	max_items = 21
	max_combined_w_class = WEIGHT_CLASS_TINY * 21
	click_gather = TRUE

/datum/component/storage/concrete/box/lights/Initialize()
	. = ..()
	CANHOLD_STATIC(src, typecacheof(list(
		/obj/item/light/tube,
		/obj/item/light/bulb,
	)))
