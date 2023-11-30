/obj/item/gun/energy/laser/practice				//SCROLL DOWN FOR FALLOUT 13 CONTENT
	name = "practice laser gun"
	icon_state = "laser-p"
	desc = "A modified version of the basic laser gun, this one fires less concentrated energy bolts designed for target practice."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/practice)
	clumsy_check = 0
	item_flags = NONE

/obj/item/gun/energy/laser/practice/hyperburst
	name = "toy hyper-burst launcher"
	desc = "A toy laser with a unique beam shaping lens that projects harmless bolts capable of going through objects. Compatible with existing laser tag systems."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/magtag)
	icon_state = "toyburst"
	obj_flags = NONE
	fire_delay = 40
	w_class = WEIGHT_CLASS_HUGE
	weapon_weight = WEAPON_HEAVY
	selfcharge = EGUN_SELFCHARGE
	charge_delay = 2
	recoil = 2
	cell_type = /obj/item/stock_parts/cell/toymagburst

/obj/item/gun/energy/laser/retro
	name ="retro laser gun"
	icon_state = "retro"
	desc = "An older model of the basic lasergun, no longer used by Nanotrasen's private security or military forces. Nevertheless, it is still quite deadly and easy to maintain, making it a favorite amongst pirates and other outlaws."
	ammo_x_offset = 3

/obj/item/gun/energy/laser/captain
	name = "antique laser gun"
	icon_state = "caplaser"
	item_state = "caplaser"
	desc = "This is an antique laser gun. All craftsmanship is of the highest quality. It is decorated with assistant leather and chrome. The object menaces with spikes of energy. On the item is an image of Space Station 13. The station is exploding."
	force = 10
	ammo_x_offset = 3
	selfcharge = EGUN_SELFCHARGE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/gun/energy/laser/cyborg
	name = "integrated AER9"
	can_charge = FALSE
	desc = "An energy-based laser gun that draws power from the robot's internal energy cell directly. So this is what freedom looks like?"
	fire_delay = 1
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun/hitscan)
	icon_state = "laser"
	item_state = "laser-rifle9"
	selfcharge = EGUN_SELFCHARGE_BORG
	cell_type = /obj/item/stock_parts/cell/secborg
	charge_delay = 3

/obj/item/gun/energy/laser/cyborg/emp_act()
	return

/obj/item/gun/energy/laser/cyborg/mean
	use_cyborg_cell = TRUE
	selfcharge = EGUN_NO_SELFCHARGE

/obj/item/gun/energy/laser/scatter
	name = "scatter laser gun"
	desc = "A laser gun equipped with a refraction kit that spreads bolts."
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter, /obj/item/ammo_casing/energy/laser)

//Laser Cannon
/obj/item/gun/energy/lasercannon
	name = "accelerator laser cannon"
	desc = "An advanced laser cannon that does more damage the farther away the target is."
	icon_state = "lasercannon"
	item_state = "laser"
	w_class = WEIGHT_CLASS_BULKY
	force = 10
	flags_1 =  CONDUCT_1
	slot_flags = ITEM_SLOT_BACK
	ammo_type = list(/obj/item/ammo_casing/energy/laser/accelerator)
	pin = null
	ammo_x_offset = 3

/obj/item/ammo_casing/energy/laser/accelerator
	projectile_type = /obj/item/projectile/beam/laser/accelerator
	select_name = "accelerator"
	fire_sound = 'sound/weapons/lasercannonfire.ogg'

/obj/item/projectile/beam/laser/accelerator
	name = "accelerator laser"
	icon_state = "scatterlaser"
	range = 255
	damage = 6

/obj/item/projectile/beam/laser/accelerator/Range()
	..()
	damage += 7
	transform *= 1 + ((damage/7) * 0.2)//20% larger per tile

/obj/item/gun/energy/xray
	name = "\improper X-ray laser gun"
	desc = "A high-power laser gun capable of expelling concentrated X-ray blasts that pass through multiple soft targets and heavier materials."
	icon_state = "xray"
	item_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/xray)
	pin = null
	ammo_x_offset = 3

////////Laser Tag////////////////////

/obj/item/gun/energy/laser/bluetag
	name = "laser tag gun"
	icon_state = "bluetag"
	desc = "A retro laser gun modified to fire harmless blue beams of light. Sound effects included!"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/bluetag)
	item_flags = NONE
	clumsy_check = FALSE
	pin = /obj/item/firing_pin/tag/blue
	ammo_x_offset = 2
	selfcharge = EGUN_SELFCHARGE

/obj/item/gun/energy/laser/bluetag/hitscan
	ammo_type = list(/obj/item/ammo_casing/energy/laser/bluetag/hitscan)

