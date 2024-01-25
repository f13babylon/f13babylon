/*
current emotes. * denotes sound.
aflap, airguitar, alarm, alert,
baa*, bark*, blink*, blink_r, blorble*, blurp*, blush*, bork*, bow, bun*, burp*,
cackle*, chitter*, choke*, chuckle*, circle, clap*, clap1*, clear*, collapse*, come*,
cougar*, cough*, coyawoo*, cross, cry,
dance, dap, deathgasp, drool,
eyebrow,
faint*, fenbark*, flap, flash, flip, foxbark*, frown,
gag, gasp*, geck*, giggle*, glare, gnarl, grimace, grin, groan, growl, grumble,
handshake, help, hiss*, hug,
insult,
jump,
kiss, kyaa*,
laugh*, look, lynx*,
mawp, mbark*, me, merp*, moan*, moo*, mrowl*, msqueak*, mumble,
nod, notice, nya*,
pale, panda*, paper, peep*, peep2*, point, pout, purr*, purrlong*,
raise, roar*, rock, roll,
salute, scissors, scowl, scratch, scream*, screech, shake, shiver, shrug, sigh*, sign, signal,
sit, slap, smile, smirk, smug, snap*, snap2*, snap3*, sneeze*, sniff*, snore*, spin, squeak*, stare,
stretch, subtle, subtler, sulk, surrender*, sway,
tail, tremble, trumpet, twitch, twitch_s,
wag, warcry, wave, weh*, weh-s*, weh2*, weh3*, whimper*, whistle, wing, wink, wolfhowl*, wolfwhistle*, wsmile,
yap, yawn.
*/

/////////////////////////////////////////////////////////////////
/datum/emote/human
	mob_type_allowed_typecache = list(/mob/living/carbon/human)
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/audible
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/audible/can_run_emote(mob/living/user, status_check = TRUE)
	. = ..()
	if(. && iscarbon(user))
		var/mob/living/carbon/C = user
		return !C.silent && (!C.mind || !C.mind.miming)

////////////////////////////////////////////////////////////////
/datum/emote/aflap
	key = "aflap"
	key_third_person = "aflaps"
	message = "flaps their wings ANGRILY!!"

/datum/emote/living/carbon/airguitar
	key = "airguitar"
	message = "is strumming the air and headbanging like a safari chimp."
	restraint_check = TRUE

/datum/emote/brain/alarm
	key = "alarm"
	message = "sounds an alarm."
	emote_type = EMOTE_AUDIBLE

/datum/emote/brain/alert
	key = "alert"
	message = "lets out a distressed noise."
	emote_type = EMOTE_AUDIBLE

/datum/emote/baa
	key = "baa"
	key_third_person = "baas"
	message = "baas."
	emote_type = EMOTE_AUDIBLE
	sound = list('sound/f13effects/emotes/baa.ogg',
				'sound/f13effects/emotes/baa2.ogg')

/datum/emote/bark
	key = "bark"
	key_third_person = "barks"
	message = "barks!"
	sound = 'sound/f13effects/emotes/bark.ogg'

/datum/emote/living/carbon/blink
	key = "blink"
	key_third_person = "blinks"
	message = "blinks."
	sound = "sound/f13effects/emotes/blink.ogg"

/datum/emote/living/carbon/blink_r
	key = "blink_r"
	message = "blinks rapidly."

/datum/emote/living/audible/blorble
	key = "blorble"
	key_third_person = "blorbles"
	message = "blorbles."
	message_param = "blorbles at %t."
	emote_type = EMOTE_AUDIBLE
	sound = list('sound/effects/attackblob.ogg',
				'sound/effects/blobattack.ogg')

/datum/emote/living/audible/blurp
	key = "blurp"
	key_third_person = "blurps"
	message = "blurps."
	message_param = "blurps at %t."
	emote_type = EMOTE_AUDIBLE
	sound = list('sound/effects/meatslap.ogg',
				'sound/effects/gib_step.ogg')

/datum/emote/living/blush
	key = "blush"
	key_third_person = "blushes"
	message = "blushes."
	sound = 'sound/f13effects/emotes/blush.ogg'

/datum/emote/living/blush/run_emote(mob/user, params)
	. = ..()
	if(. && isipcperson(user))
		do_fake_sparks(5,FALSE,user)

/datum/emote/bork
	key = "bork"
	key_third_person = "borks"
	message = "borks!"
	sound = 'sound/f13effects/emotes/bork.ogg'

/datum/emote/living/bow
	key = "bow"
	key_third_person = "bows"
	message = "bows."
	message_param = "bows to %t."
	restraint_check = TRUE

/datum/emote/bun
	key = "bun"
	key_third_person = "squeals like a rabbit"
	message = "squeals like a rabbit!"
	sound = 'sound/f13effects/emotes/rabbit.ogg'

