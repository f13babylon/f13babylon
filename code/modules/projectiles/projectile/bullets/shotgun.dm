//SLUGS
/obj/item/projectile/bullet/shotgun_slug
	name = "shotgun slug"
	damage = 35
	sharpness = SHARP_POINTY
	wound_bonus = 45
	bare_wound_bonus = 0
	armour_penetration = 0.15
	spread = 2
	wound_falloff_tile = -7.5
	supereffective_damage = 35
	supereffective_faction = list("supermutant", "deathclaw", "raider", "wastebot", "radscorpion")

/obj/item/projectile/bullet/shotgun_beanbag
	name = "beanbag slug"
	damage = 10
	stamina = 60
	wound_bonus = 20
	sharpness = SHARP_NONE
	embedding = null

//INCENDIARY AMMO
/obj/item/projectile/bullet/incendiary/shotgun
	name = "incendiary slug"
	damage = 20
	supereffective_damage = 80
	supereffective_faction = list("ant", "cazador", "radscorpion")

/obj/item/projectile/bullet/incendiary/shotgun/dragonsbreath
	name = "dragonsbreath pellet"
	damage = 5

/obj/item/projectile/incendiary/flamethrower		//Flamethrower projectile
	name = "flame ball"
	icon = 'icons/effects/fire.dmi'
	icon_state = "fire"
	light_range = LIGHT_RANGE_FIRE
	light_color = LIGHT_COLOR_FIRE
	damage_type = BURN
	damage = 20
	wound_bonus = 40
	supereffective_damage = 25
	supereffective_faction = list("ant", "cazador", "gecko", "radscorpion", "wolf", "dog", "plants", "rat", "spiders")
	var/dmg_dropoff_per_tile = 15 / 7	//In 7 tiles it will lose all of its initial damage (and get deleted)

/obj/item/projectile/incendiary/flamethrower/on_hit(atom/target)
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(3)
		M.IgniteMob()
	if(ismob(target))
		..()

/obj/item/projectile/incendiary/flamethrower/Range()
	..()
	if(damage > 0)
		damage -= dmg_dropoff_per_tile
	else
		qdel(src)

//PELLET SHELLS
/obj/item/projectile/bullet/pellet
	var/tile_dropoff = 0.45
	var/tile_dropoff_s = 2.5

/obj/item/projectile/bullet/pellet/shotgun_buckshot
	name = "buckshot pellet"
	damage = 12
	wound_bonus = 40
	bare_wound_bonus = 90
	wound_falloff_tile = -20 // low damage + additional dropoff will already curb wounding potential anything past point blank
	supereffective_damage = 3
	supereffective_faction = list("hostile", "ant", "supermutant", "cazador", "raider", "gecko", "radscorpion")

/obj/item/projectile/bullet/pellet/shotgun_rubbershot
	name = "rubbershot pellet"
	damage = 3.5
	stamina = 20.5
	sharpness = SHARP_NONE
	embedding = null

/obj/item/projectile/bullet/pellet/Range()
	..()
	if(damage > 0)
		damage -= tile_dropoff
	if(stamina > 0)
		stamina -= tile_dropoff_s
	if(damage < 0 && stamina < 0)
		qdel(src)

/obj/item/projectile/bullet/pellet/shotgun_improvised
	tile_dropoff = 0.35		//Come on it does 6 damage don't be like that.
	damage = 6
	wound_bonus = 0
	bare_wound_bonus = 7.5

/obj/item/projectile/bullet/pellet/shotgun_improvised/Initialize(mapload)
	. = ..()
	range = rand(1, 8)

/obj/item/projectile/bullet/pellet/shotgun_improvised/on_range()
	do_sparks(1, TRUE, src)
	..()

// Mech Scattershots

/obj/item/projectile/bullet/scattershot
	damage = 28
	icon_state = "mech_autocannon"
	light_range = 1.5
	light_power = 0.3
	light_color = "#FF7F01"

/obj/item/projectile/bullet/seed
	damage = 6
	stamina = 1

/obj/item/projectile/bullet/pellet/shotgun_incapacitate
	name = "incapacitating pellet"
	damage = 1
	stamina = 6

// BETA STUFF // Obsolete
/obj/item/projectile/bullet/pellet/shotgun_buckshot/test
	name = "buckshot pellet"
	damage = 0
