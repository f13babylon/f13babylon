//IN THIS DOCUMENT: Automatic template, SMGs, Carbines, Semi-auto rifles, Assault rifles, Machineguns and Misc.
// See gun.dm for keywords and the system used for gun balance



//////////////////////
//AUTOMATIC TEMPLATE//
//////////////////////


/obj/item/gun/ballistic/automatic
	name = "automatic gun template"
	desc = "should not be here, bugreport."
	slowdown = 0.5
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = 0
	force = 15
	burst_size = 1
	burst_shot_delay = 3
	var/automatic_burst_overlay = TRUE
	var/semi_auto = FALSE
	var/auto_eject = 0
	var/auto_eject_sound = null
	var/alarmed = 0
	var/select = 1
	var/is_automatic = FALSE
	can_suppress = FALSE
	equipsound = 'sound/f13weapons/equipsounds/riflequip.ogg'
	var/set_burst_size = 1 //Added for Gun Mods System

/obj/item/gun/ballistic/automatic/examine(mob/user)
	. = ..()
	if (auto_sear)
		. += "It has an automatic sear installed."
	else if (can_automatic && semi_auto)
		. += "It has room to install an extra <b>automatic sear</b> for select-fire capabilities."

/obj/item/gun/ballistic/automatic/attackby(obj/item/I, mob/user, params)
	if(user.a_intent == INTENT_HARM)
		return ..()
	else if(istype(I, /obj/item/attachments/auto_sear))
		var/obj/item/attachments/auto_sear/A = I
		if(!auto_sear && can_automatic && semi_auto)
			if(!user.transferItemToLoc(I, src))
				return
			auto_sear = A
			src.burst_size += 1
			src.spread += 6
			src.recoil += 0.1
			src.automatic_burst_overlay = TRUE
			src.semi_auto = FALSE
			to_chat(user, "<span class='notice'>You attach \the [A] to \the [src].</span>")
			update_icon()
	else
		return ..()

/obj/item/gun/ballistic/automatic/update_overlays()
	. = ..()
	if(automatic_burst_overlay)
		if(!select)
			. += ("[initial(icon_state)]semi")
		if(select == 1)
			. += "[initial(icon_state)]burst"

/obj/item/gun/ballistic/automatic/update_icon_state()
	icon_state = "[initial(icon_state)][magazine ? "-[magazine.max_ammo]" : ""][chambered ? "" : "-e"]"

/obj/item/gun/ballistic/automatic/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return
	if(istype(A, /obj/item/ammo_box/magazine))
		var/obj/item/ammo_box/magazine/AM = A
		if(istype(AM, mag_type))
			var/obj/item/ammo_box/magazine/oldmag = magazine
			if(user.transferItemToLoc(AM, src))
				magazine = AM
				if(oldmag)
					to_chat(user, "<span class='notice'>You perform a tactical reload on \the [src], replacing the magazine.</span>")
					oldmag.forceMove(get_turf(src.loc))
					oldmag.update_icon()
				else
					to_chat(user, "<span class='notice'>You insert the magazine into \the [src].</span>")

				playsound(user, 'sound/weapons/autoguninsert.ogg', 60, 1)
				chamber_round()
				A.update_icon()
				update_icon()
				return 1
			else
				to_chat(user, "<span class='warning'>You cannot seem to get \the [src] out of your hands!</span>")

/obj/item/gun/ballistic/automatic/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/toggle_firemode))
		if(is_automatic == FALSE)
			burst_select()
		if(is_automatic == TRUE)
			auto_select()
	else
		return ..()

/obj/item/gun/ballistic/automatic/proc/burst_select()
	var/mob/living/carbon/human/user = usr
	if(semi_auto)
		to_chat(user, "<span class = 'notice'>This weapon is semi-automatic only.</span>")
		return
	else
		select = !select
		if(!select)
			disable_burst()
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
		else
			//enable_burst()//Removed for Gun Mods System
			if(set_burst_size != null && set_burst_size > 1)
				burst_size = set_burst_size
			else
				enable_burst()
			to_chat(user, "<span class='notice'>You switch to [burst_size]-rnd burst.</span>")
		playsound(user, 'sound/weapons/empty.ogg', 100, 1)
		update_icon()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/gun/ballistic/automatic/proc/auto_select()
	var/mob/living/carbon/human/user = usr
	if(semi_auto)
		to_chat(user, "<span class = 'notice'>This weapon is semi-automatic only.</span>")
		return
	else
		select = !select
		if(!select)
			disable_auto()
			to_chat(user, "<span class='notice'>You switch to semi-automatic.</span>")
		else
			enable_auto()
			to_chat(user, "<span class='notice'>You switch to automatic fire.</span>")
		playsound(user, 'sound/weapons/empty.ogg', 100, 1)
		update_icon()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()

/obj/item/gun/ballistic/automatic/proc/enable_burst()
	burst_size = initial(burst_size)
	if(auto_sear)
		burst_size += initial(burst_size)
	if(burst_improvement)
		burst_size += initial(burst_size)
	if(burst_improvement && auto_sear)
		burst_size += 1 + initial(burst_size)

/obj/item/gun/ballistic/automatic/proc/disable_burst()
	burst_size = initial(burst_size)

/obj/item/gun/ballistic/automatic/proc/enable_auto()
	automatic = 1

/obj/item/gun/ballistic/automatic/proc/disable_auto()
	automatic = 0

/obj/item/gun/ballistic/automatic/can_shoot()
	return get_ammo()

/obj/item/gun/ballistic/automatic/proc/empty_alarm()
	if(!chambered && !get_ammo() && !alarmed)
		playsound(src.loc, 'sound/weapons/smg_empty_alarm.ogg', 40, 1)
		update_icon()
		alarmed = 1
	return

