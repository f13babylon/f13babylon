//The code execution of the emote datum is located at code/datums/emotes.dm
/mob/proc/emote(act, m_type = null, message = null, intentional = FALSE)
	var/input_text = lowertext(act)
	var/param = message
	var/custom_param = findchar(input_text, " ")
	if(custom_param)
		param = copytext(act, custom_param + length(act[custom_param]))
		input_text = copytext(input_text, 1, custom_param)

	var/datum/emote/E
	E = E.emote_list[input_text]
	if(!E)
		to_chat(src, "<span class='notice'>Unusable emote '[act]'. Say *help for a list.</span>")
		return
	E.run_emote(src, param, m_type, intentional)

/mob/proc/do_checks(message)
	if(!length(message))
		return FALSE

	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return FALSE

	if(length(message) > MAX_MESSAGE_LEN)
		to_chat(usr, message)
		to_chat(usr, "<span class='danger'>^^^----- The preceeding message has been DISCARDED for being over the maximum length of [MAX_MESSAGE_LEN]. It has NOT been sent! -----^^^</span>")
		return FALSE

	if(usr.stat == SOFT_CRIT || usr.stat == UNCONSCIOUS || usr.stat == DEAD)
		to_chat(usr, "<span class='notice'>You cannot Do in your current condition.</span>")
		return FALSE

	usr.log_message(message, LOG_EMOTE)
	usr.emote_for_ghost_sight(message)		//If all these checks have passed, might as well log the message now
	return TRUE

/datum/emote/spin
	key = "spin"
	key_third_person = "spins"
	restraint_check = TRUE
	mob_type_allowed_typecache = list(/mob/living, /mob/dead/observer)
	mob_type_ignore_stat_typecache = list(/mob/dead/observer)

/datum/emote/spin/run_emote(mob/user)
	. = ..()
	if(.)
		user.spin(20, 1)

		if(iscyborg(user) && user.has_buckled_mobs())
			var/mob/living/silicon/robot/R = user
			var/datum/component/riding/riding_datum = R.GetComponent(/datum/component/riding)
			if(riding_datum)
				for(var/mob/M in R.buckled_mobs)
					riding_datum.force_dismount(M)
			else
				R.unbuckle_all_mobs()

/datum/emote/flip
	key = "flip"
	key_third_person = "flips"
	restraint_check = TRUE
	mob_type_allowed_typecache = list(/mob/living, /mob/dead/observer)
	mob_type_ignore_stat_typecache = list(/mob/dead/observer)

/datum/emote/flip/run_emote(mob/user, params)
	. = ..()
	if(.)
		user.SpinAnimation(7,1)

/datum/emote/flip/run_emote(mob/living/user, params)
	if(ishuman(user))
		user.adjustStaminaLoss(5)
	. = ..()
