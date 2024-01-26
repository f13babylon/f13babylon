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