/obj/item/gun/ballistic/automatic/afterattack(atom/target, mob/living/user)
	..()
	if(auto_eject && magazine && magazine.stored_ammo && !magazine.stored_ammo.len && !chambered)
		magazine.dropped()
		user.visible_message(
			"[magazine] falls out and clatters on the floor!",
			"<span class='notice'>[magazine] falls out and clatters on the floor!</span>"
		)
		if(auto_eject_sound)
			playsound(user, auto_eject_sound, 40, 1)
		magazine.forceMove(get_turf(src.loc))
		magazine.update_icon()
		magazine = null
		update_icon()



///////////////////
//SUBMACHINE GUNS//
///////////////////


//SMG TEMPLATE
/obj/item/gun/ballistic/automatic/smg
	name = "SMG TEMPLATE"
	desc = "You're not supposed to see this."
	icon = 'icons/obj/guns/gunfruits2022/smgs.dmi'
	icon_state = "MP5"
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BELT
	automatic = TRUE
	is_automatic = TRUE
	fire_delay = 3
	autofire_shot_delay = 2
	slowdown = 0.15
	spread = 14
	force = 15
	recoil = 0.6
	actions_types = list(/datum/action/item_action/toggle_firemode)

/obj/item/gun/ballistic/automatic/smg/auto_select()
	if(!automatic)
		spread *= 1.2
		recoil *= 1.2
		if(w_class != WEIGHT_CLASS_BULKY)
			weapon_weight = WEAPON_LIGHT
		to_chat(usr, "<span class='notice'>You switch to automatic fire.</span>")
	else
		spread /= 1.2
		recoil /= 1.2
		if(w_class != WEIGHT_CLASS_BULKY)
			weapon_weight = WEAPON_LIGHT
		to_chat(usr, "<span class='notice'>You switch to semi-auto.</span>")

	automatic = !automatic
	playsound(usr, 'sound/weapons/empty.ogg', 100, 1)

//American 180			Keywords: .22 LR, Suppressed, Bullethose, 180 Round drum, Bulky, High-mid tier
/obj/item/gun/ballistic/automatic/smg/smg22
	name = "silenced .22 SMG"
	desc = "An integrally suppressed American 180 riot suppression submachine gun chambered in .22 LR, feeding from top-loaded pan magazines."
	icon_state = "smg22"
	item_state = "smg22"
	fire_sound = 'sound/f13weapons/american180.ogg'
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/msmg22
	fire_delay = 2
	autofire_shot_delay = 1
	slowdown = 0.4
	spread = 25
	suppressed = TRUE
	can_unsuppress = FALSE

//Uzi			Keywords: 9mm, Bullethose, Dual-wieldable on semi-auto, 32/50 Rounds, Normal, High-mid tier
/obj/item/gun/ballistic/automatic/smg/uzi
	name = "9mm submachine gun"
	desc = "A compact and reliable Israeli Uzi SMG chambered for 9mm, best paired with a .45 longslide with laser sighting."
	icon_state = "uzi"
	item_state = "uzi"
	fire_sound = 'sound/f13weapons/9mm.ogg'
	mag_type = /obj/item/ammo_box/magazine/msmg9mm
	fire_delay = 2
	autofire_shot_delay = 1
	slowdown = 0.1
	spread = 20
	recoil = 0.8

//MP5			Keywords: 9mm, Suppressed, Dual-wieldable on semi-auto, AP, Accurate, 32/50 Rounds, Normal, High-mid tier
/obj/item/gun/ballistic/automatic/smg/mp5
	name = "advanced 9mm SMG"
	desc = "An integrally suppressed MP5SD6 made by Heckler & Koch, renowned for its accuracy in comparison to other machine guns of its type."
	icon_state = "mp5"
	item_state = "mp5"
	fire_sound = 'sound/weapons/Gunshot_large_silenced.ogg'
	mag_type = /obj/item/ammo_box/magazine/msmg9mm
	spread = 6
	extra_damage = 5	//20 DAM
	extra_penetration = 0.2	//20% AP
	suppressed = TRUE
	can_unsuppress = FALSE
	recoil = 0.5

//Calico			Keywords: 9mm, Bullethose, 70 rounds, Bulky, Superhigh tier
/obj/item/gun/ballistic/automatic/smg/calico
	name = "9mm machine gun"
	desc = "A roller-delayed Calico M960A machine gun that feeds from a proprietary helical magazine, chambered for 9mm."
	icon_state = "calico"
	item_state = "calico"
	fire_sound = 'sound/f13weapons/smg_loud.ogg'
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/mcalico
	fire_delay = 2
	autofire_shot_delay = 1
	slowdown = 0.4
	spread = 16

//10mm SMG			Keywords: 10mm, Dual-wieldable on semi-auto, 30 Rounds, Normal, Mid tier
/obj/item/gun/ballistic/automatic/smg/smg10mm
	name = "10mm submachine gun"
	desc = "An open-bolt Heckler & Koch MP9 that saw extensive use in military and police units prior to the war, chambered in 10mm despite its name."
	icon_state = "smg10mm"
	item_state = "smg10mm"
	fire_sound = 'sound/f13weapons/10mm_fire_03.ogg'
	mag_type = /obj/item/ammo_box/magazine/msmg10mm

//Grease Gun			Keywords: .45 ACP, Dual-wieldable on semi-auto, 30 Rounds, Normal, Low-mid tier
/obj/item/gun/ballistic/automatic/smg/greasegun
	name = "cheap .45 Auto SMG"
	desc = "A rather inexpensive M3A1 Grease Gun with the absolute simplest of designs."
	icon_state = "grease_gun"
	item_state = "grease_gun"
	fire_sound = 'sound/f13weapons/smg_dull.ogg'
	mag_type = /obj/item/ammo_box/magazine/mgreasegun
	spread = 18
	extra_damage = -4	//20 DAM

