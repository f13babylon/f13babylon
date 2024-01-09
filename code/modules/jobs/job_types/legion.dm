/*
WRITTEN 12/11/22 - AUTHOR: DRAGONFRUITS
[CAESAR'S LEGION FACTION DESIGN NOTES]
The Legion focuses on being hard-hitting melee glass cannons above all. They're expected to have weak, fast armor and usually poor choices
of ranged equipment.
For the sake of this, most if not all of the Legion's members come pre-equipped with trekking, iron fist, and big leagues.
The leaders are supplied lifegiver to further encourage their gameplay style.
They're primarily countered by long range attacks or wide defenses that force them to switch their playstyle.

The exception to the Legion's forced playstyle are Explorers and their squad lead, as well as the Centurion's prioprietary Ranger counter loadout.

Discuss balance and documentation changes with Dragonfruits#1913 or forward them to Carl.
*/

/datum/job/CaesarsLegion
	department_flag = LEGION
	selection_color = "#ffeeee"
	faction = FACTION_LEGION

	forbids = "The Legion forbids: Using chemicals the likes of stimpacks, buffout, med-x, et cetera. Ghouls or mutants serving. Women fighting (self defense and suicide allowed). Slaves carrying weapons. Reliance on technology & Killing Legion members in secret, only if according to law and in public is it acceptable."
	enforces = "The Legion demands: Obeying the orders of superiors. A Latin name. Wearing the uniform (Unless acting as a Frumentarius). Expect death as punishment for failing to obey."
	objectivesList = list("Focus on the tribals, win them over or intimidate them.", "Focus on Bighorn, display power.", "Send out patrols and establish checkpoints to curb use of digusting drugs and degenerate behaviour.", "Flagstaff requests more workers: acquire slaves, train them if possible, send them east for breaking if not.", "Make sure no other faction than the Khans gains dominance in Bighorn, if they remain neutral it can be used to the Legion's advantage.")

	exp_type = EXP_TYPE_LEGION

	access = list(ACCESS_LEGION, ACCESS_LEGION_SLAVE)
	minimal_access = list(ACCESS_LEGION, ACCESS_LEGION_SLAVE)
	blacklisted_quirks = list(/datum/quirk/stim_intolerance, /datum/quirk/straight_edge, /datum/quirk/herbal_affinity)

/datum/outfit/job/CaesarsLegion
	ears = null
	box = null

/datum/outfit/job/CaesarsLegion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legiongate)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/berserker_powder)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/hydra)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/naturalpainkiller)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/rip/crossexecution)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombatarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombatarmormk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombathelmetmk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionrangercape)
	ADD_TRAIT(H, TRAIT_GENERIC,  REF(src))
	ADD_TRAIT(H, TRAIT_STIM_INTOLERANCE, REF(src)) //Can't use stimpaks without getting sick
	ADD_TRAIT(H, TRAIT_STRAIGHT_EDGE, REF(src)) //Can't use Fallout chems, such as Psycho, Med-X, Buffout, Turbo etc. without getting sick
	ADD_TRAIT(H, TRAIT_HERBAL_AFFINITY, REF(src)) //Better tribal medicine healing rates and no drawbacks

/datum/outfit/job/CaesarsLegion/Legionnaire
	belt = /obj/item/storage/belt/military/assault/legion
	ears = /obj/item/radio/headset/headset_legion
	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	uniform = /obj/item/clothing/under/f13/legskirt
	shoes = /obj/item/clothing/shoes/f13/military/legion
	gloves = /obj/item/clothing/gloves/legion
	box = /obj/item/storage/survivalkit_tribal

/datum/outfit/job/CaesarsLegion/Legionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)	//sorry babe, the legion /are/ gamers.
		H.gender = MALE
		H.real_name = random_unique_name(MALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()
	ADD_TRAIT(H, TRAIT_HERBAL_AFFINITY,  REF(src))
	ADD_TRAIT(H, TRAIT_GENERIC,  REF(src))
	ADD_TRAIT(H, TRAIT_FEARLESS,  REF(src)) //no phobias for legion!
	ADD_TRAIT(H, TRAIT_BERSERKER,  REF(src))

/obj/item/storage/box/legate
	name = "legate belongings"
	icon_state = "secbox"
	illustration = "flashbang"

/obj/item/storage/box/legate/PopulateContents()
	. = ..()
	new /obj/item/reagent_containers/pill/patch/healingpoultice(src)
	new /obj/item/reagent_containers/pill/patch/healingpoultice(src)
	new /obj/item/ammo_box/magazine/m14mm(src)
	new /obj/item/ammo_box/magazine/m14mm(src)
	new /obj/item/ammo_box/magazine/m14mm(src)


///////////////////
/// Admin Roles ///
///////////////////

// LEGATE

/datum/job/CaesarsLegion/Legionnaire/f13legate
	title = "Legion Legate"
	flag = F13LEGATE
	head_announce = list("Security")
	supervisors = "Caesar"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	total_positions = 0
	spawn_positions = 0
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legate
	access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)
	minimal_access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legate/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS,  REF(src))
	ADD_TRAIT(H, TRAIT_LIFEGIVER,  REF(src))
	ADD_TRAIT(H, TRAIT_IRONFIST,  REF(src))
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES,  REF(src))
	H.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legate	// 14mm Pistol, Goliath
	name = "Legate"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13legate
	shoes =	/obj/item/clothing/shoes/f13/military/legate
	suit = /obj/item/clothing/suit/armor/f13/legion/legate
	head = /obj/item/clothing/head/helmet/f13/legion/legate
	gloves = /obj/item/clothing/gloves/legion/legate
	glasses = /obj/item/clothing/glasses/sunglasses/big
	suit_store = /obj/item/gun/ballistic/automatic/pistol/pistol14
	r_pocket = /obj/item/storage/bag/money/small/legion
	l_pocket = /obj/item/flashlight/lantern
	r_hand = /obj/item/melee/f13powerfist/goliath
	l_hand = /obj/item/tank/internals/oxygen
	backpack = null
	satchel = null
	ears = /obj/item/radio/headset/headset_legion/cent
	box = /obj/item/storage/box/legate


// ORATOR

