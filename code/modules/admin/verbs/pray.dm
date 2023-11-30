/mob/verb/pray(msg as text)
	set category = "IC"
	set name = "Pray"

	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return

	msg = copytext_char(sanitize(msg), 1, MAX_MESSAGE_LEN)
	if(!msg)
		return
	log_prayer("[src.key]/([src.name]): [msg]")
	if(usr.client)
		if(usr.client.prefs.muted & MUTE_PRAY)
			to_chat(usr, "<span class='danger'>You cannot pray (muted).</span>")
			return
		if(src.client.handle_spam_prevention(msg,MUTE_PRAY))
			return

	var/mutable_appearance/icon = mutable_appearance('icons/obj/storage.dmi', "bible")
	var/prayer_type = "PRAYER"
	var/prayer_span = "prayer"
	var/sound/prayer_sound = sound(get_sfx('sound/effects/ghost2.ogg'))
	var/deity
	if(usr.job == "Preacher")
		icon.icon_state = "kingyellow"
		prayer_type = "PREACHER PRAYER"
		prayer_span = "preacher_prayer"
		prayer_sound = sound(get_sfx('sound/effects/pray_chaplain.ogg'))
		if(GLOB.deity)
			deity = GLOB.deity
	if(usr.job == "Legion Orator" || usr.job == "Legion Priestess")
		icon = mutable_appearance('icons/obj/statue.dmi', "marsred")
		prayer_type = "LEGION PRAYER"
		prayer_span = "legion_prayer"
		prayer_sound = sound(get_sfx('sound/items/cornu.ogg'))
		deity = "Mars"
	else if(iscultist(usr))
		icon.icon_state = "tome"
		prayer_type = "CULTIST PRAYER"
		prayer_span = "cult_prayer"
		prayer_sound = sound(get_sfx('sound/hallucinations/i_see_you1.ogg'))
		deity = "Nar'Sie"
	else if(isliving(usr))
		var/mob/living/L = usr
		if(HAS_TRAIT(L, TRAIT_SPIRITUAL))
			icon.icon_state = "holylight"
			prayer_type = "SPIRITUAL PRAYER"
			prayer_span = "spiritual_prayer"
			prayer_sound = sound(get_sfx('sound/effects/pray.ogg'))

	prayer_sound.volume = 50
	var/msg_tmp = msg
	msg = "<span class='adminnotice'><span class=[prayer_span]>[icon2html(icon, GLOB.admins)][prayer_type][deity ? " to [deity]" : ""]:</span> [ADMIN_FULLMONTY(src)] [ADMIN_SC(src)]:<span class='notice'>\"[msg]\"</span></span>"

	for(var/client/C in GLOB.admins)
		if(C.prefs.chat_toggles & CHAT_PRAYER)
			to_chat(C, msg)
			if(C.prefs.toggles & SOUND_PRAYERS)
				SEND_SOUND(C, prayer_sound)

	to_chat(usr, "<span class='info'>You pray to the gods: \"[msg_tmp]\"</span>")

	SSblackbox.record_feedback("tally", "admin_verb", 1, "Prayer") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	//log_admin("HELP: [key_name(src)]: [msg]")

/proc/CentCom_announce(text , mob/Sender)
	var/msg = copytext_char(sanitize(text), 1, MAX_MESSAGE_LEN)
	msg = "<span class='adminnotice'><b><font color=orange>CENTCOM:</font>[ADMIN_FULLMONTY(Sender)] [ADMIN_CENTCOM_REPLY(Sender)]:</b> [msg]</span>"
	to_chat(GLOB.admins, msg)
	for(var/obj/machinery/computer/communications/C in GLOB.machines)
		C.overrideCooldown()

/proc/Syndicate_announce(text , mob/Sender)
	var/msg = copytext_char(sanitize(text), 1, MAX_MESSAGE_LEN)
	msg = "<span class='adminnotice'><b><font color=crimson>SYNDICATE:</font>[ADMIN_FULLMONTY(Sender)] [ADMIN_SYNDICATE_REPLY(Sender)]:</b> [msg]</span>"
	to_chat(GLOB.admins, msg)
	for(var/obj/machinery/computer/communications/C in GLOB.machines)
		C.overrideCooldown()

/proc/Nuke_request(text , mob/Sender)
	var/msg = copytext_char(sanitize(text), 1, MAX_MESSAGE_LEN)
	msg = "<span class='adminnotice'><b><font color=orange>NUKE CODE REQUEST:</font>[ADMIN_FULLMONTY(Sender)] [ADMIN_CENTCOM_REPLY(Sender)] [ADMIN_SET_SD_CODE]:</b> [msg]</span>"
	to_chat(GLOB.admins, msg)
	for(var/obj/machinery/computer/communications/C in GLOB.machines)
		C.overrideCooldown()
