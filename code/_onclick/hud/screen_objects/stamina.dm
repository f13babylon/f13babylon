/datum/hud/var/atom/movable/screen/staminas/staminas
/datum/hud/var/atom/movable/screen/staminabuffer/staminabuffer

/atom/movable/screen/staminas
	icon = 'modular_citadel/icons/ui/screen_gen.dmi'
	name = "stamina"
	icon_state = "stamina0"
	screen_loc = ui_stamina
	mouse_opacity = 1

/atom/movable/screen/staminas/Click(location,control,params)
	if(isliving(usr))
		var/mob/living/L = usr
		to_chat(L, "<span class='notice'>You have <b>[L.getStaminaLoss()]</b> stamina loss.<br>Your stamina buffer can take <b>[L.stambuffer]</b> stamina loss, and recharges at no cost.<br>Your stamina buffer is <b>[(L.stambuffer*(100/L.stambuffer))-(L.bufferedstam*(100/L.stambuffer))]%</b> full.</span>")

/atom/movable/screen/staminas/update_icon()
	// todo: report back if this causes lag
	// it probably shouldn't, because the relevant code calls update_icon_state directly
	// so this should just run when ui style is changed
	. = ..()
	icon = tg_ui_icon_to_cit_ui(icon) // no-op if it's already set or unsupported

/atom/movable/screen/staminas/update_icon_state()
	var/mob/living/carbon/user = hud?.mymob
	if(!user)
		return
	if(user.stat == DEAD || (user.combat_flags & COMBAT_FLAG_HARD_STAMCRIT) || (user.hal_screwyhud in 1 to 2))
		icon_state = "staminacrit"
	else if(user.hal_screwyhud == 5)
		icon_state = "stamina0"
	else
		icon_state = "stamina[clamp(FLOOR(user.getStaminaLoss() /20, 1), 0, 6)]"

//stam buffer
/atom/movable/screen/staminabuffer
	icon = 'modular_citadel/icons/ui/screen_gen.dmi'
	name = "stamina buffer"
	icon_state = "stambuffer0"
	screen_loc = ui_stamina
	layer = ABOVE_HUD_LAYER + 0.1
	mouse_opacity = 0

/atom/movable/screen/staminabuffer/update_icon()
	// todo: report back if this causes lag
	// it probably shouldn't, because the relevant code calls update_icon_state directly
	// so this should just run when ui style is changed
	. = ..()
	icon = tg_ui_icon_to_cit_ui(icon) // no-op if it's already set or unsupported

/atom/movable/screen/staminabuffer/update_icon_state()
	var/mob/living/carbon/user = hud?.mymob
	if(!user)
		return
	if(user.stat == DEAD || (user.combat_flags & COMBAT_FLAG_HARD_STAMCRIT) || (user.hal_screwyhud in 1 to 2))
		icon_state = "stambuffer7"
	else if(user.hal_screwyhud == 5)
		icon_state = "stambuffer0"
	else
		switch(user.bufferedstam / user.stambuffer)
			if(0.95 to INFINITY)
				icon_state = "stambuffer7"
			if(0.9 to 0.95)
				icon_state = "stambuffer6"
			if(0.8 to 0.9)
				icon_state = "stambuffer5"
			if(0.6 to 0.8)
				icon_state = "stambuffer4"
			if(0.4 to 0.6)
				icon_state = "stambuffer3"
			if(0.2 to 0.4)
				icon_state = "stambuffer2"
			if(0.05 to 0.2)
				icon_state = "stambuffer1"
			else
				icon_state = "stambuffer0"