/datum/job/CaesarsLegion/Legionnaire/f13orator
	title = "Legion Orator"
	flag = F13ORATOR
	supervisors = "Centurion"
	selection_color = "#ffdddd"
	total_positions = 1
	spawn_positions = 1
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13orator
	display_order = JOB_DISPLAY_ORDER_ORATOR
	access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)
	minimal_access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)
	exp_type = EXP_TYPE_LEGION
	exp_requirements = 900

/datum/outfit/job/CaesarsLegion/Legionnaire/f13orator
	name = "Orator"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13orator
	suit = /obj/item/clothing/suit/armor/f13/legion/orator
	head = /obj/item/clothing/head/helmet/f13/legion/orator
	ears = /obj/item/radio/headset/headset_legion
	shoes = /obj/item/clothing/shoes/f13/military/plated
	neck = /obj/item/storage/belt/holster
	id = /obj/item/card/id/dogtag/legorator
	backpack = /obj/item/storage/backpack/legionr
	r_pocket = /obj/item/storage/bag/money/small/legofficers
	l_pocket = /obj/item/flashlight/lantern
	suit_store = /obj/item/gun/ballistic/automatic/pistol/pistol14/orator
	backpack_contents = list(
		/obj/item/binoculars = 1,
		/obj/item/ammo_box/magazine/m14mm = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2,
		/obj/item/book/granter/trait/iron_fist = 1,
		/obj/item/book/granter/trait/bigleagues = 1,
		/obj/item/stack/f13Cash/random/denarius/high = 3,
		/obj/item/stack/f13Cash/random/aureus/high = 2
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13orator/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS,  REF(src))
	ADD_TRAIT(H, TRAIT_LIFEGIVER,  REF(src))
	H.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)

/datum/job/CaesarsLegion/f13priestess
	title = "Legion Priestess"
	flag = F13PRIESTESS
	supervisors = "Centurion"
	selection_color = "#ffdddd"
	total_positions = 1
	spawn_positions = 1
	outfit = /datum/outfit/job/CaesarsLegion/f13priestess
	display_order = JOB_DISPLAY_ORDER_PRIESTESS
	access = list(ACCESS_LEGION, ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)
	minimal_access = list(ACCESS_LEGION, ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)
	exp_type = EXP_TYPE_LEGION
	exp_requirements = 900

/datum/outfit/job/CaesarsLegion/f13priestess
	name = "Priestess of Mars"
	jobtype = /datum/job/CaesarsLegion/f13priestess
	uniform = /obj/item/clothing/under/f13/pmarsrobe
	head = /obj/item/clothing/head/helmet/f13/legion/orator
	ears = /obj/item/radio/headset/headset_legion
	shoes = /obj/item/clothing/shoes/roman
	id = /obj/item/card/id/dogtag/legpriest
	backpack = /obj/item/storage/backpack/legionr
	r_pocket = /obj/item/storage/bag/money/small/legofficers
	l_pocket = /obj/item/flashlight/lantern
	box = /obj/item/storage/survivalkit_tribal/chief
	belt = /obj/item/storage/belt/military/assault/legion
	backpack_contents = list(
		/obj/item/stack/f13Cash/random/denarius/high = 1,
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/stack/sticky_tape/surgical = 1,
		/obj/item/stack/medical/bone_gel = 1,
		/obj/item/warpaint_bowl = 1
	)

/datum/outfit/job/CaesarsLegion/f13priestess/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == MALE)	//femstatic role
		H.gender = FEMALE
		H.real_name = random_unique_name(FEMALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()
	ADD_TRAIT(H, TRAIT_SURGERY_MID,  REF(src))
	ADD_TRAIT(H, TRAIT_LIFEGIVER,  REF(src))
	ADD_TRAIT(H, TRAIT_CHEMWHIZ,  REF(src))
	ADD_TRAIT(H, TRAIT_MARS_TEACH,  REF(src))

/////////////////
//// Officers ///
/////////////////

// CENTURION

/datum/job/CaesarsLegion/Legionnaire/f13centurion
	title = "Legion Centurion"
	flag = F13CENTURION
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the camp commander and strongest soldier. Use your officers, the Decanii, to delegate tasks, make sure you lead and give orders. Take no disrespect, you are the dominus. If you prove a fool or weak, expect to be dispatched by a stronger subordinate."
	supervisors = "the Legate"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	display_order = JOB_DISPLAY_ORDER_CENTURION
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion
	exp_type = EXP_TYPE_LEGION
	exp_requirements = 1440

	access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)
	minimal_access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)

	loadout_options = list(
		/datum/outfit/loadout/palacent,				// M1919, Spatha
		/datum/outfit/loadout/rangerhunter,			// AMR, Hunting Revolver, Spatha
		/datum/outfit/loadout/centurion,			// Uzi, Goliath, CQC
		/datum/outfit/loadout/berserkercenturion,	// Love Tap, Berserker Martial Art
	)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS,  REF(src))
	ADD_TRAIT(H, TRAIT_LIFEGIVER,  REF(src))
	ADD_TRAIT(H, TRAIT_IRONFIST,  REF(src))
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES,  REF(src))
	H.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion
	name = "Legion Centurion"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13centurion
	id = /obj/item/card/id/dogtag/legcenturion
	mask = /obj/item/clothing/mask/bandana/legion/legcenturion
	ears = /obj/item/radio/headset/headset_legion/cent
	gloves = /obj/item/clothing/gloves/legion/plated
	glasses = /obj/item/clothing/glasses/night/polarizing
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/restraints/handcuffs
	l_pocket = /obj/item/flashlight/lantern
	box = /obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola = 1,
		/obj/item/storage/bag/money/small/legion = 1,
		/obj/item/warpaint_bowl = 1,
		/obj/item/ammo_box/a357 = 1,
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/binoculars = 1,
	)

/datum/outfit/loadout/palacent
	name = "Paladin-Slayer Centurion"
	suit = /obj/item/clothing/suit/armor/f13/legion/palacent
	head = /obj/item/clothing/head/helmet/f13/legion/palacent
	neck = /obj/item/clothing/neck/mantle/legion
	suit_store = /obj/item/gun/ballistic/automatic/lmg/m1919
	backpack_contents = list(
		/obj/item/ammo_box/magazine/mm762 = 1,
		/obj/item/melee/onehanded/machete/spatha = 1,
	)