//Thompson			Keywords: .45 ACP, 30/50 Rounds, Bulky, High-mid tier
/obj/item/gun/ballistic/automatic/smg/thompson
	name = ".45 Auto submachine gun"
	desc = "A classic, American-made Thompson M1A1 submachine gun chambered in .45 Auto. It can feed from a straight stick magazine or a fifty-round drum."
	icon_state = "thompson"
	item_state = "thompson"
	fire_sound = 'sound/f13weapons/smg_dull.ogg'
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/mthompson
	slowdown = 0.3
	spread = 13

//P90			Keywords: 5mm, AP, 50 Rounds, Bulky, Superhigh tier
/obj/item/gun/ballistic/automatic/smg/p90
	name = "5mm submachine gun"
	desc = "A uniquely powerful and lightweight personal defense weapon developed by FN Herstal, chambered for 5mm and feeding from fifty-round translucent box magazines."
	icon_state = "p90"
	item_state = "p90"
	fire_sound = 'sound/f13weapons/assault_carbine.ogg'
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/mp90
	slowdown = 0.3
	spread = 16
	extra_damage = -5		//15 DAM

//14mm SMG 			Keywords: 14mm, AP, 21/27 rounds, Bulky, Superhigh tier
/obj/item/gun/ballistic/automatic/smg/smg14mm
	name = "14mm submachine gun"
	desc = "A SIG-made hand-cannon chambered for the 14mm hunting cartridge, loading from top-mounted magazines and benefitting from an unique recoil reduction system."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "smg14mm"
	item_state = "smg14mm"
	fire_sound = 'sound/f13weapons/magnum_fire.ogg'
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/msmg14mm
	fire_delay = 4
	autofire_shot_delay = 3
	slowdown = 0.4
	spread = 12
	recoil = 0.8
	extra_damage = -7			//25 DAM
	extra_penetration = 0.20	//20% AP

////////////////////
//SEMI-AUTO RIFLES//
////////////////////

//Combat Carbine	Keywords: .45 Caliber Rifle, Town rifle
/obj/item/gun/ballistic/automatic/combatcarbine
	name = "Combat Carbine"
	desc = "A .45 semi-automatic combat carbine, produced pre-war for National Guard forces."
	icon_state = "combat_c"
	item_state = "combatrifle"
	icon_prefix = "combatrifle"
	mag_type = /obj/item/ammo_box/magazine/mthompson
	fire_delay = 3
	burst_size = 1
	spread = 1
	slowdown = 0.25
	extra_penetration = 0.1
	automatic_burst_overlay = FALSE
	semi_auto = TRUE
	fire_sound = 'sound/weapons/gunshot_smg.ogg'

//Combat Rifle	Keywords: .308 Caliber Rifle, Town rifle
/obj/item/gun/ballistic/automatic/combat
	name = "Combat Rifle"
	desc = "A .308 semi-automatic combat rifle, Modified from carbines produced pre-war for National Guard forces."
	icon_state = "combat_rifle"
	item_state = "combatrifle"
	icon_prefix = "combatrifle"
	mag_type = /obj/item/ammo_box/magazine/w308
	fire_delay = 4
	burst_size = 1
	spread = 1
	slowdown = 0.35
	automatic_burst_overlay = FALSE
	semi_auto = TRUE
	fire_sound = 'sound/f13weapons/combatrifle.ogg'

//Service rifle			Keywords: NCR, 5.56mm, Semi-auto, 20 (10-50) round magazine, 25dmg
/obj/item/gun/ballistic/automatic/service
	name = "service rifle"
	desc = "A pre-war AR-15 sporting rifle maintained by the Gun Runners and used as the primary infantry weapon of the NCRA. Chambered in 5.56mm."
	icon = 'icons/obj/guns/gunfruits2022/rifles.dmi'
	icon_state = "service_rifle"
	item_state = "servicerifle"
	mag_type = /obj/item/ammo_box/magazine/m556mm
	fire_delay = 4
	slowdown = 0.15
	spread = 1
	fire_sound = 'sound/f13weapons/varmint_rifle.ogg'
	actions_types = null

//Infantry Rifle		Keywords: 5mm, Semi-auto, 30/50 Rounds magazine
/obj/item/gun/ballistic/automatic/infantry_rifle
	name = "infantry rifle"
	desc = "A long-barreled semi-automatic variant of the Colt XM-177 assault carbine intended for use by military garrison troops. Chambered in 5mm."
	icon = 'icons/obj/guns/gunfruits2022/rifles.dmi'
	icon_state = "infantry_rifle"
	item_state = "assault_carbine"
	fire_sound = 'sound/f13weapons/assault_carbine.ogg'
	mag_type = /obj/item/ammo_box/magazine/m5mm
	fire_delay = 4
	slowdown = 0.2
	spread = 2
	actions_types = null

//Scout carbine			Keywords: NCR, 5.56mm, Semi-auto, 20 (10-50) round magazine. Special modifiers:spread -1
/obj/item/gun/ballistic/automatic/service/carbine
	name = "scout carbine"
	desc = "A cut down version of the standard-issue service rifle tapped with mounting holes for a scope. Shorter barrel, lower muzzle velocity."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "scout_carbine"
	spread = 1.2
	slowdown = 0.05
	can_scope = TRUE
	scope_state = "scope_short"
	scope_x_offset = 4
	scope_y_offset = 15
	suppressor_x_offset = 26
	suppressor_y_offset = 28
	extra_penetration = 0.1

