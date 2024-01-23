/datum/crafting_recipe/compressedpowder
	name = "Turn liquid black powder into sheets"
	result = /obj/item/stack/ore/blackpowder
	time = 5
	reqs = list(/datum/reagent/blackpowder = 50)
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/*	- Removed upon request, replaced with singaler bomb for similar usage.
/datum/crafting_recipe/explosive/explosive_collar
	name = "Explosive Collar"
	result = /obj/item/electropack/shockcollar/explosive
	reqs = list(/datum/reagent/blackpowder = 50,
				/obj/item/electropack/shockcollar = 1,
				/obj/item/stack/cable_coil = 1,
				/obj/item/assembly/igniter = 1,)
	time = 120
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
*/

/datum/crafting_recipe/grenadebeaker
	name = "Grenade Beaker"
	result = /obj/item/reagent_containers/glass/beaker/bomb
	time = 5
	reqs = list(/obj/item/reagent_containers/glass/beaker = 2,
				/obj/item/stack/cable_coil = 2
				)
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = TRUE
	blacklist = list(
					/obj/item/reagent_containers/glass/beaker/bomb,
					/obj/item/reagent_containers/glass/beaker/large,
					/obj/item/reagent_containers/glass/beaker/plastic,
					/obj/item/reagent_containers/glass/beaker/meta,
					/obj/item/reagent_containers/glass/beaker/noreact,
					/obj/item/reagent_containers/glass/beaker/bluespace
					)

/datum/crafting_recipe/explosive/chemical
	name = "Chemical Grenade"
	result = /obj/item/grenade/chem_grenade
	reqs = list(/obj/item/stack/sheet/metal = 5,
				/obj/item/stack/crafting/goodparts = 6,
				/obj/item/crafting/grenade_casing = 1,
				/obj/item/crafting/abraxo = 1)
	time = 30 SECONDS
	tools = list(TOOL_WORKBENCH)
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE

/datum/crafting_recipe/chemical_payload
	name = "Chemical Payload (C4)"
	result = /obj/item/bombcore/chemical
	reqs = list(
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/grenade/plastic/c4 = 1,
		/obj/item/stack/crafting/goodparts = 2,
		/obj/item/stack/sheet/glass = 6,
	)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = TRAIT_ADVANCED_EXPLOSIVE_CRAFTING

/datum/crafting_recipe/explosive/c4
	name = "Plastic Explosive"
	result = /obj/item/grenade/plastic/c4
	reqs = list(/obj/item/crafting/grenade_casing = 1,
				/datum/reagent/blackpowder = 30,
				/datum/reagent/nitroglycerin = 30,
				/obj/item/stack/cable_coil = 1,
				/obj/item/stack/crafting/metalparts = 4,
				/obj/item/stack/crafting/goodparts = 2,
				/obj/item/stack/crafting/electronicparts = 1,
				/obj/item/assembly/igniter = 1,
				/obj/item/assembly/timer = 1)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = TRAIT_ADVANCED_EXPLOSIVE_CRAFTING

/datum/crafting_recipe/explosive/molotov
	name = "Molotov Cocktail (empty)"
	result = /obj/item/reagent_containers/food/drinks/bottle/molotov
	reqs = list(/obj/item/reagent_containers/rag = 1,
		/obj/item/reagent_containers/food/drinks/bottle = 1,
		)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/explosive/firebomb
	name = "Firebomb"
	result = /obj/item/grenade/homemade/firebomb
	reqs = list(/datum/reagent/fuel = 50,
				/obj/item/stack/cable_coil = 1,
				/obj/item/assembly/igniter = 1,
				/obj/item/reagent_containers/food/drinks/flask = 1)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/explosive/coffeepotbomb
	name = "Coffeepot Bomb"
	result = /obj/item/grenade/homemade/coffeepotbomb
	reqs = list(/obj/item/crafting/coffee_pot = 1,
				/obj/item/stack/ore/blackpowder = 5,
				/obj/item/stack/cable_coil = 1,
				/obj/item/assembly/timer = 1)
	time = 120
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/explosive/pipebomb
	name = "Pipebomb"
	result = /obj/item/grenade/homemade/pipebomb
	reqs = list(/datum/reagent/blackpowder = 80,
				/obj/item/stack/sheet/metal = 15,
				/obj/item/stack/crafting/goodparts = 3,
				/obj/item/stack/cable_coil = 1,
				/obj/item/stack/sheet/cloth = 1)
	time = 70
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/explosive/dynamite
	name = "Dynamite Stick"
	result = /obj/item/grenade/homemade/dynamite
	reqs = list(/datum/reagent/blackpowder = 70,
				/obj/item/stack/crafting/metalparts = 2,
				/obj/item/stack/cable_coil = 1,
				/obj/item/stack/sheet/cloth = 5)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE

/datum/crafting_recipe/explosive/bottlecap_mine
	name = "Bottlecap Mine"
	result = /obj/item/bottlecap_mine
	reqs = list(/obj/item/crafting/lunchbox = 1,
			/obj/item/stack/ore/blackpowder = 1,
			/obj/item/assembly/prox_sensor = 1,
			/obj/item/stack/cable_coil = 5,
			/obj/item/stack/f13Cash/caps = 200)
	time = 150
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/explosive/signalermine
	name = "Bottlecap Signal-Activated Mine"
	result = /obj/item/signal_bomb
	reqs = list(/obj/item/bottlecap_mine = 1,
				/obj/item/stack/crafting/electronicparts = 3,
				/obj/item/stack/cable_coil = 5,
				/obj/item/assembly/signaler = 1,
				/obj/item/assembly/igniter = 1)
	time = 90
	always_available = FALSE
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/explosive/shrapnelmine
	name = "Shrapnel Mine"
	result = /obj/item/mine/shrapnel/random
	reqs = list(/obj/item/stack/sheet/metal = 10,
			/obj/item/stack/crafting/metalparts = 2,
			/obj/item/stack/crafting/electronicparts = 1,
			/obj/item/stack/ore/blackpowder = 1,
			/obj/item/assembly/prox_sensor = 1,
			/obj/item/stack/cable_coil = 5)
	time = 120
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE

/datum/crafting_recipe/explosive/explomine
	name = "High-Explosive Mine"
	result = /obj/item/mine/explosive/random
	reqs = list(/obj/item/stack/sheet/metal = 10,
			/obj/item/stack/crafting/metalparts = 2,
			/obj/item/stack/crafting/goodparts = 1,
			/obj/item/stack/crafting/electronicparts = 1,
			/obj/item/stack/ore/blackpowder = 2,
			/obj/item/assembly/prox_sensor = 1,
			/obj/item/stack/cable_coil = 5
	)
	time = 120
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE

/datum/crafting_recipe/explosive/stingmine
	name = "Stingball Mine"
	result = /obj/item/mine/shrapnel/sting/random
	reqs = list(/obj/item/stack/sheet/metal = 5,
			/obj/item/stack/sheet/plastic = 1,
			/obj/item/stack/crafting/metalparts = 2,
			/obj/item/stack/crafting/electronicparts = 1,
			/obj/item/stack/ore/blackpowder = 1,
			/obj/item/assembly/prox_sensor = 1,
			/obj/item/stack/cable_coil = 5
	)
	time = 120
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE

/datum/crafting_recipe/explosive/pulsemine
	name = "Pulse Mine"
	result = /obj/item/mine/emp/random
	reqs = list(/obj/item/stack/sheet/metal = 10,
			/obj/item/stack/crafting/metalparts = 3,
			/obj/item/stack/crafting/goodparts = 1,
			/obj/item/stack/crafting/electronicparts = 5,
			/obj/item/assembly/prox_sensor = 1,
			/obj/item/stack/cable_coil = 30
	)
	time = 150
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE

/datum/crafting_recipe/explosive/stunmine
	name = "Stun Mine"
	result = /obj/item/mine/stun/random
	reqs = list(/obj/item/stack/sheet/metal = 5,
			/obj/item/stack/crafting/metalparts = 3,
			/obj/item/stack/crafting/electronicparts = 5,
			/obj/item/assembly/prox_sensor = 1,
			/obj/item/stack/cable_coil = 5
	)
	time = 80
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE


/datum/crafting_recipe/lance
	name = "Explosive Spear (Grenade)"
	result = /obj/item/twohanded/spear
	reqs = list(/obj/item/twohanded/spear = 1,
				/obj/item/grenade = 1)
	parts = list(/obj/item/twohanded/spear = 1,
				/obj/item/grenade = 1)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO

/datum/crafting_recipe/concussion
	name = "High Explosive Grenade" //this one has no shrapnel
	result = /obj/item/grenade/f13/he_grenade
	reqs = list(
			/obj/item/stack/sheet/metal = 10,
			/obj/item/stack/crafting/metalparts = 5,
			/obj/item/stack/crafting/goodparts = 1,
			/obj/item/stack/crafting/electronicparts = 1,
			/obj/item/stack/ore/blackpowder = 2,
			/obj/item/assembly/prox_sensor = 1,
			/obj/item/stack/cable_coil = 5
	)
	tools = list(TOOL_AWORKBENCH)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = TRAIT_ADVANCED_EXPLOSIVE_CRAFTING

/datum/crafting_recipe/frag_shrapnel
	name = "Fragmentation Grenade"
	result = /obj/item/grenade/f13/frag
	reqs = list(
			/obj/item/stack/sheet/metal = 10,
			/obj/item/stack/crafting/metalparts = 2,
			/obj/item/stack/crafting/goodparts = 1,
			/obj/item/stack/crafting/electronicparts = 1,
			/obj/item/stack/ore/blackpowder = 2,
			/obj/item/assembly/prox_sensor = 1,
			/obj/item/stack/cable_coil = 5
	)
	tools = list(TOOL_AWORKBENCH)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = list(list(TRAIT_EXPLOSIVE_CRAFTING, TRAIT_ADVANCED_EXPLOSIVE_CRAFTING))

/datum/crafting_recipe/incendiary
	name = "Incendiary Grenade"
	result = /obj/item/grenade/f13/incendiary
	reqs = list(
			/obj/item/stack/sheet/metal = 10,
			/obj/item/stack/crafting/metalparts = 15,
			/obj/item/stack/crafting/goodparts = 3,
			/obj/item/stack/crafting/electronicparts = 5,
			/obj/item/stack/ore/blackpowder = 10,
			/obj/item/assembly/prox_sensor = 1,
			/obj/item/stack/cable_coil = 5
	)
	tools = list(TOOL_AWORKBENCH)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = TRAIT_ADVANCED_EXPLOSIVE_CRAFTING

/datum/crafting_recipe/stinger
	name = "Stinger Grenade"
	result = /obj/item/grenade/f13/stinger
	reqs = list(
			/obj/item/stack/sheet/metal = 10,
			/obj/item/stack/crafting/metalparts = 3,
			/obj/item/stack/ore/blackpowder = 1,
			/obj/item/stack/crafting/goodparts = 1,
			/obj/item/assembly/prox_sensor = 1,
			/obj/item/stack/cable_coil = 5
	)
	tools = list(TOOL_AWORKBENCH)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = list(list(TRAIT_EXPLOSIVE_CRAFTING, TRAIT_ADVANCED_EXPLOSIVE_CRAFTING))