/datum/outfit/loadout/rangerhunter
	name = "Ranger-Hunter Centurion"
	suit = /obj/item/clothing/suit/armor/f13/legion/rangercent
	head = /obj/item/clothing/head/helmet/f13/legion/rangercent
	neck = /obj/item/clothing/neck/mantle/legion/rangercent
	suit_store = /obj/item/gun/ballistic/rifle/mag/antimateriel
	backpack_contents = list(
		/obj/item/ammo_box/magazine/amr = 2,
		/obj/item/gun/ballistic/revolver/hunting = 1,
		/obj/item/melee/onehanded/machete/spatha = 1,
	)

/datum/outfit/loadout/centurion
	name = "Warlord Centurion"
	suit = /obj/item/clothing/suit/armor/f13/legion/centurion
	head = /obj/item/clothing/head/helmet/f13/legion/centurion
	neck = /obj/item/clothing/neck/mantle/legion
	suit_store = /obj/item/gun/ballistic/automatic/smg/uzi
	backpack_contents = list(
		/obj/item/melee/f13powerfist/goliath = 1,
		/obj/item/book/granter/martial/cqc = 1,
		/obj/item/ammo_box/magazine/msmg9mm/drum = 1,
	)

/datum/outfit/loadout/berserkercenturion
	name = "Praetorian Candidate"
	suit = /obj/item/clothing/suit/armor/f13/legion/centurion
	head = /obj/item/clothing/head/helmet/f13/legion/centurion
	neck = /obj/item/clothing/neck/mantle/legion
	backpack_contents = list(
		/obj/item/melee/unarmed/brass/lovetap = 1,
		/obj/item/book/granter/martial/berserker = 1,
	)

// VETERAN DECANUS

/datum/job/CaesarsLegion/Legionnaire/f13decanvet
	title = "Legion Veteran Decanus"
	flag = F13DECANVET
	total_positions = 1
	spawn_positions = 1
	description = "You answer directly to the Centurion, his second in command. Lead the camp, ensure its defended, keep track of the Explorers and use your veterans to their full potential."
	supervisors = "the Centurion"
	display_order = JOB_DISPLAY_ORDER_DECANVET
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet
	exp_type = EXP_TYPE_LEGION
	exp_requirements = 900

	access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)
	minimal_access = list(ACCESS_LEGION, ACCESS_CHANGE_IDS, ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)

	loadout_options = list(
		/datum/outfit/loadout/decvetbull,	// Chinese LMG, Advanced 9mm pistol
		/datum/outfit/loadout/decvetwolf,	// Thermic lance, 10mm SMG
		/datum/outfit/loadout/decvetsnake, // Brush gun, Spatha
		/datum/outfit/loadout/decvetbrave, // Riot shotgun, Spatha
	)


/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES,  REF(src))
	ADD_TRAIT(H, TRAIT_IRONFIST,  REF(src))
	ADD_TRAIT(H, TRAIT_HARD_YARDS,  REF(src))
	ADD_TRAIT(H, TRAIT_LIFEGIVER,  REF(src))

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet
	name = "Legion Veteran Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decanvet
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/heavy
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	gloves = /obj/item/clothing/gloves/legion/plated
	glasses = /obj/item/clothing/glasses/legiongoggles
	ears = /obj/item/radio/headset/headset_legion/cent
	glasses = /obj/item/clothing/glasses/sunglasses/big
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	box = /obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/storage/bag/money/small/legofficers = 1,
		/obj/item/binoculars = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2,
	)

/datum/outfit/loadout/decvetbull
	name = "Mark of The Bull"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/decan
	suit_store = /obj/item/gun/ballistic/automatic/lmg/type88
	backpack_contents = list(
		/obj/item/ammo_box/magazine/type88 = 1,
		/obj/item/gun/ballistic/automatic/pistol/beretta = 1,
		/obj/item/ammo_box/magazine/m9mmds = 2,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 2,
	)

/datum/outfit/loadout/decvetwolf
	name = "Mark of the Wolf"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/decan
	suit_store = /obj/item/twohanded/thermic_lance
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/smg/smg10mm = 1,
		/obj/item/ammo_box/magazine/msmg10mm = 2,
	)

/datum/outfit/loadout/decvetsnake
	name = "Mark of the Snake"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/decan
	suit_store = /obj/item/gun/ballistic/rifle/repeater/brush
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/spatha = 1,
		/obj/item/ammo_box/tube/c4570 = 3,
	)

/datum/outfit/loadout/decvetbrave
	name = "Mark of the Brave"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/decan
	suit_store = /obj/item/gun/ballistic/automatic/shotgun/riot
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/spatha = 1,
		/obj/item/ammo_box/magazine/d12g = 2,
	)

// PRIME DECANUS

/datum/job/CaesarsLegion/Legionnaire/f13decan
	title = "Legion Prime Decanus"
	flag = F13DECAN
	total_positions = 1
	spawn_positions = 1
	description = "A experienced officer, often commanding the camp. Give orders, lead patrols."
	supervisors = "the Veteran Decanus and the Centurion"
	display_order = JOB_DISPLAY_ORDER_DECAN
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decan
	access = list(ACCESS_LEGION, ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)
	minimal_access = list(ACCESS_LEGION,  ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)
	exp_type = EXP_TYPE_LEGION
	exp_requirements = 780

	loadout_options = list(	//ALL: Gladius, Smokebomb
		/datum/outfit/loadout/decprimfront,	// MP5, Tower Shield, Throwing knives
		/datum/outfit/loadout/decprimrear,	// Legion lance, Lever Shotgun
		/datum/outfit/loadout/decprimboom, // GL, .44 Revolver, Frag grenades
	)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
	)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decan/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES,  REF(src))
	ADD_TRAIT(H, TRAIT_IRONFIST,  REF(src))
	ADD_TRAIT(H, TRAIT_HARD_YARDS,  REF(src))
	ADD_TRAIT(H, TRAIT_LIFEGIVER,  REF(src))

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decan
	name = "Prime Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decan
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/prime/decan
	head = /obj/item/clothing/head/helmet/f13/legion/prime/decan
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/legiongoggles
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	l_pocket = /obj/item/restraints/handcuffs
	box = /obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/storage/bag/money/small/legofficers = 1,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/binoculars = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 1,
		)

