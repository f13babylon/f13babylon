
//////////////////
//PLASMA WEAPONS//
//////////////////
//Plasma Rifle
/obj/item/gun/energy/laser/plasma
	name ="plasma rifle"
	item_state = "plasma"
	icon_state = "plasrifle"
	icon = 'icons/obj/guns/gunfruits2022/energy.dmi'
	weapon_weight = WEAPON_HEAVY
	desc = "An advanced man-portable Winchester plasma rifle based on an older military design. Fires bolts of plasma that form into toroids in the chamber, which are then sent down a superconducting barrel and propelled by electromagnetic claws."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	equipsound = 'sound/f13weapons/equipsounds/plasequip.ogg'
	slowdown = 0.3
	fire_delay = 6

//Plasma pistol
/obj/item/gun/energy/laser/plasma/pistol
	name ="plasma pistol"
	item_state = "plasma-pistol"
	icon_state = "plaspistol"
	desc = "A REPCONN-made pistol-sized plasma caster based on a Winchester model. Fires bolts of plasma that form into toroids in the chamber, which are then sent down a superconducting barrel and propelled by electromagnetic claws."
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	equipsound = 'sound/f13weapons/equipsounds/pistolplasequip.ogg'
	slowdown = 0.2
	fire_delay = 4

//BoS knight craftable plasma pistol
/obj/item/gun/energy/laser/plasma/pistol/light
	name = "lightweight plasma pistol"
	icon_state = "plaspistol_s"
	desc = "A lightweight modification of the common REPCONN-built plasma pistol. Fires heavy low penetration plasma clots at a slower rate than the regular design due to reduced cooling."
	fire_delay = 5

/obj/item/gun/energy/laser/plasma/pistol/remnant
	name ="corroded plasma pistol"
	desc = "A REPCONN-made pistol-sized plasma caster based on a Winchester model. Fires bolts of plasma that form into toroids in the chamber, which are then sent down a superconducting barrel and propelled by electromagnetic claws. This one's internal parts have loose seals and corroded electronics."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol/worn)
	icon_state = "plaspistol_old"
	fire_delay = 6

/obj/item/gun/energy/laser/plasma/pistol/worn/gutsy
	name ="\improper integrated plasma pistol"
	desc = "A pistol-sized miniaturized plasma caster built by REPCONN. It fires a bolt of superhot ionized gas."
	selfcharge = EGUN_SELFCHARGE_BORG

//Glock 86 Plasma pistol
/obj/item/gun/energy/laser/plasma/glock
	name = "glock 86"
	desc = "A bleeding edge Glock 86 plasma pistol, designed by the Gaston Glock AI Supercomputer. Fires bolts of plasma that form into toroids in the chamber, which are then sent down a superconducting barrel lined with electromagnetic coils. Reliable, lightweight, and energy efficient."
	item_state = "plasma-pistol"
	icon_state = "glock"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol/glock)
	equipsound = 'sound/f13weapons/equipsounds/pistolplasequip.ogg'
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	fire_delay = 5
	slowdown = 0.1

//Glock 86 A Plasma pistol
/obj/item/gun/energy/laser/plasma/glock/extended
	name ="glock 86a"
	fire_delay = 4
	item_state = "plasma-pistol"
	icon_state = "betterglock"
	desc = "A bleeding edge Glock 86 plasma pistol, designed by the Gaston Glock AI Supercomputer. Fires bolts of plasma that form into toroids in the chamber, which are then sent down a superconducting barrel lined with electromagnetic coils. This one has been fitted with a targetting system and higher quality parts."
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol/glock/extended)
	cell_type = /obj/item/stock_parts/cell/ammo/ec

//Plasma carbine
/obj/item/gun/energy/laser/plasma/carbine
	name ="plasma carbine"
	item_state = "plasma"
	icon = 'icons/obj/guns/gunfruits2022/energy.dmi'
	icon_state = "p94"
	desc = "A militarized Winchester P-94 plasma caster, featuring a firearm-styled housing complete with a stock, rail, and pistol grip. Replaced by the urban plasma rifle not long before the war, this model remained in use due to its ability for rapid fire. Fires bolts of plasma that form into toroids in the chamber, which are then sent down a superconducting barrel and propelled by electromagnetic claws."
	ammo_type = list(/obj/item/ammo_casing/energy/plasmacarbine)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	fire_delay = 6
	weapon_weight = WEAPON_MEDIUM
	burst_size = 2
	burst_shot_delay = 1.5
	actions_types = list(/datum/action/item_action/toggle_firemode)
	can_scope = TRUE
	scope_state = "plasma_scope"
	slowdown = 0.3
	scope_x_offset = 13
	scope_y_offset = 16
	equipsound = 'sound/f13weapons/equipsounds/plasequip.ogg'

/obj/item/gun/energy/laser/plasma/carbine/enable_burst()
	. = ..()
	spread = 15

/obj/item/gun/energy/laser/plasma/carbine/disable_burst()
	. = ..()
	spread = 0


//Multiplas rifle
/obj/item/gun/energy/laser/plasma/scatter
	name = "multiplas rifle"
	item_state = "multiplas"
	icon = 'icons/obj/guns/gunfruits2022/energy.dmi'
	icon_state = "multiplas"
	fire_delay = 5
	desc = "A heavily modified version of an urban plasma rifle equipped with a multi-caster attachment for a barrel. Fires bolts of plasma that form into toroids in the chamber, which are then sent down a split barrel and propelled by electromagnetic coils."
	equipsound = 'sound/f13weapons/equipsounds/plasequip.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/scatter)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc

//FNV plasma caster
//very heavy
//deliberately OP
/obj/item/gun/energy/laser/plasma/caster
	name = "Plasma caster"
	icon = 'icons/fallout/objects/guns/longguns.dmi'
	item_state = "plasmacaster_fnv"
	icon_state = "plasmacaster_fnv"
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	desc = "A bulky and outdated industrial-grade Winchester P-94 energy caster, intended for heavy mining operations. Fires bolts of plasma that form into toroids in the chamber, which are then sent down a superconducting barrel and propelled by electromagnetic claws."
	equipsound = 'sound/f13weapons/equipsounds/plasequip.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/caster)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	weapon_weight = WEAPON_LIGHT
	slowdown = 0.4
	fire_delay = 8
	var/twohands = FALSE

/obj/item/gun/energy/laser/plasma/caster/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed)
	AddElement(/datum/element/update_icon_updates_onmob)
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, .proc/allow_fire)
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, .proc/deny_fire)


/obj/item/gun/energy/laser/plasma/caster/proc/allow_fire()
	twohands = TRUE

/obj/item/gun/energy/laser/plasma/caster/proc/deny_fire()
	twohands = FALSE


/obj/item/gun/energy/laser/plasma/caster/Destroy()
	UnregisterSignal(src, list(COMSIG_TWOHANDED_WIELD,
								COMSIG_TWOHANDED_UNWIELD))
	return ..()

/obj/item/gun/energy/laser/plasma/caster/can_shoot()
	. = ..()
	if(!twohands)
		return FALSE