/datum/emote/living/burp
	key = "burp"
	key_third_person = "burps"
	message = "burps."
	emote_type = EMOTE_AUDIBLE
	sound = 'sound/f13effects/emotes/lilburp.ogg'

/datum/emote/cackle
	key = "cackle"
	key_third_person = "cackles worryingly"
	message = "cackles worryingly."
	sound = 'sound/f13effects/emotes/YeenCackle.ogg'

/datum/emote/living/audible/chitter
	key = "chitter"
	key_third_person = "chitters"
	message = "chitters."
	sound = 'sound/voice/moth/mothchitter.ogg'

/datum/emote/living/choke
	key = "choke"
	key_third_person = "chokes"
	message = "chokes!"
	emote_type = EMOTE_AUDIBLE
	sound = 'sound/f13effects/emotes/choke.ogg'

/datum/emote/living/chuckle
	key = "chuckle"
	key_third_person = "chuckles"
	message = "chuckles."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/chuckle/get_sound(mob/living/M)
	if(ishuman(M))
		if(M.gender == FEMALE)
			return 'sound/f13effects/emotes/femalechuckle.ogg'
		else
			return 'sound/f13effects/emotes/malechuckle.ogg'

/datum/emote/living/circle
	key = "circle"
	key_third_person = "circles"
	restraint_check = TRUE

/datum/emote/living/circle/run_emote(mob/user, params)
	. = ..()
	var/obj/item/circlegame/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, "<span class='notice'>You make a circle with your hand.</span>")
	else
		qdel(N)
		to_chat(user, "<span class='warning'>You don't have any free hands to make a circle with.</span>")

/datum/emote/living/carbon/clap
	key = "clap"
	key_third_person = "claps"
	message = "claps."
	muzzle_ignore = TRUE
	restraint_check = TRUE
	emote_type = EMOTE_AUDIBLE
	sound = list('sound/f13effects/emotes/clap1.ogg',
				'sound/f13effects/emotes/clap2.ogg',
				'sound/f13effects/emotes/clap3.ogg',
				'sound/f13effects/emotes/clap4.ogg')

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
	sound = list('sound/f13effects/emotes/claponce1.ogg',
				'sound/f13effects/emotes/claponce2.ogg')

/datum/emote/living/carbon/clap1/can_run_emote(mob/living/user, status_check, intentional)
	. = ..()
	// Need hands to clap
	if(!user.get_bodypart(BODY_ZONE_L_ARM) || !user.get_bodypart(BODY_ZONE_R_ARM))
		return

/datum/emote/living/carbon/clear
	key = "clear"
	key_third_person = "clears their throat"
	message = "clears their throat."
	emote_type = EMOTE_AUDIBLE
	sound = list('sound/f13effects/emotes/male_clear_throat_1.ogg',
				'sound/f13effects/emotes/male_clear_throat_2.ogg')

/datum/emote/living/collapse
	key = "collapse"
	key_third_person = "collapses"
	message = "collapses!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/collapse/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Unconscious(40)

/datum/emote/whistlecome
	key = "come"
	key_third_person = "whistles to get someones attention"
	message = "whistles to get someones attention!"
	sound = 'sound/f13effects/emotes/whistle-overhere.ogg'

/datum/emote/cougar
	key = "cougar"
	key_third_person = "growls like a cougar"
	message = "growls like a cougar!"
	sound = 'sound/f13effects/emotes/cougar.ogg'

/datum/emote/living/cough
	key = "cough"
	key_third_person = "coughs"
	message = "coughs!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cough/can_run_emote(mob/user, status_check = TRUE , intentional)
	. = ..()
	if(HAS_TRAIT(user, TRAIT_SOOTHED_THROAT))
		return FALSE

/datum/emote/living/cough/get_sound(mob/living/M)
	if(ishuman(M))
		if(M.gender == FEMALE)
			return 'sound/f13effects/emotes/female_cough.ogg'
		else
			return 'sound/f13effects/emotes/male_cough.ogg'

/datum/emote/coyawoo
	key = "coyawoo"
	key_third_person = "howls like a coyote"
	message = "howls like a coyote!"
	emote_type = EMOTE_AUDIBLE
	sound = list('sound/f13effects/emotes/coyoteawoo.ogg',
				'sound/f13effects/emotes/coyoteawoo2.ogg',
				'sound/f13effects/emotes/coyoteawoo3.ogg',
				'sound/f13effects/emotes/coyoteawoo4.ogg',
				'sound/f13effects/emotes/coyoteawoo5.ogg')

/datum/emote/living/cross
	key = "cross"
	key_third_person = "crosses"
	message = "crosses their arms."
	restraint_check = TRUE

/datum/emote/living/carbon/human/cry
	key = "cry"
	key_third_person = "cries"
	message = "cries."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/cry/run_emote(mob/user, params)
	. = ..()
	if(. && isipcperson(user))
		do_fake_sparks(5,FALSE,user)

