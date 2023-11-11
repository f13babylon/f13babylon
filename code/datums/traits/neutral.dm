//traits with no real impact that can be taken freely
//MAKE SURE THESE DO NOT MAJORLY IMPACT GAMEPLAY. those should be positive or negative traits.

/datum/quirk/no_taste
	name = "Ageusia"
	desc = "You can't taste anything! Toxic food will still poison you."
	value = 0
	mob_trait = TRAIT_AGEUSIA
	gain_text = "<span class='notice'>You can't taste anything!</span>"
	lose_text = "<span class='notice'>You can taste again!</span>"
	medical_record_text = "Patient suffers from ageusia and is incapable of tasting food or reagents."

/datum/quirk/snob
	name = "Snob"
	desc = "You care about the finer things, if a room doesn't look nice its just not really worth it, is it?"
	value = 0
	gain_text = "<span class='notice'>You feel like you understand what things should look like.</span>"
	lose_text = "<span class='notice'>Well who cares about deco anyways?</span>"
	medical_record_text = "Patient seems to be rather stuck up."
	mob_trait = TRAIT_SNOB

/datum/quirk/friendly
	name = "Friendly"
	desc = "You give the best hugs, especially when you're in the right mood."
	value = 0
	mob_trait = TRAIT_FRIENDLY
	gain_text = "<span class='notice'>You want to hug someone.</span>"
	lose_text = "<span class='danger'>You no longer feel compelled to hug others.</span>"
	mood_quirk = TRUE
	medical_record_text = "Patient demonstrates low-inhibitions for physical contact and well-developed arms. Requesting another doctor take over this case."

/datum/quirk/empath
	name = "Empath"
	desc = "Whether it's a sixth sense or careful study of body language, it only takes you a quick glance at someone to understand how they feel."
	value = 0
	mob_trait = TRAIT_EMPATH
	gain_text = "<span class='notice'>You feel in tune with those around you.</span>"
	lose_text = "<span class='danger'>You feel isolated from others.</span>"
	medical_record_text = "Patient is highly perceptive of and sensitive to social cues, or may possibly have ESP. Further testing needed."

/datum/quirk/jolly
	name = "Jolly"
	desc = "You sometimes just feel happy, for no reason at all."
	value = 0
	mob_trait = TRAIT_JOLLY
	mood_quirk = TRUE
	medical_record_text = "Patient demonstrates constant euthymia irregular for environment. It's a bit much, to be honest."

/datum/quirk/jolly/on_process()
	if(prob(0.05))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "jolly", /datum/mood_event/jolly)

	/datum/quirk/depression
	name = "Depression"
	desc = "You sometimes just hate life."
	mob_trait = TRAIT_DEPRESSION
	value = 0
	gain_text = "<span class='danger'>You start feeling depressed.</span>"
	lose_text = "<span class='notice'>You no longer feel depressed.</span>" //if only it were that easy!
	medical_record_text = "Patient has a severe mood disorder, causing them to experience acute episodes of depression."
	mood_quirk = TRUE

/datum/quirk/depression/on_process()
	if(prob(0.05))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "depression", /datum/mood_event/depression)

/datum/quirk/lightless
	name = "Light Sensitivity"
	desc = "Bright lights irritate you. Your eyes start to water, your skin feels itchy against the photon radiation, and your hair gets dry and frizzy. Maybe it's a medical condition."
	value = 0
	gain_text = "<span class='danger'>The safety of light feels off...</span>"
	lose_text = "<span class='notice'>Enlightening.</span>"
	medical_record_text = "Patient has acute phobia of light, and insists it is physically harmful."

/datum/quirk/apathetic
	name = "Apathetic"
	desc = "You just don't care as much as other people. That's nice to have in a place like this, I guess."
	value = 0
	mood_quirk = TRUE
	medical_record_text = "Patient was administered the Apathy Evaluation Scale but did not bother to complete it."

/datum/quirk/unstable
	name = "Unstable"
	desc = "Due to past troubles, you are unable to recover your sanity if you lose it. Be very careful managing your mood!"
	value = 0
	mob_trait = TRAIT_UNSTABLE
	gain_text = "<span class='danger'>There's a lot on your mind right now.</span>"
	lose_text = "<span class='notice'>Your mind finally feels calm.</span>"
	medical_record_text = "Patient's mind is in a vulnerable state, and cannot recover from traumatic events."

