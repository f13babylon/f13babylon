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
	desc = "should not exist"
	icon = 'icons/obj/guns/gunfruits2022/smgs.dmi'
	icon_state = "MP5"
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_HEAVY
	automatic = TRUE
	is_automatic = TRUE
	fire_delay = 3
	autofire_shot_delay = 2
	slowdown = 0.15
	spread = 14
	force = 12
	recoil = 0.65
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

//American 180			Keywords: .22 LR, Supressed, Bullethose, 180 Round drum, Bulky, Low-mid tier
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
	slowdown = 0.25
	spread = 25
	suppressed = 1
	can_unsuppress = TRUE	//Without can_suppress only results in a better examine message

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
	slowdown = 0.12
	spread = 20
	extra_damage = -2	//14 DAM
	recoil = 0.85

//MP5			Keywords: 9mm, Suppressed, Dual-wieldable on semi-auto, AP, Accurate, 32/50 Rounds, Normal, High-mid tier
/obj/item/gun/ballistic/automatic/smg/mp5
	name = "advanced 9mm SMG"
	desc = "An integrally suppressed MP5SD6 made by Heckler & Koch, renowned for its accuracy in comparison to other machine guns of its type."
	icon_state = "mp5"
	item_state = "fnfal"
	fire_sound = 'sound/weapons/Gunshot_large_silenced.ogg'
	mag_type = /obj/item/ammo_box/magazine/msmg9mm
	spread = 6
	extra_damage = 2	//18 DAM
	extra_penetration = 0.15	//15% AP
	suppressed = 1
	can_unsuppress = TRUE	//Without can_suppress only results in a better examine message
	recoil = 0.55

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
	slowdown = 0.3
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
	fire_sound = 'sound/f13weapons/smg_loud.ogg'
	w_class = WEIGHT_CLASS_BULKY
	mag_type = /obj/item/ammo_box/magazine/mp90
	slowdown = 0.2
	spread = 13
	extra_damage = -5		//15 DAM
	extra_penetration = -0.15	//30% AP

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
	recoil = 0.85
	extra_penetration = 0.05	//5% AP

////////////
//CARBINES//
////////////

//M1 Carbine				Keywords: 10mm, Semi-auto, 12/24 rounds, Long barrel
/obj/item/gun/ballistic/automatic/m1carbine
	name = "M1 carbine"
	desc = "The M1 Carbine was mass produced during some old war, and at some point NCR found stockpiles and rechambered them to 10mm to make up for the fact their service rifle production can't keep up with demand."
	icon_state = "m1carbine"
	item_state = "rifle"
	mag_type = /obj/item/ammo_box/magazine/m10mm
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


//M1/n Carbine				Keywords: NCR, 10mm, Semi-auto, 12/24 rounds, Long barrel, Damage +1
/obj/item/gun/ballistic/automatic/m1carbine/m1n
	name = "M1/N carbine"
	desc = "An M1 Carbine with markings identifying it as issued to the NCR Mojave Expedtionary Force. Looks beat up but functional."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "ncr-m1carbine"
	item_state = "rifle"


//M1A1 Carbine				Keywords: 10mm, Semi-auto, 12/24 rounds, Long barrel, Folding stock.
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


////////////////////
//SEMI-AUTO RIFLES//
////////////////////

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

//Combat Carbine	Keywords: .45 Caliber Rifle, Town rifle
/obj/item/gun/ballistic/automatic/combatcarbine
	name = "Combat Carbine"
	desc = "A .45 semi-automatic combat carbine, produced pre-war for National Guard forces."
	icon_state = "combat_c"
	item_state = "combatrifle"
	icon_prefix = "combatrifle"
	mag_type = /obj/item/ammo_box/magazine/tommygunm45/stick
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
	desc = "A 5.56x45 semi-automatic service rifle manufactured by the NCR and issued to all combat personnel."
	icon_state = "service_rifle"
	item_state = "servicerifle"
	icon_prefix = "servicerifle"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	slowdown = 0.15
	fire_delay = 4
	burst_size = 1
	spread = 1
	can_attachments = TRUE
	automatic_burst_overlay = FALSE
	semi_auto = TRUE
	can_bayonet = TRUE
	bayonet_state = "bayonet"
	knife_x_offset = 22
	knife_y_offset = 21
	fire_sound = 'sound/f13weapons/varmint_rifle.ogg'

