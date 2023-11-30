/**
 * Fallout-specific areas
 */

/area/fallout
	name = "base area type - if you see this, report it!"
	icon = 'icons/turf/areas.dmi'
	has_gravity = STANDARD_GRAVITY
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
	requires_power = FALSE // Enable on specific subtypes, until we get a working power plant added.

/**
 *	Wasteland generic areas
 *	Ambigen sound tips for ambientsounds:
 *		1 - 2 : outside the ruined buildings,
 *		3 - 9 : inside the wasteland buildings,
 *		10 - 14 : vaults and bunkers specific,
 *		15-19 : caves
 */

/area/fallout/wasteland
	name = "Wasteland"
	icon_state = "wasteland"

	ambientsounds = list(
		'sound/f13ambience/battle_1.ogg',
		'sound/f13ambience/battle_2.ogg',
		'sound/f13ambience/battle_3.ogg',
		'sound/f13ambience/rattlesnake_1.ogg',
		'sound/f13ambience/rattlesnake_2.ogg',
		'sound/f13ambience/rattlesnake_3.ogg',
		'sound/f13ambience/bird_1.ogg',
		'sound/f13ambience/bird_2.ogg',
		'sound/f13ambience/bird_3.ogg',
		'sound/f13ambience/bird_4.ogg',
	)

	outdoors = TRUE

/area/fallout/wasteland/event
	name = "Wasteland (Event)"

/area/fallout/wasteland/east
	name = "Eastern Yuma"
	icon_state = "yuma_east"

/area/fallout/wasteland/west
	name = "Western Yuma"
	icon_state = "yuma_west"

/area/fallout/wasteland/quarry
	name = "Quarry"
	icon_state = "quarry"

/area/fallout/wasteland/valley
	name = "Corocotta Valley"
	icon_state = "valley"

/area/fallout/wasteland/mass_fusion
	name = "Mass Fusion Exterior"
	icon_state = "fusion_ext"

/area/fallout/wasteland/mall
	name = "Mall of Wyoming Exterior"
	icon_state = "mall_ext"

/area/fallout/wasteland/hospital
	name = "Sheridan County Hospital Exterior"
	icon_state = "hospital_ext"

/area/fallout/wasteland/museum
	name = "Museum of Technology Exterior"
	icon_state = "museum_ext"

/area/fallout/wasteland/fire_station
	name = "Fire Station Exterior"
	icon_state = "fire_ext"

/area/fallout/wasteland/heaven
	name = "Heaven's Night Exterior"
	icon_state = "heaven_ext"

/area/fallout/wasteland/train
	name = "Train Station Exterior"
	icon_state = "train_ext"

/area/fallout/wasteland/nanotrasen
	name = "Nanotrasen HQ Exterior"
	icon_state = "nano_ext"

/area/fallout/wasteland/bighorn
	name = "Bighorn Exterior"
	icon_state = "bighorn_ext"
	requires_power = TRUE

/area/fallout/wasteland/khan_fort
	name = "Khan Fortress Exterior"
	icon_state = "khanfort_ext"

/area/fallout/wasteland/followers
	name = "Followers Exterior"
	icon_state = "followers_ext"

/area/fallout/wasteland/bighorn_bunker
	name = "Bighorn Bunker Exterior"
	icon_state = "bighornbunker_ext"

/area/fallout/wasteland/ncr
	name = "NCR Outpost Exterior"
	icon_state = "ncr_ext"

/area/fallout/wasteland/legion
	name = "Legion Fortress Exterior"
	icon_state = "legion_ext"

/area/fallout/wasteland/rock_springs
	name = "Rock Springs"

/area/fallout/wasteland/warren
	name = "Warren"


/**
 *  General outdoors areas
 */

