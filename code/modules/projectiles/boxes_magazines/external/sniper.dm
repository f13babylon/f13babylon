/obj/item/ammo_box/magazine/amr
	name = "Anti-materiel rifle magazine (.50)"
	desc = "A large eight-round magazine chambered for .50 MG, designed to fit in the AMR."
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "50mag"
	max_ammo = 8
	ammo_type = /obj/item/ammo_casing/a50MG
	caliber = "a50MG"
	multiple_sprites = 2
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/ammo_box/magazine/amr/empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/amr/incindiary
	name = "Anti-materiel magazine (Incendiary)"
	desc = "A large eight-round magazine chambered for .50 MG, filled with Armor-Piercing Incendiary munitions that ignite the target."
	special_ammo = TRUE
	ammo_type = /obj/item/ammo_casing/a50MG/incendiary

/obj/item/ammo_box/magazine/amr/penetrator
	name = "Anti-materiel magazine (Penetrator)"
	desc = "A large eight-round magazine chambered for .50 MG, filled with exceedingly rare High-Velocity Armor-Piercing Fin Discarding Sabot munitions. It just means that they can go through a vault door, a Legion snake, and a tank at the same time."
	special_ammo = TRUE
	ammo_type = /obj/item/ammo_casing/a50MG/penetrator

/obj/item/ammo_box/magazine/amr/uranium
	name = "Anti-materiel magazine (Uranium)"
	desc = "A large eight-round magazine chambered for .50 MG, filled with enriched uranium payloads that fragment on the target and dump lethal doses of radiation in their bodies."
	special_ammo = TRUE
	ammo_type = /obj/item/ammo_casing/a50MG/uraniumtipped
/*
/obj/item/ammo_box/magazine/sniper_rounds/soporific
	name = "sniper rounds (Zzzzz)"
	desc = "Soporific sniper rounds, designed for happy days and dead quiet nights..."
	icon_state = "soporific"
	max_ammo = 3
	caliber = ".50"

/obj/item/ammo_box/magazine/sniper_rounds/penetrator
	name = "sniper rounds (penetrator)"
	desc = "An extremely powerful round capable of passing straight through cover and anyone unfortunate enough to be behind it."
	max_ammo = 5
*/