/datum/emote/living/dance
	key = "dance"
	key_third_person = "dances"
	message = "dances around happily."
	restraint_check = TRUE

/datum/emote/living/carbon/human/dap
	key = "dap"
	key_third_person = "daps"
	message = "sadly can't find anybody to give daps to, and daps themself. Shameful."
	message_param = "give daps to %t."
	restraint_check = TRUE

/datum/emote/living/deathgasp
	key = "deathgasp"
	key_third_person = "deathgasps"
	message = "seizes up and falls limp, their eyes dead and lifeless..."
	message_robot = "shudders violently for a moment before falling still, its eyes slowly darkening."
	message_AI = "lets out a flurry of sparks, its screen flickering as its systems slowly halt."
	message_alien = "lets out a waning guttural screech, green blood bubbling from its maw..."
	message_larva = "lets out a sickly hiss of air and falls limply to the floor..."
	message_monkey = "lets out a faint chimper as it collapses and stops moving..."
	message_simple =  "stops moving..."
	stat_allowed = UNCONSCIOUS

/datum/emote/living/deathgasp/run_emote(mob/user, params)
	var/mob/living/simple_animal/S = user
	if(istype(S) && S.deathmessage)
		message_simple = S.deathmessage
	. = ..()
	message_simple = initial(message_simple)
	if(. && user.deathsound)
		if(isliving(user))
			var/mob/living/L = user
			if(!L.can_speak_vocal() || L.oxyloss >= 50)
				return //stop the sound if oxyloss too high/cant speak
		playsound(user, user.deathsound, 200, TRUE, TRUE)

/datum/emote/living/drool
	key = "drool"
	key_third_person = "drools"
	message = "drools."

/datum/emote/living/carbon/human/eyebrow
	key = "eyebrow"
	message = "raises an eyebrow."

/datum/emote/living/faint
	key = "faint"
	key_third_person = "faints"
	message = "faints."

/datum/emote/living/faint/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.SetSleeping(200)

/datum/emote/fenbark
	key = "fenbark"
	key_third_person = "makes a fennec-y bark"
	message = "makes a fennec-y bark!"
	sound = 'sound/f13effects/emotes/fenbark.ogg'

/datum/emote/flap
	key = "flap"
	key_third_person = "flaps"
	message = "flaps their wings."

/datum/emote/brain/flash
	key = "flash"
	message = "blinks their lights."

/datum/emote/flip
	key = "flip"
	key_third_person = "flips"
	message = "does a flip!"
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

/datum/emote/foxbark
	key = "foxbark"
	key_third_person = "makes a foxy bark"
	message = "makes a foxy bark!"
	sound = 'sound/f13effects/emotes/foxbark.ogg'

/datum/emote/living/frown
	key = "frown"
	key_third_person = "frowns"
	message = "frowns."

/datum/emote/living/gag
	key = "gag"
	key_third_person = "gags"
	message = "gags."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/gasp
	key = "gasp"
	key_third_person = "gasps"
	message = "gasps!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS

/datum/emote/living/gasp/get_sound(mob/living/M)
	if(ishuman(M))
		if(M.gender == FEMALE)
			return 'sound/f13effects/emotes/female_gasp.ogg'
		else
			return 'sound/f13effects/emotes/male_gasp.ogg'

/datum/emote/geckers
	key = "geck"
	key_third_person = "geckers loudly"
	message = "geckers loudly."
	sound = 'sound/f13effects/emotes/geck.ogg'

/datum/emote/living/giggle
	key = "giggle"
	key_third_person = "giggles"
	message = "giggles."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/giggle/get_sound(mob/living/M)
	if(ishuman(M))
		if(M.gender == FEMALE)
			return 'sound/f13effects/emotes/femalegiggle1.ogg'
		else
			return 'sound/f13effects/emotes/malegiggle1.ogg'

/datum/emote/living/glare
	key = "glare"
	key_third_person = "glares"
	message = "glares."
	message_param = "glares at %t."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/gnarl
	key = "gnarl"
	key_third_person = "gnarls"
	message = "gnarls and shows its teeth..."

/datum/emote/living/grimace
	key = "grimace"
	key_third_person = "grimaces"
	message = "grimaces."

/datum/emote/living/grin
	key = "grin"
	key_third_person = "grins"
	message = "grins."

/datum/emote/living/groan
	key = "groan"
	key_third_person = "groans"
	message = "groans!"

/datum/emote/growl
	key = "growl"
	key_third_person = "growls viciously"
	message = "growls viciously."
	sound = 'sound/f13effects/emotes/growl.ogg'

/datum/emote/living/carbon/human/grumble
	key = "grumble"
	key_third_person = "grumbles"
	message = "grumbles!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/handshake
	key = "handshake"
	message = "shakes their own hands."
	message_param = "shakes hands with %t."
	restraint_check = TRUE
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/help
	key = "help"