//Scout carbine			Keywords: NCR, 5.56mm, Semi-auto, 20 (10-50) round magazine. Special modifiers: spread -1
/obj/item/gun/ballistic/automatic/service/carbine
	name = "scout carbine"
	desc = "A cut down version of the standard-issue service rifle tapped with mounting holes for a scope. Shorter barrel, lower muzzle velocity."
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
	desc = "A marksman carbine built off the AR platform chambered in 5.56x45. Seen heavy usage in pre-war conflicts. This particular model is a civilian version and is semi-auto only."
	icon_state = "marksman_rifle"
	item_state = "marksman"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
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
	mag_type = /obj/item/ammo_box/magazine/m762
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
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'
	extra_penetration = 0.2


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
	mag_type = /obj/item/ammo_box/magazine/m762
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
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'


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
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'

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

//Republics Pride			Keywords: UNIQUE, 7.62mm, Semi-auto, 8 rounds internal, Scoped, Damage +8, Penetration +0.1
/obj/item/gun/ballistic/automatic/m1garand/republicspride
	name = "Republic's Pride"
	desc = "A well-tuned scoped M1C rifle crafted by master gunsmith from the Gunrunners. Chambered in 7.62x51."
	icon_state = "republics_pride"
	item_state = "scoped308"
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	fire_delay = 1.5
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
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'


//DKS 501 sniper rifle				Keywords: .308, Semi-auto, 7 round magazine, Scoped, Extra speed +500, Fire delay +1, 43dmg
/obj/item/gun/ballistic/automatic/marksman/sniper
	name = "sniper rifle"
	desc = "A DKS 501, chambered in .308 Winchester.  With a light polymer body, it's suited for long treks through the desert."
	icon_prefix = "sniperrifle"
	icon_state = "sniper_rifle"
	item_state = "sniper_rifle"
	mag_type = /obj/item/ammo_box/magazine/w308
	fire_delay = 7
	burst_size = 1
	extra_speed = 900
	slowdown = 0.3
	zoom_amt = 10
	zoom_out_amt = 13
	semi_auto = TRUE
	can_automatic = FALSE
	can_bayonet = FALSE
	fire_sound = 'sound/f13weapons/hunting_rifle.ogg'
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


//R91 assault rifle				Keywords: 5.56mm, Automatic, 20 (10-50) round magazine, 25dmg
/obj/item/gun/ballistic/automatic/assault_rifle
	name = "r91 assault rifle"
	desc = "The R91 was the standard US Army assault rifle, and so saw wide-spread use after the war. Most are worn out by now."
	icon_state = "assault_rifle"
	item_state = "fnfal"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	fire_delay = 3
	slowdown = 0.35
	spread = 6
	recoil = 0.1
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2.5
	can_attachments = TRUE
	can_bayonet = FALSE
	bayonet_state = "rifles"
	knife_x_offset = 23
	knife_y_offset = 11
	can_suppress = TRUE
	suppressor_x_offset = 32
	suppressor_y_offset = 15
	suppressor_state = "ar_suppressor"
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/varmint_rifle.ogg'


//Infiltrator			Keywords: 5.56mm, Automatic, 20 (10-50) round magazine, Suppressed, Small scope, Pistol grip
/obj/item/gun/ballistic/automatic/assault_rifle/infiltrator
	name = "infiltrator"
	desc = "A customized R91 assault rifle, with an integrated suppressor, small scope, cut down stock and polymer furniture."
	icon_state = "infiltrator"
	item_state = "fnfal"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	spread = 7
	fire_delay = 4
	burst_shot_delay = 2
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2
	recoil = 0.6
	can_suppress = FALSE
	can_unsuppress = FALSE
	suppressed = 1
	can_bayonet = FALSE
	can_scope = FALSE
	zoomable = TRUE
	zoom_amt = 6
	zoom_out_amt = 9
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/weapons/Gunshot_large_silenced.ogg'


