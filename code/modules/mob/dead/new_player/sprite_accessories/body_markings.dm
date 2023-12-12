/******************************************
************ Furry Markings ***************
*******************************************/

// These are all color matrixed and applied per-limb by default. you MUST comply with this if you want to have your markings work --Pooj
// use the HumanScissors tool to break your sprite up into the zones easier.
// Although Byond supposedly doesn't have an icon limit anymore of 512 states after 512.1478, just be careful about too many additions.

/datum/sprite_accessory/mam_body_markings
	extra = FALSE
	extra2 = FALSE
	color_src = MATRIXED
	gender_specific = 0
	icon = 'modular_citadel/icons/mob/mam_markings.dmi'
	recommended_species = list("mammal", "xeno", "slimeperson", "podweak")
	matrixed_sections = MATRIX_ALL // this value is used if there is no value in covered_limbs, don't rely on it, it's a backup value
	var/list/covered_limbs = list("Head", "Chest", "Left Leg", "Right Leg", "Left Arm", "Right Arm")

/datum/sprite_accessory/mam_body_markings/none
	name = "None"
	icon_state = "none"
	ckeys_allowed = list("yousshouldnteverbeseeingthisyoumeme")
	icon = 'modular_citadel/icons/mob/markings_notmammals.dmi'
	relevant_layers = null
	matrixed_sections = 0

/datum/sprite_accessory/mam_body_markings/abs
	name = "Abdominals"
	icon_state = "abs"
	covered_limbs = list("Head" = MATRIX_RED, "Chest" = MATRIX_RED, "Left Leg" = MATRIX_RED_BLUE, "Right Leg" = MATRIX_RED_BLUE)

