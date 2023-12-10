SUBSYSTEM_DEF(discord)
	name = "Discord Relay"
	flags = SS_NO_INIT|SS_NO_FIRE

/datum/controller/subsystem/discord/proc/send_to_round_channel(datum/tgs_message_content/message)
	set waitfor = FALSE
	if(IsAdminAdvancedProcCall())
		return

	var/tgs_channel_tag = CONFIG_GET(string/discord_round_channel)
	if(!tgs_channel_tag)
		return
	if(istext(message))
		message = new(message)
	send2chat(message, tgs_channel_tag)

/datum/controller/subsystem/discord/proc/send_to_admin_channel(datum/tgs_message_content/message)
	set waitfor = FALSE
	if(IsAdminAdvancedProcCall())
		return

	var/tgs_channel_tag = CONFIG_GET(string/discord_admin_channel)
	if(!tgs_channel_tag)
		return
	if(istext(message))
		message = new(message)
	send2chat(message, tgs_channel_tag)

/datum/controller/subsystem/discord/proc/send_to_ban_channel(datum/tgs_message_content/message)
	set waitfor = FALSE
	if(IsAdminAdvancedProcCall())
		return

	var/tgs_channel_tag = CONFIG_GET(string/discord_ban_channel)
	if(!tgs_channel_tag)
		return
	if(istext(message))
		message = new(message)
	send2chat(message, tgs_channel_tag)
