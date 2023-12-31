/datum/emote/living/carbon/airguitar
	key = "airguitar"
	message = "is strumming the air and headbanging like a safari chimp."
	restraint_check = TRUE

/datum/emote/living/carbon/blink
	key = "blink"
	key_third_person = "blinks"
	message = "blinks."
	sound = "sound/emotes/blink.ogg"

/datum/emote/living/carbon/blink_r
	key = "blink_r"
	message = "blinks rapidly."

/datum/emote/living/carbon/clap
	key = "clap"
	key_third_person = "claps"
	message = "claps."
	muzzle_ignore = TRUE
	restraint_check = TRUE
	emote_type = EMOTE_AUDIBLE
	sound = list('sound/misc/clap1.ogg',
				'sound/misc/clap2.ogg',
				'sound/misc/clap3.ogg',
				'sound/misc/clap4.ogg')


/datum/emote/living/carbon/clap/can_run_emote(mob/living/user, status_check, intentional)
	. = ..()
	// Need hands to clap
	if(!user.get_bodypart(BODY_ZONE_L_ARM) || !user.get_bodypart(BODY_ZONE_R_ARM))
		return


/datum/emote/living/carbon/clap1
	key = "clap1"
	key_third_person = "claps once"
	message = "claps once."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	restraint_check = TRUE
	sound_volume = 30
	sound = list('sound/emotes/claponce1.ogg',
				'sound/emotes/claponce2.ogg')

/datum/emote/living/carbon/clear
	key = "clear"
	key_third_person = "clears their throat"
	message = "clears their throat."
	emote_type = EMOTE_AUDIBLE
	sound = list('sound/emotes/male_clear_throat_1.ogg',
				'sound/emotes/male_clear_throat_2.ogg')


/datum/emote/living/carbon/clap/can_run_emote(mob/living/user, status_check, intentional)
	. = ..()
	// Need hands to clap
	if(!user.get_bodypart(BODY_ZONE_L_ARM) || !user.get_bodypart(BODY_ZONE_R_ARM))
		return

/datum/emote/living/carbon/gnarl
	key = "gnarl"
	key_third_person = "gnarls"
	message = "gnarls and shows its teeth..."

/datum/emote/living/carbon/moan
	key = "moan"
	key_third_person = "moans"
	message = "moans!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT

/datum/emote/living/carbon/roll
	key = "roll"
	key_third_person = "rolls"
	message = "rolls."
	restraint_check = TRUE

/datum/emote/living/carbon/scratch
	key = "scratch"
	key_third_person = "scratches"
	message = "scratches."
	restraint_check = TRUE

/datum/emote/living/carbon/screech
	key = "screech"
	key_third_person = "screeches"
	message = "screeches."

/datum/emote/living/carbon/sign
	key = "sign"
	key_third_person = "signs"
	message_param = "signs the number %t."
	restraint_check = TRUE

/datum/emote/living/carbon/sign/select_param(mob/user, params)
	. = ..()
	if(!isnum(text2num(params)))
		return message

/datum/emote/living/carbon/sign/signal
	key = "signal"
	key_third_person = "signals"
	message_param = "raises %t fingers."
	restraint_check = TRUE

/datum/emote/living/carbon/tail
	key = "tail"
	message = "waves their tail."

/datum/emote/living/carbon/wink
	key = "wink"
	key_third_person = "winks"
	message = "winks."