//R93 PDW		Keywords: 5.56mm, Semi-Automatic, 20 (10-50) round magazine, Pistol grip
/obj/item/gun/ballistic/automatic/r93
	name = "R93 PDW"
	desc = "A lightweight assault rifle manufactured by the Brotherhood of Steel with a folding stock, based on weapons from the R-series platforms. It is generally issued to Brotherhood Knights for scouting missions."
	icon_state = "r93"
	item_state = "r93"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	fire_delay = 3
	spread = 1
	burst_size = 1
	can_attachments = FALSE
	semi_auto = TRUE
	automatic_burst_overlay = FALSE
	can_scope = FALSE
	zoomable = TRUE
	zoom_amt = 6
	zoom_out_amt = 9
	can_bayonet = TRUE
	fire_sound = 'sound/weapons/Gunshot_large_silenced.ogg'
	slowdown = 0.15

//Type 93 Chinese rifle				Keywords: 5.56mm, Automatic, 20 (10-50) round magazine, 26dmg
/obj/item/gun/ballistic/automatic/type93
	name = "type 93 assault rifle"
	desc = "The Type 93 Chinese assault rifle was designed and manufactured by a Chinese industrial conglomerate for the People's Liberation Army during the Resource Wars, for the purpose of equipping the Chinese infiltrators and American fifth-columnists. Chambered in 5.56x45."
	icon_state = "type93"
	item_state = "handmade_rifle"
	icon_prefix = "handmade_rifle"
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	fire_delay = 4
	spread = 10
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 3
	recoil = 0.1
	can_suppress = TRUE
	suppressor_state = "rifle_suppressor"
	suppressor_x_offset = 27
	suppressor_y_offset = 27
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'

/obj/item/gun/ballistic/automatic/type93/worn //24dmg
	name = "\improper Worn Type 93"
	desc = "This Type 93 Chinese assault rifle looks like it has been made in a garage. The bore is shot to hell, the threading is destroyed, but atleast it works."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	icon_state = "type93"
	item_state = "handmade_rifle"
	fire_delay = 5
	spread = 13
	can_suppress = FALSE


//Bozar					Keywords: 5.56mm, Automatic, 20 (10-50) round magazine
/obj/item/gun/ballistic/automatic/bozar
	name = "Bozar"
	desc = "The ultimate refinement of the sniper's art, the Bozar is a scoped, accurate, light machine gun that will make nice big holes in your enemy. Uses 5.56."
	icon_state = "bozar"
	item_state = "sniper"
	slot_flags = SLOT_BACK
	mag_type = /obj/item/ammo_box/magazine/m556/rifle
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2
	burst_shot_delay = 1.5
	fire_delay = 5
	spread = 8
	recoil = 0.1
	can_attachments = FALSE
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	can_scope = FALSE
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/bozar_fire.ogg'
	extra_damage = -3


//Assault Carbine				Keywords: 5mm, Automatic, 30 round magazine, Flashlight, 20dmg/0.50AP
/obj/item/gun/ballistic/automatic/assault_carbine
	name = "assault carbine"
	desc = "The U.S. army carbine version of the R91, made by Colt and issued to special forces."
	icon_state = "assault_carbine"
	item_state = "assault_carbine"
	icon_prefix = "assault_carbine"
	slowdown = 0.25
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/m5mm
	fire_delay = 4
	burst_shot_delay = 1.8
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 1.75
	spread = 18 //high-velocity
	can_attachments = TRUE
	can_scope = TRUE //guh
	scope_state = "scope_short"
	scope_x_offset = 4
	scope_y_offset = 15
	can_suppress = TRUE
	suppressor_state = "rifle_suppressor"
	suppressor_x_offset = 26
	suppressor_y_offset = 28
	can_flashlight = TRUE
	gunlight_state = "flightangle"
	flight_x_offset = 21
	flight_y_offset = 21
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/assault_carbine.ogg'

	//Renamed Police Rifle			Keywords: NCR, 5mm, Semi-auto, 30 round magazine
/obj/item/gun/ballistic/automatic/assault_carbine/policerifle
	name = "R92 Assault Rifle"
	desc = "A pre-War rifle maintained and upkept by the Gun Runners. This one has seen a fair few battles."
	icon = 'icons/fallout/objects/guns/ballistic.dmi'
	lefthand_file = 'icons/fallout/onmob/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/fallout/onmob/weapons/guns_righthand.dmi'
	icon_state = "rifle-police"
	autofire_shot_delay = 2.55
	spread = 8 //more accurate than the assault carbine, its a rifle
	can_scope = TRUE
	extra_penetration = -0.15
	extra_damage = -3