/area/fallout/forest
	name = "Forest"
	icon_state = "forest"
	ambientsounds = list(
		'sound/f13ambience/bird_1.ogg',
		'sound/f13ambience/bird_2.ogg',
		'sound/f13ambience/bird_3.ogg',
		'sound/f13ambience/bird_4.ogg',
		'sound/f13ambience/bird_5.ogg',
		'sound/f13ambience/bird_6.ogg',
		'sound/f13ambience/bird_7.ogg',
		'sound/f13ambience/bird_8.ogg',
		'sound/f13ambience/rattlesnake_1.ogg',
		'sound/f13ambience/rattlesnake_2.ogg',
		'sound/f13ambience/rattlesnake_3.ogg',
	)
	outdoors = TRUE

/area/fallout/ruins
	name = "Ruins"
	icon_state = "ruins"
	ambientsounds = list(
		'sound/f13ambience/ambigen_1.ogg',
		'sound/f13ambience/ambigen_2.ogg',
		'sound/f13ambience/dog_distant_1.ogg',
		'sound/f13ambience/dog_distant_2.ogg',
		'sound/f13ambience/dog_distant_3.ogg',
		'sound/f13ambience/rattlesnake_1.ogg',
		'sound/f13ambience/rattlesnake_2.ogg',
		'sound/f13ambience/rattlesnake_3.ogg',
	)
	outdoors = TRUE

/area/fallout/shack
	name = "Shack"
	icon_state = "shack"
	ambientsounds = list(
		'sound/f13ambience/ambigen_3.ogg',
		'sound/f13ambience/ambigen_4.ogg',
		'sound/f13ambience/ambigen_5.ogg',
		'sound/f13ambience/ambigen_6.ogg',
		'sound/f13ambience/ambigen_7.ogg',
		'sound/f13ambience/ambigen_8.ogg',
		'sound/f13ambience/ambigen_15.ogg',
		'sound/f13ambience/ambigen_16.ogg',
	)

/area/fallout/farm
	name = "Farm"
	icon_state = "farm"
	ambientsounds = list(
		'sound/f13ambience/dog_distant_1.ogg',
		'sound/f13ambience/dog_distant_2.ogg',
		'sound/f13ambience/dog_distant_3.ogg',
		'sound/f13ambience/bird_1.ogg',
		'sound/f13ambience/bird_2.ogg',
		'sound/f13ambience/bird_3.ogg',
		'sound/f13ambience/bird_4.ogg',
		'sound/f13ambience/bird_5.ogg',
		'sound/f13ambience/bird_6.ogg',
		'sound/f13ambience/bird_7.ogg',
		'sound/f13ambience/bird_8.ogg',
	)
	outdoors = TRUE

/area/fallout/tribe
	name = "Tribe"
	icon_state = "tribe"
	ambientsounds = list(
		'sound/f13ambience/dog_distant_1.ogg',
		'sound/f13ambience/dog_distant_2.ogg',
		'sound/f13ambience/dog_distant_3.ogg',
		'sound/f13ambience/bird_1.ogg',
		'sound/f13ambience/bird_2.ogg',
		'sound/f13ambience/bird_3.ogg',
		'sound/f13ambience/bird_4.ogg',
		'sound/f13ambience/bird_5.ogg',
		'sound/f13ambience/bird_6.ogg',
		'sound/f13ambience/bird_7.ogg',
		'sound/f13ambience/bird_8.ogg',
	)
	outdoors = TRUE


/**
 * Building areas
 */

/area/fallout/building
	name = "Building"
	icon_state = "building"
	ambientsounds = list(
		'sound/f13ambience/ambigen_3.ogg',
		'sound/f13ambience/ambigen_4.ogg',
		'sound/f13ambience/ambigen_5.ogg',
		'sound/f13ambience/ambigen_6.ogg',
		'sound/f13ambience/ambigen_7.ogg',
		'sound/f13ambience/ambigen_8.ogg',
		'sound/f13ambience/ambigen_9.ogg',
	)

/area/fallout/building/mass_fusion
	name = "Mass Fusion Plant"
	icon_state = "fusion_int"

/area/fallout/building/hospital
	name = "Sheridan County Hospital"
	icon_state = "hospital"

/area/fallout/building/mall
	name = "Mall of Utah"
	icon_state = "mall"

/area/fallout/building/museum
	name = "Museum of Technology"
	icon_state = "museum"