/datum/outfit/loadout/decprimfront
	name = "Aspiring Prime Decanus"
	suit_store = /obj/item/gun/ballistic/automatic/smg/mp5
	backpack_contents = list(
		/obj/item/shield/riot/tower = 1,
		/obj/item/ammo_box/magazine/msmg9mm = 2,
		/obj/item/melee/onehanded/knife/throwing = 3,
		)

/datum/outfit/loadout/decprimrear
	name = "Battleborn Prime Decanus"
	suit_store = /obj/item/twohanded/spear/lance
	backpack_contents = list(
		/obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever = 1,
		/obj/item/ammo_box/shotgun/buck = 2,
		)

/datum/outfit/loadout/decprimboom
	name = "Marksman Prime Decanus"
	suit_store = /obj/item/gun/ballistic/automatic/rangemaster
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/m29 = 1,
		/obj/item/ammo_box/m44 = 2,
		/obj/item/ammo_box/magazine/m762mm = 2,
		)


// RECRUIT DECANUS

/datum/job/CaesarsLegion/Legionnaire/f13decanrec
	title = "Legion Recruit Decanus"
	flag = F13DECANREC
	total_positions = 2
	spawn_positions = 2
	description = "The junior officer, you must train the recruits and test them, and if a suicide charge is needed, lead them to a glorious death."
	supervisors = "the Prime/Veteran Decanus and the Centurion"
	display_order = JOB_DISPLAY_ORDER_DECANREC
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec
	access = list(ACCESS_LEGION, ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)
	minimal_access = list(ACCESS_LEGION,  ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)
	exp_type = EXP_TYPE_LEGION
	exp_requirements = 540

	loadout_options = list(
		/datum/outfit/loadout/recdeclegion,	// 10mm SMG, Lance, Smokebomb
		/datum/outfit/loadout/recdectribal,	// Trail Carbine, Throwing spears, Reinforced machete, Bottlecap mine
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES,  REF(src))
	ADD_TRAIT(H, TRAIT_HARD_YARDS,  REF(src))

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec
	name = "Legion Recruit Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decanrec
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/recruit/decan
	head = /obj/item/clothing/head/helmet/f13/legion/recruit/decan
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/legiongoggles
	r_pocket = /obj/item/flashlight/lantern
	l_pocket = /obj/item/storage/survivalkit_tribal
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/reagent_containers/pill/patch/healingpoultice = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/storage/bag/money/small/legofficers = 1,
		)

/datum/outfit/loadout/recdeclegion
	name = "Frontier Decanus"
	suit_store = /obj/item/twohanded/spear/lance
	backpack_contents = list(
		/obj/item/grenade/smokebomb = 1,
		/obj/item/gun/ballistic/automatic/smg/smg10mm = 1,
		/obj/item/ammo_box/magazine/msmg10mm = 2,
		/obj/item/warpaint_bowl = 1,
		)

/datum/outfit/loadout/recdectribal
	name = "Backliner Decanus"
	suit_store = /obj/item/gun/ballistic/rifle/repeater/trail
	backpack_contents = list(
		/obj/item/ammo_box/tube/m44 = 2,
		/obj/item/melee/onehanded/machete/forgedmachete = 1,
		/obj/item/storage/backpack/spearquiver = 1,
		/obj/item/warpaint_bowl = 1,
		)



////////////////////
///Specialist///////
////////////////////

// VEXILLARIUS

/datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	title = "Legion Vexillarius"
	flag = F13VEXILLARIUS
	total_positions = 2
	spawn_positions = 1
	description = "You are a Veteran of proven bravery. When not fighting, relay orders from the commander and act as a bodyguard."
	supervisors = "the Veteran Decanus and Centurion"
	display_order = JOB_DISPLAY_ORDER_VEXILLARIUS
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius
	access = list(ACCESS_LEGION, ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)
	minimal_access = list(ACCESS_LEGION,  ACCESS_LEGION_COMMAND, ACCESS_LEGION_SLAVE)
	exp_type = EXP_TYPE_LEGION
	exp_requirements = 1020

	loadout_options = list(
		/datum/outfit/loadout/vexbear,	//	Lever shotgun, Ripper
		/datum/outfit/loadout/vexfox,	//	Type 93, Spatha
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES,  REF(src))
	ADD_TRAIT(H, TRAIT_IRONFIST,  REF(src))
	ADD_TRAIT(H, TRAIT_HARD_YARDS,  REF(src))
	ADD_TRAIT(H, TRAIT_LIFEGIVER,  REF(src))
	H.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius
	name = "Vexillarius"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	id = /obj/item/card/id/dogtag/legveteran
	suit = /obj/item/clothing/suit/armor/f13/legion/vet/vexil
	mask = /obj/item/clothing/mask/bandana/legion/legvet
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/legion/plated
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpoultice = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/megaphone/cornu = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/warpaint_bowl = 1,
	)

/datum/outfit/loadout/vexbear
	name = "Mountain Bear"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/combvexil
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/reagent_containers/pill/patch/healingpowder/berserker = 2,
		/obj/item/melee/powered/ripper = 1,
		/obj/item/book/granter/martial/berserker = 1,
	)

/datum/outfit/loadout/vexfox
	name = "Desert Fox"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/vexil
	suit_store = /obj/item/gun/ballistic/automatic/assault_rifle/type93
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/spatha = 1,
		/obj/item/ammo_box/magazine/m5mm = 2,
	)

//EXPLORER