/obj/item/gun/ballistic/automatic/assault_carbine/worn
	name = "worn assault carbine"
	desc = "The U.S. army carbine version of the R91, made by Colt and issued to special forces. This one is beat-up and falling apart."
	icon_state = "assault_carbine"
	fire_delay = 5
	burst_shot_delay = 2.2
	spread = 18
	autofire_shot_delay = 1.85
	extra_penetration = -0.05

//FN-FAL				Keywords: 7.62mm, Automatic, 10/20 round magazine
/obj/item/gun/ballistic/automatic/fnfal
	name = "FN FAL"
	desc = "This rifle has been more widely used by armed forces than any other rifle in history. It's a reliable assault weapon for any terrain or tactical situation."
	icon_state = "fnfal"
	item_state = "fnfal"
	force = 20
	extra_speed = 100
	fire_delay = 5
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 1.9
	mag_type = /obj/item/ammo_box/magazine/m762
	spread = 12 //infamously hard to control on full-auto
	recoil = 0.25
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'

//H&K G11				Keywords: 4.73mm, Automatic, 50 round magazine
/obj/item/gun/ballistic/automatic/g11
	name = "G11"
	desc = "This experimental gun fires a caseless cartridge consisting of a block of propellant with a bullet buried inside. The weight and space savings allows for a very high magazine capacity. Chambered in 4.73mm. \
	Given the rarity, it's usually seen in the hands of pre-war fanatics."
	icon_state = "g11"
	item_state = "arg"
	mag_type = /obj/item/ammo_box/magazine/m473
	burst_size = 1
	fire_delay = 4
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 1.5
	burst_shot_delay = 1.5
	spread = 8
	recoil = 0.1
	can_attachments = TRUE
	semi_auto = TRUE
	can_scope = FALSE
	zoomable = TRUE
	zoom_amt = 10
	zoom_out_amt = 13
	actions_types = list(/datum/action/item_action/toggle_firemode)
	select = 0

//H&K G11E				Keywords: 4.73mm, Automatic, 50 round magazine
/obj/item/gun/ballistic/automatic/g11/g11e
	name = "G11E"
	desc = "The rifle to rival its older brother, which is a challenge in and of itself. Yet it surpasses even that, somehow. \
	There are markings along the side of the barrel, indicating it belongs to a 'Lieutenant' of some sort. Whatever that means."
	icon_state = "g11e"
	spread = 2
	can_unsuppress = FALSE
	suppressed = 1
	fire_sound = 'sound/weapons/Gunshot_large_silenced.ogg'

////////////////
//MACHINE-GUNS//
////////////////


//R84 Light machinegun				Keywords: NCR, 5.56mm, Automatic, 60 rounds
/obj/item/gun/ballistic/automatic/r84
	name = "light machine gun"
	desc = "An NCR-made FN R84 SAW chambered in 5.56mm, made for sustained fire. It's loaded with 60-round ammo boxes and it's as heavy as the people usually seen carrying one."
	icon = 'icons/obj/guns/gunfruits2022/lmg.dmi'
	icon_state = "r84"
	item_state = "R84"
	slowdown = 1.25
	recoil = 0.5
	mag_type = /obj/item/ammo_box/magazine/lmg
	fire_delay = 3
	burst_shot_delay = 3
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2
	spread = 18
	can_attachments = FALSE
	actions_types = null
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	extra_penetration = 0.05

//BAR
/obj/item/gun/ballistic/automatic/bar
	name = "FN Model D"
	desc = "An exceedingly heavy light machine gun based on the BAR platform, featuring the blessing of Belgian gunsmithing. It's the last, and best of its kind in regards to quality and reliability."
	icon = 'icons/fallout/objects/guns/bar.dmi'
	slot_flags = ITEM_SLOT_BACK
	icon_state = "BAR"
	item_state = "BAR"
	icon_prefix = "rifle"
	automatic = 1
	mag_type = /obj/item/ammo_box/magazine/m762/ext
	force = 24
	slowdown = 1.5
	autofire_shot_delay = 1.7
	spread = 10
	recoil = 0.85
	actions_types = list(/datum/action/item_action/toggle_firemode)
	fire_sound = 'sound/f13weapons/automaticrifle_BAR.ogg'
	extra_penetration = 0.25