/datum/crafting_recipe/radgrenade
	name = "Radiation Grenade"
	result = /obj/item/grenade/f13/radiation
	reqs = list(
			/obj/item/stack/sheet/metal = 20,
			/obj/item/stack/crafting/metalparts = 10,
			/obj/item/stack/crafting/goodparts = 3,
			/obj/item/stack/crafting/electronicparts = 30,
			/obj/item/stack/ore/blackpowder = 4,
			/obj/item/assembly/prox_sensor = 1,
			/obj/item/advanced_crafting_components/flux = 2,
			/obj/item/stack/cable_coil = 5
	)
	tools = list(TOOL_AWORKBENCH)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = TRAIT_ADVANCED_EXPLOSIVE_CRAFTING

/datum/crafting_recipe/flashbang
	name = "Flashbang"
	result = /obj/item/grenade/flashbang
	reqs = list(
			/obj/item/stack/sheet/metal = 10,
			/obj/item/stack/crafting/metalparts = 3,
			/obj/item/stack/crafting/goodparts = 1,
			/obj/item/stack/crafting/electronicparts = 5,
			/obj/item/assembly/prox_sensor = 1,
			/obj/item/stack/cable_coil = 5
	)
	tools = list(TOOL_AWORKBENCH)
	time = 40
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = list(list(TRAIT_EXPLOSIVE_CRAFTING, TRAIT_ADVANCED_EXPLOSIVE_CRAFTING))

/datum/crafting_recipe/smokebomb
	name = "Smokebomb"
	result = /obj/item/grenade/smokebomb
	reqs = list(
			/obj/item/stack/sheet/metal = 10,
			/obj/item/stack/crafting/metalparts = 5,
			/obj/item/stack/crafting/goodparts = 1,
			/obj/item/stack/crafting/electronicparts = 5,
			/obj/item/assembly/prox_sensor = 1,
			/obj/item/stack/cable_coil = 5
	)
	tools = list(TOOL_AWORKBENCH)
	time = 40
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = list(list(TRAIT_EXPLOSIVE_CRAFTING, TRAIT_ADVANCED_EXPLOSIVE_CRAFTING))

/datum/crafting_recipe/empgrenade
	name = "Pulse Grenade"
	result = /obj/item/grenade/empgrenade
	reqs = list(
			/obj/item/stack/sheet/metal = 20,
			/obj/item/stack/crafting/metalparts = 10,
			/obj/item/stack/crafting/goodparts = 3,
			/obj/item/stack/crafting/electronicparts = 25,
			/obj/item/assembly/prox_sensor = 1,
			/obj/item/stack/cable_coil = 200
	)
	tools = list(TOOL_AWORKBENCH)
	time = 80
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = TRAIT_ADVANCED_EXPLOSIVE_CRAFTING

/datum/crafting_recipe/rocket_base
	name = "Empty rocket shell"
	result = /obj/item/rocketshell
	reqs = list(
				/obj/item/stack/sheet/metal = 10,
				/obj/item/stack/crafting/metalparts = 8,
				/obj/item/stack/crafting/goodparts = 2,
				/obj/item/stack/crafting/electronicparts = 5,
				/obj/item/stack/ore/blackpowder = 3,
				/obj/item/assembly/igniter = 1
	)
	tools = list(TOOL_AWORKBENCH)
	time = 15
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = list(list(TRAIT_EXPLOSIVE_CRAFTING, TRAIT_ADVANCED_EXPLOSIVE_CRAFTING))

/datum/crafting_recipe/weakrocket
	name = "Low-yield HE rocket"
	result = /obj/item/ammo_casing/caseless/rocket
	reqs = list(
		/obj/item/rocketshell = 1,
		/obj/item/stack/crafting/electronicparts = 5,
		/obj/item/stack/sheet/mineral/titanium = 5,
		/obj/item/stack/ore/blackpowder = 5,
	)
	tools = list(TOOL_AWORKBENCH)
	time = 30
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = list(list(TRAIT_EXPLOSIVE_CRAFTING, TRAIT_ADVANCED_EXPLOSIVE_CRAFTING))