/datum/job/CaesarsLegion/Legionnaire/f13explorer
	title = "Legion Explorer"
	flag = F13EXPLORER
	total_positions = 2
	spawn_positions = 3
	description = "Scout the area, secure key points, but do not ignore orders or wordlessly die some place. A good explorer helps his unit by taking initiative and helping the commander without needing micro-managment."
	supervisors = "the Veteran Decanus and Centurion must be obeyed, and as always, respect must be given to other Decanus. You are not a officer, but you are a specialist."
	display_order = JOB_DISPLAY_ORDER_EXPLORER
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer
	exp_type = EXP_TYPE_LEGION
	exp_requirements = 300

	loadout_options = list(
		/datum/outfit/loadout/expambusher,	// Lever-action Shotgun, Reinforced Bola
		/datum/outfit/loadout/expstalker,	// MP5, Smoke Grenade
		/datum/outfit/loadout/expsniper,	// Explorer Sniper Rifle, .45 Revolver
	)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
			),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
			),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS,  REF(src))
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES,  REF(src))
	ADD_TRAIT(H, TRAIT_SILENT_STEP,  REF(src))

/datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer
	name = "Legion Explorer"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13explorer
	id = /obj/item/card/id/dogtag/legexplorer
	suit = /obj/item/clothing/suit/armor/f13/legion/vet/explorer
	head = /obj/item/clothing/head/helmet/f13/legion/vet/explorer
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/sunglasses/big
	r_pocket = /obj/item/flashlight
	l_pocket = /obj/item/binoculars
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/restraints/handcuffs = 1,
	)

/datum/outfit/loadout/expambusher
	name = "Ambusher"
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever
	backpack_contents = list(
		/obj/item/restraints/legcuffs/bola/tactical = 1,
		/obj/item/ammo_box/shotgun/buck = 2,
	)

/datum/outfit/loadout/expstalker
	name = "Stalker"
	suit_store = /obj/item/gun/ballistic/automatic/smg/mp5
	backpack_contents = list(
		/obj/item/grenade/smokebomb = 1,
		/obj/item/ammo_box/magazine/msmg9mm = 2,
	)

/datum/outfit/loadout/expsniper
	name = "Sniper"
	glasses = /obj/item/clothing/glasses/sunglasses/big
	suit_store = /obj/item/gun/ballistic/rifle/hunting/remington
	backpack_contents = list(
		/obj/item/attachments/scope = 1,
		/obj/item/ammo_box/a762mm = 4,
		/obj/item/gun/ballistic/revolver/revolver45 = 1,
		/obj/item/ammo_box/c45rev = 1,
	)

///////////////////
////Legionnaires///
///////////////////

// VETERAN

/datum/job/CaesarsLegion/Legionnaire/vetlegionnaire
	title = "Veteran Legionary"
	flag = F13VETLEGIONARY
	total_positions = 3
	spawn_positions = 3
	description = "A hardened warrior, obeying the orders from the Decanus and Centurion is second nature, as is fighting the profligates. If no officers are present, make sure the younger warriors act like proper Legionaires."
	supervisors = "the Decani and Centurion"
	display_order = JOB_DISPLAY_ORDER_VETLEGIONARY
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/vetlegionnaire
	exp_type = EXP_TYPE_LEGION
	exp_requirements = 840

	loadout_options = list(	//ALL: Gladius
		/datum/outfit/loadout/vetaxe,	// Smoke nade, Axe
		/datum/outfit/loadout/vetshot,	// Lever action
		/datum/outfit/loadout/vetrifle,		// Trail gun w/ Scope
	)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/vetlegionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES,  REF(src))
	ADD_TRAIT(H, TRAIT_HARD_YARDS,  REF(src))
	ADD_TRAIT(H, TRAIT_IRONFIST,  REF(src))

/datum/outfit/job/CaesarsLegion/Legionnaire/vetlegionnaire
	name = "Veteran Legionary"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/vetlegionnaire
	id = /obj/item/card/id/dogtag/legveteran
	mask = /obj/item/clothing/mask/bandana/legion/legvet
	head = /obj/item/clothing/head/helmet/f13/legion/vet
	neck = /obj/item/storage/belt/holster
	suit = /obj/item/clothing/suit/armor/f13/legion/vet
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpoultice = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/restraints/handcuffs = 1,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/reagent_containers/pill/patch/bitterdrink = 1,
	)


/datum/outfit/loadout/vetaxe
	name = "Enforcer"
	suit_store = /obj/item/twohanded/legionaxe
	backpack_contents = list(
		/obj/item/grenade/smokebomb = 1,
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/ammo_box/a357 = 2,
	)

/datum/outfit/loadout/vetshot
	name = "Flanker"
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/restraints/legcuffs/bola = 1,
	)

/datum/outfit/loadout/vetrifle
	name = "Sharpshooter"
	suit_store = /obj/item/gun/ballistic/rifle/repeater/trail
	backpack_contents = list(
		/obj/item/ammo_box/tube/m44/ = 2,
		/obj/item/attachments/scope = 1,
		/obj/item/melee/onehanded/machete/gladius = 1,
	)

// PRIME

/datum/job/CaesarsLegion/Legionnaire/f13legionary
	title = "Prime Legionary"
	flag = F13LEGIONARY
	total_positions = 3
	spawn_positions = 3
	description = "A front line soldier who has shown ability to obey and fought in some battles. The Legions muscle, the young men who will build the future with their own blood and sacrifice, for Caesar."
	supervisors = "the Decani and Centurion"
	display_order = JOB_DISPLAY_ORDER_LEGIONARY
	exp_type = EXP_TYPE_LEGION
	exp_requirements = 180
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary

	loadout_options = list(	//ALL: Forged Machete
		/datum/outfit/loadout/primelancer,	// .357 Revolver, Legion lance
		/datum/outfit/loadout/primerifle,	// Cowboy Repeater, Firebomb
		/datum/outfit/loadout/primebrave,	// Hunting shotgun, Throwing spears
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES,  REF(src))
	ADD_TRAIT(H, TRAIT_HARD_YARDS,  REF(src))

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary
	name = "Prime Legionary"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13legionary
	id = /obj/item/card/id/dogtag/legprime
	mask = /obj/item/clothing/mask/bandana/legion/legprime
	head = /obj/item/clothing/head/helmet/f13/legion/prime
	neck = /obj/item/storage/belt/holster
	suit = /obj/item/clothing/suit/armor/f13/legion/prime
	glasses = /obj/item/clothing/glasses/legiongoggles
	r_pocket = /obj/item/flashlight/lantern
	l_pocket = /obj/item/restraints/handcuffs
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/reagent_containers/pill/patch/healingpoultice = 1,
		/obj/item/melee/onehanded/machete/forgedmachete = 1,
		)