/area/fallout/building/fire_station
	name = "Fire Station"
	icon_state = "fire"

/area/fallout/building/train_station
	name = "Train Station"
	icon_state = "train"

/area/fallout/building/nanotrasen
	name = "Nanotrasen HQ"
	icon_state = "nano"

/area/fallout/building/khan_fort
	name = "Khan Fortress"
	icon_state = "khan_fort"

/area/fallout/building/bighorn_bunker
	name = "Bighorn Bunker"
	icon_state = "bighorn_bunker"

/area/fallout/village
	name = "Village"
	icon_state = "village"
	ambientsounds = list(
		'sound/f13ambience/dog_distant_1.ogg',
		'sound/f13ambience/dog_distant_2.ogg',
		'sound/f13ambience/dog_distant_3.ogg',
		'sound/f13ambience/bird_1.ogg',
		'sound/f13ambience/bird_2.ogg',
		'sound/f13ambience/bird_3.ogg',
		'sound/f13ambience/bird_4.ogg',
	)

/area/fallout/outpost
	name = "Outpost"
	icon_state = "outpost"
	ambientsounds = list(
		'sound/f13ambience/battle_1.ogg',
		'sound/f13ambience/battle_2.ogg',
		'sound/f13ambience/battle_3.ogg',
		'sound/f13ambience/bird_1.ogg',
		'sound/f13ambience/bird_2.ogg',
		'sound/f13ambience/bird_3.ogg',
		'sound/f13ambience/bird_4.ogg',
	)

/area/fallout/hub
	name = "Hub"
	icon_state = "hub"
	ambientsounds = list(
		'sound/f13ambience/dog_distant_1.ogg',
		'sound/f13ambience/dog_distant_2.ogg',
		'sound/f13ambience/dog_distant_3.ogg',
		'sound/f13ambience/rattlesnake_1.ogg',
		'sound/f13ambience/rattlesnake_2.ogg',
		'sound/f13ambience/rattlesnake_3.ogg',
	)
	outdoors = TRUE


/**
 * City areas
 */

/area/fallout/city
	name = "City"
	icon_state = "city"
	ambientsounds = list(
		'sound/f13ambience/dog_distant_1.ogg',
		'sound/f13ambience/dog_distant_2.ogg',
		'sound/f13ambience/dog_distant_3.ogg',
		'sound/f13ambience/ambigen_1.ogg',
		'sound/f13ambience/ambigen_2.ogg',
	)
	outdoors = TRUE

/area/fallout/city/museum
	name = "Museum"
	outdoors = FALSE

/area/fallout/city/bighorn
	name = "Bighorn"
	icon_state = "bighorn"
	requires_power = TRUE

/area/fallout/city_caves
	name = "City Caves"
	icon_state = "city_caves"
	ambientsounds = list(
		'sound/f13ambience/ambigen_15.ogg',
		'sound/f13ambience/ambigen_16.ogg',
		'sound/f13ambience/dog_distant_1.ogg',
		'sound/f13ambience/dog_distant_2.ogg',
		'sound/f13ambience/dog_distant_3.ogg',
	)


/area/fallout/chapel
	name = "Chapel"
	icon_state = "chapel"
	ambientsounds = list(
		'sound/ambience/ambicha1.ogg',
		'sound/ambience/ambicha2.ogg',
		'sound/ambience/ambicha3.ogg',
		'sound/ambience/ambicha4.ogg',
	)


/area/fallout/mountain_area
	name = "Unknown"
	icon_state = "forest"
	ambientsounds = list(
		'sound/f13ambience/bird_1.ogg',
		'sound/f13ambience/bird_2.ogg',
		'sound/f13ambience/bird_3.ogg',
		'sound/f13ambience/bird_4.ogg',
		'sound/f13ambience/bird_5.ogg',
		'sound/f13ambience/bird_6.ogg',
		'sound/f13ambience/bird_7.ogg',
		'sound/f13ambience/bird_8.ogg',
	)
	outdoors = TRUE