/datum/emote/living/help/run_emote(mob/user, params)
	var/list/keys = list()
	var/list/message = list("Available emotes, you can use them with say \"*emote\": ")

	var/datum/emote/E
	var/list/emote_list = E.emote_list
	for(var/e in emote_list)
		if(e in keys)
			continue
		E = emote_list[e]
		if(E.can_run_emote(user, status_check = FALSE))
			keys += E.key

	keys = sortList(keys)

	for(var/emote in keys)
		if(LAZYLEN(message) > 1)
			message += ", [emote]"
		else
			message += "[emote]"

	message += "."

	message = jointext(message, "")

	to_chat(user, message)

/datum/emote/living/carbon/human/hiss
	key = "hiss"
	key_third_person = "hisses"
	message = "hisses."
	message_param = "hisses softly."
	emote_type = EMOTE_AUDIBLE
	sound = list('sound/f13effects/emotes/hiss1.ogg',
				'sound/f13effects/emotes/hiss2.ogg',
				'sound/f13effects/emotes/hiss3.ogg',
				'sound/f13effects/emotes/hiss4.ogg')

/datum/emote/living/carbon/human/hug
	key = "hug"
	key_third_person = "hugs"
	message = "hugs themself."
	message_param = "hugs %t."
	restraint_check = TRUE
	emote_type = EMOTE_AUDIBLE

#define INSULTS_FILE "insult.json"

/mob
	var/nextsoundemote = 1

/datum/emote/living/insult
	key = "insult"
	key_third_person = "insults"
	message = "spews insults."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/insult/run_emote(mob/living/user, params)
	if(user.mind?.miming)
		message = "creatively gesticulates."
	else if(!user.is_muzzled())
		message = pick_list_replacements(INSULTS_FILE, "insult_gen")
	else
		message = "muffles something."
	. = ..()

/datum/emote/living/jump
	key = "jump"
	key_third_person = "jumps"
	message = "jumps!"
	restraint_check = TRUE

/datum/emote/living/kiss
	key = "kiss"
	key_third_person = "kisses"
	message = "blows a kiss."
	message_param = "blows a kiss to %t."
	emote_type = EMOTE_AUDIBLE

/datum/emote/kyaa
	key = "kyaa"
	key_third_person = "kyaas"
	message = "kyaas loudly!"
	sound = 'sound/f13effects/emotes/birdkyaa.ogg'

/datum/emote/living/audible/laugh
	key = "laugh"
	key_third_person = "laughs"
	message = "laughs."

/datum/emote/living/audible/laugh/get_sound(mob/living/user)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/human_user = user
		//power armor laugh track.... spooky
		if(istype(human_user.get_item_by_slot(ITEM_SLOT_OCLOTHING), /obj/item/clothing/suit/armor/f13/power_armor))
			return 'sound/voice/robolaugh.ogg'
		return human_user.dna.species.get_laugh_sound(user)

/datum/emote/living/look
	key = "look"
	key_third_person = "looks"
	message = "looks."
	message_param = "looks at %t."

/datum/emote/lynx
	key = "lynx"
	key_third_person = "growls like a bobcat"
	message = "growls like a bobcat!"
	sound = 'sound/f13effects/emotes/lynx.ogg'

/datum/emote/living/carbon/human/mawp
	key = "mawp"
	key_third_person = "mawps"
	message = "mawps annoyingly."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/mawp/run_emote(mob/living/user, params)
	. = ..()
	if(.)
		if(ishuman(user))
			if(prob(10))
				user.adjustEarDamage(-5, -5)

/datum/emote/barkmisery
	key = "mbark"
	key_third_person = "barks miserably"
	message = "barks miserably!"
	sound = 'sound/f13effects/emotes/dog-miserable.ogg'

/datum/emote/living/custom
	key = "me"
	key_third_person = "custom"
	message = null

/datum/emote/living/custom/proc/check_invalid(mob/user, input)
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
		return TRUE
	return FALSE

/datum/emote/living/custom/run_emote(mob/user, params, type_override = null)
	if(jobban_isbanned(user, "emote"))
		to_chat(user, "You cannot send custom emotes (banned).")
		return FALSE
	else if(QDELETED(user))
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	else if(!params)
		var/custom_emote = stripped_multiline_input_or_reflect(user, "Choose an emote to display.", "Custom Emote", null, MAX_MESSAGE_LEN)
		if(custom_emote && !check_invalid(user, custom_emote))
			var/type = input("Is this a visible or hearable emote?") as null|anything in list("Visible", "Hearable")
			switch(type)
				if("Visible")
					emote_type = EMOTE_VISIBLE
				if("Hearable")
					emote_type = EMOTE_AUDIBLE
				else
					return
			message = custom_emote
	else
		message = params
		if(type_override)
			emote_type = type_override
	message = user.say_emphasis(message)
	. = ..()
	message = null
	emote_type = EMOTE_VISIBLE