/obj/item/gun/energy/laser/redtag
	name = "laser tag gun"
	icon_state = "redtag"
	desc = "A retro laser gun modified to fire harmless beams red of light. Sound effects included!"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/redtag)
	item_flags = NONE
	clumsy_check = FALSE
	pin = /obj/item/firing_pin/tag/red
	ammo_x_offset = 2
	selfcharge = EGUN_SELFCHARGE

/obj/item/gun/energy/laser/redtag/hitscan
	ammo_type = list(/obj/item/ammo_casing/energy/laser/redtag/hitscan)



//	v	FALLOUT 13 CONTENT STARTS HERE	v


/obj/item/gun/energy/laser
	name = "energy weapon template"
	desc = "Should not exists. Bugreport."
	icon_state = "laser"
	item_state = "laser"
	slowdown = 0.3
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	custom_materials = list(/datum/material/iron=2000)
	ammo_type = list(/obj/item/ammo_casing/energy/lasergun)
	ammo_x_offset = 1
	shaded_charge = 1
	var/select = 1

/obj/item/gun/energy/laser/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return
	if(istype(A, /obj/item/stock_parts/cell/ammo))
		var/obj/item/stock_parts/cell/ammo/AM = A
		if(istype(AM, cell_type))
			var/obj/item/stock_parts/cell/ammo/oldcell = cell
			if(user.transferItemToLoc(AM, src))
				cell = AM
				if(oldcell)
					to_chat(user, "<span class='notice'>You perform a tactical reload on \the [src], replacing the cell.</span>")
					oldcell.dropped()
					oldcell.forceMove(get_turf(src.loc))
					oldcell.update_icon()
				//else
				//	to_chat(user, "<span class='notice'>You insert the cell into \the [src].</span>")

				//playsound(src, 'sound/weapons/autoguninsert.ogg', 60, TRUE)
				//chamber_round()
				A.update_icon()
				update_icon()
				return 1
			else
				to_chat(user, "<span class='warning'>You cannot seem to get \the [src] out of your hands!</span>")

/obj/item/gun/energy/laser/proc/burst_select()
	var/mob/living/carbon/human/user = usr
	select = !select
	if(!select)
		disable_burst()
		to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
	else
		enable_burst()
		to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")

/obj/item/gun/energy/laser/proc/enable_burst()
	burst_size = initial(burst_size)

/obj/item/gun/energy/laser/proc/disable_burst()
	burst_size = 1



/////////////////
//LASER PISTOLS//
/////////////////


//Wattz 1000 Laser pistol
/obj/item/gun/energy/laser/wattz
	name = "civilian laser pistol"
	desc = "A Wattz 1000 laser pistol intended for civilian use. Fires less concentrated beams of light that are usually incapable of penetrating armor."
	icon = 'icons/obj/guns/gunfruits2022/energy.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "wattz1000"
	item_state = "laser-pistol"
	fire_delay = 0
	slowdown = 0.2
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_LIGHT //Can dual wield, which makes up for the meh damage. Especially so with the Magneto.
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/wattz/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

//Upgraded Wattz 1000
/obj/item/gun/energy/laser/wattz/magneto
	name = "magnetic laser pistol"
	desc = "An upgraded variant of the Wattz 1000 laser pistol originally intended for police use. Fires concentrated beams of light that are capable of penetrating common armor."
	icon_state = "wattzplus"
	fire_delay = 0
	item_state = "laser-pistol"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/wattz/magneto/hitscan)

/obj/item/gun/energy/laser/wattz/recharger
	name = "Recharger Pistol"
	desc = "A recharger pistol manufactured by the Followers of the Apocalpyse. As the name implied, it charges its capacitor banks over time using radioactive decay."
	can_remove = 0
	can_charge = 0
	selfcharge = 1
	icon_state = "rechargerpistol"
	icon = 'icons/obj/guns/gunfruits2022/energy.dmi'
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/recharger/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/breeder
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

//AEP 7 Laser pistol
/obj/item/gun/energy/laser/pistol
	name = "laser pistol"
	desc = "A military-grade AEP7 laser pistol that fires concentrated beams of light."
	slowdown = 0.2
	icon = 'icons/obj/guns/gunfruits2022/energy.dmi'
	icon_state = "aep7"
	item_state = "laser-pistol"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	fire_delay = 0
	can_scope = FALSE
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

/obj/item/gun/energy/laser/pistol/cyborg
	name = "\improper assaultron AEP7 laser eye"
	desc = "A basic energy-based laser projector that fires concentrated beams of light from your eye! It draws power from your cell so try not to go crazy."
	can_scope = FALSE
	can_charge = FALSE
	selfcharge = EGUN_SELFCHARGE_BORG
	cell_type = /obj/item/stock_parts/cell/secborg
	charge_delay = 3

