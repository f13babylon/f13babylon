/*
This entire file is a replacement for the horrible mess that was 'Outlaws' in 'wasteland.dm'.
Within this file is the material to turn the previous odd-inclusion into a proper faction.
*/

/datum/job/raider //do NOT use this for anything, it's just to store faction datums
	selection_color = "#db3529"
	department_flag = RAIDER
	faction = FACTION_RAIDERS
	access = list(ACCESS_RAIDER)
	minimal_access = list(ACCESS_RAIDER)
	exp_requirements = 0
	exp_type = EXP_TYPE_WASTELAND

/datum/job/raider/f13raider
	title = "Raider"
	flag = F13RAIDER
	faction = FACTION_RAIDERS
	social_faction = FACTION_RAIDERS
	exp_requirements = 600
	exp_type = EXP_TYPE_FALLOUT
	total_positions = 6
	spawn_positions = 6
	description = "You are an undesirable figure of some kind- perhaps a corrupt official, or a cannibalistic bartender, or a devious conman, to name a few examples. \
	You have more freedom than anyone else in the wastes. \
	You're not held by the same moral code as others, but though you may only be interested in self-gain, you still have a responsibility to make your time here interesting."
	supervisors = "No Gods, No Masters!"

	outfit = /datum/outfit/job/raider/f13raider

	matchmaking_allowed = list(
		/datum/matchmaking_pref/patron = list(
			/datum/job/raider/f13raider,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/raider/f13raider,
		),
		/datum/matchmaking_pref/outlaw = list(
			/datum/job/raider/f13raider,
		),
		/datum/matchmaking_pref/bounty_hunter = list(
			/datum/job/raider/f13raider,
		),
	)
	loadout_options = list(
	/datum/outfit/loadout/raider_jackal,
	/datum/outfit/loadout/raider_badlands,
	/datum/outfit/loadout/raider_powder,
	/datum/outfit/loadout/raider_smith,
	/datum/outfit/loadout/raider_sawbones,
	/datum/outfit/loadout/raider_highway,
	/datum/outfit/loadout/raider_enclave,
	/datum/outfit/loadout/raider_bos,
	/datum/outfit/loadout/raider_ncr,
	/datum/outfit/loadout/raider_legion,
	/datum/outfit/loadout/raider_vault,
	)

/datum/outfit/job/raider/f13raider/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.social_faction = FACTION_RAIDERS

/datum/outfit/job/raider/f13raider
	name = "Raider"
	jobtype = /datum/job/raider/f13raider
	id = /obj/item/card/id/raider_tags
	ears = null
	belt = null
	shoes = /obj/item/clothing/shoes/f13/raidertreads
	uniform = /obj/item/clothing/under/f13/raider_leather
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	gloves = /obj/item/clothing/gloves/f13/handwraps
	r_pocket = /obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/storage/bag/money/small/raider = 1,
		)

/datum/outfit/loadout/raider_jackal
	name = "Jackal"
	suit = /obj/item/clothing/suit/armor/f13/raider/jackal
	head = /obj/item/clothing/head/helmet/f13/jackal
	backpack_contents = list(
		/obj/item/melee/onehanded/machete = 1,
		/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
		/obj/item/ammo_box/magazine/m10mm = 2,
		/obj/item/twohanded/fireaxe = 1,
		/obj/item/restraints/legcuffs/beartrap = 2,
		/obj/item/book/granter/trait/bigleagues = 1,
		/obj/item/book/granter/trait/cannibal = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
	)

/datum/outfit/loadout/raider_badlands
	name = "Fiend"
	suit = /obj/item/clothing/suit/armor/f13/raider/badlands
	head = /obj/item/clothing/head/helmet/f13/fiend
	backpack_contents = list(
		/obj/item/gun/energy/laser/wattz/magneto = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/melee/onehanded/club/tireiron = 1,
		/obj/item/reagent_containers/hypospray/medipen/psycho = 3,
		/obj/item/reagent_containers/pill/patch/turbo = 2,
		/obj/item/reagent_containers/hypospray/medipen/medx = 1,
		/obj/item/book/granter/trait/bigleagues = 1,
		/obj/item/book/granter/trait/cannibal = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
	)

/datum/outfit/loadout/raider_powder
	name = "Powder Ganger"
	suit = /obj/item/clothing/suit/armor/f13/raider/ncrcfarmor
	head = /obj/item/clothing/head/f13/stormchaser
	uniform = /obj/item/clothing/under/f13/ncrcf
	shoes = /obj/item/clothing/shoes/f13/brownie
	backpack_contents = list(
		/obj/item/grenade/homemade/dynamite = 4,
		/obj/item/gun/ballistic/revolver/caravan_shotgun = 1,
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
		/obj/item/ammo_box/magazine/m9mmds = 2,
		/obj/item/book/granter/trait/explosives = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
	)

