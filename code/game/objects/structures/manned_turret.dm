/////// MANNED TURRET ////////

/obj/machinery/manned_turret
	name = "machine gun turret"
	desc = "While the trigger is held down, this gun will redistribute recoil to allow its user to easily shift targets."
	icon = 'icons/obj/turrets.dmi'
	icon_state = "machinegun"
	can_buckle = FALSE
	anchored = FALSE
	density = TRUE
	max_integrity = 100
	buckle_lying = FALSE
	layer = ABOVE_MOB_LAYER
	var/view_range = 10
	var/cooldown = 0
	var/projectile_type = /obj/item/projectile/bullet/manned_turret
	var/rate_of_fire = 1
	var/number_of_shots = 40
	var/cooldown_duration = 90
	var/atom/target
	var/turf/target_turf
	var/warned = FALSE
	var/list/calculated_projectile_vars

/obj/machinery/manned_turret/Destroy()
	target = null
	target_turf = null
	return ..()

/obj/machinery/manned_turret/examine(mob/user)
	. = ..()
	if(!anchored)	//We haven't wrenched it yet
		. += "<span class='notice'>The bolts are <i>loosened</i>, allowing it to be moved.</span>"
	else if(!can_buckle)	//We have wrenched it but haven't welded it yet
		. += "<span class='notice'>The bolts are <b>secured</b>, but the anchor must be <i>welded</i> to the floor before use.</span>"
	else	//We have wrenched and welded it, it's ready to be used
		. += "<span class='notice'>The anchor is <b>welded</b> to the floor and the gun is ready to be used. Time to let 'er rip!</span>"

/obj/machinery/manned_turret/wrench_act(mob/living/user, obj/item/I)
	. = TRUE
	if(can_buckle)		//We haven't unwelded it yet
		to_chat(user, "<span class='warning'>You have to unweld [src] from the floor first.</span>")
		return

	else if(anchored)	//We have wrenched it already
		to_chat(user, "<span class='notice'>You start unsecuring [src]...</span>")
		if(I.use_tool(src, user, 4 SECONDS, volume=100))
			to_chat(user, "<span class='notice'>You unsecure [src].</span>")
			anchored = FALSE

	else				//We haven't wrenched it yet
		to_chat(user, "<span class='notice'>You start securing [src]...</span>")
		if(I.use_tool(src, user, 4 SECONDS, volume=100))
			to_chat(user, "<span class='notice'>You secure [src].</span>")
			anchored = TRUE

/obj/machinery/manned_turret/welder_act(mob/living/user, obj/item/I)
	. = TRUE
	if(!anchored)		//We haven't wrenched it yet
		to_chat(user, "<span class='warning'>You have to secure [src] first.</span>")
		return

	if(can_buckle)		//We have welded it already
		to_chat(user, "<span class='notice'>You start unwelding [src] from the floor...</span>")
		if(I.use_tool(src, user, 4 SECONDS, volume=50, amount=2))
			user.visible_message("<span class='notice'>[user] unwelds [src] from the floor.</span>",\
								"<span class='notice'>You unweld [src] from the floor.</span>")
			unbuckle_all_mobs(TRUE)
			can_buckle = FALSE
			playsound(loc, 'sound/items/deconstruct.ogg', 50, TRUE)

	else if(anchored)	//We have wrenched it already
		to_chat(user, "<span class='notice'>You start welding [src] to the floor...</span>")
		if(I.use_tool(src, user, 4 SECONDS, volume=50, amount=2))
			user.visible_message("<span class='warning'>[user] welds [src] to the floor.</span>",\
								"<span class='notice'>You weld [src] to the floor.</span>")
			can_buckle = TRUE
			playsound(loc, 'sound/items/deconstruct.ogg', 50, TRUE)

//BUCKLE HOOKS

/obj/machinery/manned_turret/unbuckle_mob(mob/living/buckled_mob,force = FALSE)
	playsound(src,'sound/mecha/mechmove01.ogg', 50, 1)
	for(var/obj/item/I in buckled_mob.held_items)
		if(istype(I, /obj/item/gun_control))
			qdel(I)
	if(istype(buckled_mob))
		buckled_mob.pixel_x = 0
		buckled_mob.pixel_y = 0
		if(buckled_mob.client)
			buckled_mob.client.change_view(CONFIG_GET(string/default_view))
	. = ..()
	STOP_PROCESSING(SSfastprocess, src)

/obj/machinery/manned_turret/user_buckle_mob(mob/living/M, mob/living/carbon/user)
	if(user.incapacitated() || !istype(user))
		return
	M.forceMove(get_turf(src))
	. = ..()
	if(!.)
		return
	for(var/V in M.held_items)
		var/obj/item/I = V
		if(istype(I))
			if(M.dropItemToGround(I))
				var/obj/item/gun_control/TC = new(src)
				M.put_in_hands(TC)
		else	//Entries in the list should only ever be items or null, so if it's not an item we can assume it's an empty hand
			var/obj/item/gun_control/TC = new(src)
			M.put_in_hands(TC)
	M.pixel_y = 14
	layer = ABOVE_MOB_LAYER
	setDir(SOUTH)
	playsound(src,'sound/mecha/mechmove01.ogg', 50, 1)
	if(M.client)
		M.client.change_view(view_range)
	START_PROCESSING(SSfastprocess, src)

/obj/machinery/manned_turret/process()
	if (!update_positioning())
		return PROCESS_KILL

/obj/machinery/manned_turret/proc/update_positioning()
	if (!LAZYLEN(buckled_mobs))
		return FALSE
	var/mob/living/controller = buckled_mobs[1]
	if(!istype(controller))
		return FALSE
	var/client/C = controller.client
	if(C)
		var/atom/A = C.mouseObject
		var/turf/T = get_turf(A)
		if(istype(T))	//They're hovering over something in the map.
			direction_track(controller, T)
			calculated_projectile_vars = calculate_projectile_angle_and_pixel_offsets(controller, C.mouseParams)