/datum/sprite_accessory/mam_body_markings/abstwo
	name = "Abdominals 2-Tone"
	icon_state = "absbelly"
	covered_limbs = list("Head" = MATRIX_RED, "Chest" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/absthree
	name = "Abdominals 3-Tone"
	icon_state = "absarms"
	covered_limbs = list("Head" = MATRIX_RED, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_RED_BLUE, "Right Arm" = MATRIX_RED_BLUE)

/datum/sprite_accessory/mam_body_markings/backsailchest
	name = "Backsail"
	icon_state = "backsail"
	covered_limbs = list("Chest" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/bands
	name = "Bands"
	icon_state = "bands"
	covered_limbs = list("Left Leg" = MATRIX_RED, "Right Leg" = MATRIX_RED, "Left Arm" = MATRIX_RED, "Right Arm" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/bat
	name = "Bat"
	icon_state = "bat"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_ALL, "Left Leg" = MATRIX_RED_BLUE, "Right Leg" = MATRIX_RED_BLUE, "Left Arm" = MATRIX_RED, "Right Arm" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/bee
	name = "Bee"
	icon_state = "bee"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_GREEN, "Left Leg" = MATRIX_GREEN, "Right Leg" = MATRIX_GREEN, "Left Arm" = MATRIX_GREEN, "Right Arm" = MATRIX_GREEN)

/datum/sprite_accessory/mam_body_markings/bee_alt
	name = "Bee (Alt)"
	icon_state = "beealt"
	recommended_species = list("insect")
	covered_limbs = list("Chest" = MATRIX_ALL, "Right Arm" = MATRIX_GREEN, "Left Arm" = MATRIX_GREEN, "Right Leg" = MATRIX_GREEN, "Left Leg" = MATRIX_GREEN)

/datum/sprite_accessory/mam_body_markings/bee_fluff
	name = "Bee (Fluffy)"
	icon_state = "bee_fluff"
	recommended_species = list("insect")
	covered_limbs = list("Chest" = MATRIX_ALL, "Right Arm" = MATRIX_GREEN_BLUE, "Left Arm" = MATRIX_GREEN_BLUE, "Right Leg" = MATRIX_GREEN, "Left Leg" = MATRIX_GREEN)

/datum/sprite_accessory/mam_body_markings/bug3tone
	name = "Beetle"
	icon_state = "bug3tone"
	recommended_species = list("insect")
	covered_limbs = list("Chest" = MATRIX_GREEN_BLUE)

/datum/sprite_accessory/mam_body_markings/belly
	name = "Belly"
	icon_state = "belly"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_GREEN, "Left Leg" = MATRIX_RED, "Right Leg" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/bellyfur
	name = "Belly (Fur)"
	icon_state = "floof"
	covered_limbs = list("Chest" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/scutesbelly
	name = "Belly (Scutes)"
	icon_state = "scutesbelly"
	covered_limbs = list("Chest" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/bellyslim
	name = "Bellyslim"
	icon_state = "bellyslim"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_RED, "Right Leg" = MATRIX_RED, "Left Arm" = MATRIX_RED, "Right Arm" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/tajbelly
	name = "Belly (Tajaran)"
	icon_state = "tajbelly"
	covered_limbs = list("Chest" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/tajbellyfull
	name = "Belly (Tajaran Full)"
	icon_state = "tajbellyfull"
	covered_limbs = list("Chest" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/gloss
	name = "Body Gloss"
	icon_state = "gloss"
	covered_limbs = list("Chest" = MATRIX_RED, "Right Arm" = MATRIX_RED, "Left Arm" = MATRIX_RED, "Right Leg" = MATRIX_RED, "Left Leg" = MATRIX_RED, "Head" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/cow
	name = "Bovine"
	icon_state = "bovine"
	covered_limbs = list("Head" = MATRIX_ALL, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/corgi
	name = "Corgi"
	icon_state = "corgi"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/corvid
	name = "Corvid"
	icon_state = "corvid"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_RED, "Right Arm" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/dalmation
	name = "Dalmation"
	icon_state = "dalmation"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/datashark
	name = "DataShark"
	icon_state = "datashark"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_GREEN, "Left Leg" = MATRIX_GREEN, "Right Leg" = MATRIX_GREEN, "Left Arm" = MATRIX_GREEN, "Right Arm" = MATRIX_GREEN)

/datum/sprite_accessory/mam_body_markings/deer
	name = "Deer"
	icon_state = "deer"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_GREEN, "Right Arm" = MATRIX_GREEN)

/datum/sprite_accessory/mam_body_markings/dinohornhead
	name = "Dino Head"
	icon_state = "dinohorn"
	covered_limbs = list("Head" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/dog
	name = "Dog"
	icon_state = "dog"
	covered_limbs = list("Head" = MATRIX_RED_BLUE, "Chest" = MATRIX_ALL, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_ALL, "Right Arm" = MATRIX_ALL)

/datum/sprite_accessory/mam_body_markings/easterndragon
	name = "Eastern Dragon"
	icon_state = "easternd"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/eevee
	name = "Eevee"
	icon_state = "eevee"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_GREEN)

/datum/sprite_accessory/mam_body_markings/fennec
	name = "Fennec"
	icon_state = "Fennec"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/fox
	name = "Fox"
	icon_state = "fox"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_RED_BLUE, "Right Arm" = MATRIX_RED_BLUE)

/datum/sprite_accessory/mam_body_markings/frog
	name = "Frog"
	icon_state = "frog"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_GREEN, "Left Leg" = MATRIX_GREEN, "Right Leg" = MATRIX_GREEN, "Left Arm" = MATRIX_GREEN, "Right Arm" = MATRIX_GREEN)

/datum/sprite_accessory/mam_body_markings/goat
	name = "Goat"
	icon_state = "goat"
	covered_limbs = list("Head" = MATRIX_RED, "Chest" = MATRIX_RED, "Left Leg" = MATRIX_RED_BLUE, "Right Leg" = MATRIX_RED_BLUE, "Left Arm" = MATRIX_RED_BLUE, "Right Arm" = MATRIX_RED_BLUE)

/datum/sprite_accessory/mam_body_markings/gradient
	name = "Gradient"
	icon_state = "gradient"
	covered_limbs = list("Left Leg" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/guilmon
	name = "Guilmon"
	icon_state = "guilmon"
	covered_limbs = list("Head" = MATRIX_RED_BLUE, "Chest" = MATRIX_ALL, "Left Leg" = MATRIX_BLUE, "Right Leg" = MATRIX_BLUE, "Left Arm" = MATRIX_ALL, "Right Arm" = MATRIX_ALL)

/datum/sprite_accessory/mam_body_markings/handsfeet
	name = "Handsfeet"
	icon_state = "handsfeet"
	covered_limbs = list("Head" = MATRIX_RED, "Chest" = MATRIX_RED, "Left Leg" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/harlequin
	name = "Harlequin"
	icon_state = "harlequin"
	covered_limbs = list("Chest" = MATRIX_ALL, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_ALL, "Right Arm" = MATRIX_ALL)

/datum/sprite_accessory/mam_body_markings/harlequin_reversed
	name = "Harlequin (Reversed)"
	icon_state = "harlequin_reversed"
	covered_limbs = list("Chest" = MATRIX_ALL, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_ALL, "Right Arm" = MATRIX_ALL)

/datum/sprite_accessory/mam_body_markings/hawk
	name = "Hawk"
	icon_state = "hawk"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_RED, "Right Arm" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/husky
	name = "Husky"
	icon_state = "husky"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/hyena
	name = "Hyena"
	icon_state = "hyena"
	covered_limbs = list("Head" = MATRIX_ALL, "Chest" = MATRIX_ALL, "Left Leg" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/jackalb
	name = "Jackal Bareback"
	icon_state = "jackalb"
	covered_limbs = list("Chest" = MATRIX_GREEN, "Left Leg" = MATRIX_GREEN, "Right Leg" = MATRIX_GREEN, "Left Arm" = MATRIX_GREEN, "Right Arm" = MATRIX_GREEN)

/datum/sprite_accessory/mam_body_markings/jackalp
	name = "Jackal Backpattern"
	icon_state = "jackalp"
	covered_limbs = list("Chest" = MATRIX_GREEN, "Left Leg" = MATRIX_GREEN, "Right Leg" = MATRIX_GREEN, "Left Arm" = MATRIX_GREEN, "Right Arm" = MATRIX_GREEN)

/datum/sprite_accessory/mam_body_markings/leopard1
	name = "Leopard"
	icon_state = "leopard1"
	covered_limbs = list("Chest" = MATRIX_ALL, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_ALL, "Right Arm" = MATRIX_ALL)

/datum/sprite_accessory/mam_body_markings/leopard2
	name = "Leopard Alt"
	icon_state = "leopard2"
	covered_limbs = list("Chest" = MATRIX_ALL, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_ALL, "Right Arm" = MATRIX_ALL)

/datum/sprite_accessory/mam_body_markings/moth
	name = "Moth"
	icon_state = "moth"
	recommended_species = list("insect")
	covered_limbs = list("Head" = MATRIX_BLUE, "Chest" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED, "Left Leg" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/orca
	name = "Orca"
	icon_state = "orca"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/otie
	name = "Otie"
	icon_state = "otie"
	covered_limbs = list("Head" = MATRIX_ALL, "Chest" = MATRIX_ALL, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_ALL, "Right Arm" = MATRIX_ALL)

/datum/sprite_accessory/mam_body_markings/otter
	name = "Otter"
	icon_state = "otter"
	covered_limbs = list("Head" = MATRIX_ALL, "Chest" = MATRIX_GREEN)

/datum/sprite_accessory/mam_body_markings/panther
	name = "Panther"
	icon_state = "panther"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/patches
	name = "Patches"
	icon_state = "patches"
	covered_limbs = list("Left Leg" = MATRIX_RED, "Right Leg" = MATRIX_RED, "Left Arm" = MATRIX_RED, "Right Arm" = MATRIX_RED, "Chest" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/paw_socks
	name = "Paw Socks"
	icon_state = "pawsocks"
	covered_limbs = list("Left Leg" = MATRIX_RED, "Right Leg" = MATRIX_RED, "Left Arm" = MATRIX_RED, "Right Arm" = MATRIX_RED, "Chest" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/pigeon
	name = "Pigeon"
	icon_state = "pigeon"
	covered_limbs = list("Chest" = MATRIX_GREEN, "Right Arm" = MATRIX_GREEN_BLUE, "Left Arm" = MATRIX_GREEN_BLUE)

/datum/sprite_accessory/mam_body_markings/plain
	name = "Plain"
	icon_state = "plain"
	covered_limbs = list("Head" = MATRIX_RED, "Chest" = MATRIX_RED, "Left Leg" = MATRIX_RED, "Right Leg" = MATRIX_RED, "Left Arm" = MATRIX_RED, "Right Arm" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/possum
	name = "Possum"
	icon_state = "possum"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_RED_BLUE, "Right Leg" = MATRIX_RED_BLUE, "Left Arm" = MATRIX_RED_BLUE, "Right Arm" = MATRIX_RED_BLUE)

/datum/sprite_accessory/mam_body_markings/raccoon
	name = "Raccoon"
	icon_state = "raccoon"
	covered_limbs = list("Head" = MATRIX_ALL, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/raccalt
	name = "Raccoon (Alt)"
	icon_state = "raccalt"
	covered_limbs = list("Head" = MATRIX_ALL, "Chest" = MATRIX_RED_BLUE, "Right Arm" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_ALL, "Left Leg" = MATRIX_ALL)

/datum/sprite_accessory/mam_body_markings/chemlight
	name = "Rad-Dog"
	icon_state = "chemlight"
	covered_limbs = list("Head" = MATRIX_ALL, "Chest" = MATRIX_ALL, "Right Arm" = MATRIX_RED_BLUE, "Left Arm" = MATRIX_RED_BLUE, "Right Leg" = MATRIX_RED_BLUE, "Left Leg" = MATRIX_RED_BLUE)

/datum/sprite_accessory/mam_body_markings/rat
	name = "Rat"
	icon_state = "rat"
	covered_limbs = list("Head" = MATRIX_ALL, "Chest" = MATRIX_ALL, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_ALL, "Right Arm" = MATRIX_ALL)

/datum/sprite_accessory/mam_body_markings/redpanda
	name = "Redpanda"
	icon_state = "redpanda"
	covered_limbs = list("Head" = MATRIX_ALL, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/sabresune
	name = "Sabresune"
	icon_state = "sabresune"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/pede
	name = "Scolipede"
	icon_state = "scolipede"
	covered_limbs = list("Head" = MATRIX_GREEN, "Chest" = MATRIX_ALL, "Left Leg" = MATRIX_GREEN, "Right Leg" = MATRIX_GREEN, "Left Arm" = MATRIX_GREEN, "Right Arm" = MATRIX_GREEN)

/datum/sprite_accessory/mam_body_markings/sergal
	name = "Sergal"
	icon_state = "sergal"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/shark
	name = "Shark"
	icon_state = "shark"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED, "Left Leg" = MATRIX_RED, "Right Leg" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED_GREEN, "Right Arm" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/shepherd
	name = "Shepherd"
	icon_state = "shepherd"
	covered_limbs = list("Head" = MATRIX_ALL, "Chest" = MATRIX_ALL, "Left Leg" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED, "Right Arm" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/shrike
	name = "Shrike"
	icon_state = "shrike"
	covered_limbs = list("Head" = MATRIX_GREEN_BLUE, "Chest" = MATRIX_BLUE, "Right Arm" = MATRIX_GREEN_BLUE, "Left Arm" = MATRIX_GREEN_BLUE)

/datum/sprite_accessory/mam_body_markings/skunk
	name = "Skunk"
	icon_state = "skunk"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_RED_GREEN, "Right Leg" = MATRIX_RED_GREEN, "Left Arm" = MATRIX_RED, "Right Arm" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/stegoplatechest
	name = "Stego Chestplate"
	icon_state = "stegoplate"
	covered_limbs = list("Chest" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/backstripe
	name = "Stripe Back"
	icon_state = "backstripe"
	covered_limbs = list("Chest" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/tigerstripes
	name = "Stripe Tiger"
	icon_state = "tiger"
	covered_limbs = list("Left Leg" = MATRIX_RED, "Right Leg" = MATRIX_RED, "Left Arm" = MATRIX_RED, "Right Arm" = MATRIX_RED, "Chest" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/tajaran
	name = "Tajaran"
	icon_state = "tajaran"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED_GREEN, "Left Leg" = MATRIX_RED, "Right Leg" = MATRIX_RED, "Left Arm" = MATRIX_RED, "Right Arm" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/tatblush
	name = "Tattoo Blush"
	icon_state = "blush"
	covered_limbs = list("Head" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/tatcampbell
	name = "Tattoo Campbell"
	icon_state = "tatcampbell"
	covered_limbs = list("Right Arm" = MATRIX_RED, "Left Arm" = MATRIX_RED, "Right Leg" = MATRIX_RED, "Left Leg" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/tatlips
	name = "Tattoo Lip"
	icon_state = "lips"
	covered_limbs = list("Head" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/tatnightling
	name = "Tattoo Nightling"
	icon_state = "tatnightling"
	covered_limbs = list("Chest" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/tatsilverburgh
	name = "Tattoo Silverburgh"
	icon_state = "tatsilverburgh"
	covered_limbs = list("Right Leg" = MATRIX_RED, "Left Leg" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/tattiger
	name = "Tattoo Tiger"
	icon_state = "tattiger"
	covered_limbs = list("Right Arm" = MATRIX_RED, "Left Arm" = MATRIX_RED, "Chest" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/tiger
	name = "Tiger"
	icon_state = "tiger"
	covered_limbs = list("Head" = MATRIX_ALL, "Chest" = MATRIX_ALL, "Left Leg" = MATRIX_ALL, "Right Leg" = MATRIX_ALL, "Left Arm" = MATRIX_RED_BLUE, "Right Arm" = MATRIX_RED_BLUE)

/datum/sprite_accessory/mam_body_markings/trikebeakhead
	name = "Trike Beak"
	icon_state = "trikebeak"
	covered_limbs = list("Head" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/trikehornhead
	name = "Trike Horn"
	icon_state = "trikehorn"
	covered_limbs = list("Head" = MATRIX_RED_GREEN)

/datum/sprite_accessory/mam_body_markings/turian
	name = "Turian"
	icon_state = "turian"
	covered_limbs = list("Head" = MATRIX_RED_GREEN, "Chest" = MATRIX_RED, "Left Leg" = MATRIX_RED, "Right Leg" = MATRIX_RED, "Left Arm" = MATRIX_RED, "Right Arm" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/umbreon
	name = "Umbreon"
	icon_state = "umbreon"
	covered_limbs = list("Left Leg" = MATRIX_RED, "Right Leg" = MATRIX_RED, "Left Arm" = MATRIX_RED, "Right Arm" = MATRIX_RED, "Head" = MATRIX_RED)

/datum/sprite_accessory/mam_body_markings/wolf
	name = "Wolf"
	icon_state = "wolf"
	covered_limbs = list("Head" = MATRIX_ALL, "Chest" = MATRIX_ALL, "Left Leg" = MATRIX_RED_BLUE, "Right Leg" = MATRIX_RED_BLUE, "Left Arm" = MATRIX_RED_BLUE, "Right Arm" = MATRIX_RED_BLUE)

/datum/sprite_accessory/mam_body_markings/xeno
	name = "Xeno"
	icon_state = "xeno"
	covered_limbs = list("Head" = MATRIX_BLUE, "Chest" = MATRIX_GREEN, "Left Leg" = MATRIX_BLUE, "Right Leg" = MATRIX_BLUE, "Left Arm" = MATRIX_BLUE, "Right Arm" = MATRIX_BLUE)

/******************************************
************* Insect Markings *************
*******************************************/

/datum/sprite_accessory/insect_fluff
	icon = 'icons/mob/wings.dmi'
	color_src = 0
	relevant_layers = list(BODY_FRONT_LAYER)
	mutant_part_string = "insect_fluff"

/datum/sprite_accessory/insect_fluff/is_not_visible(mob/living/carbon/human/H, tauric)
	return (!H.dna.features["insect_fluff"] || H.dna.features["insect_fluff"] == "None" || H.wear_suit && (H.wear_suit.flags_inv & HIDEJUMPSUIT))

/datum/sprite_accessory/insect_fluff/none
	name = "None"
	icon_state = "none"
	relevant_layers = null

/datum/sprite_accessory/insect_fluff/brown
	name = "Brown"
	icon_state = "brown"

/datum/sprite_accessory/insect_fluff/punished
	name = "Burnt Off"
	icon_state = "punished"

/datum/sprite_accessory/insect_fluff/colored1
	name = "Colored (Primary)"
	icon_state = "snow"
	color_src = MUTCOLORS

/datum/sprite_accessory/insect_fluff/colored2
	name = "Colored (Secondary)"
	icon_state = "snow"
	color_src = MUTCOLORS2

/datum/sprite_accessory/insect_fluff/colored3
	name = "Colored (Tertiary)"
	icon_state = "snow"
	color_src = MUTCOLORS3

/datum/sprite_accessory/insect_fluff/colored
	name = "Colored (Hair)"
	icon_state = "snow"
	color_src = HAIR

/datum/sprite_accessory/insect_fluff/deathhead
	name = "Deathshead"
	icon_state = "deathhead"

/datum/sprite_accessory/insect_fluff/featherymoth
	name = "Feathery Moth"
	icon_state = "featherymoth"

/datum/sprite_accessory/insect_fluff/firewatch
	name = "Firewatch"
	icon_state = "firewatch"

/datum/sprite_accessory/insect_fluff/gothic
	name = "Gothic"
	icon_state = "gothic"

/datum/sprite_accessory/insect_fluff/jungle
	name = "Jungle"
	icon_state = "jungle"

/datum/sprite_accessory/insect_fluff/lovers
	name = "Lovers"
	icon_state = "lovers"

/datum/sprite_accessory/insect_fluff/moonfly
	name = "Moon Fly"
	icon_state = "moonfly"

/datum/sprite_accessory/insect_fluff/plain
	name = "Plain"
	icon_state = "plain"

/datum/sprite_accessory/insect_fluff/plasmafire
	name = "Plasmafire"
	icon_state = "plasmafire"

/datum/sprite_accessory/insect_fluff/poison
	name = "Poison"
	icon_state = "poison"

/datum/sprite_accessory/insect_fluff/oakworm
	name = "Oak Worm"
	icon_state = "oakworm"

/datum/sprite_accessory/insect_fluff/ragged
	name = "Ragged"
	icon_state = "ragged"

/datum/sprite_accessory/insect_fluff/reddish
	name = "Reddish"
	icon_state = "redish"

/datum/sprite_accessory/insect_fluff/rosy
	name = "Rosy"
	icon_state = "rosy"

/datum/sprite_accessory/insect_fluff/royal
	name = "Royal"
	icon_state = "royal"

/datum/sprite_accessory/insect_fluff/snow
	name = "Snow"
	icon_state = "snow"

/datum/sprite_accessory/insect_fluff/whitefly
	name = "White Fly"
	icon_state = "whitefly"

/datum/sprite_accessory/insect_fluff/witchwing
	name = "Witch Wing"
	icon_state = "witchwing"


/*No Antenna*/

/datum/sprite_accessory/insect_fluff/brown_noear
	name = "Brown No Antenna"
	icon_state = "brown2"

/datum/sprite_accessory/insect_fluff/punished_noear
	name = "Burnt Off No Antenna"
	icon_state = "punished2"

/datum/sprite_accessory/insect_fluff/colored1_noear
	name = "Colored (Primary) No Antenna"
	icon_state = "snow2"
	color_src = MUTCOLORS

/datum/sprite_accessory/insect_fluff/colored2_noear
	name = "Colored (Secondary) No Antenna"
	icon_state = "snow2"
	color_src = MUTCOLORS2

/datum/sprite_accessory/insect_fluff/colored3_noear
	name = "Colored (Tertiary) No Antenna"
	icon_state = "snow2"
	color_src = MUTCOLORS3

/datum/sprite_accessory/insect_fluff/colored_noear
	name = "Colored (Hair) No Antenna"
	icon_state = "snow2"
	color_src = HAIR

/datum/sprite_accessory/insect_fluff/deathhead_noear
	name = "Deathshead No Antenna"
	icon_state = "deathhead2"

/datum/sprite_accessory/insect_fluff/featherymoth_noear
	name = "Feathery Moth No Antenna"
	icon_state = "featherymoth2"

/datum/sprite_accessory/insect_fluff/firewatch_noear
	name = "Firewatch No Antenna"
	icon_state = "firewatch2"

/datum/sprite_accessory/insect_fluff/gothic_noear
	name = "Gothic No Antenna"
	icon_state = "gothic2"

/datum/sprite_accessory/insect_fluff/jungle_noear
	name = "Jungle No Antenna"
	icon_state = "jungle2"

/datum/sprite_accessory/insect_fluff/lovers_noear
	name = "Lovers No Antenna"
	icon_state = "lovers2"

/datum/sprite_accessory/insect_fluff/moonfly_noear
	name = "Moon Fly No Antenna"
	icon_state = "moonfly2"

/datum/sprite_accessory/insect_fluff/plain_noear
	name = "Plain No Antenna"
	icon_state = "plain2"

/datum/sprite_accessory/insect_fluff/plasmafire_noear
	name = "Plasmafire No Antenna"
	icon_state = "plasmafire2"

/datum/sprite_accessory/insect_fluff/poison_noear
	name = "Poison No Antenna"
	icon_state = "poison2"

/datum/sprite_accessory/insect_fluff/oakworm_noear
	name = "Oak Worm No Antenna"
	icon_state = "oakworm2"

/datum/sprite_accessory/insect_fluff/ragged_noear
	name = "Ragged No Antenna"
	icon_state = "ragged2"

/datum/sprite_accessory/insect_fluff/reddish_noear
	name = "Reddish No Antenna"
	icon_state = "redish2"

/datum/sprite_accessory/insect_fluff/rosy_noear
	name = "Rosy No Antenna"
	icon_state = "rosy2"

/datum/sprite_accessory/insect_fluff/royal_noear
	name = "Royal No Antenna"
	icon_state = "royal2"

/datum/sprite_accessory/insect_fluff/snow_noear
	name = "Snow No Antenna"
	icon_state = "snow2"

/datum/sprite_accessory/insect_fluff/whitefly_noear
	name = "White Fly No Antenna"
	icon_state = "whitefly2"

/datum/sprite_accessory/insect_fluff/witchwing_noear
	name = "Witch Wing No Antenna"
	icon_state = "witchwing2"

/*No Antenna*/

/datum/sprite_accessory/insect_fluff/brown_nofur
	name = "Brown No Fur"
	icon_state = "brown3"

/datum/sprite_accessory/insect_fluff/punished_nofur
	name = "Burnt Off No Fur"
	icon_state = "punished3"

/datum/sprite_accessory/insect_fluff/colored1_nofur
	name = "Colored (Primary) No Fur"
	icon_state = "snow3"
	color_src = MUTCOLORS

/datum/sprite_accessory/insect_fluff/colored2_nofur
	name = "Colored (Secondary) No Fur"
	icon_state = "snow3"
	color_src = MUTCOLORS2

/datum/sprite_accessory/insect_fluff/colored3_nofur
	name = "Colored (Tertiary) No Fur"
	icon_state = "snow3"
	color_src = MUTCOLORS3

/datum/sprite_accessory/insect_fluff/colored_nofur
	name = "Colored (Hair) No Fur"
	icon_state = "snow3"
	color_src = HAIR

/datum/sprite_accessory/insect_fluff/deathhead_nofur
	name = "Deathshead No Fur"
	icon_state = "deathhead3"

/datum/sprite_accessory/insect_fluff/featherymoth_nofur
	name = "Feathery Moth No Fur"
	icon_state = "featherymoth3"

/datum/sprite_accessory/insect_fluff/firewatch_nofur
	name = "Firewatch No Fur"
	icon_state = "firewatch3"

/datum/sprite_accessory/insect_fluff/gothic_nofur
	name = "Gothic No Fur"
	icon_state = "gothic3"

/datum/sprite_accessory/insect_fluff/jungle_nofur
	name = "Jungle No Fur"
	icon_state = "jungle3"

/datum/sprite_accessory/insect_fluff/lovers_nofur
	name = "Lovers No Fur"
	icon_state = "lovers3"

/datum/sprite_accessory/insect_fluff/moonfly_nofur
	name = "Moon Fly No Fur"
	icon_state = "moonfly3"

/datum/sprite_accessory/insect_fluff/plain_nofur
	name = "Plain No Fur"
	icon_state = "plain3"

/datum/sprite_accessory/insect_fluff/plasmafire_nofur
	name = "Plasmafire No Fur"
	icon_state = "plasmafire3"

/datum/sprite_accessory/insect_fluff/poison_nofur
	name = "Poison No Fur"
	icon_state = "poison3"

/datum/sprite_accessory/insect_fluff/oakworm_nofur
	name = "Oak Worm No Fur"
	icon_state = "oakworm3"

/datum/sprite_accessory/insect_fluff/ragged_nofur
	name = "Ragged No Fur"
	icon_state = "ragged3"

/datum/sprite_accessory/insect_fluff/reddish_nofur
	name = "Reddish No Fur"
	icon_state = "redish3"

/datum/sprite_accessory/insect_fluff/rosy_nofur
	name = "Rosy No Fur"
	icon_state = "rosy3"

/datum/sprite_accessory/insect_fluff/royal_nofur
	name = "Royal No Fur"
	icon_state = "royal3"

/datum/sprite_accessory/insect_fluff/snow_nofur
	name = "Snow No Fur"
	icon_state = "snow3"

/datum/sprite_accessory/insect_fluff/whitefly_nofur
	name = "White Fly No Fur"
	icon_state = "whitefly3"

/datum/sprite_accessory/insect_fluff/witchwing_nofur
	name = "Witch Wing No Fur"
	icon_state = "witchwing3"