/obj/item/gun/energy/laser/pistol/cyborg/gutsy
	name = "\improper integrated laser pistol"
	desc = "An integrated laser pistol that draws power directly from your cell."

//Compliance Regulator

/obj/item/gun/energy/laser/complianceregulator
	name = "compliance regulator laser pistol"
	desc = "An AEP-7 pistol that has been modified for non-lethal work, formally addressed to as the AEP-5 Compliance Regulator. It fires concentrated beams of light that aren't intense enough to burn skin, but cause muscle tissue to stiffen involuntarily."
	slowdown = 0.2
	icon = 'icons/obj/guns/gunfruits2022/energy.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "aep5"
	item_state = "AEP5CR"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/laser/stun)
	cell_type = /obj/item/stock_parts/cell/ammo/ec
	fire_delay = 0
	can_scope = FALSE
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'

/obj/item/gun/energy/laser/pistol/pewpew
	name = "Pew Pew"
	desc = "An especially modified AEP-7 pistol that seems to have been previously owned by some kind of aficionado. The focus adjustment knob on the rear of the gun has a Sunset Sarsaparilla bottle cap with a crudely drawn star attached by a screw. Underneath the bottle cap are the words 'HAD IT COMING' etched into the casing."
	icon_state = "pewpew"
	weapon_weight = WEAPON_LIGHT
	slowdown = 0.05
	equipsound = 'sound/f13weapons/equipsounds/aer14equip.ogg'
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/hitscan/pewpew)
	
////////////////
//LASER RIFLES//
////////////////


