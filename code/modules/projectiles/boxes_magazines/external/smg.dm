///////////////////
// SMG MAGAZINES //
///////////////////

/obj/item/ammo_box/magazine/msmg22
	name = "toploader submachinegun magazine (.22 LR)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "msmg22"
	caliber = ".22lr"
	ammo_type = /obj/item/ammo_casing/a22
	max_ammo = 180
	multiple_sprites = 2

/obj/item/ammo_box/magazine/msmg22/empty
	start_empty = 1

/obj/item/ammo_box/magazine/msmg9mm
	name = "submachinegun magazine (9mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "msmg9mm"
	caliber = "9mm"
	ammo_type = /obj/item/ammo_casing/c9mm
	max_ammo = 32

/obj/item/ammo_box/magazine/msmg9mm/update_icon()
	..()
	icon_state = "[initial(icon_state)]-[round(ammo_count(),4)]"

/obj/item/ammo_box/magazine/msmg9mm/empty
	start_empty = 1

/obj/item/ammo_box/magazine/msmg9mm/drum
	name = "submachinegun drum magazine (9mm)"
	icon_state = "mdrum"
	max_ammo = 50
	multiple_sprites = 2

/obj/item/ammo_box/magazine/msmg9mm/drum/update_icon()
	..()

/obj/item/ammo_box/magazine/msmg9mm/drum/empty
	start_empty = 1

/obj/item/ammo_box/magazine/mcalico
	name = "helical submachinegun magazine (9mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "mcalico"
	caliber = "9mm"
	ammo_type = /obj/item/ammo_casing/c9mm
	max_ammo = 70
	multiple_sprites = 2

/obj/item/ammo_box/magazine/mcalico/empty
	start_empty = 1

/obj/item/ammo_box/magazine/msmg10mm
	name = "submachinegun magazine (10mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "msmg10mm"
	caliber = "10mm"
	ammo_type = /obj/item/ammo_casing/c10mm
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/msmg10mm/empty
	start_empty = 1

/obj/item/ammo_box/magazine/mgreasegun
	name = "grease gun magazine (.45 ACP)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "mgreasegun"
	caliber = ".45"
	ammo_type = /obj/item/ammo_casing/c45
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/mgreasegun/empty
	start_empty = 1

/obj/item/ammo_box/magazine/mthompson
	name = "thompson magazine (.45 ACP)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "mthompsonstick"
	ammo_type = /obj/item/ammo_casing/c45
	caliber = ".45"
	max_ammo = 30
	multiple_sprites = 2

/obj/item/ammo_box/magazine/mthompson/drum
	name = "thompson drum magazine (.45 ACP)"
	icon_state = "mdrum"
	max_ammo = 50

/obj/item/ammo_box/magazine/mp90
	name = "submachinegun magazine (5mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "mp90"
	ammo_type = /obj/item/ammo_casing/a5mm
	caliber = "a5mm"
	max_ammo = 50
	multiple_sprites = 2

/obj/item/ammo_box/magazine/mp90/empty
	start_empty = 1

/obj/item/ammo_box/magazine/msmg14mm
	name = "submachinegun magazine (14mm)"
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "msmg14mm"
	caliber = "14"
	ammo_type = /obj/item/ammo_casing/p14mm
	max_ammo = 21
	multiple_sprites = 2

/obj/item/ammo_box/magazine/msmg14mm/empty
	start_empty = 1

/obj/item/ammo_box/magazine/msmg14mm/extended
	name = "submachinegun extended magazine (14mm)"
	icon_state = "msmg14mmext"
	max_ammo = 27

/obj/item/ammo_box/magazine/msmg14mm/extended/empty
	start_empty = 1