/datum/quirk/apathetic/add()
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(mood)
		mood.mood_modifier = 0.8

/datum/quirk/apathetic/remove()
	if(quirk_holder)
		var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
		if(mood)
			mood.mood_modifier = 1 //Change this once/if species get their own mood modifiers.

/datum/quirk/lightless/on_process()
	var/turf/T = get_turf(quirk_holder)
	var/lums = T.get_lumcount()
	if(lums >= 0.8)
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "brightlight", /datum/mood_event/brightlight)
	else
		SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, "brightlight")

/datum/quirk/family_heirloom
	name = "Family Heirloom"
	desc = "You are the current owner of an heirloom, passed down for generations. You have to keep it safe!"
	value = 0
	mood_quirk = TRUE
	medical_record_text = "Patient demonstrates an unnatural attachment to a family heirloom."
	var/obj/item/heirloom
	var/where

GLOBAL_LIST_EMPTY(family_heirlooms)

/datum/quirk/family_heirloom/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/heirloom_type
	switch(quirk_holder.mind.assigned_role)
		if("Scribe")
			heirloom_type = pick(/obj/item/trash/f13/electronic/toaster, /obj/item/screwdriver/crude, /obj/item/toy/tragicthegarnering)
		if("Knight")
			heirloom_type = /obj/item/gun/ballistic/automatic/toy/pistol
		if("BoS Off-Duty")
			heirloom_type = /obj/item/toy/figure/borg
		if("Sheriff")
			heirloom_type = /obj/item/clothing/accessory/medal/silver
		if("Deputy")
			heirloom_type = /obj/item/clothing/accessory/medal/bronze_heart
		if("Shopkeeper")
			heirloom_type = /obj/item/coin/plasma
		if("Followers Doctor")
			heirloom_type = pick(/obj/item/clothing/neck/stethoscope,/obj/item/toy/tragicthegarnering)
		if("Followers Administrator")
			heirloom_type = pick(/obj/item/toy/nuke, /obj/item/wrench/medical, /obj/item/clothing/neck/tie/horrible)
		if("Prime Legionnaire")
			heirloom_type = pick(/obj/item/melee/onehanded/machete, /obj/item/melee/onehanded/club/warclub, /obj/item/clothing/accessory/talisman, /obj/item/toy/plush/mr_buckety)
		if("Recruit Legionnaire")
			heirloom_type = pick(/obj/item/melee/onehanded/machete, /obj/item/melee/onehanded/club/warclub, /obj/item/clothing/accessory/talisman,/obj/item/clothing/accessory/skullcodpiece/fake)
		if("Den Mob Boss")
			heirloom_type = /obj/item/lighter/gold
		if("Den Doctor")
			heirloom_type = /obj/item/card/id/dogtag/MDfakepermit
		if("Farmer")
			heirloom_type = pick(/obj/item/hatchet, /obj/item/shovel/spade, /obj/item/toy/plush/beeplushie)
		if("Janitor")
			heirloom_type = /obj/item/mop
		if("Security Officer")
			heirloom_type = /obj/item/clothing/accessory/medal/silver/valor
		if("Scientist")
			heirloom_type = /obj/item/toy/plush/slimeplushie
		if("Assistant")
			heirloom_type = /obj/item/clothing/gloves/cut/family
		if("Chaplain")
			heirloom_type = /obj/item/camera/spooky/family
		if("Captain")
			heirloom_type = /obj/item/clothing/accessory/medal/gold/captain/family
	if(!heirloom_type)
		heirloom_type = pick(
		/obj/item/toy/cards/deck,
		/obj/item/lighter,
		/obj/item/card/id/rusted,
		/obj/item/card/id/rusted/fadedvaultid,
		/obj/item/clothing/gloves/ring/silver,
		/obj/item/toy/figure/detective,
		/obj/item/toy/tragicthegarnering,
		)
	heirloom = new heirloom_type(get_turf(quirk_holder))
	GLOB.family_heirlooms += heirloom
	var/list/slots = list(
		"in your left pocket" = SLOT_L_STORE,
		"in your right pocket" = SLOT_R_STORE,
		"in your backpack" = SLOT_IN_BACKPACK
	)
	where = H.equip_in_one_of_slots(heirloom, slots, FALSE) || "at your feet"