/datum/outfit/loadout/primelancer
	name = "Guardian"
	suit_store = /obj/item/gun/ballistic/revolver/colt357
	r_hand = /obj/item/twohanded/spear/lance
	backpack_contents = list(
		/obj/item/ammo_box/a357 = 2,
		)

/datum/outfit/loadout/primerifle
	name = "Gunner"
	suit_store = /obj/item/gun/ballistic/rifle/repeater/cowboy
	backpack_contents = list(
		/obj/item/ammo_box/tube/a357 = 2,
		/obj/item/grenade/homemade/firebomb = 2,
		)

/datum/outfit/loadout/primebrave
	name = "Skirmish"
	suit_store = /obj/item/gun/ballistic/shotgun/hunting
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/storage/backpack/spearquiver = 1,
		)

// RECRUIT

/datum/job/CaesarsLegion/Legionnaire/f13recleg
	title = "Recruit Legionary"
	flag = F13RECRUITLEG
	total_positions = 4
	spawn_positions = 4
	description = "You have recently been transfered or inducted into The Legion. You have minimal training, and are expected to follow every whim of the Decani and your Centurion. Respect every soldier of higher rank."
	supervisors = "the Decani and Centurion."
	display_order = JOB_DISPLAY_ORDER_RECRUITLEG
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg

	loadout_options = list(	//ALL: Machete
		/datum/outfit/loadout/recruittribal,	// Fireaxe
		/datum/outfit/loadout/recruitlegion,	// .357 Revolver
		/datum/outfit/loadout/recruitutah, 		// Double barrel
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES,  REF(src))

/datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg
	name = "Recruit Legionary"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13recleg
	id = /obj/item/card/id/dogtag/legrecruit
	shoes = /obj/item/clothing/shoes/f13/military/leather
	suit = /obj/item/clothing/suit/armor/f13/legion/recruit
	head = /obj/item/clothing/head/helmet/f13/legion/recruit
	mask = /obj/item/clothing/mask/bandana/legion/legrecruit
	glasses = /obj/item/clothing/glasses/legiongoggles
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 1,
		)

/datum/outfit/loadout/recruittribal
	name = "Tribal Recruit"
	suit_store = /obj/item/twohanded/fireaxe
	backpack_contents = list(
		/obj/item/warpaint_bowl = 1,
		/obj/item/storage/backpack/spearquiver = 1,
	)

/datum/outfit/loadout/recruitlegion
	name = "Born in the East"
	suit_store = /obj/item/melee/onehanded/machete
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		/obj/item/ammo_box/a357 = 2,
		/obj/item/shield/riot/buckler = 1,
	)

/datum/outfit/loadout/recruitutah
	name = "Utah Recruit"
	suit_store = /obj/item/gun/ballistic/revolver/widowmaker
	backpack_contents = list(
		/obj/item/ammo_casing/shotgun/buckshot = 1,
		/obj/item/melee/onehanded/machete = 1,
	)



//////////////////////
////Support Roles ////
//////////////////////

// Immunes are mostly an off-duty role meant to attend to the camp itself and the slaves or prisoners within.

/datum/job/CaesarsLegion/immune
	title = "Legion Camp Follower"
	flag = F13IMMUNE
	total_positions = 7
	spawn_positions = 7
	description = "An Immune is a Legionary or free citizen temporarily assigned to keeping the camp in order, according to their tasking on any given week."
	enforces = "You may leave the base, but you are not allowed to antagonize other factions or scavenge. You are a non-combatant. You cannot join any raids or battles on the surface. You cannot run dungeons."
	supervisors = "the Centurion."
	display_order = JOB_DISPLAY_ORDER_IMMUNE
	outfit = /datum/outfit/job/CaesarsLegion/immune
	exp_requirements = 0

/datum/outfit/job/CaesarsLegion/immune
	name = "Camp Follower"
	jobtype = /datum/job/CaesarsLegion/immune
	id = /obj/item/card/id/dogtag/legimmune
	mask = /obj/item/clothing/mask/bandana/legion/camp
	uniform = /obj/item/clothing/under/f13/legskirt
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/f13/military/leather
	l_pocket = /obj/item/flashlight/lantern
	suit_store = /obj/item/melee/onehanded/machete/forgedmachete
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2
		)

/datum/outfit/job/CaesarsLegion/immune/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MARS_TEACH,  REF(src))

// FORGE MASTER

/datum/job/CaesarsLegion/f13campfollower	// Extra materials, Blueprints
	title = "Legion Forgemaster"
	flag = F13CAMPFOLLOWER
	total_positions = 1
	spawn_positions = 2
	description = "The Forgemaster makes weapons of all sorts and upgrades them, keeping order in the Forge and makes sure the camp is defended."
	supervisors = "the Centurion."
	display_order = JOB_DISPLAY_ORDER_CAMPFOLLOWER
	outfit = /datum/outfit/job/CaesarsLegion/f13campfollower
	exp_requirements = 0

/datum/outfit/job/CaesarsLegion/f13campfollower
	name = "Legion Forgemaster"
	id = /obj/item/card/id/dogtag/legforgemaster
	glasses = /obj/item/clothing/glasses/welding
	belt = /obj/item/storage/belt/utility/waster/forgemaster
	neck = /obj/item/clothing/neck/apron/labor/forge
	gloves = /obj/item/clothing/gloves/legion/forgemaster
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	ears = /obj/item/radio/headset/headset_legion
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = TRUE
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/stack/sheet/metal/twenty = 2,
		/obj/item/stack/sheet/mineral/wood/twenty = 1,
		/obj/item/stack/sheet/leather/twenty = 1,
		/obj/item/stack/sheet/cloth/thirty = 1,
		/obj/item/stack/sheet/prewar/twenty = 1,
		/obj/item/book/granter/trait/explosives = 1,
		/obj/item/book/granter/trait/explosives_advanced = 1
		)

/datum/outfit/job/CaesarsLegion/f13campfollower/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES,  REF(src))
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK,  REF(src))
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gladius)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/spatha)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lance)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionshield)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legionlance)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/concussion)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalwar/xbow)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tribalwar/cheaparrow)

	H.mind.teach_crafting_recipe(/datum/crafting_recipe/sks)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/greasegun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/smg10mm)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/remingtonhuntingrifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/huntingshotgun)

	H.mind.teach_crafting_recipe(/datum/crafting_recipe/receiver)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/assembly)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/alloys)