/datum/emote/living/custom/replace_pronoun(mob/user, message)
	return message

/datum/emote/merp
	key = "merp"
	key_third_person = "merps"
	message = "let out a merp!"
	sound = 'sound/f13effects/emotes/merp.ogg'

/datum/emote/living/carbon/moan
	key = "moan"
	key_third_person = "moans"
	message = "moans!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = SOFT_CRIT

/datum/emote/living/carbon/moan/get_sound(mob/living/M) //need better, ie. more pleasured (because these are mostly when doing drugs) moans
	if(ishuman(M))
		if(M.gender == FEMALE)
			. = list(
				'sound/f13effects/emotes/female_moan1.ogg',
				'sound/f13effects/emotes/female_moan2.ogg',
				'sound/f13effects/emotes/female_moan3.ogg'
			)
		else
			. = list(
				'sound/f13effects/emotes/male_moan1.ogg',
				'sound/f13effects/emotes/male_moan2.ogg',
				'sound/f13effects/emotes/male_moan3.ogg'
			)
		return


/datum/emote/moo
	key = "moo"
	key_third_person = "moos"
	message = "moos."
	sound = 'sound/f13effects/emotes/moo.ogg'

/datum/emote/mrowl
	key = "mrowl"
	key_third_person = "mrowls"
	message = "mrowls."
	sound = 'sound/f13effects/emotes/mrowl.ogg'

/datum/emote/msqueak
	key = "msqueak"
	key_third_person = "msqueaks"
	message = "squeaks!"
	sound = 'sound/f13effects/emotes/mothsqueak.ogg'

/datum/emote/living/carbon/human/mumble
	key = "mumble"
	key_third_person = "mumbles"
	message = "mumbles!"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/nod
	key = "nod"
	key_third_person = "nods"
	message = "nods."
	message_param = "nods at %t."

/datum/emote/brain/notice
	key = "notice"
	message = "plays a loud tone."
	emote_type = EMOTE_AUDIBLE

/datum/emote/nya //Kitten Must Die.ogg
	key = "nya"
	key_third_person = "nyas"
	message = "nyas."
	sound = 'sound/f13effects/emotes/nya.ogg'

/datum/emote/living/carbon/human/pale
	key = "pale"
	message = "goes pale for a second."

/datum/emote/panda //yee
	key = "panda"
	key_third_person = "makes a panda like... noise"
	message = "makes a panda like... noise?"
	sound = 'sound/f13effects/emotes/panda.ogg'

/datum/emote/peep
	key = "peep"
	key_third_person = "peeps like a bird"
	message = "peeps like a bird!"
	sound = 'sound/f13effects/emotes/peeponce.ogg'

/datum/emote/peep2
	key = "peep2"
	key_third_person = "peeps twice like a bird"
	message = "peeps twice like a bird!"
	sound = 'sound/f13effects/emotes/peep.ogg'

/datum/emote/living/point
	key = "point"
	key_third_person = "points"
	message = "points."
	message_param = "points at %t."
	restraint_check = TRUE

/datum/emote/living/point/run_emote(mob/user, params)
	message_param = initial(message_param) // reset
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.get_num_arms() == 0)
			if(H.get_num_legs() != 0)
				message_param = "tries to point at %t with a leg, <span class='userdanger'>falling down</span> in the process!"
				H.DefaultCombatKnockdown(20)
			else
				message_param = "<span class='userdanger'>bumps [user.p_their()] head on the ground</span> trying to motion towards %t."
				H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5)
	..()

/datum/emote/living/pout
	key = "pout"
	key_third_person = "pouts"
	message = "pouts."
	emote_type = EMOTE_AUDIBLE

/datum/emote/purr
	key = "purr"
	key_third_person = "purrs contentedly"
	message = "purrs contentedly."
	sound = 'sound/f13effects/emotes/cat_purr.ogg'


/datum/emote/purrlong
	key = "purrlong"
	key_third_person = "purrs contentedly"
	message = "purrs contentedly."
	sound = 'sound/f13effects/emotes/cat_purr_long.ogg'

/datum/emote/living/carbon/human/raise
	key = "raise"
	key_third_person = "raises"
	message = "raises a hand."
	restraint_check = TRUE

/datum/emote/roar
	key = "roar"
	key_third_person = "roars"
	message = "roars."
	message_param = "softly roars."
	emote_type = EMOTE_AUDIBLE
	sound = 'sound/f13effects/emotes/hiss5.ogg'

/datum/emote/living/carbon/roll
	key = "roll"
	key_third_person = "rolls"
	message = "rolls."
	restraint_check = TRUE