/area/fallout/bar
	name = "Bar"
	icon_state = "bar"
	ambientsounds = list(
		'sound/f13ambience/ambigen_1.ogg',
		'sound/f13ambience/ambigen_2.ogg',
	)

/area/fallout/bar/heaven
	name = "Heaven's Night"
	icon_state = "heaven"


/area/fallout/casino
	name = "Casino"
	icon_state = "casino"
	ambientsounds = list(
		'sound/f13ambience/ambigen_3.ogg',
		'sound/f13ambience/ambigen_4.ogg',
		'sound/f13ambience/ambigen_5.ogg',
		'sound/f13ambience/ambigen_6.ogg',
		'sound/f13ambience/ambigen_7.ogg',
		'sound/f13ambience/ambigen_8.ogg',
	)


/area/fallout/clinic
	name = "Clinic"
	icon_state = "clinic"
	ambientsounds = list(
		'sound/f13ambience/ambigen_1.ogg',
		'sound/f13ambience/ambigen_2.ogg',
		'sound/f13ambience/ambigen_3.ogg',
		'sound/f13ambience/ambigen_4.ogg',
		'sound/f13ambience/ambigen_5.ogg',
		'sound/f13ambience/ambigen_6.ogg',
		'sound/f13ambience/ambigen_7.ogg',
		'sound/f13ambience/ambigen_8.ogg',
		'sound/f13ambience/ambigen_9.ogg',
		'sound/f13ambience/ambigen_17.ogg',
		'sound/f13ambience/ambigen_18.ogg',
		'sound/f13ambience/ambigen_19.ogg',
	)


/area/fallout/office
	name = "Office"
	icon_state = "office"
	ambientsounds = list(
		'sound/f13ambience/ambigen_3.ogg',
		'sound/f13ambience/ambigen_4.ogg',
		'sound/f13ambience/ambigen_5.ogg',
		'sound/f13ambience/ambigen_6.ogg',
		'sound/f13ambience/ambigen_7.ogg',
		'sound/f13ambience/ambigen_8.ogg',
	)


/area/fallout/store
	name = "Store"
	icon_state = "store"
	ambientsounds = list(
		'sound/f13ambience/ambigen_3.ogg',
		'sound/f13ambience/ambigen_4.ogg',
		'sound/f13ambience/ambigen_5.ogg',
		'sound/f13ambience/ambigen_6.ogg',
		'sound/f13ambience/ambigen_7.ogg',
		'sound/f13ambience/ambigen_8.ogg',
	)


/**
 * Bunker areas
 */

/area/fallout/bunker
	name = "Bunker"
	icon_state = "bunker"
	ambientsounds = list(
		'sound/f13ambience/ambigen_1.ogg',
		'sound/f13ambience/ambigen_2.ogg',
		'sound/f13ambience/ambigen_9.ogg',
		'sound/f13ambience/ambigen_10.ogg',
		'sound/f13ambience/ambigen_11.ogg',
		'sound/f13ambience/ambigen_12.ogg',
		'sound/f13ambience/ambigen_13.ogg',
	)

/area/fallout/bunker/bunker_two
	name = "Bunker Two"

/area/fallout/bunker/museum
	name = "Bunker Museum"

/area/fallout/bunker/bighorn_bunker
	name = "Bighorn Bunker"
	icon_state = "bighorn_bunker2"


/**
 * Tunnel areas
 */

/area/fallout/tunnel
	name = "Tunnel"
	icon_state = "tunnel"
	ambientsounds = list(
		'sound/f13ambience/ambigen_9.ogg',
		'sound/f13ambience/ambigen_12.ogg',
		'sound/f13ambience/ambigen_15.ogg',
		'sound/f13ambience/ambigen_16.ogg',
		'sound/f13effects/steam_short.ogg',
		'sound/f13effects/steam_long.ogg',
	)

/area/fallout/tunnel/north_east
	name = "North-Eastern Tunnel"
	icon_state = "tunnel_ne"

/area/fallout/tunnel/north_west
	name = "North-Western Tunnel"
	icon_state = "tunnel_nw"

/area/fallout/tunnel/south_east
	name = "South-Eastern Tunnel"
	icon_state = "tunnel_se"

