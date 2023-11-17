// 40mm (Grenade Launcher

/obj/item/projectile/rocket/a40mmHE
	name ="40mm HE grenade"
	desc = "Oh no."
	icon_state= "bolter"
	damage = 30
	armour_penetration = 0.25
	pixels_per_second = TILES_TO_PIXELS(10) //slower than bullets
	shrapnel_magnitude = 4

/obj/item/projectile/rocket/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, -1, -1, 0, 3, 0, flame_range = 3)
	new /obj/effect/temp_visual/explosion(get_turf(target))
	return BULLET_ACT_HIT

//40mm tear gas

/obj/item/projectile/bullet/a40mmCS
	name ="40mm CS grenade"
	icon_state = "bolter"
	damage_type = STAMINA
	damage = 80//If you get hit with this directly? Ouch...
	pixels_per_second = TILES_TO_PIXELS(10) //slower than bullets
	var/datum/effect_system/smoke_spread/bad/smoke

/obj/item/projectile/bullet/a40mmCS/Initialize(mapload)
	. = ..()
	src.smoke = new /datum/effect_system/smoke_spread/teargas
	src.smoke.attach(src)
	smoke.set_up(4, src)

/obj/item/projectile/bullet/a40mmCS/Destroy()
	QDEL_NULL(smoke)
	return ..()

/obj/item/projectile/bullet/a40mmg/on_hit(atom/target, blocked = FALSE)

// 40mm HEDP (Grenade Launcher

/obj/item/projectile/rocket/a40mmHEDP
	name ="40mm HEDP grenade"
	desc = "Oh no."
	icon_state= "bolter"
	damage = 30
	armour_penetration = 0.75
	pixels_per_second = TILES_TO_PIXELS(10) //slower than bullets
	shrapnel_magnitude = 4

/obj/item/projectile/rocket/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, -1, -1, 0, 3, 0, flame_range = 3)
	new /obj/effect/temp_visual/explosion(get_turf(target))
	return BULLET_ACT_HIT

// 40mm Smoke

/obj/item/projectile/bullet/a40mmS
	name ="40mm Smoke grenade"
	icon_state = "bolter"
	damage_type = STAMINA
	damage = 80//If you get hit with this directly? Ouch...
	pixels_per_second = TILES_TO_PIXELS(10) //slower than bullets
	var/datum/effect_system/smoke_spread/bad/smoke

/obj/item/projectile/bullet/a40mmS/Initialize(mapload)
	. = ..()
	src.smoke = new /datum/effect_system/smoke_spread/teargas
	src.smoke.attach(src)
	smoke.set_up(4, src)

/obj/item/projectile/bullet/a40mmS/Destroy()
	QDEL_NULL(smoke)
	return ..()

/obj/item/projectile/bullet/a40mmg/on_hit(atom/target, blocked = FALSE)

// 40mm Baton

/obj/item/projectile/rocket/a40mmM
	name ="40mm METAL grenade"
	desc = "Oh no."
	icon_state= "bolter"
	damage = 80
	pixels_per_second = TILES_TO_PIXELS(10) //slower than bullets

/obj/item/projectile/rocket/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, -1, -1, 0, 0, 0, flame_range = 0)
	new /obj/effect/temp_visual/explosion(get_turf(target))
	return BULLET_ACT_HIT

// 40mm Flashbang

/obj/item/projectile/rocket/a40mmF
	name ="40mm Flash grenade"
	desc = "Oh no."
	icon_state= "bolter"
	damage = 20
	pixels_per_second = TILES_TO_PIXELS(10) //slower than bullets

/obj/item/projectile/rocket/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, -1, -1, 0, 0, 5, flame_range = 0)
	new /obj/effect/temp_visual/explosion(get_turf(target))
	return BULLET_ACT_HIT

// 40mm Incend

/obj/item/projectile/rocket/a40mmI
	name ="40mm INCENDARY grenade"
	desc = "Oh no."
	icon_state= "bolter"
	damage = 20
	pixels_per_second = TILES_TO_PIXELS(10) //slower than bullets

/obj/item/projectile/rocket/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, -1, -1, 0, 0, 0, flame_range = 8)
	new /obj/effect/temp_visual/explosion(get_turf(target))
	return BULLET_ACT_HIT