/datum/crafting_recipe/strongrocket
	name = "High-yield HE rocket"
	result = /obj/item/ammo_casing/caseless/rocket/big
	reqs = list(
		/obj/item/rocketshell = 1,
		/obj/item/stack/crafting/electronicparts = 5,
		/obj/item/stack/sheet/prewar = 5,
		/obj/item/stack/ore/blackpowder = 15,
	)
	tools = list(TOOL_AWORKBENCH)
	time = 45
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE

/datum/crafting_recipe/incendiaryrocket
	name = "Incendiary rocket"
	result = /obj/item/ammo_casing/caseless/rocket/incendiary
	reqs = list(
		/obj/item/rocketshell = 1,
		/obj/item/stack/crafting/electronicparts = 25,
		/obj/item/stack/sheet/prewar = 10,
		/obj/item/stack/ore/blackpowder = 15,
		/datum/reagent/phlogiston = 200
	)
	tools = list(TOOL_AWORKBENCH)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = TRAIT_ADVANCED_EXPLOSIVE_CRAFTING

/datum/crafting_recipe/chemrocket
	name = "Chemical rocket"
	result = /obj/item/ammo_casing/caseless/rocket/chem
	reqs = list(
		/obj/item/rocketshell = 1,
		/obj/item/stack/crafting/electronicparts = 25,
		/obj/item/stack/sheet/prewar = 10,
		/obj/item/stack/ore/blackpowder = 5,
		/datum/reagent/toxin/anacea = 30,//actual rocket uses metabtoxin, but this is here as placeholder.
		/datum/reagent/toxin/lexorin = 30,
		/datum/reagent/toxin/cyanide = 30,
		/datum/reagent/toxin/bungotoxin = 30
	)
	tools = list(TOOL_AWORKBENCH)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = TRAIT_ADVANCED_EXPLOSIVE_CRAFTING

/datum/crafting_recipe/mortar_shell
	name = "Mortar (HE)"
	result = /obj/item/mortar_shell
	reqs = list(
		/obj/item/rocketshell = 1,
		/obj/item/stack/crafting/electronicparts = 15,
		/obj/item/stack/sheet/prewar = 5,
		/obj/item/stack/ore/blackpowder = 5,
	)
	tools = list(TOOL_AWORKBENCH)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = TRAIT_ADVANCED_EXPLOSIVE_CRAFTING

/datum/crafting_recipe/mortar_shell_wp
	name = "Mortar (WP)"
	result = /obj/item/mortar_shell/smoke
	reqs = list(
		/obj/item/rocketshell = 1,
		/obj/item/stack/crafting/electronicparts = 15,
		/obj/item/stack/sheet/prewar = 5,
		/obj/item/stack/ore/blackpowder = 5,
		/datum/reagent/phlogiston = 200,
	)
	tools = list(TOOL_AWORKBENCH)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = TRAIT_ADVANCED_EXPLOSIVE_CRAFTING

/datum/crafting_recipe/mortar_shell_frag
	name = "Mortar (FRAG)"
	result = /obj/item/mortar_shell/frag
	reqs = list(
		/obj/item/rocketshell = 1,
		/obj/item/stack/crafting/electronicparts = 15,
		/obj/item/stack/sheet/prewar = 15,
		/obj/item/stack/ore/blackpowder = 25,
	)
	tools = list(TOOL_AWORKBENCH)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = TRAIT_ADVANCED_EXPLOSIVE_CRAFTING

/datum/crafting_recipe/mortar_shell_rad
	name = "Mortar (CNTM)"
	result = /obj/item/mortar_shell/rad
	reqs = list(
		/obj/item/rocketshell = 1,
		/obj/item/stack/crafting/electronicparts = 5,
		/obj/item/stack/sheet/mineral/uranium = 5,
		/obj/item/stack/ore/blackpowder = 5,
	)
	tools = list(TOOL_AWORKBENCH)
	time = 60
	category = CAT_WEAPONRY
	subcategory = CAT_AMMO
	always_available = FALSE
	granting_trait = TRAIT_ADVANCED_EXPLOSIVE_CRAFTING