/area/fallout/tunnel/south_west
	name = "South-Western Tunnel"
	icon_state = "tunnel_sw"

/area/fallout/tunnel/southeast_bighorn
	name = "Bighorn Eastern Sewers"
	icon_state = "tunnel_e"

/area/fallout/tunnel/southwest_bighorn
	name = "Bighorn Western Sewers"
	icon_state = "tunnel_w"

/area/fallout/tunnel/subway
	name = "Subway Tunnel"
	icon_state = "tunnel_train"

/area/fallout/tunnel/khan_fort
	name = "Khan Fortress Tunnel"
	icon_state = "tunnel_khan"

/area/fallout/tunnel/bighorn
	name = "Bighorn Underground"
	icon_state = "tunnel"
	requires_power = TRUE


/area/fallout/train_station
	name = "Tunnel"
	icon_state = "tunnel"
	ambientsounds = list(
		'sound/f13ambience/ambigen_9.ogg',
		'sound/f13ambience/ambigen_12.ogg',
		'sound/f13ambience/ambigen_15.ogg',
		'sound/f13ambience/ambigen_16.ogg',
		'sound/f13effects/steam_short.ogg',
		'sound/f13effects/steam_long.ogg',
	)


/area/fallout/sewer
	name = "Sewer"
	icon_state = "sewer"
	ambientsounds = list(
		'sound/f13ambience/ambigen_9.ogg',
		'sound/f13effects/steam_short.ogg',
		'sound/f13effects/steam_long.ogg',
	)


/area/fallout/caves
	name = "Caves"
	icon_state = "caves"
	ambientsounds = list(
		'sound/f13ambience/ambigen_15.ogg',
		'sound/f13ambience/ambigen_16.ogg',
		'sound/f13ambience/ambigen_17.ogg',
		'sound/f13ambience/ambigen_18.ogg',
		'sound/f13ambience/ambigen_19.ogg',
	)


/area/fallout/subway
	name = "Subway"
	icon_state = "subway"
	ambientsounds = list(
		'sound/f13ambience/ambigen_1.ogg',
		'sound/f13ambience/ambigen_2.ogg',
		'sound/f13ambience/ambigen_9.ogg',
		'sound/f13ambience/ambigen_12.ogg',
	)

/area/fallout/secret
	name = "Secret"
	icon_state = "secret"
	ambientsounds = list(
		'sound/ambience/signal.ogg',
		'sound/f13ambience/ambigen_10.ogg',
		'sound/f13ambience/ambigen_11.ogg',
		'sound/f13ambience/ambigen_12.ogg',
		'sound/f13ambience/ambigen_13.ogg',
	)


/area/fallout/radiation
	name = "Radiation"
	icon_state = "radiation"
	ambientsounds = list(
		'sound/f13ambience/rattlesnake_1.ogg',
		'sound/f13ambience/rattlesnake_2.ogg',
		'sound/f13ambience/rattlesnake_3.ogg',
	)


/**
 * Faction areas
 */

/area/fallout/raiders
	name = "Raiders"
	icon_state = "raiders"
	ambientsounds = list(
		'sound/f13ambience/ambigen_1.ogg',
		'sound/f13ambience/ambigen_2.ogg',
		'sound/f13ambience/dog_distant_1.ogg',
		'sound/f13ambience/dog_distant_2.ogg',
		'sound/f13ambience/dog_distant_3.ogg',
		'sound/f13ambience/battle_1.ogg',
		'sound/f13ambience/battle_2.ogg',
		'sound/f13ambience/battle_3.ogg',
	)
	outdoors = TRUE

/area/fallout/enclave
	name = "Enclave Bunker"
	icon_state = "enclave"
	ambientsounds = list(
		'sound/f13ambience/ambigen_10.ogg',
		'sound/f13ambience/ambigen_11.ogg',
		'sound/f13ambience/ambigen_12.ogg',
		'sound/f13ambience/ambigen_13.ogg',
		'sound/f13ambience/ambigen_14.ogg',
		'sound/f13ambience/enclave_vault.ogg',
		'sound/ambience/signal.ogg',
	)
	requires_power = TRUE

