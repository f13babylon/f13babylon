#define EMOTE_SPECIAL_STR "Strength"
#define EMOTE_SPECIAL_PER "Perception"
#define EMOTE_SPECIAL_END "Endurance"
#define EMOTE_SPECIAL_CHA "Charisma"
#define EMOTE_SPECIAL_INT "Intelligence"
#define EMOTE_SPECIAL_AGI "Agility"
#define EMOTE_SPECIAL_LCK "Luck"
#define EMOTE_SPECIAL_GEN "???"
#define EMOTE_SPECIAL_SUF "Crit"

GLOBAL_LIST_INIT(special_skill_list, list(
	EMOTE_SPECIAL_STR,
	EMOTE_SPECIAL_PER,
	EMOTE_SPECIAL_END,
	EMOTE_SPECIAL_CHA,
	EMOTE_SPECIAL_INT,
	EMOTE_SPECIAL_AGI,
	EMOTE_SPECIAL_LCK,
	EMOTE_SPECIAL_GEN))

GLOBAL_LIST_INIT(special_triggers, list(
	EMOTE_SPECIAL_STR = list(
		"s",
		"str",
		"strength",
		"strangth",
		"strong",
		"strongth",
		"might",
		"power"),
	EMOTE_SPECIAL_PER = list(
		"p",
		"per",
		"perception",
		"preception",
		"look",
		"see",
		"peep"),
	EMOTE_SPECIAL_END = list(
		"e",
		"end",
		"endurance",
		"endurence",
		"toughness",
		"tough",
		"grit",
		"beef",
		"beefiness"),
	EMOTE_SPECIAL_CHA = list(
		"c",
		"cha",
		"charisma",
		"charesma",
		"charm",
		"moxie",
		"smarm",
		"wink",
		"char"),
	EMOTE_SPECIAL_INT = list(
		"int",
		"i",
		"intelligence",
		"inteligence",
		"intelligance",
		"inteligance",
		"intel",
		"intell",
		"intelect",
		"intellect",
		"smart",
		"smartness",
		"nerd",
		"nerdiness",
		"dork",
		"dorkiness",
		"dweeb",
		"dweebishness"),
	EMOTE_SPECIAL_AGI = list(
		"agi",
		"a",
		"agility",
		"agillity",
		"quick",
		"quickness",
		"fast",
		"fastness",
		"dex",
		"speed",
		"speediness",
		"athleticism",
		"acrobatics",
		"escape",
		"dodge",
		"evade",
		"evasion",
		"cat"),
	EMOTE_SPECIAL_LCK = list(
		"l",
		"lck",
		"luck",
		"lick",
		"lock",
		"lunk",
		"link",
		"chance",
		"fortune",
		"dice",
		"luk",
		"luc"),
	EMOTE_SPECIAL_GEN = list(
		"x",
		"non",
		"none",
		"generic",
		"something",
		"else",
		"smth",
		"?",
		"rand",
		"huh",
		"stuff",
		"roll")))

GLOBAL_LIST_INIT(special_phrases, list(
	EMOTE_SPECIAL_STR = list(
		"initial" = list(
			"tests their strength...",
			"flexes their arm(s)...",
			"prepares to lift...",
			"puts their back into it..."),
		"success" = list(
			"is strong!",
			"is beefy!",
			"has some serious guns!",
			"had some strength behind it!"),
		"failure" = list(
			"was too weak.",
			"was a little wet noodle.",
			"would loose an arm wrestling match with a mouse.",
			"has some serious atrophy. it's a wonder they can move at all.")),
	EMOTE_SPECIAL_PER = list(
		"initial" = list(
			"takes a good, long look...",
			"squints...",
			"looks around...",
			"focuses in..."),
		"success" = list(
			"was perceptive!",
			"noticed things!",
			"has eyes like a hawk!",
			"could find Doc Mitchell's keys!",
			"noticed whatever they were trying to see!"),
		"failure" = list(
			"was totally oblivious.",
			"forgot their glasses.",
			"didn't see anything.")),
	EMOTE_SPECIAL_END = list(
		"initial" = list(
			"tests their toughness...",
			"braces themself..."),
		"success" = list(
			"was tough!",
			"was one tough cookie!",
			"doesn't even flinch!",
			"is solid as an oak!",
			"endured!"),
		"failure" = list(
			"is a floppy lil' noodle.",
			"is made of paper.",
			"would be torn to shreds by a light breeze.",
			"crumpled up and blew away.")),
	EMOTE_SPECIAL_CHA = list(
		"initial" = list(
			"starts to be charismatic...",
			"puts on the charm..."),
		"success" = list(
			"was charismatic!",
			"is an absolute charmer!",
			"was good and charming!"),
		"failure" = list(
			"was totally uncharismatic.",
			"isn't fooling anyone.",
			"put their foot in their mouth.",
			"could hear a pin drop.",
			"miiiiight have some frontal lobe damage.",
			"had their charms fall flat.")),
	EMOTE_SPECIAL_INT = list(
		"initial" = list(
			"thinks hard...",
			"ponders hard...",
			"takes a moment to think...",
			"furrows their brow..."),
		"success" = list(
			"was clever!",
			"is a genius!",
			"has a mind sharp as a whip!",
			"had a thought!"),
		"failure" = list(
			"was dumb as a doornail.",
			"burned their last braincell years ago.",
			"is running low on braincells.",
			"was dense as a brick.")),
	EMOTE_SPECIAL_AGI = list(
		"initial" = list(
			"tries to get agile...",
			"prepares their moves...",
			"starts to get limber..."),
		"success" = list(
			"was very flexible!",
			"had some excellent footwork!",
			"was in perfect control!",
			"was agile as a cat!",
			"was agile as a fox!"),
		"failure" = list(
			"fell flat on their face.",
			"fell flat on their back.",
			"triped over themself.",
			"has two left feet.",
			"was clumsy as a cat.",
			"was clumsy as a fox.")),
	EMOTE_SPECIAL_LCK = list(
		"initial" = list(
			"tries their luck...",
			"takes a chance...",
			"puts it all on red..."),
		"success" = list(
			"lucked out!",
			"was the luckiest son-of-a-gun in the wasteland!",
			"could make a bullet turn right around and climb back into the gun!",
			"got lucky!"),
		"failure" = list(
			"was unlucky.",
			"realized their game was rigged from the start.",
			"showed that the house always wins.")),
	EMOTE_SPECIAL_GEN = list(
		"initial" = list(
			"tests their skills...",
			"tries their skills...",
			"attempts to do a thing...",
			"puts their skills to the test..."),
		"success" = list(
			"succeeded!",
			"did it!"),
		"failure" = list(
			"was really bad at whatever they did.",
			"just really sucked.",
			"messed up real bad.")),
	EMOTE_SPECIAL_SUF = list(
		"initial" = list(
			"shouldnt see this lol"),
		"success" = list(
			"Ring-a-ding baby!",
			"Wow!"),
		"failure" = list(
			"How could someone mess up so badly?",
			"The game was rigged from the start."))))