//Marksman carbine			Keywords: 5.56mm, Semi-auto, 20 (10-50) round magazine, Small scope
/obj/item/gun/ballistic/automatic/marksman
	name = "marksman carbine"
	desc = "A semi-automatic Colt R91 rifle that was specially modified for paratrooper marksmen. It's been fitted with a precision stock and a West-Tek combat gunsight. Chambered in 5.56mm."
	icon = 'icons/obj/guns/gunfruits2022/rifles.dmi'
	icon_state = "marksman_carbine"
	item_state = "marksman"
	mag_type = /obj/item/ammo_box/magazine/m556mm
	fire_delay = 4
	slowdown = 0.3
	burst_size = 1
	spread = 1
	can_attachments = TRUE
	semi_auto = TRUE
	automatic_burst_overlay = FALSE
	can_scope = FALSE
	zoomable = TRUE
	zoom_amt = 6
	zoom_out_amt = 9
	can_bayonet = FALSE
	bayonet_state = "rifles"
	knife_x_offset = 22
	knife_y_offset = 12
	can_suppress = TRUE
	suppressor_state = "suppressor"
	suppressor_x_offset = 31
	suppressor_y_offset = 15
	fire_sound = 'sound/f13weapons/marksman_rifle.ogg'
	extra_penetration = 0.2
	extra_damage = 2

//Colt Rangemaster				Keywords: 7.62mm, Semi-auto, 10/20 round magazine, 35dmg
/obj/item/gun/ballistic/automatic/rangemaster
	name = "Colt Rangemaster"
	desc = "A Colt Rangemaster semi-automatic rifle, chambered for 7.62x51. Single-shot only."
	icon_state = "rangemaster"
	item_state = "308"
	icon_prefix = "308"
	force = 20
	mag_type = /obj/item/ammo_box/magazine/m762mm
	burst_size = 1
	fire_delay = 6
	slowdown = 0.3
	spread = 1
	automatic_burst_overlay = FALSE
	semi_auto = TRUE
	can_attachments = TRUE
	can_scope = TRUE
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 24
	knife_y_offset = 21
	scope_state = "scope_long"
	scope_x_offset = 4
	scope_y_offset = 11
	fire_sound = 'sound/f13weapons/762rifle.ogg'
	extra_penetration = 0.2

//M1 Garand					Keywords: .308, Semi-auto, 8 rounds internal
/obj/item/gun/ballistic/automatic/m1garand
	name = "M1 Garand"
	desc = "The WWII American Classic. Still has that satisfiying ping."
	icon_state = "m1garand"
	item_state = "rifle"
	icon_prefix = "308"
	force = 20
	slowdown = 0.2
	mag_type = /obj/item/ammo_box/magazine/garand308
	fire_delay = 5
	burst_size = 1
	spread = 1
	en_bloc = 1
	auto_eject = 1
	semi_auto = TRUE
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 22
	knife_y_offset = 21
	can_scope = TRUE
	scope_state = "scope_long"
	scope_x_offset = 5
	scope_y_offset = 14
	auto_eject_sound = 'sound/f13weapons/garand_ping.ogg'
	fire_sound = 'sound/f13weapons/762rifle.ogg'

/obj/item/gun/ballistic/automatic/m1garand/update_icon()
	..()
	icon_state = "[initial(icon_state)]"

/obj/item/gun/ballistic/automatic/m1garand/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return

//Old Glory					Keywords: UNIQUE, .308, Semi-auto, 8 rounds internal, Damage +10
/obj/item/gun/ballistic/automatic/m1garand/oldglory
	name = "Old Glory"
	desc = "This Machine kills communists!"
	icon_state = "oldglory"
	extra_damage = 10
	extra_penetration = 0.12

//Republics Pride			Keywords: UNIQUE, 7.62mm, Semi-auto, 8 rounds internal, Scoped, Damage -3, Penetration +0.1
/obj/item/gun/ballistic/automatic/m1garand/republicspride
	name = "Republic's Pride"
	desc = "A well-tuned scoped M1C rifle crafted by master gunsmith from the Gunrunners. Chambered in 7.62x51."
	icon_state = "republics_pride"
	item_state = "scoped308"
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	fire_delay = 2
	can_scope = FALSE
	extra_penetration = 0.1
	extra_damage = -3

//SKS				Keywords: LEGION, .308, Semi-auto, 10 rounds internal, Penetration +0.1
/obj/item/gun/ballistic/automatic/m1garand/sks
	name = "SKS"
	desc = "Old hunting rifle taken from disovered stockpiles and refurbished in Phoenix workshops. The standard heavy rifle of the Legion, still rare. .308, semi-auto only, internal magazine."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "sks"
	item_state = "sks"
	mag_type = /obj/item/ammo_box/magazine/sks
	fire_delay = 4
	extra_speed = 100
	bayonet_state = "bayonet"
	knife_x_offset = 24
	knife_y_offset = 23
	scope_state = "scope_mosin"
	scope_x_offset = 4
	scope_y_offset = 12
	auto_eject_sound = 'sound/weapons/magout.ogg'
	fire_sound = 'sound/f13weapons/762rifle.ogg'


//DKS 501 sniper rifle				Keywords: .308, Semi-auto, 7 round magazine, Scoped, Extra speed +500, Fire delay +1, 43dmg
/obj/item/gun/ballistic/automatic/marksman/sniper
	name = "sniper rifle"
	desc = "A DKS 501, chambered in .308 Winchester.  With a light polymer body, it's suited for long treks through the desert."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_prefix = "sniperrifle"
	icon_state = "sniper_rifle"
	item_state = "sniper_rifle"
	mag_type = /obj/item/ammo_box/magazine/w308
	fire_delay = 8
	burst_size = 1
	extra_speed = 900
	slowdown = 0.3
	zoom_amt = 10
	zoom_out_amt = 13
	semi_auto = TRUE
	can_automatic = FALSE
	can_bayonet = FALSE
	fire_sound = 'sound/f13weapons/762rifle.ogg'
	extra_penetration = 0.25
	extra_damage = 10