/area/fallout/ahs
	name = "Adepts of Hubology Studies"
	icon_state = "ahs"
	ambientsounds = list(
		'sound/f13ambience/ambigen_10.ogg',
		'sound/f13ambience/ambigen_11.ogg',
		'sound/f13ambience/ambigen_12.ogg',
		'sound/f13ambience/ambigen_13.ogg',
		'sound/ambience/signal.ogg',
	)

/area/fallout/ncr
	name = "NCR Outpost"
	icon_state = "ncr"
	ambientsounds = list(
		'sound/f13ambience/ambigen_3.ogg',
		'sound/f13ambience/ambigen_4.ogg',
		'sound/f13ambience/ambigen_5.ogg',
		'sound/f13ambience/ambigen_6.ogg',
		'sound/f13ambience/ambigen_7.ogg',
		'sound/f13ambience/ambigen_8.ogg',
		'sound/f13ambience/ambigen_9.ogg',
		'sound/f13ambience/ambigen_10.ogg',
		'sound/f13ambience/ambigen_11.ogg',
		'sound/f13ambience/ambigen_12.ogg',
	)
	requires_power = FALSE

/area/fallout/legion
	name = "Legion Fortress"
	icon_state = "legion"
	ambientsounds = list(
		'sound/f13ambience/ambigen_3.ogg',
		'sound/f13ambience/ambigen_4.ogg',
		'sound/f13ambience/ambigen_15.ogg',
		'sound/f13ambience/ambigen_16.ogg',
		'sound/f13ambience/dog_distant_1.ogg',
		'sound/f13ambience/dog_distant_2.ogg',
		'sound/f13ambience/dog_distant_3.ogg',
	)

/area/fallout/followers
	name = "Followers of the Apocalypse Clinic"
	icon_state = "followers"
	ambientsounds = list(
		'sound/f13ambience/ambigen_10.ogg',
		'sound/f13ambience/ambigen_11.ogg',
		'sound/f13ambience/ambigen_12.ogg',
		'sound/f13ambience/ambigen_13.ogg',
		'sound/ambience/signal.ogg',
	)
	requires_power = TRUE

/area/fallout/wasteland/khans
	name = "Great Khan Encampment"
	icon_state = "khans"


/**
 * Vault-tec
 */
/area/fallout/vault
	name = "Vault"
	icon_state = "vault_tec"
	ambientsounds = list(
		'sound/f13ambience/ambigen_10.ogg',
		'sound/f13ambience/ambigen_11.ogg',
		'sound/f13ambience/ambigen_12.ogg',
		'sound/f13ambience/ambigen_13.ogg',
		'sound/f13ambience/ambigen_14.ogg',
		'sound/f13effects/steam_short.ogg',
		'sound/f13effects/steam_long.ogg',
	)
	requires_power = TRUE

/area/fallout/vault/reactor
	name = "Reactor"
	icon_state = "reactor"

/area/fallout/vault/storage
	name = "Storage"
	icon_state = "storage"

/area/fallout/vault/storage_office
	name = "Storage Office"
	icon_state = "storage_office"

/area/fallout/vault/overseer
	name = "Overseer's Office"
	icon_state = "overseer_office"

/area/fallout/vault/chief_office
	name = "Chief's Office"
	icon_state = "chief_office"

/area/fallout/vault/id_control
	name = "ID Control Office"
	icon_state = "id_control"

/area/fallout/vault/vents
	name = "Vents"
	icon_state = "vents"

/area/fallout/vault/bot_control
	name = "Bot Control"
	icon_state = "bot_control"

/area/fallout/vault/atrium
	name = "Vault Atrium"
	icon_state = "vault_atrium"

/area/fallout/vault/security
	name = "Brig"
	icon_state = "brig"

/area/fallout/vault/checkpoint
	name = "Security Checkpoint"
	icon_state = "checkpoint"

/area/fallout/vault/armory
	name = "Armory"
	icon_state = "armory"