/datum/emote/living/carbon/human/salute
	key = "salute"
	key_third_person = "salutes"
	message = "salutes."
	message_param = "salutes to %t."
	restraint_check = TRUE

/datum/emote/living/scowl
	key = "scowl"
	key_third_person = "scowls"
	message = "scowls."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/scratch
	key = "scratch"
	key_third_person = "scratches"
	message = "scratches."
	restraint_check = TRUE

/datum/emote/living/scream
	key = "scream"
	key_third_person = "screams"
	message = "screams."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/scream/run_emote(mob/living/user, params) //I can't not port this shit, come on.
	if(user.nextsoundemote >= world.time || user.stat != CONSCIOUS)
		return
	var/sound
	var/miming = user.mind ? user.mind.miming : 0
	if(!user.is_muzzled() && !miming)
		user.nextsoundemote = world.time + 7
		if(issilicon(user))
			sound = 'modular_citadel/sound/voice/scream_silicon.ogg'
			if(iscyborg(user))
				var/mob/living/silicon/robot/S = user
				if(S.cell?.charge < 20)
					to_chat(S, "<span class='warning'>Scream module deactivated. Please recharge.</span>")
					return
				S.cell.use(200)
		if(ismonkey(user))
			sound = 'modular_citadel/sound/voice/scream_monkey.ogg'
		if(istype(user, /mob/living/simple_animal/hostile/gorilla))
			sound = 'sound/creatures/gorilla.ogg'
		if(ishuman(user))
			user.adjustOxyLoss(5)
			sound = pick('modular_citadel/sound/voice/scream_m1.ogg', 'modular_citadel/sound/voice/scream_m2.ogg')
			if(user.gender == FEMALE)
				sound = pick('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
			if(is_species(user, /datum/species/jelly))
				if(user.gender == FEMALE)
					sound = pick('modular_citadel/sound/voice/scream_jelly_f1.ogg', 'modular_citadel/sound/voice/scream_jelly_f2.ogg')
				else
					sound = pick('modular_citadel/sound/voice/scream_jelly_m1.ogg', 'modular_citadel/sound/voice/scream_jelly_m2.ogg')
			if(is_species(user, /datum/species/android) || is_species(user, /datum/species/synth) || is_species(user, /datum/species/ipc))
				sound = 'modular_citadel/sound/voice/scream_silicon.ogg'
			if(is_species(user, /datum/species/lizard))
				sound = 'modular_citadel/sound/voice/scream_lizard.ogg'
			if(is_species(user, /datum/species/skeleton))
				sound = 'modular_citadel/sound/voice/scream_skeleton.ogg'
			if (is_species(user, /datum/species/fly) || is_species(user, /datum/species/insect))
				sound = 'modular_citadel/sound/voice/scream_moth.ogg'
		LAZYINITLIST(user.alternate_screams)
		if(LAZYLEN(user.alternate_screams))
			sound = pick(user.alternate_screams)
		playsound(user.loc, sound, 50, 1, 4, 1.2)
		message = "screams!"
	else if(miming)
		message = "acts out a scream."
	else
		message = "makes a very loud noise."
	. = ..()

/datum/emote/living/carbon/screech
	key = "screech"
	key_third_person = "screeches"
	message = "screeches."

/datum/emote/living/shake
	key = "shake"
	key_third_person = "shakes"
	message = "shakes their head."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/shiver
	key = "shiver"
	key_third_person = "shiver"
	message = "shivers."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/shrug
	key = "shrug"
	key_third_person = "shrugs"
	message = "shrugs."

/datum/emote/living/sigh
	key = "sigh"
	key_third_person = "sighs"
	message = "sighs."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sigh/get_sound(mob/living/M)
	if(ishuman(M))
		if(M.gender == FEMALE)
			return 'sound/f13effects/emotes/femalesigh1.ogg'
		else
			return 'sound/f13effects/emotes/malesigh1.ogg'

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

/datum/emote/living/sit
	key = "sit"
	key_third_person = "sits"
	message = "sits down."

/datum/emote/living/slap
	key = "slap"
	key_third_person = "slaps"
	restraint_check = TRUE

/datum/emote/living/slap/run_emote(mob/user, params)
	. = ..()
	if(!.)
		return
	var/obj/item/slapper/N = new(user)
	if(user.put_in_hands(N))
		to_chat(user, "<span class='notice'>You ready your slapping hand.</span>")
	else
		to_chat(user, "<span class='warning'>You're incapable of slapping in your current state.</span>")

/datum/emote/living/smile
	key = "smile"
	key_third_person = "smiles"
	message = "smiles."

/datum/emote/living/smirk
	key = "smirk"
	key_third_person = "smirks"
	message = "smirks."

/datum/emote/living/smug
	key = "smug"
	key_third_person = "smugs"
	message = "grins smugly."

/datum/emote/living/snap
	key = "snap"
	key_third_person = "snaps"
	message = "snaps their fingers."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	restraint_check = TRUE

/datum/emote/living/snap/run_emote(mob/living/user, params)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'sound/f13effects/emotes/snap.ogg', 50, 1, -1)

