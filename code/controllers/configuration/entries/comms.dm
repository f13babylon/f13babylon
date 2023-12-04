/datum/config_entry/string/comms_key
	protection = CONFIG_ENTRY_HIDDEN

/datum/config_entry/string/comms_key/ValidateAndSet(str_val)
	return str_val != "default_pwd" && length(str_val) > 6 && ..()

/datum/config_entry/keyed_list/cross_server
	key_mode = KEY_MODE_TEXT
	value_mode = VALUE_MODE_TEXT
	protection = CONFIG_ENTRY_LOCKED

/datum/config_entry/keyed_list/cross_server/ValidateAndSet(str_val)
	. = ..()
	if(.)
		var/list/newv = list()
		for(var/I in config_entry_value)
			newv[replacetext(I, "+", " ")] = config_entry_value[I]
		config_entry_value = newv

/datum/config_entry/keyed_list/cross_server/ValidateListEntry(key_name, key_value)
	return key_value != "byond:\\address:port" && ..()

/datum/config_entry/string/cross_comms_name

/datum/config_entry/string/medal_hub_address

/datum/config_entry/string/medal_hub_password
	protection = CONFIG_ENTRY_HIDDEN

/datum/config_entry/keyed_list/cross_server_bunker_override
	key_mode = KEY_MODE_TEXT
	value_mode = VALUE_MODE_TEXT
	protection = CONFIG_ENTRY_LOCKED

/datum/config_entry/keyed_list/cross_server_bunker_override/ValidateAndSet(str_val)
	. = ..()
	if(.)
		var/list/newv = list()
		for(var/I in config_entry_value)
			newv[replacetext(I, "+", " ")] = config_entry_value[I]
		config_entry_value = newv

/datum/config_entry/keyed_list/cross_server_bunker_override/ValidateListEntry(key_name, key_value)
	return key_value != "byond:\\address:port" && ..()

/datum/config_entry/flag/allow_cross_server_bunker_override
	protection = CONFIG_ENTRY_LOCKED

/datum/config_entry/string/tgs_ban_relay_tag
	config_entry_value = "ban-alert"
	protection = CONFIG_ENTRY_LOCKED

/datum/config_entry/string/discord_round_ping_role
	protection = CONFIG_ENTRY_LOCKED

/datum/config_entry/string/discord_round_channel
	protection = CONFIG_ENTRY_LOCKED
	config_entry_value = "round-relay"

/datum/config_entry/string/discord_admin_channel
	protection = CONFIG_ENTRY_LOCKED
	config_entry_value = "admin-relay"

/datum/config_entry/string/discord_ban_channel
	protection = CONFIG_ENTRY_LOCKED
	config_entry_value = "ban-relay"
