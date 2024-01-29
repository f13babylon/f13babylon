//The ammo/gun is stored in a back slot item
/obj/item/m2flamethrowertank
	name = "backpack fuel tank"
	desc = "The massive pressurized fuel tank for a M2 Flamethrower."
	icon = 'icons/obj/guns/flamethrower.dmi'
	icon_state = "m2_flamethrower_back"
	item_state = "m2_flamethrower_back"
	lefthand_file = 'icons/mob/inhands/equipment/backpack_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/backpack_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	var/obj/item/gun/ballistic/m2flamethrower/gun
	var/armed = 0 //whether the gun is attached, 0 is attached, 1 is the gun is wielded.
	var/overheat = 0
	var/overheat_max = 40
	var/heat_diffusion = 10

/obj/item/m2flamethrowertank/Initialize(mapload)
	. = ..()
	gun = new(src)
	START_PROCESSING(SSobj, src)

/obj/item/m2flamethrowertank/Destroy()
	QDEL_NULL(gun)
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/m2flamethrowertank/process()
	if(world.time - gun.last_fire > 4)
		overheat = max(0, overheat - heat_diffusion)

/obj/item/m2flamethrowertank/on_attack_hand(mob/living/carbon/user)
	if(src.loc == user)
		if(!armed)
			if(user.get_item_by_slot(SLOT_BACK) == src)
				armed = 1
				if(!user.put_in_hands(gun))
					armed = 0
					to_chat(user, "<span class='warning'>You need a free hand to hold the gun!</span>")
					return
				update_icon()
				user.update_inv_back()
				gun.weapondraw(gun, user)
		else
			to_chat(user, "<span class='warning'>You are already holding the gun!</span>")
	else
		..()

/obj/item/m2flamethrowertank/attackby(obj/item/W, mob/user, params)
	if(W == gun) //Don't need armed check, because if you have the gun assume its armed.
		user.dropItemToGround(gun, TRUE)
	else
		..()

/obj/item/m2flamethrowertank/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Current heat level: [overheat] / [overheat_max]"

/obj/item/m2flamethrowertank/dropped(mob/user)
	. = ..()
	if(armed)
		user.dropItemToGround(gun, TRUE)

/obj/item/m2flamethrowertank/MouseDrop(atom/over_object)
	. = ..()
	if(armed)
		return
	if(iscarbon(usr))
		var/mob/M = usr

		if(!over_object)
			return

		if(!M.incapacitated())

			if(istype(over_object, /atom/movable/screen/inventory/hand))
				var/atom/movable/screen/inventory/hand/H = over_object
				M.putItemFromInventoryInHandIfPossible(src, H.held_index)


/obj/item/m2flamethrowertank/update_icon_state()
	if(armed)
		icon_state = "m2_flamethrower_back"
	else
		icon_state = "m2_flamethrower_back"

/obj/item/m2flamethrowertank/proc/attach_gun(mob/user)
	if(!gun)
		gun = new(src)
	gun.forceMove(src)
	armed = 0
	if(user)
		to_chat(user, "<span class='notice'>You attach the [gun.name] to the [name].</span>")
	else
		src.visible_message("<span class='warning'>The [gun.name] snaps back onto the [name]!</span>")
	update_icon()
	user.update_inv_back()


/obj/item/gun/ballistic/m2flamethrower
	name = "\improper M2 Flamethrower"
	desc = "A pre-war M2 Flamethrower, commonly found in National Guard armoies. This one has NCR armory markings and is issued to combat engineers."
	icon = 'icons/obj/guns/flamethrower.dmi'
	icon_state = "m2_flamethrower_on"
	item_state = "m2flamethrower"
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY
	slot_flags = null
	automatic = TRUE
	autofire_shot_delay = 1
	slowdown = 1
	spread = 18
	force = 20
	automatic = TRUE
	fire_sound = 'sound/f13weapons/flamethrower.ogg'
	insert_sound = 'sound/effects/refill.ogg'
	casing_ejector = FALSE
	mag_type = /obj/item/ammo_box/magazine/internal/m2flamethrower
	var/obj/item/m2flamethrowertank/ammo_pack

/obj/item/gun/ballistic/m2flamethrower/Initialize(mapload)
	. = ..()
	if(istype(loc, /obj/item/m2flamethrowertank)) //We should spawn inside an ammo pack so let's use that one.
		ammo_pack = loc
	else
		return INITIALIZE_HINT_QDEL //No pack, no gun

/obj/item/gun/ballistic/m2flamethrower/Destroy()
	. = ..()
	ammo_pack = null

/obj/item/gun/ballistic/m2flamethrower/attack_self(mob/living/user)
	return

/obj/item/gun/ballistic/m2flamethrower/dropped(mob/user)
	. = ..()
	if(ammo_pack)
		ammo_pack.attach_gun(user)
	else
		qdel(src)

/obj/item/gun/ballistic/m2flamethrower/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0, stam_cost = 0)
	if(ammo_pack)
		if(ammo_pack.overheat < ammo_pack.overheat_max)
			if(..())
				ammo_pack.overheat += burst_size
				if(ammo_pack.overheat >= ammo_pack.overheat_max * 0.25 && ammo_pack.overheat < ammo_pack.overheat_max * 0.5 && prob(25))
					to_chat(user, "<span class ='notice'>The flamethrower is starting to heat up.</span>")
				else if(ammo_pack.overheat >= ammo_pack.overheat_max * 0.5 && ammo_pack.overheat < ammo_pack.overheat_max * 0.75 && prob(50))
					to_chat(user, "<span class ='warning'>The flamethrower is getting dangerously hot!</span>")
				else if(ammo_pack.overheat >= ammo_pack.overheat_max * 0.75 && prob(75))
					to_chat(user, "<span class ='warning'>The flamethrower is getting extremely hot! It is going to overheat soon!</span>")
		else
			to_chat(user, "<span class ='warning'>The flamethrower has overheated! It must cool down before firing again.</span>")

/obj/item/gun/ballistic/m2flamethrower/afterattack(atom/target, mob/living/user, flag, params)
	. = ..()
	if(!ammo_pack || ammo_pack.loc != user)
		to_chat(user, "You need the backpack fuel tank to fire the gun!")