// AUXILIA - Civilians with special training. Can sow new uniforms for soldiers who lost theirs, and are loyal so they would never abuse this.

/datum/job/CaesarsLegion/auxilia
	title = "Legion Auxilia"
	flag = F13AUXILIA
	total_positions = 3
	spawn_positions = 3
	description = "A non-combat position in the Legion for free citizens who perform tasks that need special training, such as surgery. They are loyal to the Legion even if they are not treated as equals to warriors."
	supervisors = "the Centurion"
	display_order = JOB_DISPLAY_ORDER_AUXILIA
	outfit = /datum/outfit/job/CaesarsLegion/auxilia
	exp_requirements = 0
	exp_type = EXP_TYPE_WASTELAND//So you can't sit on it and play Centurion. :)

	loadout_options = list(
		/datum/outfit/loadout/auxassist, // Keep track of the money, handle trading beneath the warriors
		/datum/outfit/loadout/auxmedicus, // Do surgery, medical tasks.
		/datum/outfit/loadout/auxopifex, // Build defenses, craft necessary items
		/datum/outfit/loadout/auxservant,
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion,
		),
		)


/datum/outfit/job/CaesarsLegion/auxilia
	name = "Legion Auxilia"
	jobtype = /datum/job/CaesarsLegion/auxilia
	id = /obj/item/card/id/dogtag/legauxilia
	uniform = /obj/item/clothing/under/f13/legauxiliaf
	gloves = null
	belt = null
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/reagent_containers/food/snacks/grown/ambrosia/deus = 1,
		/obj/item/warpaint_bowl = 1
		)

/datum/outfit/job/CaesarsLegion/auxilia/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_LOW,  REF(src))
	ADD_TRAIT(H, TRAIT_MARS_TEACH,  REF(src))
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK,  REF(src))
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/tailor/legionuniform)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/warpaint)


/datum/outfit/loadout/auxassist
	name = "Treasurer"
	neck = /obj/item/clothing/neck/mantle/treasurer
	head = /obj/item/clothing/head/f13/auxilia
	shoes = /obj/item/clothing/shoes/roman
	ears = /obj/item/radio/headset/headset_legion
	backpack_contents = list(
		/obj/item/folder/red = 1,
		/obj/item/paper/natural = 2,
		/obj/item/pen/fountain = 1,
		/obj/item/storage/bag/money/small/legion = 1,
		/obj/item/taperecorder = 1,
		)

/datum/outfit/loadout/auxmedicus
	name = "Medicus (Surgeon)"
	neck = /obj/item/clothing/neck/apron/medicus
	gloves = /obj/item/clothing/gloves/f13/crudemedical
	belt = /obj/item/storage/belt/medical/primitive
	head = /obj/item/clothing/head/f13/auxilia
	shoes = /obj/item/clothing/shoes/roman
	ears = /obj/item/radio/headset/headset_legion
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/stack/sticky_tape/surgical = 1,
		/obj/item/stack/medical/bone_gel = 1,
		/obj/item/book/granter/trait/midsurgery = 1,
		)
/datum/outfit/loadout/auxopifex
	name = "Opifex (Artisan)"
	neck = /obj/item/clothing/neck/apron/labor/forge
	head = /obj/item/clothing/head/f13/auxilia
	shoes = /obj/item/clothing/shoes/roman
	ears = /obj/item/radio/headset/headset_legion
	gloves = /obj/item/clothing/gloves/legion/forgemaster
	belt = /obj/item/storage/belt
	glasses = /obj/item/clothing/glasses/welding
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/stack/sheet/metal/twenty = 2,
		/obj/item/stack/sheet/mineral/wood/twenty = 1,
		/obj/item/stack/sheet/leather/twenty = 1,
		/obj/item/stack/sheet/cloth/thirty = 1,
		/obj/item/stack/sheet/prewar/twenty = 1,
		/obj/item/weldingtool = 1,
		/obj/item/book/granter/trait/explosives = 1
		)

/datum/outfit/loadout/auxservant
	name = "Auxilia-Servant"
	neck = /obj/item/electropack/shockcollar
	shoes =	null
	backpack_contents = list(
		/obj/item/storage/bag/plants = 1,
		/obj/item/reagent_containers/food/snacks/grown/ambrosia/deus = 1,
		/obj/item/cultivator = 1,
		/obj/item/soap/homemade = 1,
		/obj/item/shovel/spade = 1,
		/obj/item/clothing/under/f13/legslavef = 1
		)

// LEGION SLAVES - Servant cook, and assist with medical, low surgery. Worker farm and mine.
// Both get Mars teachings to help out when normal work is done.

/datum/job/CaesarsLegion/slave
	title = "Legion Slave"
	flag = F13LEGIONSLAVE
	total_positions = 0
	spawn_positions = 0
	description = "A slave that survives the breaking camps is given a Legion appropriate name (latin-tribal inspired) and bull tattoo. Be obedient, respectful, stay inside the camp. Work the farm, mine, make food, clean and help injured men. Do NOT escape on your own, up to you how to handle it if forcibly freed by outside forces."
	supervisors = "Officers and Slavemaster first, then Auxilia, then warriors."
	display_order = JOB_DISPLAY_ORDER_LEGIONSLAVE
	exp_requirements = 0
	outfit = /datum/outfit/job/CaesarsLegion/slave
	exp_type = EXP_TYPE_WASTELAND//So you can't sit on it and play Centurion. :)

	access = list(ACCESS_LEGION_SLAVE)
	minimal_access = list(ACCESS_LEGION_SLAVE)

	loadout_options = list(
		/datum/outfit/loadout/slaveservant,
		/datum/outfit/loadout/slaveworker,
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/CaesarsLegion/slave,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/CaesarsLegion/slave,
		),
	)

/datum/outfit/job/CaesarsLegion/slave/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MARS_TEACH,  REF(src))

