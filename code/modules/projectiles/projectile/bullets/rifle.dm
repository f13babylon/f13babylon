//In this document: Rifle calibre cartridges values for damage and penetration.

//////////////////////
// AMMUNITION TYPES //
//////////////////////
/*
FMJ (full metal jacket)		=	Baseline
+P/+P+ = used by simplemobs
SHOCK = low-severity emp, -damage base, bonus burn damage (5-10)
Incin = -damage, sets target on fire
Acid = Heavy -damage, coats target in small amount of acid (1-5u)
Uranium = Irradiates, high AP, lower damage
Micro-Shrapnel = Wound bonus, embed bonus, high falloff for both
Contaminated = -damage, spawns a gas cloud that heavily reduces healing efficiency
Improvised = -1 to -4 damage
Civilian round				=	-10% damage. AP reduced by 50%
*/

/*
Ammo groupings for specialty:
5mm/22lr: Shock
Small Pistol calibers (38 357 9mm): Acid/Incin
Large Pistol Calibers (44 45 10mm): Incin
Very Large pistol (45-70): Knockback, Acid
autorifle calibers (5.56 7.62): Micro-Shrapnel (wound/embed)
heavy rifle calibers (12.7, 14mm, 7.62): Uranium, Contaminated, Incin
*/

// Explanation: Two major ammo stats, AP and Damage. Bullets placed in classes. Light rounds for example balanced with each other, one more AP, one more Damage.
// Balance between classes mostly done on the gun end, bigger rounds typically fire slower and have more recoil. They are not supposed to be totally equal either.


////////////////////
// 5.56 MM & .223 //		- 5.56mm: Medium damage, Medium wound bonus
////////////////////		- .223: Less damage, More wound bonus, More damage against simple mobs

/obj/item/projectile/bullet/a556mm
	name = "5.56 FMJ bullet"
	damage = 25
	wound_bonus = 20

/obj/item/projectile/bullet/a556mm/sport
	name = ".223 bullet"
	damage = 20
	wound_bonus = 25
	supereffective_damage = 15
	supereffective_faction = list("hostile", "ant", "deathclaw", "cazador", "china", "gecko", "radscorpion") //5.56 being effective against the Chinese is a funny code joke that someone will look at like 4 years from now on and cry about.

/obj/item/projectile/bullet/a556mm/simple		//for simple mobs
	name = "5.56 FMJ bullet"
	damage = 25

/obj/item/projectile/bullet/a556mm/simple/ap	//for simple mobs
	name = "5.56 AP bullet"
	damage = 25
	armour_penetration = 0.1

////////////////////
// 7.62 MM & .308 //		- 7.62mm: High damage, High wound bonus
////////////////////		- .308: Less damage, More wound bonus, More damage against simple mobs

/obj/item/projectile/bullet/a762mm
	name = "7.62 FMJ bullet"
	damage = 35
	wound_bonus = 30

/obj/item/projectile/bullet/a762mm/sport
	name = ".308 bullet"
	damage = 30
	wound_bonus = 35
	supereffective_damage = 15
	supereffective_faction = list("hostile", "ant", "deathclaw", "cazador", "gecko", "radscorpion")

/obj/item/projectile/bullet/a762mm/simple		//for simple mobs
	name = "7.62 FMJ bullet"
	damage = 30

/obj/item/projectile/bullet/a762mm/simple/ap	//for simple mobs
	name = "7.62 AP bullet"
	damage = 30
	armour_penetration = 0.1

/////////
// .50 //
/////////			-Very heavy rifle round.

/obj/item/projectile/bullet/a50MG
	name = ".50 MG bullet"
	damage = 50
	stamina = 45
	armour_penetration = 0.75
	pixels_per_second = 4000
	zone_accuracy_factor = 100
	wound_bonus = 35
	bare_wound_bonus = 80
	supereffective_damage = 150
	supereffective_faction = list("hostile", "ant", "supermutant", "deathclaw", "cazador", "raider", "china", "gecko", "wastebot", "radscorpion")