//Wattz 2000 Laser rifle
/obj/item/gun/energy/laser/wattz2k
	name = "laser sniper rifle"
	desc = "A devastating U.S. Marine Corps issue Wattz 2000 laser rifle, equipped with uniquely powerful parts and a long-range scope."
	slowdown = 0.3
	icon = 'icons/obj/guns/gunfruits2022/energy.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "wattz2k"
	item_state = "sniper_rifle"
	fire_delay = 1
	ammo_type = list(/obj/item/ammo_casing/energy/wattz2k/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	equipsound = 'sound/f13weapons/equipsounds/aer14equip.ogg'

//Wattz 3000
/obj/item/gun/energy/laser/wattz2k/extended
	name = "advanced laser sniper rifle"
	desc = "A rare Wattz 3000 laser rifle equipped with an advanced targetting system and a recycling chip that allows for better energy efficiency. It's been fitted with a pistol grip separate from the stock."
	icon_state = "wattz3k"
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	item_state = "sniper_rifle"
	ammo_type = list(/obj/item/ammo_casing/energy/wattz2k/extended/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	equipsound = 'sound/f13weapons/equipsounds/aer14equip.ogg'



//AER9 Laser rifle
/obj/item/gun/energy/laser/aer9
	name = "laser rifle"
	desc = "A military-grade General Atomics AER-9 laser rifle. Fires powerful concentrated beams of lights capable of burning through flesh and bone with the effectiveness of an infantry rifle."
	icon = 'icons/obj/guns/gunfruits2022/energy.dmi'
	icon_state = "aer9"
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	fire_delay = 1
	scope_state = "AEP7_scope"
	scope_x_offset = 12
	scope_y_offset = 20
	equipsound = 'sound/f13weapons/equipsounds/aer9equip.ogg'

/obj/item/gun/energy/laser/aer9/recharger
	name = "gen-3 recharger rifle"
	desc = "A strange fusion of pre-war tech and recent innovation. Uses a MF-Breeder cell to charge it's capacitor banks, but isn't the most powerful."
	icon = 'icons/fallout/objects/guns/energy.dmi'
	icon_state = "rechargerrifle"
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun/hitscan/recharger)
	cell_type = /obj/item/stock_parts/cell/ammo/breeder
	fire_delay = 1
	can_scope = 1
	can_remove = 0
	can_charge = 0
	selfcharge = 1
	scope_x_offset = 12
	scope_y_offset = 22
	equipsound = 'sound/f13weapons/equipsounds/aer9equip.ogg'

//Tribeam Laser rifle
/obj/item/gun/energy/laser/scatter
	name = "tribeam laser rifle"
	desc = "A military-grade General Atomics AER-9T scattershot laser rifle. Fires powerful concentrated beams of lights capable of burning through flesh and bone with the effectiveness of a shotgun."
	icon = 'icons/obj/guns/gunfruits2022/energy.dmi'
	icon_state = "tribeam"
	item_state = "laser-rifle9"
	fire_delay = 3
	ammo_type = list(/obj/item/ammo_casing/energy/laser/scatter/tribeam/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	equipsound = 'sound/f13weapons/equipsounds/tribeamequip.ogg'


//AER12 Laser rifle
/obj/item/gun/energy/laser/aer12
	name = "advanced laser rifle"
	desc = "A modern military-grade General Atomics AER-12 advanced laser rifle. Fires powerful concentrated beams of lights capable of burning through flesh, bone, and most armor with the effectiveness of a battle rifle."
	icon_state = "aer12"
	icon = 'icons/obj/guns/gunfruits2022/energy.dmi'
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/aer12/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	fire_delay = 1.5
	scope_state = "AEP7_scope"
	scope_x_offset = 12
	scope_y_offset = 20
	equipsound = 'sound/f13weapons/equipsounds/tribeamequip.ogg'

//AER14 Laser rifle
/obj/item/gun/energy/laser/aer14
	name = "experimental laser rifle"
	desc = "A cutting-edge General Atomics AER-14 prototype laser rifle. Fires extremely powerful concentrated beams of lights capable of burning through flesh, bone, and most armor with the effectiveness of a high-power marksman rifle. Due to the experimental tuning, it has very bad ammo efficiency."
	icon_state = "aer14"
	icon = 'icons/obj/guns/gunfruits2022/energy.dmi'
	item_state = "laser-rifle9"
	ammo_type = list(/obj/item/ammo_casing/energy/laser/aer14/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	fire_delay = 1.5
	scope_state = "AEP7_scope"
	scope_x_offset = 12
	scope_y_offset = 20
	equipsound = 'sound/f13weapons/equipsounds/aer14equip.ogg'

//LAER Energy rifle
/obj/item/gun/energy/laser/laer
	name = "laser-assisted energy rifle"
	desc = "An extremely powerful experimental energy rifle developed by the Yuma Flats Energy Consumption after their research on pulse weaponry. Due to its incredible rarity and unprecedented firepower, the weapon is rarely seen in the hands of anyone but the wasteland's most highly regarded individuals."
	icon_state = "laer"
	icon = 'icons/obj/guns/gunfruits2022/energy.dmi'
	item_state = "laer"
	fire_delay = 3
	burst_size = 1
	ammo_type = list(/obj/item/ammo_casing/energy/laser/laer/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	equipsound = 'sound/f13weapons/equipsounds/laerequip.ogg'


//Laser RCW
/obj/item/gun/energy/laser/rcw
	name = "laser rapid capacitor weapon"
	desc = "A rapid-fire machine laser modeled after the .45 Auto SMG. It houses six capacitor banks that surround its port, fit for an electron charge pack. While it's extremely fast firing, its shots are not as powerful as those of your standard laser rifle."
	icon_state = "rcw"
	icon = 'icons/obj/guns/gunfruits2022/energy.dmi'
	item_state = "rcw"
	fire_delay = 3
	burst_size = 1
	automatic = 1
	autofire_shot_delay = 2
	spread = 14
	ammo_type = list(/obj/item/ammo_casing/energy/laser/rcw/hitscan)
	cell_type = /obj/item/stock_parts/cell/ammo/ecp
	equipsound = 'sound/f13weapons/equipsounds/RCWequip.ogg'

/obj/item/gun/energy/laser/rcw/burst_select()
	var/mob/living/carbon/human/user = usr
	playsound(user, 'sound/weapons/empty.ogg', 100, 1)
	update_icon()
//	for(var/X in actions)
//		var/datum/action/A = X

/obj/item/gun/energy/laser/rcw/afterattack()
	. = ..()
//	empty_alarm()
	return


//Alien Blaster
/obj/item/gun/energy/laser/plasma/pistol/alien
	name = "alien blaster"
	slowdown = 0.2
	item_state = "alienblaster"
	icon_state = "alienblaster"
	desc = "This weapon is unlike any other you've ever seen before, and appears to be made out of metals not usually found on Earth. It certainly packs a punch, though."
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	can_charge = FALSE
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/pistol/alien)
	cell_type = /obj/item/stock_parts/cell/ammo/alien //unchargeable, but removable


//Gamma gun
/obj/item/gun/energy/gammagun
	name = "Gamma gun"
	desc = "An advanced radiation weapon commonly utilized by people who have passionate hatred for their fellow man. Fires slow velocity, low damage radiation beams."
	icon_state = "ultra_pistol"
	item_state = "laser-pistol"
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BELT
	ammo_type = list(/obj/item/ammo_casing/energy/gammagun)
	cell_type = /obj/item/stock_parts/cell/ammo/mfc
	ammo_x_offset = 3

//// BETA /// Obsolete
/obj/item/gun/energy/laser/lasertesting
	ammo_type = list(/obj/item/ammo_casing/energy/laser/pistol/lasertest)