/obj/item/gun/ballistic/automatic/marksman/sniper/gold
	name = "golden sniper rifle"
	desc = "A Customized DKS 501, chambered in .308 Winchester. This one has a gold trim and the words 'Old Cassius' engraved into the stock."
	icon_state = "gold_sniper"
	item_state = "gold_sniper"
	slowdown = 0
	fire_delay = 5
	can_bayonet = TRUE

/obj/item/gun/ballistic/automatic/marksman/sniper/america
	name = "Gobi Campaign sniper rifle"
	desc = "A customized DKS 501, chambered in .308 Winchester, and coated in gold paint. This one was made for the Gobi Campaign, there's a torn rag from a flag wrapped around its stock."
	icon_state = "gold_sniper_america"
	item_state = "gold_sniper_america"
	slowdown = 0.19
	fire_delay = 5
	can_bayonet = TRUE
	zoom_amt = 12
	zoom_out_amt = 14

/obj/item/gun/ballistic/automatic/marksman/sniper/snipervenator
	name = "explorer sniper rifle"
	desc = "The customized sniper rifle, fitted with a telescopic sight for extreme accuracy and chambered for a high-ballistic performance centerfire cartridge. It is a superior version of the regular sniper rifle and is decorated with the flag of the bull and tokens of a hunt."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/backslot_weapon.dmi'
	icon_state = "venator_sniper"
	item_state = "venator_sniper"
	fire_delay = 5
	slowdown = 0.12

/obj/item/gun/ballistic/automatic/marksman/sniper/sniperranger
	name = "compact sniper rifle"
	desc = "A DKS 501, chambered in .308 Winchester.  With a light polymer body, it's suited for long treks through the desert. This particular model is lighter and faster."
	slowdown = 0.25
	fire_delay = 5

//////////////////
//ASSAULT RIFLES//
//////////////////


//ASSAULT RIFLE TEMPLATE
/obj/item/gun/ballistic/automatic/assault_rifle
	name = "ASSAULT RIFLE TEMPLATE"
	desc = "You're not supposed to see this."
	icon = 'icons/obj/guns/gunfruits2022/rifles.dmi'
	icon_state = "ASSAULT CARBINE"
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	automatic = TRUE
	is_automatic = TRUE
	fire_delay = 4
	autofire_shot_delay = 3
	burst_shot_delay = 1
	slowdown = 0.4
	spread = 8
	force = 20
	recoil = 0.7
	actions_types = list(/datum/action/item_action/toggle_firemode)

/obj/item/gun/ballistic/automatic/assault_rifle/auto_select()
	if(!automatic)
		spread *= 1.2
		recoil *= 1.2
		to_chat(usr, "<span class='notice'>You switch to automatic fire.</span>")
	else
		spread /= 1.2
		recoil /= 1.2
		to_chat(usr, "<span class='notice'>You switch to semi-auto.</span>")

	automatic = !automatic
	playsound(usr, 'sound/weapons/empty.ogg', 100, 1)

/obj/item/gun/ballistic/automatic/assault_rifle/burst_select()
	if(burst_size != 3)
		spread *= 1.2
		recoil *= 1.2
		burst_size = 3
		fire_delay++
		to_chat(usr, "<span class='notice'>You switch to burst fire.</span>")
	else
		spread /= 1.2
		recoil /= 1.2
		burst_size = 1
		fire_delay--
		to_chat(usr, "<span class='notice'>You switch to semi-auto.</span>")

	playsound(usr, 'sound/weapons/empty.ogg', 100, 1)

//R91		Keywords: 5.56mm, 10/20/30/50 Rounds, High tier
/obj/item/gun/ballistic/automatic/assault_rifle/r91
	name = "assault rifle"
	desc = "A pre-war R91 rifle manufactured for the U.S. National Guard by Stent Security Solutions. It holds its own in any fight, even today. Chambered in 5.56mm."
	icon_state = "r91"
	item_state = "r91"
	fire_sound = 'sound/f13weapons/assault_rifle.ogg'
	mag_type = /obj/item/ammo_box/magazine/m556mm

//Infiltrator		Keywords: 5.56mm, Suppressed, Medium Scope, AP, Accurate, 10/20/30/50 Rounds, Unique tier
/obj/item/gun/ballistic/automatic/assault_rifle/r91/infiltrator
	name = "\improper Infiltrator"
	desc = "An especially tuned and modified R91 rifle manufactured by Stent Security Solutions. The name's Plissken. Chambered in 5.56mm."
	icon_state = "infiltrator"
	item_state = "infiltrator"
	fire_sound = 'sound/f13weapons/infiltrator.ogg'
	init_mag_type = /obj/item/ammo_box/magazine/m556mm/extended
	spread = 4
	recoil = 0.6
	extra_penetration = 0.3		//30% AP
	zoomable = TRUE
	zoom_amt = 8
	zoom_out_amt = 11
	suppressed = TRUE
	can_unsuppress = FALSE

//AK-112		Keywords: 5mm, 30/50 Rounds, High-mid tier
/obj/item/gun/ballistic/automatic/assault_rifle/ak112
	name = "cheap assault rifle"
	desc = "An AK-112 assault rifle manufactured by Colt with designs imported from the Soviet Union. It was replaced by the Colt R91 in U.S. Army service before the war. Chambered in 5mm."
	icon_state = "ak112"
	item_state = "handmade_rifle"
	fire_sound = 'sound/f13weapons/chinese_assault_rifle.ogg'
	mag_type = /obj/item/ammo_box/magazine/m5mm
	spread = 16
	extra_damage = -5	//15 DAM