/datum/emote/living/snap2
	key = "snap2"
	key_third_person = "snaps twice"
	message = "snaps twice."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	restraint_check = TRUE

/datum/emote/living/snap2/run_emote(mob/living/user, params)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'sound/f13effects/emotes/snap2.ogg', 50, 1, -1)

/datum/emote/living/snap3
	key = "snap3"
	key_third_person = "snaps thrice"
	message = "snaps thrice."
	emote_type = EMOTE_AUDIBLE
	muzzle_ignore = TRUE
	restraint_check = TRUE

/datum/emote/living/snap3/run_emote(mob/living/user, params)
	if(!(. = ..()))
		return
	if(user.nextsoundemote >= world.time)
		return
	user.nextsoundemote = world.time + 7
	playsound(user, 'sound/f13effects/emotes/snap3.ogg', 50, 1, -1)

/datum/emote/living/sneeze
	key = "sneeze"
	key_third_person = "sneezes"
	message = "sneezes."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/sneeze/get_sound(mob/living/M)
	if(ishuman(M))
		if(M.gender == FEMALE)
			return 'sound/f13effects/emotes/female_sneeze.ogg'
		else
			return 'sound/f13effects/emotes/male_sneeze.ogg'

/datum/emote/living/sniff
	key = "sniff"
	key_third_person = "sniffs"
	message = "sniffs."
	emote_type = EMOTE_AUDIBLE
	sound_volume = 30

/datum/emote/living/sniff/get_sound(mob/living/M)
	if(ishuman(M))
		if(M.gender == FEMALE)
			return 'sound/f13effects/emotes/female_sniff.ogg'
		else
			return 'sound/f13effects/emotes/male_sniff.ogg'

/datum/emote/living/snore
	key = "snore"
	key_third_person = "snores"
	message = "snores."
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS

/datum/emote/living/snore/get_sound(mob/living/M)
	if(ishuman(M))
		if(M.gender == FEMALE)
			return 'sound/f13effects/emotes/femalesnore1.ogg'
		else
			return 'sound/f13effects/emotes/malesnore1.ogg'

/datum/emote/spin
	key = "spin"
	key_third_person = "spins"
	message = "does a spin!"
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

/datum/emote/squeak
	key = "squeak"
	key_third_person = "squeaks"
	message = "let out a tiny squeak!"
	sound = 'sound/f13effects/emotes/mousesqueek.ogg'

/datum/emote/living/stare
	key = "stare"
	key_third_person = "stares"
	message = "stares."
	message_param = "stares at %t."

/datum/emote/living/strech
	key = "stretch"
	key_third_person = "stretches"
	message = "stretches their arms."

/datum/emote/living/sulk
	key = "sulk"
	key_third_person = "sulks"
	message = "sulks down sadly."

/datum/emote/living/surrender
	key = "surrender"
	key_third_person = "surrenders"
	message = "puts their hands on their head and falls to the ground, they surrender!"
	emote_type = EMOTE_AUDIBLE
	stat_allowed = UNCONSCIOUS
	restraint_check = FALSE
	sound_volume = 80
	sound_vary = FALSE
	sound = 'sound/f13effects/surrender1.ogg'

/datum/emote/living/surrender/run_emote(mob/user, params)
	. = ..()
	if(. && isliving(user))
		var/mob/living/L = user
		L.Knockdown(200)
		L.Paralyze(200)

		var/mutable_appearance/overlay = mutable_appearance('icons/mob/talk.dmi', "surrender", ABOVE_MOB_LAYER)
		user.flick_overlay_static(overlay, 200)

/datum/emote/living/sway
	key = "sway"
	key_third_person = "sways"
	message = "sways around dizzily."

/datum/emote/living/carbon/tail
	key = "tail"
	message = "waves their tail."

/datum/emote/living/tremble
	key = "tremble"
	key_third_person = "trembles"
	message = "trembles in fear!"

/datum/emote/trumpet
	key = "trumpet"
	key_third_person = "trumpets"
	message = "trumpets!"
	sound = 'sound/f13effects/emotes/trumpet.ogg'

/datum/emote/living/twitch
	key = "twitch"
	key_third_person = "twitches"
	message = "twitches violently."

/datum/emote/living/twitch_s
	key = "twitch_s"
	message = "twitches."

/datum/emote/living/carbon/human/wag
	key = "wag"
	key_third_person = "wags"
	message = "wags their tail."

/datum/emote/living/carbon/human/wag/run_emote(mob/user, params)
	. = ..()
	if(!.)
		return
	var/mob/living/carbon/human/H = user
	if(!istype(H) || !H.dna || !H.dna.species || !H.dna.species.can_wag_tail(H))
		return
	if(!H.dna.species.is_wagging_tail())
		H.dna.species.start_wagging_tail(H)
	else
		H.dna.species.stop_wagging_tail(H)

