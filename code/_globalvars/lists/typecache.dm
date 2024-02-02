//please store common type caches here.
//type caches should only be stored here if used in mutiple places or likely to be used in mutiple places.

//Note: typecache can only replace istype if you know for sure the thing is at least a datum.

GLOBAL_LIST_INIT(typecache_mob, typecacheof(
	/mob
))

GLOBAL_LIST_INIT(typecache_living, typecacheof(
	/mob/living
))

GLOBAL_LIST_INIT(typecache_stack, typecacheof(
	/obj/item/stack
))

GLOBAL_LIST_INIT(typecache_machine_or_structure, typecacheof(list(
	/obj/machinery,
	/obj/structure
)))

GLOBAL_LIST_INIT(typecache_freezing_objects, typecacheof(list(
	/obj/structure/closet/crate/freezer,
	/obj/structure/closet/secure_closet/freezer,
	/obj/structure/bodycontainer,
	/obj/item/autosurgeon,
	/obj/machinery/smartfridge/organ
)))			//list of all cold objects, that freeze organs when inside

GLOBAL_LIST_INIT(typecache_medical_storage, typecacheof(list(
	/obj/item/healthanalyzer,
	/obj/item/dnainjector,
	/obj/item/reagent_containers/dropper,
	/obj/item/reagent_containers/glass/beaker,
	/obj/item/reagent_containers/glass/bottle,
	/obj/item/reagent_containers/pill,
	/obj/item/reagent_containers/syringe,
	/obj/item/reagent_containers/medspray,
	/obj/item/lighter,
	/obj/item/storage/fancy/cigarettes,
	/obj/item/storage/pill_bottle,
	/obj/item/stack/medical,
	/obj/item/flashlight/pen,
	/obj/item/extinguisher/mini,
	/obj/item/reagent_containers/hypospray,
	/obj/item/hypospray/mkii,
	/obj/item/sensor_device,
	/obj/item/radio,
	/obj/item/clothing/gloves,
	/obj/item/lazarus_injector,
	/obj/item/clothing/mask/surgical,
	/obj/item/clothing/mask/breath,
	/obj/item/surgical_drapes,
	/obj/item/scalpel,
	/obj/item/circular_saw,
	/obj/item/bonesetter,
	/obj/item/surgicaldrill,
	/obj/item/retractor,
	/obj/item/cautery,
	/obj/item/hemostat,
	/obj/item/geiger_counter,
	/obj/item/clothing/neck/stethoscope,
	/obj/item/stamp,
	/obj/item/clothing/glasses,
	/obj/item/wrench/medical,
	/obj/item/clothing/mask/muzzle,
	/obj/item/storage/bag/chemistry,
	/obj/item/storage/bag/bio,
	/obj/item/reagent_containers/blood,
	/obj/item/tank/internals/emergency_oxygen,
	/obj/item/implantcase,
	/obj/item/implant,
	/obj/item/implanter,
	/obj/item/pinpointer/crew,
	/obj/item/reagent_containers/chem_pack,
	/obj/item/weldingtool/basic,
	/obj/item/stack/sticky_tape,
	/obj/item/handsaw,
)))

GLOBAL_LIST_INIT(typecache_tool_storage, typecacheof(list(
	/obj/item/crowbar,
	/obj/item/screwdriver,
	/obj/item/weldingtool,
	/obj/item/wirecutters,
	/obj/item/wrench,
	/obj/item/multitool,
	/obj/item/flashlight,
	/obj/item/stack/cable_coil,
	/obj/item/t_scanner,
	/obj/item/analyzer,
	/obj/item/geiger_counter,
	/obj/item/extinguisher/mini,
	/obj/item/radio,
	/obj/item/clothing/gloves,
	/obj/item/holosign_creator,
	/obj/item/forcefield_projector,
	/obj/item/assembly/signaler,
	/obj/item/melee/smith/hammer,
)))

GLOBAL_LIST_INIT(typecache_botany_storage, typecacheof(list(
	/obj/item/shovel/spade,
	/obj/item/cultivator,
	/obj/item/hatchet,
	/obj/item/book/manual/advice_farming,
	/obj/item/reagent_containers/glass,
	/obj/item/reagent_containers/food/drinks,
	/obj/item/storage/bag/plants,
	/obj/item/plant_analyzer,
)))

GLOBAL_LIST_INIT(typecache_ammo_storage, typecacheof(list(
	/obj/item/ammo_casing,
	/obj/item/ammo_box,
	/obj/item/stock_parts/cell/ammo,
)))

GLOBAL_LIST_INIT(typecache_shotgun_ammo_storage, typecacheof(list(
	/obj/item/ammo_casing/shotgun,
	/obj/item/ammo_box/shotgun,
	/obj/item/ammo_box/magazine/m12g,
	/obj/item/ammo_box/magazine/d12g,
)))

GLOBAL_LIST_INIT(typecache_grenade_storage, typecacheof(list(
	/obj/item/screwdriver,
	/obj/item/lighter,
	/obj/item/multitool,
	/obj/item/grenade,
	/obj/item/reagent_containers/food/drinks/bottle/molotov,
	/obj/item/bottlecap_mine,
	/obj/item/signal_bomb,
	/obj/item/mine,
	/obj/item/mortar_shell,
	/obj/item/ammo_casing/a40mmHE,
	/obj/item/ammo_casing/a40mmCS,
	/obj/item/ammo_casing/a40mmS,
	/obj/item/ammo_casing/a40mmHEDP,
	/obj/item/ammo_casing/a40mmM,
	/obj/item/ammo_casing/a40mmF,
	/obj/item/ammo_casing/a40mmI,
)))

GLOBAL_LIST_INIT(typecache_noncombat_cant_hold, typecacheof(list(
	/obj/item/gun,
	/obj/item/melee,
	/obj/item/shovel/trench,
	/obj/item/grenade,
	/obj/item/reagent_containers/food/drinks/bottle/molotov,
	/obj/item/bottlecap_mine,
	/obj/item/signal_bomb,
	/obj/item/mine,
	/obj/item/mortar_shell,
	/obj/item/ammo_box,
	/obj/item/ammo_casing/a40mmHE,
	/obj/item/ammo_casing/a40mmCS,
	/obj/item/ammo_casing/a40mmS,
	/obj/item/ammo_casing/a40mmHEDP,
	/obj/item/ammo_casing/a40mmM,
	/obj/item/ammo_casing/a40mmF,
	/obj/item/ammo_casing/a40mmI,
	/obj/item/stock_parts/cell/ammo,
)))
