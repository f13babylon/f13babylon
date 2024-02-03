/datum/component/storage/concrete/belt/holster
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 7
	quickdraw = TRUE
	var/multiple_weapons_allowed = FALSE

/datum/component/storage/concrete/belt/holster/Initialize()
	. = ..()
	CANHOLD_STATIC(src, typecacheof(list(
		/obj/item/ammo_casing,
		/obj/item/gun/ballistic/automatic/pistol,
		/obj/item/ammo_box/magazine/m22,
		/obj/item/ammo_box/magazine/zipgun,
		/obj/item/ammo_box/magazine/m9mm,
		/obj/item/ammo_box/magazine/m9mmds,
		/obj/item/ammo_box/magazine/m10mm,
		/obj/item/ammo_box/magazine/m45,
		/obj/item/ammo_box/magazine/m45exp,
		/obj/item/ammo_box/magazine/m44,
		/obj/item/ammo_box/magazine/automag,
		/obj/item/ammo_box/magazine/m14mm,
		/obj/item/gun/ballistic/revolver,
		/obj/item/ammo_box/c38,
		/obj/item/ammo_box/a357,
		/obj/item/ammo_box/l10mm,
		/obj/item/ammo_box/m44,
		/obj/item/ammo_box/c45rev,
		/obj/item/ammo_box/a45lcrev,
		/obj/item/ammo_box/c4570,
		/obj/item/ammo_box/needle,
		/obj/item/ammo_box/shotgun,
		/obj/item/gun/energy/laser/pistol,
		/obj/item/gun/energy/laser/wattz,
		/obj/item/gun/energy/laser/complianceregulator,
		/obj/item/gun/energy/laser/plasma/pistol,
		/obj/item/gun/energy/laser/plasma/glock,
		/obj/item/stock_parts/cell/ammo/ec,
	)))
	CANTHOLD_STATIC(src, typecacheof(list(
		/obj/item/gun/ballistic/automatic/smg/smg22,
		/obj/item/gun/ballistic/automatic/smg/calico,
		/obj/item/gun/ballistic/automatic/smg/thompson,
		/obj/item/gun/ballistic/automatic/smg/p90,
		/obj/item/gun/ballistic/automatic/smg/smg14mm,
		/obj/item/ammo_casing/a40mmHE,
		/obj/item/ammo_casing/a40mmCS,
		/obj/item/ammo_casing/a40mmS,
		/obj/item/ammo_casing/a40mmHEDP,
		/obj/item/ammo_casing/a40mmM,
		/obj/item/ammo_casing/a40mmF,
		/obj/item/ammo_casing/a40mmI,
	)))

/datum/component/storage/concrete/belt/holster/can_be_inserted(obj/item/I, stop_messages = FALSE, mob/M)
	. = ..()
	var/atom/real_location = real_location()
	if(!multiple_weapons_allowed && isgun(I) && real_location.contents.len)
		var/obj/item/gun/G = locate() in real_location.contents
		if(G)
			to_chat(M, "<span class='warning'>The [real_location] can only hold one weapon!</span>")
			return FALSE

/datum/component/storage/concrete/belt/holster/on_alt_click(datum/source, mob/user)
	var/atom/real_location = real_location()
	if(!isliving(user) || !user.can_reach(real_location))
		return
	if(check_locked(source, user, TRUE))
		return

	user_show_to_mob(user)
	if(rustle_sound)
		playsound(real_location, "rustle", 50, 1, -5)

	if(quickdraw && real_location.contents.len && user.can_hold_items() && !user.incapacitated() && user.get_empty_held_indexes())
		var/obj/item/gun/G = locate() in real_location.contents
		if(G)
			remove_from_storage(G, user)
			user.put_in_hands(G)
			G.weapondraw(G, user)
			user.visible_message("<span class='warning'>[user] draws \a [G] from \the [real_location]!</span>", "<span class='notice'>You draw \a [G] from \the [real_location].</span>")
		else
			var/obj/item/I = locate() in real_location.contents
			remove_from_storage(I, user)
			user.put_in_hands(I)
			user.visible_message("<span class='warning'>[user] draws \a [I] from \the [real_location]!</span>", "<span class='notice'>You draw \a [I] from \the [real_location].</span>")

/datum/component/storage/concrete/belt/holster/large
	max_items = 14
	max_w_class = WEIGHT_CLASS_BULKY
	max_combined_w_class = WEIGHT_CLASS_BULKY + WEIGHT_CLASS_SMALL * 4

/datum/component/storage/concrete/belt/holster/large/Initialize()
	. = ..()
	can_hold_extra = typecacheof(list(
		/obj/item/gun/ballistic/automatic/smg,
		/obj/item/ammo_box/magazine/msmg9mm,
		/obj/item/ammo_box/magazine/mcalico,
		/obj/item/ammo_box/magazine/msmg10mm,
		/obj/item/ammo_box/magazine/mgreasegun,
		/obj/item/ammo_box/magazine/mthompson,
		/obj/item/ammo_box/magazine/mp90,
		/obj/item/ammo_box/magazine/msmg14mm,
	))

/datum/component/storage/concrete/belt/holster/double
	max_items = 2
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 2
	multiple_weapons_allowed = TRUE

/datum/component/storage/concrete/belt/holster/double/Initialize()
	. = ..()
	CANHOLD_STATIC(src, typecacheof(list(
		/obj/item/gun/ballistic/automatic/pistol,
		/obj/item/gun/ballistic/revolver,
		/obj/item/gun/energy/laser/pistol,
		/obj/item/gun/energy/laser/wattz,
		/obj/item/gun/energy/laser/complianceregulator,
		/obj/item/gun/energy/laser/plasma/pistol,
		/obj/item/gun/energy/laser/plasma/glock,
	)))