/datum/emote/living/special
	key = "special"
	message = null
	cooldown = 2.5 SECONDS // longer than it takes for the emote to run
	stat_allowed = UNCONSCIOUS
	var/special_delay = 2 SECONDS

/datum/emote/living/special/run_emote(mob/user, params, type_override, intentional = FALSE)
	if(!can_run_emote(user, TRUE, intentional))
		return FALSE
	if(jobban_isbanned(user, "emote"))	// emote ban
		to_chat(user, "You cannot send emotes (banned).")
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)	// muted
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE

	if(isnull(user.special_a))
		to_chat(user, span_phobia("You arent special."))
		to_chat(user, span_notice("Mainly because you're playing a mob withough any special skills. This is probably a bug~"))
		return FALSE

	var/special_noun = null

	for(var/which_special in GLOB.special_skill_list)
		/// if the thing we said after the emote is in one of these lists, pick the corresponding key
		if(params in GLOB.special_triggers[which_special])
			special_noun = which_special

	if(!(special_noun in GLOB.special_skill_list) || !special_noun)
		to_chat(user, span_alert("That's not a valid SPECIAL stat!"))
		to_chat(user, span_notice("To use this emote, type '*special' followed by a SPECIAL stat. For instance, '*special luck' will do a (luck*10)% roll and say if you passed or not."))
		var/valid_specials
		for(var/word in GLOB.special_triggers)
			valid_specials += "[GLOB.special_triggers[word][1]], "
			valid_specials += "[GLOB.special_triggers[word][2]]. "
		to_chat(user, span_notice("Some of the valid SPECIAL keywords are:[valid_specials]."))
		return

	var/special_skill = null
	switch(special_noun)
		if(EMOTE_SPECIAL_STR)
			special_skill = user.special_s
		if(EMOTE_SPECIAL_PER)
			special_skill = user.special_p
		if(EMOTE_SPECIAL_END)
			special_skill = user.special_e
		if(EMOTE_SPECIAL_CHA)
			special_skill = user.special_c
		if(EMOTE_SPECIAL_INT)
			special_skill = user.special_i
		if(EMOTE_SPECIAL_AGI)
			special_skill = user.special_a
		if(EMOTE_SPECIAL_LCK)
			special_skill = user.special_l
		if(EMOTE_SPECIAL_GEN) // generic random 50% chance
			special_skill = 5

	var/first_phrase = pick(GLOB.special_phrases[special_noun]["initial"])
	var/message_first = span_notice("\[[special_noun], [special_skill]0%] <b>[user]</b> [first_phrase].")	// [Luck, 100%] User tests their Luck.

	user.visible_message(
		message = message_first,
		self_message = message_first,
		blind_message = message_first)
	user.emote_for_ghost_sight(message_first)

	spawn(special_delay)
		if(!user)
			return
		if(!can_run_emote(user, TRUE,intentional))
			return

		var/message_second
		if(prob(special_skill * 10))
			var/success_phrase = pick(GLOB.special_phrases[special_noun]["success"])
			if(prob(5)) // crit success!
				success_phrase += " [pick(GLOB.special_phrases[EMOTE_SPECIAL_SUF]["success"])]"
			message_second = span_green("\[Success\] <b>[user]</b> [success_phrase]") // [Success] User is pretty lucky!
		else
			var/fail_phrase = pick(GLOB.special_phrases[special_noun]["failure"])
			if(prob(5)) // crit fail!
				fail_phrase += " [pick(GLOB.special_phrases[EMOTE_SPECIAL_SUF]["failure"])]"
			message_second = span_red("\[Failure\] <b>[user]</b> [fail_phrase]") // [Failure} User isn't very lucky...

		user.visible_message(
			message = message_second,
			self_message = message_second,
			blind_message = message_second)
		user.emote_for_ghost_sight(message_second)