/area/fallout/vault/medical
	name = "Medical Center"
	icon_state = "med_center"

/area/fallout/vault/surgery
	name = "Surgery"
	icon_state = "med_surgery"

/area/fallout/vault/medical_breakroom
	name = "Break Room"
	icon_state = "med_break_room"

/area/fallout/vault/morgue
	name = "Morgue"
	icon_state = "morgue"

/area/fallout/vault/chemistry
	name = "Chemistry"
	icon_state = "chem"

/area/fallout/vault/science
	name = "Science"
	icon_state = "science"

/area/fallout/vault/biology
	name = "Biology"
	icon_state = "biology"

/area/fallout/vault/garden
	name = "Garden"
	icon_state = "garden"

/area/fallout/vault/diner
	name = "Dining Hall"
	icon_state = "cafeteria"

/area/fallout/vault/custodial
	name = "Custodial Closet"
	icon_state = "custodial_closet"

/area/fallout/vault/dormitory
	name = "Dormitory"
	icon_state = "dormitory"

/area/fallout/vault/restrooms
	name = "Restrooms"
	icon_state = "restrooms"


/**
 * Brotherhood of Steel
 */
/area/fallout/brotherhood
	name = "Brotherhood of Steel Bunker"
	icon_state = "bhood"
	ambientsounds = list(
		'sound/f13ambience/ambigen_9.ogg',
		'sound/f13ambience/ambigen_10.ogg',
		'sound/f13ambience/ambigen_11.ogg',
		'sound/f13ambience/ambigen_12.ogg',
		'sound/f13ambience/ambigen_13.ogg',
	)
	requires_power = TRUE

/area/fallout/brotherhood/rnd
	name = "Brotherhood of Steel RnD Department"
	icon_state = "bhood_rnd"

/area/fallout/brotherhood/offices_first
	name = "Brotherhood of Steel 1st Floor Offices"
	icon_state = "bhood_offices"

/area/fallout/brotherhood/offices_second
	name = "Brotherhood of Steel 2nd Floor Offices"
	icon_state = "bhood_officess2"

/area/fallout/brotherhood/surface
	name = "Brotherhood of Steel Surface Outpost"
	icon_state = "bhood_surface"

/area/fallout/brotherhood/medical
	name = "Brotherhood of Steel Medbay"
	icon_state = "bhood_med"

/area/fallout/brotherhood/operating
	name = "Brotherhood of Steel Operating Room"
	icon_state = "bhood_surgery"

/area/fallout/brotherhood/chemistry
	name = "Brotherhood of Steel Chemistry Lab"
	icon_state = "bhood_chem"

/area/fallout/brotherhood/dorms
	name = "Brotherhood of Steel Dormitories"
	icon_state = "bhood_dorms"

/area/fallout/brotherhood/armory
	name = "Brotherhood of Steel Armory"
	icon_state = "bhood_armory"

/area/fallout/brotherhood/archives
	name = "Brotherhood of Steel Archives"
	icon_state = "bhood_archives"

/area/fallout/brotherhood/operations
	name = "Brotherhood of Steel Operations Department"
	icon_state = "bhood_operations"

/area/fallout/brotherhood/leisure
	name = "Brotherhood of Steel Leisure Areas"
	icon_state = "bhood_leisure"

/area/fallout/brotherhood/reactor
	name = "Brotherhood of Steel Reactor"
	icon_state = "bhood_reactor"

/area/fallout/brotherhood/mining
	name = "Brotherhood of Steel Mining"
	icon_state = "bhood_mining"


/**
 * Special
 */

/area/fallout/vault_elevator
	name = "elevator shaft"
	icon_state = "vault_elevator"

/area/fallout/enclave_elevator
	name = "elevator shaft"
	icon_state = "enclave_elevator"


/**
 *
 * TODO
 *
 */


/area/fallout/admeme
	icon_state = "secret"
	requires_power = FALSE


/area/fallout/bos_underground
	name = "Brotherhood of Steel Underground"
	icon_state = "bhood_underground"
	flags_1 = NONE // cannot be dirty