//Type 93 Assault Rifle		Keywords: 5mm, Burst, AP, 30/50 Rounds, High tier
/obj/item/gun/ballistic/automatic/assault_rifle/type93
	name = "chinese assault rifle"
	desc = "A burst-fire Type 93 rifle of Chinese design, distributed to various infiltrators and fifth-columnist cells across the U.S. before the war. The aged, rotting wood furniture doesn't instill confidence. Chambered in 5mm."
	icon_state = "type93"
	item_state = "handmade_rifle"
	fire_sound = 'sound/f13weapons/chinese_assault_rifle.ogg'
	mag_type = /obj/item/ammo_box/magazine/m5mm
	automatic = FALSE
	is_automatic = FALSE
	burst_size = 2
	fire_delay = 5
	spread = 12

//Assault Carbine		Keywords: 5mm, AP, 30/50 Rounds, Superhigh tier
/obj/item/gun/ballistic/automatic/assault_rifle/assault_carbine
	name = "assault carbine"
	desc = "A fully-automatic Colt XM-177 carbine developed for use by paratroopers and special forces. Chambered in 5mm."
	icon_state = "assault_carbine"
	item_state = "assault_carbine"
	fire_sound = 'sound/f13weapons/assault_carbine.ogg'
	mag_type = /obj/item/ammo_box/magazine/m5mm
	fire_delay = 3
	autofire_shot_delay = 2
	spread = 13

//G11		Keywords: 5mm, Caseless, Long Scope, AP, Accurate, 50 Rounds, Superhigh tier
/obj/item/gun/ballistic/automatic/assault_rifle/g11
	name = "advanced assault rifle"
	desc = "A prototype Heckler & Koch G11 developed for use in the Bundeswehr prior to the collapse of the European Commonwealth, fitted with a proprietary Hensoldt scope. Everything about this firearm is alien and foreign, and if anything broke in its archaic space-age clockwork mechanism the user should lament the fact that no one alive can fix it. Chambered in 5mm."
	icon_state = "g11"
	item_state = "g11"
	fire_sound = 'sound/f13weapons/g11.ogg'
	mag_type = /obj/item/ammo_box/magazine/mg11
	automatic = FALSE
	is_automatic = FALSE
	burst_size = 3
	fire_delay = 5
	slowdown = 0.8
	spread = 3
	recoil = 0.6
	extra_speed = 700	//700 Extra Speed
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	casing_ejector = FALSE

//FAL		Keywords: 7.62mm, 10/20 Rounds, Superhigh tier
/obj/item/gun/ballistic/automatic/assault_rifle/fal
	name = "automatic battle rifle"
	desc = "A uniquely powerful pre-war FAL PARA battle rifle developed by FN Herstal. The shorter barrel and lightweight polymer furniture made it ideal for paratroopers across the European Commonwealth. Chambered in 7.62mm."
	icon_state = "fal"
	item_state = "fal"
	fire_sound = 'sound/f13weapons/762assault_rifle.ogg'
	mag_type = /obj/item/ammo_box/magazine/m762mm
	init_mag_type = /obj/item/ammo_box/magazine/m762mm/extended
	slowdown = 0.5
	spread = 10
	recoil = 0.8

////////////////
//MACHINE GUNS//
////////////////

//MACHINE GUN TEMPLATE
/obj/item/gun/ballistic/automatic/lmg
	name = "LMG TEMPLATE"
	desc = "You're not supposed to see this."
	icon = 'icons/obj/guns/gunfruits2022/lmgs.dmi'
	icon_state = "LIGHT MACHINE GUN"
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY
	slot_flags = ITEM_SLOT_BACK
	automatic = TRUE
	autofire_shot_delay = 2
	slowdown = 1.25
	spread = 18
	force = 25
	recoil = 0.7
	actions_types = null

//R84 Light Machine Gun			Keywords: 5.56mm, 60 Rounds, High Tier
/obj/item/gun/ballistic/automatic/lmg/r84
	name = "light machine gun"
	desc = "A pre-war R84 light machine gun designed by FN Herstal and now manufactured by the NCR, commonly issued to Heavy Troopers. Intended for suppressive fire. Chambered in 5.56mm."
	icon_state = "r84"
	item_state = "r84"
	fire_sound = 'sound/f13weapons/assault_rifle.ogg'
	mag_type = /obj/item/ammo_box/magazine/lmg

//Bozar		Keywords: 5.56mm, Long Scope, Extra Projectile Speed, Accurate, 10/20/30/50 Rounds, Superhigh tier
/obj/item/gun/ballistic/automatic/lmg/bozar
	name = "machine sniper rifle"
	desc = "A bullpup Walther XM67 machine sniper rifle that has been designed from the ground up for non-stationary shooting, fitted with a collapsible stock, long-range scope, and reciprocating barrel. The 'Bozar' is the ultimate refinement of the sniper's art. Chambered in 5.56mm."
	icon_state = "bozar"
	item_state = "bozar"
	fire_sound = 'sound/f13weapons/bozar.ogg'
	mag_type = /obj/item/ammo_box/magazine/m556mm
	init_mag_type = /obj/item/ammo_box/magazine/m556mm/extended
	slowdown = 1.1
	spread = 8
	extra_speed = 500	//500 Extra Speed
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13