/obj/item/projectile/bullet/a50MG/incendiary
	damage = 60
	var/fire_stacks = 4
	zone_accuracy_factor = 100

/obj/item/projectile/bullet/a50MG/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

/obj/item/projectile/bullet/a50MG/explosive
	damage = 50

/obj/item/projectile/bullet/a50MG/explosive/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, 0, 1, 1, 1)

/obj/item/projectile/bullet/a50MG/penetrator
	name = ".50 penetrator round"
	damage = 50
	movement_type = FLYING | PHASING

/obj/item/projectile/bullet/a50MG/uraniumtipped
	name = "12.7mm uranium-tipped bullet"
	damage = 50
	armour_penetration = 1
	irradiate = 30

/obj/item/projectile/bullet/a50MG/contam
	name = "12.7mm contaminated bullet"
	damage = 50
	var/smoke_radius = 1
	var/datum/effect_system/smoke_spread/chem/smoke_system

/obj/item/projectile/bullet/a50MG/contam/Initialize(mapload)
	. = ..()
	create_reagents(15, NO_REACT, NO_REAGENTS_VALUE)
	smoke_system = new
	smoke_system.attach(src)
	smoke_system.set_up(src.reagents, smoke_radius, src, 0)
	reagents.add_reagent(/datum/reagent/toxin/metabtoxin, 15)

/obj/item/projectile/bullet/a50MG/contam/on_hit(atom/target, blocked = FALSE)
	playsound(get_turf(src), 'sound/effects/smoke.ogg', 50, 1, -3)
	smoke_system?.start()
	..()

/obj/item/projectile/bullet/a50MG/contam/Destroy()
	QDEL_NULL(smoke_system)
	return ..()

/obj/item/projectile/bullet/a50MG/depleteduranium//Used, currently, for the emplaced MG.
	name = ".50 DU-bullet"
	damage = 15//Fire rate is absurd. Makes up for it.
	armour_penetration = 1//:)
	wound_bonus = 30
	bare_wound_bonus = 40
	stamina = 0
	supereffective_damage = 15

//////////
// 5 MM	//		- 5mm: Low-medium damage, Low-medium wound bonus, High AP
//////////

/obj/item/projectile/bullet/a5mm
	damage = 20
	wound_bonus = 15
	armour_penetration = 0.3
	supereffective_damage = 15
	supereffective_faction = list("wastebot")

/obj/item/projectile/bullet/a5mm/simple		//for simple mobs
	name = "5mm bullet"
	damage = 20
	armour_penetration = 0.3

/////////////////////////
//2 MM ELECTROMAGNETIC //
/////////////////////////			- Gauss rifle

/obj/item/projectile/bullet/c2mm
	damage = 52
	armour_penetration = 0.9
	pixels_per_second = TILES_TO_PIXELS(100)
	supereffective_damage = 58
	supereffective_faction = list("hostile", "ant", "supermutant", "deathclaw", "cazador", "raider", "china", "gecko", "wastebot", "radscorpion")

/obj/item/projectile/bullet/c2mm/blender //welcome to pain town
	name = "2mm blender projectile"
	damage = 42
	hitscan = TRUE
	pass_flags = PASSTABLE
	armour_penetration = 1
	ricochets_max = 9 //ain't called the 'blender' for nothin'
	ricochet_incidence_leeway = 130
	ricochet_decay_damage = 1
	ricochet_decay_chance = 11
	ricochet_chance = 100
	var/collats = 3

/obj/item/projectile/bullet/c2mm/blender/process_hit(turf/T, atom/target, qdel_self, hit_something = FALSE)
	if(isliving(target) && collats)
		collats--
		temporary_unstoppable_movement = TRUE
		ENABLE_BITFIELD(movement_type, PHASING)
	..()