//HT BAR
/obj/item/gun/ballistic/automatic/bar/glowie
	name = "Colt Monitor"
	desc = "An especially modified light machine gun built on the BAR with an added pistol grip and a Cutts recoil compensator. This one features a West-Tek marksman scope and its receiver bears a red star."
	slowdown = 1.35
	autofire_shot_delay = 2.45
	spread = 5
	recoil = 0.2
	extra_speed = 100
	zoomable = TRUE
	zoom_amt = 8
	zoom_out_amt = 9
	icon_state = "MONITOR"
	item_state = "BAR"
	extra_damage = -4	//For 30 total
	extra_penetration = 0.15

//CHINESE LMG
/obj/item/gun/ballistic/automatic/rpd
	name = "chinese light machine gun"
	desc = "A restored variant of the chinese assault rifle re-chambered to 5mm that feeds from drums, featuring a heavy barrel and a full stock to go with its improved internal mechanism."
	icon = 'icons/obj/guns/gunfruits2022/lmg.dmi'
	icon_state = "rpd"
	item_state = "handmade_rifle"
	slowdown = 0.6
	recoil = 0.5
	mag_type = /obj/item/ammo_box/magazine/rpd
	fire_delay = 4
	burst_shot_delay = 3
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 1.9
	spread = 20
	can_attachments = FALSE
	actions_types = null
	fire_sound = 'sound/f13weapons/assaultrifle_fire.ogg'
	extra_penetration = -0.15 //For a total of 30%

//M1919 Machinegun				Keywords: LEGION, .308, Automatic, 80 round belt.
/obj/item/gun/ballistic/automatic/m1919
	name = "stinger heavy machine gun"
	desc = "A salvaged AN/M2 variant of the M1919 Browning initially meant for use in aircraft that has been turned into a man-portable killing machine. It has a shoulder stock cut from a brush gun with the addition of rear sights and a bipod from a different machine gun, as well as a solenoid trigger. The Legion's infamous bull is carved on the receiver."
	icon = 'icons/obj/guns/gunfruits2022/lmg.dmi'
	icon_state = "hmg"
	item_state = "M38"
	slot_flags = 0
	slowdown = 1.5
	mag_type = /obj/item/ammo_box/magazine/mm762
	burst_shot_delay = 1.5
	is_automatic = TRUE
	automatic = 1
	autofire_shot_delay = 2
	fire_delay = 3
	spread = 20
	can_attachments = FALSE
	var/cover_open = FALSE
	var/require_twohands = FALSE
	actions_types = null
	fire_sound = 'sound/f13weapons/automaticrifle_BAR.ogg'

/obj/item/gun/ballistic/automatic/m1919/update_icon()
	icon_state = "hmg[cover_open ? "open" : "closed"][magazine ? CEILING(get_ammo(0)/20, 1)*20 : "-empty"]"
	item_state = "hmg[cover_open ? "open" : "closed"][magazine ? "mag" : "nomag"]"

/obj/item/gun/ballistic/automatic/m1919/examine(mob/user)
	. = ..()
	if(cover_open && magazine)
		. += "<span class='notice'>It seems like you could use an <b>empty hand</b> to remove the ammo belt.</span>"

/obj/item/gun/ballistic/automatic/m1919/attack_self(mob/user)
	cover_open = !cover_open
	to_chat(user, "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>")
	if(cover_open)
		playsound(user, 'sound/weapons/sawopen.ogg', 60, 1)
	else
		playsound(user, 'sound/weapons/sawclose.ogg', 60, 1)
	update_icon()

/obj/item/gun/ballistic/automatic/m1919/afterattack(atom/target as mob|obj|turf, mob/living/user as mob|obj, flag, params) //what I tried to do here is just add a check to see if the cover is open or not and add an icon_state change because I can't figure out how c-20rs do it with overlays
	if(cover_open)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it to fire!</span>")
	else
		. = ..()
		update_icon()

/obj/item/gun/ballistic/automatic/m1919/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
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

/obj/item/gun/ballistic/automatic/m1919/attackby(obj/item/A, mob/user, params)
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