/datum/quirk/family_heirloom/post_add()
	if(where == "in your backpack")
		var/mob/living/carbon/human/H = quirk_holder
		SEND_SIGNAL(H.back, COMSIG_TRY_STORAGE_SHOW, H)

	to_chat(quirk_holder, "<span class='boldnotice'>There is a precious family [heirloom.name] [where], passed down from generation to generation. Keep it safe!</span>")
	var/list/family_name = splittext(quirk_holder.real_name, " ")
	heirloom.name = "\improper [family_name[family_name.len]] family [heirloom.name]"

/datum/quirk/family_heirloom/on_process()
	if(heirloom in quirk_holder.GetAllContents())
		SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, "family_heirloom_missing")
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "family_heirloom", /datum/mood_event/family_heirloom)
	else
		SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, "family_heirloom")
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "family_heirloom_missing", /datum/mood_event/family_heirloom_missing)

/datum/quirk/family_heirloom/clone_data()
	return heirloom

/datum/quirk/family_heirloom/on_clone(data)
	heirloom = data

/datum/quirk/musician
	name = "Musician"
	desc = "You can tune handheld musical instruments to play melodies that clear certain negative effects and soothe the soul."
	value = 0
	mob_trait = TRAIT_MUSICIAN
	gain_text = "<span class='notice'>You know everything about musical instruments.</span>"
	lose_text = "<span class='danger'>You forget how musical instruments work.</span>"
	medical_record_text = "Patient brain scans show a highly-developed auditory pathway."

/datum/quirk/musician/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/choice_beacon/music/B = new(get_turf(H))
	H.put_in_hands(B)
	H.equip_to_slot_if_possible(B, SLOT_IN_BACKPACK)
	var/obj/item/musicaltuner/musicaltuner = new(get_turf(H))
	H.put_in_hands(musicaltuner)
	H.equip_to_slot_if_possible(musicaltuner, SLOT_IN_BACKPACK)
	H.regenerate_icons()

/datum/quirk/fev //DOOM - Used in mob_tar creation && A secondary version for FEV-II exposure.
	name = "Unstable FEV Exposure"
	desc = "Be it accidental; the work of a mad scientist roaming the waste-land, or pre-war experiments that left an individual unable to die, this one has been exposed to an FEV Variation."
	value = 0 // Locked
	gain_text = span_notice("You feel a burning pain as your DNA is ripped apart, and sewn back together.")
	lose_text = span_notice("The dull metronome of pain that defined your existence has faded.")
	medical_record_text = "Patient appears to have 'perfect' DNA - if 'perfect' was a Wastelanders idea of beauty." 
	mob_trait = TRAIT_FEV
	locked = TRUE

/datum/quirk/fev/add()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.dna.species.punchdamagelow += 6 //Larger Muscle-mass
	mob_tar.dna.species.punchdamagehigh += 8 //But not too large. Reserved for FEV-II
	quirk_holder.become_mega_nearsighted(ROUNDSTART_TRAIT) //Custom proc to make essentially welder-blindness.
	mob_tar.maxHealth += 5 //These guys are tanky. Almost blind, and slower.
	mob_tar.health += 5
	mob_tar.resize += 0.05
	mob_tar.update_transform()
	to_chat(mob_tar, "<span class='notice'>You feel far stronger, and a tad dumber...</span>")

/datum/quirk/fev/on_spawn()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.dna.species.punchdamagelow += 6 //Larger Muscle-mass
	mob_tar.dna.species.punchdamagehigh += 8 //But not too large. Reserved for FEV-II
	quirk_holder.become_mega_nearsighted(ROUNDSTART_TRAIT) //Custom proc to make essentially welder-blindness.
	mob_tar.maxHealth += 5 //These guys are tanky. Almost blind, and slower.
	mob_tar.health += 5
	to_chat(mob_tar, "<span class='notice'>You feel far stronger, and a tad dumber...</span>")

