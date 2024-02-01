//
//Explosive collar
/obj/item/electropack/shockcollar/explosive
	name = "explosive collar"
	desc = "A thick reinforced metal collar. 'Explosion' danger symbols line the outside. A small lock is present, though it seems impossible to get it off anyway without external help."
	icon = 'icons/obj/clothing/neck.dmi'
	icon_state = "slavecollarb"
	item_state = "slavecollarb"
	slot_flags = ITEM_SLOT_NECK
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = NECK
	strip_delay = 60
	equip_delay_other = 60
	var/is_active = FALSE

/obj/item/electropack/shockcollar/explosive/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/pen))
		var/t = stripped_input(user, "Would you like to write a name on the collar?", "Name your new slave", tagname ? tagname : "Sclavus", MAX_NAME_LEN)
		if(t)
			tagname = t
			name = "[initial(name)] - [t]"
		return
	if(istype(W, /obj/item/clothing/head/helmet)) //lazy method of denying this
		return
/*	if(istype(W, /obj/item/key/bcollar)) //SCRAPPING FOR NOW
		if(lock != FALSE)
			to_chat(user, "<span class='warning'>With a click the explosive collar unlocks!</span>")
			lock = FALSE
			REMOVE_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
		to_chat(user, "<span class='warning'>With a click the explosive collar locks!</span>")
		lock = TRUE
		if(!ismob(src.loc))
			return
		var/mob/M = src.loc
		if(M.get_item_by_slot(SLOT_NECK) == src)
			ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
	return ..()*/

/obj/item/electropack/shockcollar/explosive/receive_signal(datum/signal/signal)
	if(!signal || signal.data["code"] != code || is_active)
		return
	playsound(src, 'sound/machines/triple_beep.ogg', 75)
	is_active = TRUE
	icon_state = initial(icon_state) + "_active"
	item_state = initial(item_state) + "_active"
	var/mob/living/carbon/M = loc
	if(isliving(M) && M.get_item_by_slot(SLOT_NECK) == src)
		M.visible_message("<span class='danger'>The [src] on [M]'s neck beeps loudly!</span>", "<span class='userdanger'>The [src] on your neck beeps loudly!</span>")
		M.update_inv_neck()
	else
		src.visible_message("<span class='danger'>The [src] beeps loudly!</span>")
	addtimer(CALLBACK(src, PROC_REF(boom), M), 20)

/obj/item/electropack/shockcollar/explosive/proc/boom(mob/living/carbon/collar_loc)
	explosion(get_turf(src), 0,1,2)
	if(isliving(collar_loc) && collar_loc.get_item_by_slot(SLOT_NECK) == src)
		collar_loc.apply_damage(150, BRUTE, BODY_ZONE_HEAD)
		collar_loc.apply_damage(75, BRUTE, BODY_ZONE_CHEST)
	qdel(src)

//Collar keys
/obj/item/key/scollar
	name = "Slave Collar Key"
	desc = "A small key designed to work with shock collars."
/* I'LL COME BACK TO THIS MAYBE. TODAYS DATE IS 9th JAN 2021. IF I DIDN'T COME BACK TO THIS GET RID OF THE KEY STUFF
/obj/item/key/scollar/attack(mob/living/M, mob/living/user)
	if(!istype(M.get_item_by_slot(SLOT_NECK), /obj/item/electropack/shockcollar))
		return ..()
	var/obj/item/electropack/shockcollar/shockCollar = M.get_item_by_slot(SLOT_NECK)
	shockCollar.lock = !shockCollar.lock
	visible_message("<span class='warning'>[shockCollar] [shockCollar.lock ? "locks" : "unlocks"] around [M]'s neck.</span>")
	if(shockCollar.lock)
		ADD_TRAIT(shockCollar, TRAIT_NODROP, TRAIT_GENERIC)
		return
	REMOVE_TRAIT(shockCollar, TRAIT_NODROP, TRAIT_GENERIC)
*/
/obj/item/key/bcollar
	name = "Explosive Collar Key"
	desc = "A small key designed to work with explosive collars."
