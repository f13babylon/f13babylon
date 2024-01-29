/obj/item/ammo_box/magazine/mm195x129
	name = "box magazine (1.95x129mm)"
	icon_state = "a762-50"
	ammo_type = /obj/item/ammo_casing/mm195x129
	caliber = "mm195129"
	max_ammo = 50

/obj/item/ammo_box/magazine/mm195x129/hollow
	name = "box magazine (Hollow-Point 1.95x129mm)"
	ammo_type = /obj/item/ammo_casing/mm195x129/hollow

/obj/item/ammo_box/magazine/mm195x129/ap
	name = "box magazine (Armor Penetrating 1.95x129mm)"
	ammo_type = /obj/item/ammo_casing/mm195x129/ap

/obj/item/ammo_box/magazine/mm195x129/incen
	name = "box magazine (Incendiary 1.95x129mm)"
	ammo_type = /obj/item/ammo_casing/mm195x129/incen

/obj/item/ammo_box/magazine/mm195x129/update_icon()
	..()
	icon_state = "a762-[round(ammo_count(),10)]"

/obj/item/ammo_box/magazine/mm712x82/match
	name = "box magazine (Match 7.12x82mm)"
	ammo_type = /obj/item/ammo_casing/mm712x82/match

/obj/item/ammo_box/magazine/w308
	name = "sniper rifle magazine (7.62x51)"
	icon_state = "sniper_mag"
	ammo_type = /obj/item/ammo_casing/a762mm
	caliber = "a762mm"
	max_ammo = 10
	multiple_sprites = 2

/obj/item/ammo_box/magazine/w308/empty
	start_empty = 1


/obj/item/ammo_box/magazine/lmg
	name = "ammo box (5.56)"
	desc = "An ammo box meant to be loaded into a light machine gun."
	icon_state = "r80"
	ammo_type = /obj/item/ammo_casing/a556mm
	caliber = "a556mm"
	max_ammo = 60
	multiple_sprites = 2
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/ammo_box/magazine/lmg/empty
	start_empty = 1

/obj/item/ammo_box/magazine/type88
	name = "ammo box (5mm)"
	desc = "An ammo box meant to be loaded into a chinese light machine gun."
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "mdrum"
	ammo_type = /obj/item/ammo_casing/a5mm
	caliber = "a5mm"
	max_ammo = 50
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/ammo_box/magazine/type88/empty
	start_empty = 1

/obj/item/ammo_box/magazine/cz53
	name = "ammo box (5mm)"
	icon_state = "cz53"
	ammo_type = /obj/item/ammo_casing/a5mm
	caliber = "a5mm"
	max_ammo = 240
	multiple_sprites = 2
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/ammo_box/magazine/cz53/empty
	start_empty = 1

/obj/item/ammo_box/magazine/mg34
	name = "ammo box (7.62)"
	icon_state = "r80"
	ammo_type = /obj/item/ammo_casing/a762mm
	caliber = "a762mm"
	max_ammo = 60
	multiple_sprites = 2
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/ammo_box/magazine/mg34/empty
	start_empty = 1

/obj/item/ammo_box/magazine/mm762
	name = "ammo belt (7.62)"
	desc = "An ammo belt meant to be loaded into an M1919 pattern machine gun."
	icon_state = "762belt"
	ammo_type = /obj/item/ammo_casing/a762mm/sport
	max_ammo = 80
	caliber = "a762mm"
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/ammo_box/magazine/mm762/empty
	start_empty = 1

/obj/item/ammo_box/magazine/mm762/can_load()
	return 0

/obj/item/ammo_box/magazine/mm762/update_icon()
	..()
	icon_state = "762belt-[round(ammo_count(),20)]"