/datum/outfit/job/CaesarsLegion/slave
	name = "Legion Slave"
	jobtype = /datum/outfit/job/CaesarsLegion/slave
	id = /obj/item/card/id/legionbrand
	uniform = /obj/item/clothing/under/f13/legslavef
	neck = /obj/item/electropack/shockcollar
	shoes =	null
	l_pocket = /obj/item/radio


//Servants cook, clean, help with medical tasks.
/datum/outfit/loadout/slaveservant
	name = "Servant"
	head = /obj/item/clothing/head/f13/servant
	uniform	= /obj/item/clothing/under/f13/campfollowermale
	gloves = /obj/item/clothing/gloves/f13/crudemedical
	shoes =	/obj/item/clothing/shoes/roman
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/reagent_containers/pill/patch/healingpoultice = 2,
		/obj/item/smelling_salts = 1,
		/obj/item/book/granter/trait/lowsurgery = 1,
		/obj/item/reagent_containers/food/condiment/flour = 2,
		/obj/item/storage/box/bowls = 1,
		/obj/item/reagent_containers/glass/beaker/large = 1,
		/obj/item/soap/homemade = 1,
		/obj/item/lighter = 1,
		)

//Laborers farm and mine.
/datum/outfit/loadout/slaveworker
	name = "Worker"
	suit = /obj/item/clothing/suit/armor/f13/slavelabor
	uniform = /obj/item/clothing/under/f13/legslave
	shoes =	/obj/item/clothing/shoes/f13/rag
	r_hand = /obj/item/flashlight/flare/torch
	backpack_contents = list(
		/obj/item/storage/bag/plants = 1,
		/obj/item/reagent_containers/food/snacks/grown/ambrosia/deus = 1,
		/obj/item/cultivator = 1,
		/obj/item/soap/homemade = 1,
		/obj/item/shovel/spade = 1,
		)

/*
Post Scriptum
Plans: Add recipes/traits to keep refining support roles, Forgemaster done, others will need some minor tweaking. Planned is making the medicus more of a improvised surgery master, using primitive tools to good effect, because its interesting and unique.
Venator  - Zero slots, role built on cloning vet ranger, linear just vastly better than all but the Cent, snowflakey in command when it suits them, messes up the chain of command thats already messy for Legion. FUCK IT ENABLE IT
*/
/*
/datum/job/CaesarsLegion/Legionnaire/f13venator
	title = "Legion Venator"
	flag = F13VENATOR
	total_positions = 1
	spawn_positions = 1
	description = "You are the Venator -- the Hunter. With your powerful rifle and your many years of experience, you are a formidable killing machine, capable of taking down even the most formidable targets. Note that you are not a rank-and-file legionary, and you should not be operating as such -- your job is special operations, not fighting alongside the hordes of the Legion."
	supervisors = "the Centurion"
	selection_color = "#ffdddd"
	display_order = JOB_DISPLAY_ORDER_VENATOR
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13venator
	exp_requirements = 750

/datum/outfit/job/CaesarsLegion/Legionnaire/f13venator/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS,  REF(src))
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES,  REF(src))
	ADD_TRAIT(H, TRAIT_GENERIC,  REF(src))
	ADD_TRAIT(H, TRAIT_SILENT_STEP,  REF(src))
	ADD_TRAIT(H, TRAIT_INSANE_AIM,  REF(src))
	H.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13venator
	name = "Legion Venator"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13venator
	id = /obj/item/card/id/dogtag/legvenator
	suit = /obj/item/clothing/suit/armor/f13/legion/venator
	head = /obj/item/clothing/head/helmet/f13/legion/venator
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/night/polarizing
	ears = /obj/item/radio/headset/headset_legion
	r_pocket = /obj/item/binoculars
	suit_store = /obj/item/gun/ballistic/automatic/marksman/sniper/snipervenator
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308 = 3,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/reagent_containers/pill/patch/healingpoultice = 3,
		/obj/item/gun/ballistic/revolver/revolver45 = 1,
		/obj/item/ammo_box/c45rev = 3,
		)
*/
// Slavemaster
/* - no
/datum/job/CaesarsLegion/Legionnaire/f13slavemaster
	title = "Legion Slavemaster"
	flag = F13SLAVEMASTER
	total_positions = 1
	spawn_positions = 1
	description = "You are the feared and respected disciplinary corps of the Legion. Acting as both master of the Slaves and de-facto executioner of the Centurion's will within his ranks, you are a faceless and undoubtedly cruel torturer... but be careful to not let your hubris and malice lead to a strikeback from those you thought broken."
	supervisors = "the Decani and Centurion"
	exp_requirements = 0
	display_order = JOB_DISPLAY_ORDER_SLAVEMASTER

	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13slavemaster

/datum/outfit/job/CaesarsLegion/Legionnaire/f13slavemaster
	name = "Legion Slavemaster"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13slavemaster
	id =			/obj/item/card/id/dogtag/legslavemaster
//	uniform =		/obj/item/clothing/under/gladiator
	suit = 			/obj/item/clothing/suit/armor/f13/legion/prime/slavemaster
	belt = 			/obj/item/melee/onehanded/slavewhip
	head = 			/obj/item/clothing/head/helmet/f13/legion/prime/slavemaster
	shoes =			/obj/item/clothing/shoes/roman
	suit_store = 	/obj/item/melee/onehanded/machete/forgedmachete
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
		/obj/item/flashlight/lantern = 1,
		/obj/item/electropack/shockcollar = 3,
		/obj/item/assembly/signaler/advanced = 3,
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13slavemaster/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS,  REF(src))
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES,  REF(src))
	ADD_TRAIT(H, TRAIT_GENERIC,  REF(src))
	H.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)
*/

// Legion Citizen
// Really only used for ID console
/datum/job/ncr/f13legioncitizen
	title = "Legion Citizen"
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legioncitizen

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legioncitizen
	name = "Legion Citizen (Role)"
	uniform = /obj/item/clothing/under/f13/doctor
	shoes = /obj/item/clothing/shoes/f13/fancy
	suit = /obj/item/clothing/suit/curator
	head = /obj/item/clothing/head/scarecrow_hat
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/welding
	id = /obj/item/card/id/dogtag/town/legion
	l_hand = /obj/item/shield/riot/buckler
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/spatha = 1,
		)