/datum/quirk/fev/remove()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.remove_mega_nearsighted()
	mob_tar.maxHealth -= 5 //Mutie rage.
	mob_tar.health -= 5
	mob_tar.dna.species.punchdamagelow -= 6
	mob_tar.dna.species.punchdamagehigh -= 8 
	mob_tar.resize -= 0.05
	mob_tar.update_transform()

/datum/quirk/fevII //FRANK FUCKING HORRIGAAAN
	name = "FEV-II Exposure"
	desc = "Direct exposure to FEV-II has caused unpredictable mutations to existing DNA."
	value = 0 //Never unlockable naturally.
	gain_text = span_notice("You feel a burning pain as your DNA is ripped apart, and sewn back together.")
	lose_text = span_notice("The dull metronome of pain that defined your existence has faded.")
	medical_record_text = "Patient has been exposed to FEV-II, with clear signs of triple-helix DNA present." 
	mob_trait = TRAIT_FEVII
	locked = TRUE

/datum/quirk/fevII/add()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.dna.species.punchdamagelow += 8 //Fear.
	mob_tar.dna.species.punchdamagehigh += 16  //Hurts!
	mob_tar.maxHealth += 15 //Mutie rage.
	mob_tar.health += 15
	mob_tar.resize += 0.1
	mob_tar.update_transform()
	to_chat(mob_tar, "<span class='danger'>You feel extremely strong!</span>")

/datum/quirk/fevII/on_spawn() //should never happen.
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.dna.species.punchdamagelow += 8 //Fear.
	mob_tar.dna.species.punchdamagehigh += 16  //Hurts bad.
	mob_tar.maxHealth += 15 //Mutie rage.
	mob_tar.health += 15
	to_chat(mob_tar, "<span class='danger'>You feel extremely strong!</span>")


/datum/quirk/fevII/remove()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.dna.species.punchdamagelow -= 8
	mob_tar.dna.species.punchdamagehigh -= 16 //Prevents stacking
	mob_tar.maxHealth -= 15 //Mutie rage.
	mob_tar.health -= 15
	mob_tar.resize -= 0.1
	mob_tar.update_transform()

/datum/quirk/pineapple_liker
	name = "Ananas Affinity"
	desc = "You find yourself greatly enjoying fruits of the ananas genus. You can't seem to ever get enough of their sweet goodness!"
	value = 0
	gain_text = "<span class='notice'>You feel an intense craving for pineapple.</span>"
	lose_text = "<span class='notice'>Your feelings towards pineapples seem to return to a lukewarm state.</span>"
	medical_record_text = "Patient demonstrates a pathological love of pineapple."

/datum/quirk/pineapple_liker/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food |= PINEAPPLE

/datum/quirk/pineapple_liker/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food &= ~PINEAPPLE

/datum/quirk/pineapple_hater
	name = "Ananas Aversion"
	desc = "You find yourself greatly detesting fruits of the ananas genus. Serious, how the hell can anyone say these things are good? And what kind of madman would even dare putting it on a pizza!?"
	value = 0
	gain_text = "<span class='notice'>You find yourself pondering what kind of idiot actually enjoys pineapples...</span>"
	lose_text = "<span class='notice'>Your feelings towards pineapples seem to return to a lukewarm state.</span>"
	medical_record_text = "Patient is correct to think that pineapple is disgusting."

/datum/quirk/pineapple_hater/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.disliked_food |= PINEAPPLE

/datum/quirk/pineapple_hater/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.disliked_food &= ~PINEAPPLE

/datum/quirk/deviant_tastes
	name = "Deviant Tastes"
	desc = "You dislike food that most people enjoy, and find delicious what they don't."
	value = 0
	gain_text = "<span class='notice'>You start craving something that tastes strange.</span>"
	lose_text = "<span class='notice'>You feel like eating normal food again.</span>"
	medical_record_text = "Patient demonstrates irregular nutrition preferences."

/datum/quirk/deviant_tastes/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	var/liked = species.liked_food
	species.liked_food = species.disliked_food
	species.disliked_food = liked