//Type 88 Machine Gun		Keywords: 5mm, 50 Rounds, High Tier
/obj/item/gun/ballistic/automatic/lmg/type88
	name = "chinese light machine gun"
	desc = "A Type 88 light machine gun of Chinese design, based on the original success of the Type 93 rifle. It sports a robust operating mechanism and a barrel meant to withstand extreme abuse, on top of its improved frame. Chambered in 5mm."
	icon_state = "type88"
	item_state = "handmade_rifle"
	fire_sound = 'sound/f13weapons/chinese_assault_rifle.ogg'
	mag_type = /obj/item/ammo_box/magazine/type88
	slowdown = 0.9
	spread = 20

//Colt Monitor		Keywords: 7.62mm, AP, Extra Projectile Speed, Medium Scope, Accurate, 10/20 Rounds, Heavy Gunner Exclusive
/obj/item/gun/ballistic/automatic/lmg/monitor
	name = "heavy battle rifle"
	desc = "An especially modified pre-war machine gun made for law enforcement, built on the famous BAR platform with an added pistol grip and a Cutts recoil compensator. This one has a West-Tek optical gunsight mounted. Chambered in 7.62mm."
	icon = 'icons/fallout/objects/guns/bar.dmi'
	icon_state = "monitor"
	item_state = "monitor"
	fire_sound = 'sound/f13weapons/762lmg.ogg'
	mag_type = /obj/item/ammo_box/magazine/m762mm
	init_mag_type = /obj/item/ammo_box/magazine/m762mm/extended
	autofire_shot_delay = 3
	slowdown = 1.35
	spread = 6
	recoil = 0.6
	extra_damage = -5			//30 DAM
	extra_penetration = 0.2		//20% AP
	extra_speed = 200			//200 Extra Speed
	zoomable = TRUE
	zoom_amt = 8
	zoom_out_amt = 11

//M1919		Keywords: 7.62mm, 80 Rounds, Centurion Exclusive
/obj/item/gun/ballistic/automatic/lmg/m1919
	name = "stinger heavy machine gun"
	desc = "A salvaged AN/M2 variant of the M1919 Browning initially meant for use in aircraft that has been turned into a man-portable killing machine. It has a shoulder stock cut from a brush gun with the addition of rear sights and a bipod from a different machine gun, as well as a solenoid trigger. The Legion's infamous bull is carved on the receiver."
	icon_state = "hmg"
	item_state = "M38"
	fire_sound = 'sound/f13weapons/762lmg.ogg'
	mag_type = /obj/item/ammo_box/magazine/mm762
	slowdown = 1.5
	spread = 20
	var/cover_open = FALSE

/obj/item/gun/ballistic/automatic/lmg/m1919/update_icon()
	icon_state = "hmg[cover_open ? "open" : "closed"][magazine ? CEILING(get_ammo(0)/20, 1)*20 : "-empty"]"
	item_state = "M38[cover_open ? "open" : "closed"][magazine ? "mag" : "nomag"]"

/obj/item/gun/ballistic/automatic/lmg/m1919/examine(mob/user)
	. = ..()
	if(cover_open && magazine)
		. += "<span class='notice'>It seems like you could use an <b>empty hand</b> to remove the ammo belt.</span>"

/obj/item/gun/ballistic/automatic/lmg/m1919/attack_self(mob/user)
	cover_open = !cover_open
	to_chat(user, "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>")
	if(cover_open)
		playsound(user, 'sound/weapons/sawopen.ogg', 60, 1)
	else
		playsound(user, 'sound/weapons/sawclose.ogg', 60, 1)
	update_icon()

/obj/item/gun/ballistic/automatic/lmg/m1919/afterattack(atom/target as mob|obj|turf, mob/living/user as mob|obj, flag, params) //what I tried to do here is just add a check to see if the cover is open or not and add an icon_state change because I can't figure out how c-20rs do it with overlays
	if(cover_open)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it to fire!</span>")
	else
		. = ..()
		update_icon()

/obj/item/gun/ballistic/automatic/lmg/m1919/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(loc != user)
		..()
		return	//let them pick it up
	if(!cover_open || (cover_open && !magazine))
		..()
	else if(cover_open && magazine)
		//drop the mag
		magazine.update_icon()
		magazine.forceMove(drop_location())
		user.put_in_hands(magazine)
		magazine = null
		update_icon()
		to_chat(user, "<span class='notice'>You remove the ammo belt from [src].</span>")
		playsound(user, 'sound/weapons/magout.ogg', 60, 1)

/obj/item/gun/ballistic/automatic/lmg/m1919/attackby(obj/item/A, mob/user, params)
	if(!cover_open && istype(A, mag_type))
		to_chat(user, "<span class='warning'>[src]'s cover is closed! You can't swap out the ammo belts.</span>")
		return
	..()

////////
//MISC//
////////

//M72 Gauss rifle
/obj/item/gun/ballistic/automatic/m72
	name = "\improper M72 gauss rifle"
	desc = "The M72 rifle is of German design. It uses an electromagnetic field to propel rounds at tremendous speed... and pierce almost any obstacle. Its range, accuracy and stopping power is almost unparalleled."
	icon_state = "m72"
	item_state = "sniper"
	slot_flags = SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/m2mm
	burst_size = 1
	fire_delay = 11
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	recoil = 2
	semi_auto = TRUE
	fire_sound = 'sound/f13weapons/gauss_rifle.ogg'

///////////////////////
// G R A V E Y A R D //
///////////////////////

//Guns in this section are, for code purposes, still existing. However, they shouldn't be spawned and won't be upkept.
//This is incase of