/datum/outfit/loadout/raider_smith
	name = "Raider Smith"
	suit = /obj/item/clothing/suit/armored/heavy/raidermetal
	uniform = /obj/item/clothing/under/f13/raider_leather
	head = /obj/item/clothing/head/helmet/f13/raider/arclight
	gloves = /obj/item/clothing/gloves/f13/blacksmith
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/m1911 = 1,
		/obj/item/ammo_box/magazine/m45 = 1,
		/obj/item/twohanded/steelsaw = 1,
		/obj/item/melee/smith/hammer = 1,
		/obj/item/stack/sheet/mineral/sandstone = 50,
		/obj/item/book/granter/trait/techno = 1,
		/obj/item/book/granter/crafting_recipe/scav = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		)

/datum/outfit/loadout/raider_sawbones
	name = "Raider Sawbones"
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/followers
	shoes = /obj/item/clothing/shoes/jackboots
	l_hand = /obj/item/storage/backpack/duffelbag/med/surgery
	r_hand = /obj/item/book/granter/trait/midsurgery
	suit_store = /obj/item/gun/energy/laser/wattz
	backpack_contents = list(
		/obj/item/stock_parts/cell/ammo/ec=1,
		/obj/item/reagent_containers/pill/patch/jet = 3,
		/obj/item/storage/firstaid/ancient = 1,
		/obj/item/storage/pill_bottle/aranesp = 1,
		/obj/item/storage/pill_bottle/happy = 1,
		/obj/item/book/granter/trait/chemistry = 1,
		/obj/item/stack/sheet/mineral/silver=2,
		/obj/item/defibrillator/primitive=1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		)

/datum/outfit/loadout/raider_highway
	name = "Highwayman"
	suit = /obj/item/clothing/suit/f13/cowboygvest
	uniform = /obj/item/clothing/under/f13/cowboyg
	shoes = /obj/item/clothing/shoes/cowboyboots/black
	head = /obj/item/clothing/head/cowboyhat/black
	gloves = /obj/item/clothing/gloves/color/brown
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/colt357 = 2,
		/obj/item/ammo_box/a357 = 2,
		/obj/item/binoculars = 1,
		/obj/item/radio = 1,
		/obj/item/weapon/maptool = 1,
		/obj/item/storage/belt/holster = 1,
		/obj/item/book/granter/trait/trekking = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
	)

/datum/outfit/loadout/raider_enclave
	name = "Enclave Remnant"
	suit = /obj/item/clothing/suit/armor/f13/combat/remnant
	uniform = /obj/item/clothing/under/f13/exile/enclave
	mask =	/obj/item/clothing/mask/gas/sechailer
	id = /obj/item/card/id/rusted/brokenholodog/enclave
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/fingerless
	backpack_contents = list(
		/obj/item/gun/energy/laser/plasma/pistol/remnant = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/book/granter/trait/techno = 1,
		/obj/item/book/granter/trait/chemistry = 1,
	)

/datum/outfit/loadout/raider_bos
	name = "Brotherhood Radical"
	suit = /obj/item/clothing/suit/armored/heavy/bosexile
	uniform = /obj/item/clothing/under/f13/recon/outcast
	id = /obj/item/card/id/rusted/brokenholodog
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/fingerless
	backpack_contents = list(
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/book/granter/crafting_recipe/blueprint/aer9 = 1,
		/obj/item/book/granter/trait/techno = 1,
		)

/datum/outfit/loadout/raider_ncr
	name = "NCR Deserter"
	suit = /obj/item/clothing/suit/armor/f13/exile/ncrexile
	uniform = /obj/item/clothing/under/f13/exile
	shoes = /obj/item/clothing/shoes/f13/tan
	gloves = /obj/item/clothing/gloves/fingerless
	id = /obj/item/card/id/rusted
	backpack_contents = list(
		/obj/item/gun/ballistic/rifle/hunting = 1,
		/obj/item/ammo_box/a308 = 2,
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/storage/box/ration/ranger_breakfast = 1,
		/obj/item/grenade/f13/frag = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/book/granter/crafting_recipe/blueprint/service = 1,
	    )

/datum/outfit/loadout/raider_legion
	name = "Disgraced Legionary"
	suit = /obj/item/clothing/suit/armor/f13/exile/legexile
	uniform = /obj/item/clothing/under/f13/exile/legion
	shoes = /obj/item/clothing/shoes/f13/military/legion
	id = /obj/item/card/id/rusted/rustedmedallion
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/spatha = 1,
		/obj/item/restraints/legcuffs/bola = 2,
		/obj/item/shield/riot/buckler/stop = 1,
		/obj/item/book/granter/trait/herbalist = 1,
		/obj/item/book/granter/trait/bigleagues = 1,
		/obj/item/reagent_containers/pill/patch/healingpowder = 2,
	)

/datum/outfit/loadout/raider_vault
	name = "Vault Renegade"
	suit = /obj/item/clothing/suit/armor/vest/big
	head = /obj/item/clothing/head/helmet/riot/vaultsec
	uniform = /obj/item/clothing/under/f13/exile/vault
	id = /obj/item/card/id/rusted/fadedvaultid
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/colt6520 = 1,
		/obj/item/ammo_box/l10mm = 3,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/book/granter/trait/research = 1,
		)