/datum/quirk/deviant_tastes/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food = initial(species.liked_food)
		species.disliked_food = initial(species.disliked_food)

/datum/quirk/monochromatic
	name = "Monochromacy"
	desc = "You suffer from full colorblindness, and perceive nearly the entire world in blacks and whites."
	value = 0
	medical_record_text = "Patient is afflicted with almost complete color blindness."

/datum/quirk/monochromatic/add()
	quirk_holder.add_client_colour(/datum/client_colour/monochrome)

/datum/quirk/monochromatic/post_add()
	if(quirk_holder.mind.assigned_role == "Detective")
		to_chat(quirk_holder, "<span class='boldannounce'>Mmm. Nothing's ever clear on this station. It's all shades of gray...</span>")
		quirk_holder.playsound_local(quirk_holder, 'sound/ambience/ambidet1.ogg', 50, FALSE)

/datum/quirk/monochromatic/remove()
	if(quirk_holder)
		quirk_holder.remove_client_colour(/datum/client_colour/monochrome)

/*
/datum/quirk/maso
	name = "Masochism"
	desc = "You are aroused by pain."
	value = 0
	mob_trait = TRAIT_MASO
	gain_text = "<span class='notice'>You desire to be hurt.</span>"
	lose_text = "<span class='notice'>Pain has become less exciting for you.</span>"
*/

/datum/quirk/alcohol_intolerance
	name = "Alcohol Intolerance"
	desc = "You take toxin damage from alcohol rather than getting drunk."
	value = 0
	mob_trait = TRAIT_NO_ALCOHOL
	medical_record_text = "Patient's body does not react properly to ethyl alcohol."

/datum/quirk/alcohol_intolerance/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.disliked_food |= ALCOHOL

/datum/quirk/alcohol_intolerance/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.disliked_food &= ~ALCOHOL

/datum/quirk/longtimer
	name = "Longtimer"
	desc = "You've been around for a long time and seen more than your fair share of action, suffering some pretty nasty scars along the way. For whatever reason, you've declined to get them removed or augmented."
	value = 0
	gain_text = "<span class='notice'>Your body has seen better days.</span>"
	lose_text = "<span class='notice'>Your sins may wash away, but those scars are here to stay...</span>"
	medical_record_text = "Patient has withstood significant physical trauma and declined plastic surgery procedures to heal scarring."
	/// the minimum amount of scars we can generate
	var/min_scars = 3
	/// the maximum amount of scars we can generate
	var/max_scars = 7

/datum/quirk/longtimer/on_spawn()
	var/mob/living/carbon/C = quirk_holder
	C.generate_fake_scars(rand(min_scars, max_scars))

//Horrid and pulled from Crash
/datum/quirk/soapstone
	name = "Soapstone"
	desc = "You recently found this yellow rock. Neat. Now, if only you knew what this did..."
	value = 0
	var/obj/item/heirloom
	var/where

/datum/quirk/soapstone/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/heirloom_type  ///DONT CHANGE HERILOOM STUFF FOR SOME REASON DONT WORK IF YOU REMOVE IT AAAAA.
	switch(quirk_holder.mind.assigned_role)
		if("Baron", "Centurion", "Sheriff", "NCR Captain")
			heirloom_type = pick(/obj/item/soapstone)
		else
			heirloom_type = pick(
				/obj/item/soapstone/trait)
	heirloom = new heirloom_type(get_turf(quirk_holder)) //IF YOU CHANGE THIS FOR SOME REASON WILL NOT WORK.
	var/list/slots = list(
		"in your left pocket" = SLOT_L_STORE, //SPAWNS IN THE POCKETS
		"in your right pocket" = SLOT_R_STORE,
		"in your backpack" = SLOT_IN_BACKPACK	//SPAWNS IN THE BACKPACK

	)
	where = H.equip_in_one_of_slots(heirloom, slots, FALSE) || "at your feet"

/datum/quirk/soapstone/post_add()
	if(where == "in your backpack")
		var/mob/living/carbon/human/H = quirk_holder
		SEND_SIGNAL(H.back, COMSIG_TRY_STORAGE_SHOW, H)