/obj/machinery/manned_turret/proc/direction_track(mob/user, atom/targeted)
	if(user.incapacitated())
		return
	setDir(get_dir(src,targeted))
	user.setDir(dir)
	switch(dir)
		if(NORTH)
			layer = BELOW_MOB_LAYER
			user.pixel_x = 0
			user.pixel_y = -14
		if(NORTHEAST)
			layer = BELOW_MOB_LAYER
			user.pixel_x = -8
			user.pixel_y = -4
		if(EAST)
			layer = ABOVE_MOB_LAYER
			user.pixel_x = -14
			user.pixel_y = 0
		if(SOUTHEAST)
			layer = BELOW_MOB_LAYER
			user.pixel_x = -8
			user.pixel_y = 4
		if(SOUTH)
			layer = ABOVE_MOB_LAYER
			user.pixel_x = 0
			user.pixel_y = 14
		if(SOUTHWEST)
			layer = BELOW_MOB_LAYER
			user.pixel_x = 8
			user.pixel_y = 4
		if(WEST)
			layer = ABOVE_MOB_LAYER
			user.pixel_x = 14
			user.pixel_y = 0
		if(NORTHWEST)
			layer = BELOW_MOB_LAYER
			user.pixel_x = 8
			user.pixel_y = -4

/obj/machinery/manned_turret/proc/checkfire(atom/targeted_atom, mob/user)
	target = targeted_atom
	if(target == user || user.incapacitated() || target == get_turf(src))
		return
	if(world.time < cooldown)
		if(!warned && world.time > (cooldown - cooldown_duration + rate_of_fire*number_of_shots)) // To capture the window where one is done firing
			warned = TRUE
			playsound(src, 'sound/weapons/sear.ogg', 100, 1)
		return
	else
		cooldown = world.time + cooldown_duration
		warned = FALSE
		volley(user)

/obj/machinery/manned_turret/proc/volley(mob/user)
	target_turf = get_turf(target)
	for(var/i in 1 to number_of_shots)
		addtimer(CALLBACK(src, /obj/machinery/manned_turret/.proc/fire_helper, user), i*rate_of_fire)

/obj/machinery/manned_turret/proc/fire_helper(mob/user)
	if(user.incapacitated() || !(user in buckled_mobs))
		return
	update_positioning()						//REFRESH MOUSE TRACKING!!
	var/turf/targets_from = get_turf(src)
	if(QDELETED(target))
		target = target_turf
	var/obj/item/projectile/P = new projectile_type(targets_from)
	P.starting = targets_from
	P.firer = user
	P.original = target
//	playsound(src, 'sound/weapons/gunshot_smg.ogg', 75, 1)//Not for what we use this for.
	playsound(src, 'sound/f13weapons/antimaterielfire.ogg', 75, 1)
	P.xo = target.x - targets_from.x
	P.yo = target.y - targets_from.y
	P.Angle = calculated_projectile_vars[1] + rand(-9, 9)
	P.p_x = calculated_projectile_vars[2]
	P.p_y = calculated_projectile_vars[3]
	P.fire()

/obj/machinery/manned_turret/ultimate  // Admin-only proof of concept for autoclicker automatics
	name = "Infinity Gun"
	view_range = 12
	projectile_type = /obj/item/projectile/bullet/manned_turret

/obj/machinery/manned_turret/ultimate/checkfire(atom/targeted_atom, mob/user)
	target = targeted_atom
	if(target == user || target == get_turf(src))
		return
	target_turf = get_turf(target)
	fire_helper(user)

/////////
// M2
/////////
/obj/machinery/manned_turret/m2
	name = "heavy machine gun"
	desc = "An M2 Browning heavy machine gun developed long before the bombs fell. Still as powerful as it was all those years ago."
	icon = 'icons/obj/turrets.dmi'
	icon_state = "turret"//We pulled this from TGMC, but it's only temp. Thank you, lads. We'll remove it if you wish. Lacking some directionals, but it works for now.
	can_buckle = TRUE
	anchored = TRUE
	density = TRUE
	view_range = 15
	projectile_type = /obj/item/projectile/bullet/a50MG/depleteduranium
	rate_of_fire = 1
	number_of_shots = 1
	cooldown_duration = 2
	max_integrity = 1250//can't be destroyed by stray bullets by on 'accident'.

/obj/machinery/manned_turret/m2/unanchored
	can_buckle = FALSE
	anchored = FALSE

/////////
// M2 End
/////////

/obj/item/gun_control
	name = "turret controls"
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "offhand"
	w_class = WEIGHT_CLASS_HUGE
	item_flags = ABSTRACT | NOBLUDGEON | DROPDEL
	resistance_flags = FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/obj/machinery/manned_turret/turret

/obj/item/gun_control/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
	turret = loc
	if(!istype(turret))
		return INITIALIZE_HINT_QDEL

/obj/item/gun_control/Destroy()
	turret = null
	return ..()

/obj/item/gun_control/CanItemAutoclick()
	return TRUE

/obj/item/gun_control/attack(mob/living/M, mob/living/user)
	M.lastattacker = user.real_name
	M.lastattackerckey = user.ckey
	M.attacked_by(src, user)
	add_fingerprint(user)

/obj/item/gun_control/afterattack(atom/targeted_atom, mob/user, flag, params)
	. = ..()
	var/obj/machinery/manned_turret/E = user.buckled
	E.calculated_projectile_vars = calculate_projectile_angle_and_pixel_offsets(user, params)
	E.direction_track(user, targeted_atom)
	E.checkfire(targeted_atom, user)