/area/fallout/mountain_underground
	name = "mountain"
	icon_state = "cave"


/area/fallout/tcoms
	name = "tcomms"
	icon_state = "tcomms"
	requires_power = FALSE


/area/fallout/desert
	name = "Desert"
	icon_state = "desert"

	ambientsounds = list(
		'sound/f13ambience/wasteland.ogg',
		'sound/f13ambience/sewer.ogg',
	)

	requires_power = FALSE
	poweralm = FALSE
	power_environ = FALSE
	power_equip = FALSE
	outdoors = TRUE
	lightswitch = FALSE //no. just no
	flags_1 = NONE //>desert >>has destroyed robo dirt on it


/area/fallout/sunny_dale
	name = "Sunny Dale"
	icon_state = "sunny_dale"

/area/fallout/ncr_main
	name = "NCR Mainbase"
	icon_state = "ncr_main"

/area/fallout/raider_mall
	name = "Raider Mall"
	icon_state = "raider_mall"

/area/fallout/mountain_bunker
	name = "Mountain Bunker"
	icon_state = "mountain_bunker"

/area/fallout/prison
	name = "prison"
	icon_state = "prison"

/area/fallout/klamat
	name = "Klamat"
	icon_state = "klamat"

/area/fallout/klamat/mine
	name = "Klamat mine"
	icon_state = "klamat_mine"

/area/fallout/deep_mine
	name = "Klamat deep mine"
	icon_state = "klamat_mine_deep"

/area/fallout/farmhouse
	name = "Farmhouse"
	icon_state = "farmhouse"

/area/fallout/farmhouse_south
	name = "Farmhouse (South)"
	icon_state = "farmhouse_south"

/area/fallout/legion_camp
	name = "Legion Camp"
	icon_state = "legion_camp"

/area/fallout/power_plant
	name = "Power Plant"
	icon_state = "power_plant"
	ambientsounds = ENGINEERING

/area/fallout/enclave_base
	name = "Enclave Base"
	icon_state = "enclave_base"
	ambientsounds = list('sound/f13ambience/enclave_vault.ogg')

/area/fallout/den
	name = "Den"
	icon_state = "den"

/area/fallout/overseer_office
	name = "Overseer's Office"
	icon_state = "overseer_office"
	ambientsounds = list('sound/f13ambience/vaulttec_vault.ogg')

/area/fallout/vault_atrium_upper
	name = "Vault Atrium Upper"
	icon_state = "vault_atrium_upper"
	requires_power = TRUE
	ambientsounds = list('sound/f13ambience/vaulttec_vault.ogg')

/area/fallout/vault_atrium_Lower
	name = "Vault Atrium Lower"
	icon_state = "vault_atrium_lower"
	requires_power = TRUE
	ambientsounds = list('sound/f13ambience/vaulttec_vault.ogg')

/area/shuttle/vault_elevator
	name = "Vault Elevator"

/area/shuttle/enclavefort_elevator
	name = "Enclave Fort Elevator"

/area/shuttle/bos_elevator
	name = "BOS Elevator"

/area/shuttle/bunker_elevator
	name = "Bunker Elevator"

/area/shuttle/entrance_elevator
	name = "Entrance Elevator"

/area/shuttle/north_bunker_elevator
	name = "North Bunker Elevator"

/area/shuttle/south_bunker_elevator
	name = "South Bunker Elevator"

/area/shuttle/vault_113_elevator
	name = "Vault 113 Elevator"
	ambientsounds = list('sound/f13ambience/vaulttec_vault.ogg')

/area/shuttle/mining_elevator
	name = "Mining Elevator"

/area/shuttle/bos_foyer
	name = "Brotherhood of Steel Foyer"


/**
 * Underground
 */

/area/fallout/cave
	name = "Cave"
	icon_state = "cave"
	outdoors = TRUE

/area/fallout/cave/vault
	name = "Vault Mine"
	icon_state = "vault_mine"
	outdoors = TRUE

/area/fallout/cave/vault/fourfivefour
	name = "Vault 454"
	icon_state = "vaulttec"
	outdoors = FALSE