/*
Reason this is commented out: Not needed, may re-use loadouts later

/datum/job/raider/outsiders
	title = "Outsider"
	flag = F13RAIDER_OUTSIDER
	faction = FACTION_RAIDERS
	social_faction = FACTION_RAIDERS
	exp_requirements = 0
	exp_type = EXP_TYPE_OUTLAW
	total_positions = -1
	spawn_positions = -1
	description = "You're an outcast. Someone even the lowest of the low hates. \
	You have more freedom than anyone else in the wastes. \
	You're not held by the same moral code as others, but though you may only be interested in self-gain, you still have a responsibility to make your time here interesting. \
	(Adminhelp if you require help setting up your character for the round.)"
	supervisors = "Your desire to make things interesting and fun"

	matchmaking_allowed = list(
		/datum/matchmaking_pref/patron = list(
			/datum/job/raider/outsiders,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/raider/outsiders,
		),
		/datum/matchmaking_pref/outlaw = list(
			/datum/job/raider/outsiders,
		),
		/datum/matchmaking_pref/bounty_hunter = list(
			/datum/job/raider/outsiders,
		),
	)

	loadout_options = list(
	/datum/outfit/loadout/raider_vault,
	/datum/outfit/loadout/raider_ncr,
	/datum/outfit/loadout/raider_legion,
	/datum/outfit/loadout/raider_bos,
	/datum/outfit/loadout/raider_enclave,
	/datum/outfit/loadout/raider_highway,
	)

/datum/outfit/job/raider/outsiders
	name = "Outsider"
	jobtype = /datum/job/raider/outsiders

	id = null
	ears = null
	belt = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/jackboots
	gloves = /obj/item/clothing/gloves/fingerless
	r_pocket = /obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 2,
		/obj/item/melee/onehanded/club = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/storage/bag/money/small/raider = 1,
		)

/datum/outfit/loadout/raider_highway
	name = "Highwayman"
	uniform = /obj/item/clothing/under/f13/combat
	shoes = /obj/item/clothing/shoes/f13/cowboy
	head = /obj/item/clothing/head/f13/cowboy
	gloves = /obj/item/clothing/gloves/color/brown
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/colt357=1,
		/obj/item/ammo_box/a357=2, \
		/obj/item/binoculars=1,
		/obj/item/radio=1,
		/obj/item/weapon/maptool=1)

/datum/outfit/loadout/raider_vault
	name = "Vault Renegade"
	suit = /obj/item/clothing/suit/armor/vest/big
	uniform = /obj/item/clothing/under/f13/exile/vault
	id = /obj/item/card/id/rusted/fadedvaultid
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/smg/smg10mm = 1,
		/obj/item/ammo_box/magazine/msmg10mm = 3,
		/obj/item/reagent_containers/hypospray/medipen/stimpak/imitation = 2,
		)

/datum/outfit/loadout/raider_enclave
	name = "Enclave Remnant"
	suit = /obj/item/clothing/suit/armor/f13/combat/mk2/remnant
	head = /obj/item/clothing/head/helmet/f13/combat/mk2/remnant
	id = /obj/item/card/id/rusted/brokenholodog/enclave
	backpack_contents = list(
		/obj/item/clothing/under/f13/exile/enclave = 1,
		/obj/item/clothing/mask/gas/enclave = 1,
		/obj/item/gun/energy/laser/plasma/pistol/remnant=1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/book/granter/crafting_recipe/blueprint/plasmapistol_rem = 1,
		/obj/item/grenade/f13/plasma/remnant = 2,
		)

/datum/outfit/loadout/raider_bos
	name = "Brotherhood Outcast"
	suit = /obj/item/clothing/suit/armor/f13/combat/brotherhood/outcast
	head = /obj/item/clothing/head/helmet/f13/combat/brotherhood/outcast
	id = /obj/item/card/id/rusted/brokenholodog
	backpack_contents = list(
		/obj/item/clothing/under/f13/recon/outcast = 1,
		/obj/item/gun/energy/laser/aer9=1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/grenade/f13/frag = 2,
		)

/datum/outfit/loadout/raider_ncr
	name = "NCR Deserter"
	suit = /obj/item/clothing/suit/armor/f13/exile/ncrexile
	uniform = /obj/item/clothing/under/f13/exile
	id = /obj/item/card/id/rusted
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/service = 1,
		/obj/item/ammo_box/magazine/m556mm=2,
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/storage/box/ration/ranger_breakfast = 1,
		/obj/item/book/granter/crafting_recipe/blueprint/service = 1)

/datum/outfit/loadout/raider_legion
	name = "Disgraced Legionnaire"
	suit = /obj/item/clothing/suit/armor/f13/exile/legexile
	uniform = /obj/item/clothing/under/f13/exile/legion
	id = /obj/item/card/id/rusted/rustedmedallion
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/storage/backpack/spearquiver = 1,
		/obj/item/gun/ballistic/automatic/smg/greasegun = 1,
		/obj/item/ammo_box/magazine/mgreasegun = 1,
		/obj/item/book/granter/trait/trekking = 1
		)
*/
