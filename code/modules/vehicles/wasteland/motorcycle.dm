//Fallout 13 primary vehicle

/obj/vehicle/ridden/fuel/motorcycle
	name = "motorcycle"
	desc = "Wanderer Motors LLC."
	icon = 'icons/fallout/vehicles/medium_vehicles.dmi'
	icon_state = "bike"
	pixel_x = -16
	pixel_y = -2
	layer = LYING_MOB_LAYER
	obj_integrity = 400
	max_integrity = 400
	armor = list(melee = 50, bullet = 40, laser = 30, energy = 30, bomb = 0, bio = 0, rad = 0, fire = 30, acid = 40)
	key_type = /obj/item/key/motorcycle
	var/static/mutable_appearance/motorcycle
//	var/datum_type = /datum/riding/motorcycle
	engine_on_sound = 'sound/f13machines/bike_start.ogg'
	has_engine = 1
	engine_loop_sound = 'sound/f13machines/bike_loop.ogg'

/obj/vehicle/ridden/fuel/motorcycle/Initialize(mapload)
	. = ..()
	update_icon()

	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.vehicle_move_delay = 1
	D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 8), TEXT_SOUTH = list(-2, 5), TEXT_EAST = list(0, 12), TEXT_WEST = list( 2, 5)))
	D.set_vehicle_dir_offsets(NORTH, -16, -16)
	D.set_vehicle_dir_offsets(SOUTH, -16, -16)
	D.set_vehicle_dir_offsets(EAST, -18, 0)
	D.set_vehicle_dir_offsets(WEST, -18, 0)

/obj/vehicle/ridden/fuel/motorcycle/post_buckle_mob(mob/living/M)
	for(var/V in M.held_items)
		var/obj/item/I = V
		if(istype(I))
			if(M.dropItemToGround(I))
				var/obj/item/handlebars/TC = new(src)
				M.put_in_hands(TC)
		else	//Entries in the list should only ever be items or null, so if it's not an item, we can assume it's an empty hand
			var/obj/item/handlebars/TC = new(src)
			M.put_in_hands(TC)
	add_overlay(motorcycle)
	return ..()

/obj/vehicle/ridden/fuel/motorcycle/post_unbuckle_mob(mob/living/buckled_mob,force = FALSE)
	for(var/obj/item/I in buckled_mob.held_items)
		if(istype(I, /obj/item/handlebars))
			qdel(I)
	if(!has_buckled_mobs())
		cut_overlay(motorcycle)
	return ..()

/obj/vehicle/ridden/fuel/motorcycle/relaymove(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(H.wear_suit, /obj/item/clothing/suit/armor/f13/power_armor))//Standard PA.
			to_chat(user, "The [name] will not move, because you are too heavy.")
			return
		if(istype(H.wear_suit, /obj/item/clothing/suit/armored/heavy))//Salvaged PA and misc.
			to_chat(user, "The [name] will not move, because you are too heavy.")
			return
		if(H.pulling)
			to_chat(user, "The [name] will not move, because you are attempting to pull something.")
			return
	..()

/obj/item/key/motorcycle
	name = "motorcycle key"
	desc = "A keyring with a small steel key.<br>By the look of the key cuts it likely belongs to a motorcycle."
	icon = 'icons/fallout/vehicles/small_vehicles.dmi'

/obj/item/key/motorcycle/Initialize(mapload)
	. = ..()
	icon_state = pick("key-bike-r","key-bike-y","key-bike-g","key-bike-b")

//Motorcycle subtypes with different skins

/obj/vehicle/ridden/fuel/motorcycle/rusty
	name = "rusty motorcycle"
	desc = "A very old, weathered motorcycle.<br>Somehow the engine is still intact."
	icon_state = "bike_rust_med"
//	D.vehicle_move_delay = 1.2

/obj/vehicle/ridden/fuel/motorcycle/rusty/Initialize(mapload)
	. = ..()
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.vehicle_move_delay = 1.1//only 10% slower.

/obj/vehicle/ridden/fuel/motorcycle/green
	name = "green motorcycle"
	desc = "A military motorcycle from the old days.<br>Oddly enough it's still in pristine condition. The Army always had all the top-quality stuff."
	icon_state = "bike_green"

/obj/vehicle/ridden/fuel/motorcycle/flamy
	name = "black motorcycle"
	desc = "A vintage motorcycle from the old days.<br>It's extremely well maintained, jet black, and very shiny.<br>Topping it all off, it has badass flames painted on the fuel tank."
	icon_state = "bike_flamy"

/obj/vehicle/ridden/fuel/motorcycle/scrambler
	name = "scrambler motorbike"
	desc = "Scrambler is an old term for a dirt bike with a powerful engine that raced on dirt tracks with low jumps.<br>Something tells you it's better not to mess around with its owner."
	icon_state = "bike_scrambler"

/obj/vehicle/ridden/fuel/motorcycle/scrambler/Initialize(mapload)
	. = ..()
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.vehicle_move_delay = 0.7

/obj/vehicle/ridden/fuel/motorcycle/scooter
	name = "scooter"
	desc = "A scooter that has seen some use. The worn engine chews through fuel, but can still get you where you need to go."
	icon_state = "scooter"
	idle_wasting = 0.65 //normally 0.5
	move_wasting = 0.25 //normally 0.1
	fuel = 600 //normally 600
	max_fuel = 600
	key_type = /obj/item/key/scooter

/obj/vehicle/ridden/fuel/motorcycle/scooter/Initialize(mapload)
	. = ..()
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.vehicle_move_delay = 1.1 //Normal motorbike(s) have a move delay of 1. Higher = slower speed, so the scooter is not as fast as a good bike.

	D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 4), TEXT_SOUTH = list(0, 5), TEXT_EAST = list(-2, 8), TEXT_WEST = list(-1, 8)))
	D.set_vehicle_dir_offsets(NORTH, -16, -16)
	D.set_vehicle_dir_offsets(SOUTH, -16, -16)
	D.set_vehicle_dir_offsets(EAST, -18, 0)
	D.set_vehicle_dir_offsets(WEST, -18, 0)

/obj/item/key/scooter
	name = "scooter key"
	desc = "A keyring with a small steel key.<br>By the look of the key cuts it likely belongs to a scooter."
	icon = 'icons/fallout/vehicles/small_vehicles.dmi'

/obj/item/key/scooter/Initialize(mapload)
	. = ..()
	icon_state = pick("key-bike-r","key-bike-y","key-bike-g","key-bike-b")

/*
 * Handlebars
 */

/obj/item/handlebars
	name = "motorcycle handlebars"
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "offhand"
	w_class = WEIGHT_CLASS_HUGE
	item_flags = ABSTRACT | NOBLUDGEON | DROPDEL
	resistance_flags = FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/item/handlebars/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