/datum/emote/living/carbon/human/wag/can_run_emote(mob/user, status_check = TRUE)
	if(!..())
		return FALSE
	var/mob/living/carbon/human/H = user
	return H.dna && H.dna.species && H.dna.species.can_wag_tail(user)

/datum/emote/living/carbon/human/wag/select_message_type(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(!H.dna || !H.dna.species)
		return
	if(H.dna.species.is_wagging_tail())
		. = null

/datum/emote/warcry
	key = "warcry"
	key_third_person = "warcrys"
	message = "<b>lets out a war cry!!</b>"

/datum/emote/living/wave
	key = "wave"
	key_third_person = "waves"
	message = "waves."

/datum/emote/weh
	key = "weh"
	key_third_person = "wehs"
	message = "let out a weh!"
	sound = 'sound/f13effects/emotes/weh.ogg'

/datum/emote/weh/alt1
	key = "weh2"
	key_third_person = "wehs2"
	sound = 'sound/f13effects/emotes/weh2.ogg'

/datum/emote/weh/alt2
	key = "weh3"
	key_third_person = "wehs3"
	sound = 'sound/f13effects/emotes/weh3.ogg'

/datum/emote/weh/surprised
	key = "weh-s"
	key_third_person = "wehs-s"
	message = "let out a surprised weh!"
	sound = 'sound/f13effects/emotes/weh_s.ogg'

/datum/emote/living/whimper
	key = "whimper"
	key_third_person = "whimpers"
	message = "whimpers."

/datum/emote/living/whimper/get_sound(mob/living/M)
	if(ishuman(M))
		if(M.gender == FEMALE)
			return 'sound/f13effects/emotes/femalewhimper1.ogg'
		else
			return 'sound/f13effects/emotes/malewhimper1.ogg'

/datum/emote/brain/whistle
	key = "whistle"
	key_third_person = "whistles"
	message = "whistles."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/carbon/human/wing
	key = "wing"
	key_third_person = "wings"
	message = "their wings."

/datum/emote/living/carbon/human/wing/run_emote(mob/user, params)
	. = ..()
	if(.)
		var/mob/living/carbon/human/H = user
		if(findtext(select_message_type(user), "open"))
			H.OpenWings()
		else
			H.CloseWings()

/datum/emote/living/carbon/human/wing/select_message_type(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(H.dna.species.mutant_bodyparts["wings"])
		. = "opens " + message
	else
		. = "closes " + message

/datum/emote/living/carbon/human/wing/can_run_emote(mob/user, status_check = TRUE)
	if(!..())
		return FALSE
	var/mob/living/carbon/human/H = user
	if(H.dna && H.dna.species && (H.dna.features["wings"] != "None"))
		return TRUE

/mob/living/carbon/human/proc/OpenWings()
	if(!dna || !dna.species)
		return
	if(dna.species.mutant_bodyparts["wings"])
		dna.species.mutant_bodyparts["wingsopen"] = dna.species.mutant_bodyparts["wings"]
		dna.species.mutant_bodyparts -= "wings"
	update_body()

/mob/living/carbon/human/proc/CloseWings()
	if(!dna || !dna.species)
		return
	if(dna.species.mutant_bodyparts["wingsopen"])
		dna.species.mutant_bodyparts["wings"] = dna.species.mutant_bodyparts["wingsopen"]
		dna.species.mutant_bodyparts -= "wingsopen"
	update_body()
	if(isturf(loc))
		var/turf/T = loc
		T.Entered(src)

/datum/emote/living/carbon/wink
	key = "wink"
	key_third_person = "winks"
	message = "winks."

/datum/emote/wolfhowl
	key = "wolfhowl"
	key_third_person = "howls like a wolf"
	message = "howls like a wolf!"
	sound = 'sound/f13effects/emotes/wolfhowl.ogg'

/datum/emote/wolfwhistle //Yeah baby that's what I like!
	key = "wolfwhistle"
	key_third_person = "wolf whistles"
	message = "wolf whistles!"
	sound = 'sound/f13effects/emotes/wolfwhistle.ogg'

/datum/emote/living/wsmile
	key = "wsmile"
	key_third_person = "wsmiles"
	message = "smiles weakly."

/datum/emote/yap
	key = "yap"
	key_third_person = "yaps"
	message = "yaps!"
	sound = 'sound/f13effects/emotes/yap.ogg'

/datum/emote/living/yawn
	key = "yawn"
	key_third_person = "yawns"
	message = "yawns."
	emote_type = EMOTE_AUDIBLE
	sound = list("sound/f13effects/emotes/yawn_m1.ogg",
				"sound/f13effects/emotes/yawn_m2.ogg")