// Enfield SLR				Keywords: 7.62mm, Semi-auto, 10/20 round magazine
/obj/item/gun/ballistic/automatic/slr
	name = "Enfield SLR"
	desc = "A self-loading rifle in 7.62mm NATO. Semi-auto only."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "slr"
	item_state = "slr"
	force = 20
	mag_type = /obj/item/ammo_box/magazine/m762mm
	burst_size = 1
	fire_delay = 6
	slowdown = 0.25
	spread = 1
	automatic_burst_overlay = FALSE
	semi_auto = TRUE
	can_attachments = TRUE
	can_scope = TRUE
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 24
	knife_y_offset = 21
	scope_state = "scope_long"
	scope_x_offset = 4
	scope_y_offset = 11
	fire_sound = 'sound/f13weapons/762rifle.ogg'

//M1 Carbine				Keywords: 10mm, Semi-auto, 12/24 rounds, Long barrel
/obj/item/gun/ballistic/automatic/m1carbine
	name = "M1 carbine"
	desc = "The M1 Carbine was mass produced during some old war, and at some point NCR found stockpiles and rechambered them to 10mm to make up for the fact their service rifle production can't keep up with demand."
	icon_state = "m1carbine"
	item_state = "rifle"
	mag_type = /obj/item/ammo_box/magazine/msmg10mm
	burst_size = 1
	fire_delay = 3
	spread = 2
	slowdown = 0.05
	automatic_burst_overlay = FALSE
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 22
	knife_y_offset = 21
	can_scope = TRUE
	scope_state = "scope_medium"
	scope_x_offset = 5
	scope_y_offset = 14
	can_attachments = TRUE
	can_automatic = TRUE
	semi_auto = TRUE
	can_suppress = TRUE
	suppressor_state = "rifle_suppressor"
	suppressor_x_offset = 26
	suppressor_y_offset = 31
	fire_sound = 'sound/f13weapons/varmint_rifle.ogg'
	extra_damage = 6

//M1/n Carbine				Keywords: NCR, 10mm, Semi-auto, 30 rounds, Long barrel, Damage +1
/obj/item/gun/ballistic/automatic/m1carbine/m1n
	name = "M1/N carbine"
	desc = "An M1 Carbine with markings identifying it as issued to the NCR Mojave Expedtionary Force. Looks beat up but functional."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "ncr-m1carbine"
	item_state = "rifle"

//M1A1 Carbine				Keywords: 10mm, Semi-auto, 30 rounds, Long barrel, Folding stock.
/obj/item/gun/ballistic/automatic/m1carbine/compact
	name = "M1A1 carbine"
	desc = "The M1A1 carbine is an improvement of the original, with this particular model having a folding stock allowing for greater mobility. Chambered in 10mm."
	icon_state = "m1a1carbine"
	var/stock = FALSE
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/gun/ballistic/automatic/m1carbine/compact/AltClick(mob/user)
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	toggle_stock(user)

/obj/item/gun/ballistic/automatic/m1carbine/compact/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Alt-click to toggle the stock.</span>"

/obj/item/gun/ballistic/automatic/m1carbine/compact/proc/toggle_stock(mob/living/user)
	stock = !stock
	if(stock)
		w_class = WEIGHT_CLASS_BULKY
		to_chat(user, "You unfold the stock.")
		spread = 2
	else
		w_class = WEIGHT_CLASS_NORMAL
		to_chat(user, "You fold the stock.")
		recoil = 0.5
		spread = 5
	update_icon()

/obj/item/gun/ballistic/automatic/m1carbine/compact/update_icon_state()
	icon_state = "[initial(icon_state)][magazine ? "-[magazine.max_ammo]" : ""][chambered ? "" : "-e"][stock ? "" : "-f"]"

//HEAVY SERVICE RIFLE				Keywords: 5.56mm, Semi-auto, 20 (10-50) round magazine	NOW CANON!
/obj/item/gun/ballistic/automatic/service/r82
	name = "upgraded service rifle"
	desc = "A fully-automatic service rifle with a heavier barrel, and upgraded recoil springs. Issued to high-ranking troopers and specialized units. Chambered in 5.56."
	icon_state = "m16a1"
	item_state = "servicerifle"
	icon_prefix = "m16a1"
	fire_delay = 4
	is_automatic = TRUE
	slowdown = 0.3
	automatic = 1
	autofire_shot_delay = 3
	spread = 10
	can_suppress = TRUE
	suppressor_state = "rifle_suppressor"
	suppressor_x_offset = 27
	suppressor_y_offset = 28

//De Lisle carbine							Keywords: Pre-war, 9mm, Long barrel, Suppressed
/obj/item/gun/ballistic/automatic/delisle
	name = "De Lisle carbine"
	desc = "A integrally suppressed carbine, known for being one of the quietest firearms ever made. Chambered in 9mm."
	icon_state = "delisle"
	item_state = "varmintrifle"
	mag_type = /obj/item/ammo_box/magazine/m9mmds
	slowdown = 0.05
	fire_delay = 4
	burst_size = 1
	spread = 0
	can_scope = FALSE
	can_unsuppress = FALSE
	suppressed = 1
	fire_sound = 'sound/weapons/Gunshot_large_silenced.ogg'

//Commando carbine (BoS De Lisle variant)							Keywords: BoS, .45 ACP, 12 round magazine, Long barrel, Suppressed
/obj/item/gun/ballistic/automatic/delisle/commando
	name = "commando carbine"
	desc = "A integrally suppressed carbine, known for being one of the quietest firearms ever made. This modified version is often used by the Brotherhood of Steel. Its stock has been replaced by post-war polymer furniture, with space to mount a scope. Chambered in .45 ACP."
	icon_state = "commando"
	item_state = "commando"
	mag_type = /obj/item/ammo_box/magazine/m45exp
	can_scope = TRUE
	semi_auto = TRUE
	automatic_burst_overlay = FALSE
	scope_state = "scope_medium"
	scope_x_offset = 6
	scope_y_offset = 14
