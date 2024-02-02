/datum/component/storage/concrete/belt/holster
	quickdraw = TRUE
	var/obj/item/storage/belt/holster/holster_belt

/datum/component/storage/concrete/belt/holster/Initialize()
	. = ..()
	if(parent)
		holster_belt = parent
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

/datum/component/storage/concrete/belt/holster/handle_item_insertion(obj/item/I, prevent_warning = FALSE, mob/M, datum/component/storage/remote)
	if(..() && isgun(I))
		holster_belt.stored_weapon = I

/datum/component/storage/concrete/belt/holster/remove_from_storage(atom/movable/AM, atom/new_location)
	if(..() && isgun(AM))
		holster_belt.stored_weapon = null

/datum/component/storage/concrete/belt/holster/can_be_inserted(obj/item/I, stop_messages = FALSE, mob/M)
	. = ..()
	if(isgun(I) && holster_belt.stored_weapon)
		to_chat(M, "<span class='warning'>There is already a weapon stored inside the holster!</span>")
		return FALSE

/datum/component/storage/concrete/belt/holster/on_alt_click(datum/source, mob/user)
	if(!isliving(user) || !user.can_reach(parent))
		return
	if(check_locked(source, user, TRUE))
		return TRUE

	var/atom/A = parent
	A.add_fingerprint(user)
	user_show_to_mob(user)
	if(rustle_sound)
		playsound(A, "rustle", 50, 1, -5)

	if(quickdraw && user.can_hold_items() && !user.incapacitated())
		if(!length(user.get_empty_held_indexes()))
			return TRUE
		var/obj/item/I
		if(holster_belt.stored_weapon)
			I = holster_belt.stored_weapon
		else
			I = locate() in real_location()

		if(I)
			remove_from_storage(I, user)
			user.put_in_hands(I)
			if(isgun(I))
				var/obj/item/gun/G = I
				G.weapondraw(G, user)
			user.visible_message("<span class='warning'>[user] draws [I] from [parent]!</span>", "<span class='notice'>You draw [I] from [parent].</span>")

/datum/component/storage/concrete/belt/holster/sidearm
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 7

/datum/component/storage/concrete/belt/holster/sidearm/Initialize()
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

/datum/component/storage/concrete/belt/holster/sidearm/large
	max_items = 14
	max_w_class = WEIGHT_CLASS_BULKY
	max_combined_w_class = WEIGHT_CLASS_BULKY + WEIGHT_CLASS_SMALL * 4

/datum/component/storage/concrete/belt/holster/sidearm/large/Initialize()
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

/datum/component/storage/concrete/belt/holster_double
	max_items = 2
	max_w_class = WEIGHT_CLASS_NORMAL
	max_combined_w_class = WEIGHT_CLASS_NORMAL * 2
	quickdraw = TRUE

/datum/component/storage/concrete/belt/holster_double/Initialize()
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
