/datum/sprite_accessory/tails
	icon = 'icons/mob/mutant_bodyparts.dmi'
	mutant_part_string = "tail"
	relevant_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/tails/is_not_visible(mob/living/carbon/human/H, tauric)
	return ((H.wear_suit && (H.wear_suit.flags_inv & HIDETAUR)) || tauric)

/datum/sprite_accessory/tails_animated
	icon = 'icons/mob/mutant_bodyparts.dmi'
	mutant_part_string = "tailwag" //keep this the same, ALWAYS, this is incredibly important for colouring!
	relevant_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)

/******************************************
************* Lizard Tails ****************
*******************************************/

/datum/sprite_accessory/tails_animated/lizard/is_not_visible(mob/living/carbon/human/H, tauric)
	return (((H.wear_suit && (H.wear_suit.flags_inv & HIDETAUR)) || tauric) || H.dna.species.mutant_bodyparts["tail_lizard"])

//this goes first regardless of alphabetical order
/datum/sprite_accessory/tails/lizard/none
	name = "None"
	icon_state = "None"
	relevant_layers = null

/datum/sprite_accessory/tails_animated/lizard/none
	name = "None"
	icon_state = "None"
	relevant_layers = null

/datum/sprite_accessory/tails/lizard/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/lizard/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/lizard/furdragon
	name = "Furred Dragon"
	icon_state = "fluffydragon"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/lizard/furdragon
	name = "Furred Dragon"
	icon_state = "fluffydragon"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/lizard/dtiger
	name = "Dark Tiger"
	icon_state = "dtiger"

/datum/sprite_accessory/tails_animated/lizard/dtiger
	name = "Dark Tiger"
	icon_state = "dtiger"

/datum/sprite_accessory/tails/lizard/ltiger
	name = "Light Tiger"
	icon_state = "ltiger"

/datum/sprite_accessory/tails_animated/lizard/ltiger
	name = "Light Tiger"
	icon_state = "ltiger"

/datum/sprite_accessory/tails/lizard/nightstalker
	name = "Nightstalker"
	icon_state = "nightstalker"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/lizard/nightstalker
	name = "Nightstalker"
	icon_state = "nightstalker"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/lizard/reptilian
	name = "Reptilian"
	icon_state = "guilmon"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/lizard/reptilian
	name = "Reptilian"
	icon_state = "guilmon"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/lizard/smooth
	name = "Smooth"
	icon_state = "smooth"

/datum/sprite_accessory/tails_animated/lizard/smooth
	name = "Smooth"
	icon_state = "smooth"

/datum/sprite_accessory/tails/lizard/spikes
	name = "Spikes"
	icon_state = "spikes"

/datum/sprite_accessory/tails_animated/lizard/spikes
	name = "Spikes"
	icon_state = "spikes"

/datum/sprite_accessory/tails/lizard/thick
	name = "Thick"
	icon_state = "thick"

/datum/sprite_accessory/tails_animated/lizard/thick
	name = "Thick"
	icon_state = "thick"

/datum/sprite_accessory/tails/lizard/viper
	name = "Viper"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	icon_state = "seviper"
	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails_animated/lizard/viper
	name = "Viper"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	icon_state = "seviper"
	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL

/******************************************
************** Human Tails ****************
*******************************************/

/datum/sprite_accessory/tails/human/none
	name = "None"
	icon_state = "none"
	relevant_layers = null

/datum/sprite_accessory/tails_animated/human/none
	name = "None"
	icon_state = "none"
	relevant_layers = null

/datum/sprite_accessory/tails_animated/human/is_not_visible(mob/living/carbon/human/H, tauric)
	return (((H.wear_suit && (H.wear_suit.flags_inv & HIDETAUR)) || tauric)|| H.dna.species.mutant_bodyparts["tail_human"])

/datum/sprite_accessory/tails/human/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/human/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/furdragon
	name = "Furred Dragon"
	icon_state = "fluffydragon"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/human/furdragon
	name = "Furred Dragon"
	icon_state = "fluffydragon"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/bee
	name = "Bee"
	icon_state = "bee"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/human/bee
	name = "Bee"
	icon_state = "bee"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/cat
	name = "Cat"
	icon_state = "cat"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = HAIR

/datum/sprite_accessory/tails_animated/human/cat
	name = "Cat"
	icon_state = "cat"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = HAIR

/datum/sprite_accessory/tails/human/catbig
	name = "Cat, Big"
	icon_state = "catbig"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/human/catbig
	name = "Cat, Big"
	icon_state = "catbig"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/twocat
	name = "Cat, Double"
	icon_state = "twocat"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/human/twocat
	name = "Cat, Double"
	icon_state = "twocat"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/pede
	name = "Centipede"
	icon_state = "pede"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/human/pede
	name = "Centipede"
	icon_state = "pede"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/corvid
	name = "Corvid"
	icon_state = "crow"

/datum/sprite_accessory/tails_animated/human/corvid
	name = "Corvid"
	icon_state = "crow"

/datum/sprite_accessory/tails/human/cow
	name = "Cow"
	icon_state = "cow"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/human/cow
	name = "Cow"
	icon_state = "cow"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/dtiger
	name = "Dark Tiger"
	icon_state = "dtiger"

/datum/sprite_accessory/tails_animated/human/dtiger
	name = "Dark Tiger"
	icon_state = "dtiger"

/datum/sprite_accessory/tails/human/datashark
	name = "Datashark"
	icon_state = "datashark"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/tails_animated/human/datashark
	name = "Datashark"
	icon_state = "datashark"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/tails_animated/human/deathclaw
	name = "Deathclaw"
	icon_state = "deathclaw"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/deathclaw
	name = "Deathclaw"
	icon_state = "deathclaw"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/deer
	name = "Deer"
	icon_state = "deer"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/human/deer
	name = "Deer"
	icon_state = "deer"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/feathertail
	name = "Feather"
	icon_state = "feathertail"
	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/human/fennec
	name = "Fennec"
	icon_state = "fennec"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/human/fennec
	name = "Fennec"
	icon_state = "fennec"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/fennecalt
	name = "Fennec (Alt)"
	icon_state = "eevee"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/human/fennecalt
	name = "Fennec (Alt)"
	icon_state = "eevee"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/fennecalt3
	name = "Fennec (Alt 3)"
	icon_state = "vap"

/datum/sprite_accessory/tails/human/fennecbush
	name = "Fennec (Bushy)"
	icon_state = "flareon"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/fennecdown
	name = "Fennec (Downward)"
	icon_state = "downwardfennec"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/fennecrag
	name = "Fennec (Ragged)"
	icon_state = "leaf"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/ferret
	name = "Ferret"
	icon_state = "furret"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/fish
	name = "Fish"
	icon_state = "fish"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/human/fish
	name = "Fish"
	icon_state = "fish"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/fox
	name = "Fox"
	icon_state = "fox"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/human/fox
	name = "Fox"
	icon_state = "fox"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/gecko
	name = "Gecko"
	icon_state = "gecko"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/horse
	name = "Horse"
	icon_state = "horse"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = HAIR

/datum/sprite_accessory/tails_animated/human/horse
	name = "Horse"
	icon_state = "horse"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = HAIR

/datum/sprite_accessory/tails/human/husky
	name = "Husky"
	icon_state = "husky"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/human/husky
	name = "Husky"
	icon_state = "husky"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/insect
	name = "Insect"
	icon_state = "insect"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/human/insect
	name = "Insect"
	icon_state = "insect"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/jackal
	name = "Jackal"
	icon_state = "jackal"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/human/jackal
	name = "Jackal"
	icon_state = "jackal"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/kitsune
	name = "Kitsune"
	icon_state = "kitsune"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/human/kitsune
	name = "Kitsune"
	icon_state = "kitsune"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/ltiger
	name = "Light Tiger"
	icon_state = "ltiger"

/datum/sprite_accessory/tails_animated/human/ltiger
	name = "Light Tiger"
	icon_state = "ltiger"

/datum/sprite_accessory/tails/human/lizardalt
	name = "Lizard"
	icon_state = "charmander"

/datum/sprite_accessory/tails/human/murid
	name = "Murid"
	icon_state = "murid"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_GREEN

/datum/sprite_accessory/tails_animated/human/murid
	name = "Murid"
	icon_state = "murid"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_GREEN

/datum/sprite_accessory/tails/human/nightstalker
	name = "Nightstalker"
	icon_state = "nightstalker"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/human/nightstalker
	name = "Nightstalker"
	icon_state = "nightstalker"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/orca
	name = "Orca"
	icon_state = "orca"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/orca
	name = "Orca"
	icon_state = "orca"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/otie
	name = "Otusian"
	icon_state = "otie"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/human/otie
	name = "Otusian"
	icon_state = "otie"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/femalepeacock
	name = "Peacock Female"
	icon_state = "peacockfemale"
	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/human/malepeacock
	name = "Peacock Male"
	icon_state = "peacockmale"
	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/human/pony
	name = "Pony"
	icon_state = "pony"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/porkupine
	name = "Porkapine"
	icon_state = "porkupine"
	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/human/poss
	name = "Possum"
	icon_state = "posstail"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/rabbit
	name = "Rabbit"
	icon_state = "rabbit"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/human/rabbit
	name = "Rabbit"
	icon_state = "rabbit"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/raccoon
	name = "Raccoon"
	icon_state = "raccoonalt"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/raptor
	name = "Raptor"
	icon_state = "raptor"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/tails/human/ailurus
	name = "Red Panda"
	icon_state = "wah"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/human/ailurus
	name = "Red Panda"
	icon_state = "wah"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/sergal
	name = "Sergal"
	icon_state = "sergal"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/human/sergal
	name = "Sergal"
	icon_state = "sergal"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/shark
	name = "Shark"
	icon_state = "shark"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/human/shark
	name = "Shark"
	icon_state = "shark"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/skunk
	name = "Skunk"
	icon_state = "skunk"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails_animated/human/skunk
	name = "Skunk"
	icon_state = "skunk"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/human/skunkalt
	name = "Skunk Alt"
	icon_state = "skunkalt"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/smooth
	name = "Smooth"
	icon_state = "smooth"

/datum/sprite_accessory/tails_animated/human/smooth
	name = "Smooth"
	icon_state = "smooth"

/datum/sprite_accessory/tails/human/snaketail
	name = "Snake"
	icon_state = "snaketail"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/snep
	name = "Snep"
	icon_state = "snep"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/human/snep
	name = "Snep"
	icon_state = "snep"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/spikes
	name = "Spikes"
	icon_state = "spikes"

/datum/sprite_accessory/tails_animated/human/spikes
	name = "Spikes"
	icon_state = "spikes"

/datum/sprite_accessory/tails/human/straighttail
	name = "Straight Tail"
	icon_state = "straighttail"

/datum/sprite_accessory/tails_animated/human/straighttail
	name = "Straight Tail"
	icon_state = "straighttail"

/datum/sprite_accessory/tails/human/squirrel
	name = "Squirrel"
	icon_state = "squirrel"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/human/squirrel
	name = "Squirrel"
	icon_state = "squirrel"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/tailmaw
	name = "Tail Maw"
	icon_state = "tailmaw"
	color_src = MUTCOLORS

/datum/sprite_accessory/tails_animated/human/tailmaw
	name = "Tail Maw"
	icon_state = "tailmaw"
	color_src = MUTCOLORS

/datum/sprite_accessory/tails/human/tamamo_kitsune
	name = "Tamamo Kitsune Tails" //Tamamo-no-Tiro, let it be known!
	icon_state = "9sune"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/human/tamamo_kitsune
	name = "Tamamo Kitsune Tails"
	icon_state = "9sune"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/triple_kitsune
	name = "Triple Kitsune Tails"
	icon_state = "3sune"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/human/triple_kitsune
	name = "Triple Kitsune Tails"
	icon_state = "3sune"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/takahiro_kitsune
	name = "Takahiro Kitsune Tails" //takahiro had five tails i just wanted to follow the 'T' naming convention vs. tamamo and triple
	icon_state = "7sune"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/human/takahiro_kitsune
	name = "Takahiro Kitsune Tails"
	icon_state = "7sune"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/human/tentacle
	name = "Tentacle"
	icon_state = "tentacle"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/human/tentacle
	name = "Tentacle"
	icon_state = "tentacle"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/tiger
	name = "Tiger"
	icon_state = "tiger"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails_animated/human/tiger
	name = "Tiger"
	icon_state = "tiger"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/human/viper
	name = "Viper"
	icon_state = "seviper"
	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/human/wolf
	name = "Wolf"
	icon_state = "wolf"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/human/wolf
	name = "Wolf"
	icon_state = "wolf"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/human/zorgia
	name = "Zorgoia"
	icon_state = "zorgoia"
	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL

/******************************************
************** Furry Tails ****************
*******************************************/
/datum/sprite_accessory/tails/mam_tails
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	recommended_species = list("mammal", "slimeperson", "podweak", "felinid", "insect")
	relevant_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/tails/mam_tails/none
	name = "None"
	icon_state = "none"
	recommended_species = null
	relevant_layers = null

/datum/sprite_accessory/tails_animated/mam_tails_animated
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	relevant_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/tails_animated/mam_tails_animated/is_not_visible(mob/living/carbon/human/H, tauric)
	return (((H.wear_suit && (H.wear_suit.flags_inv & HIDETAUR)) || tauric) || H.dna.species.mutant_bodyparts["mam_tail"])

/datum/sprite_accessory/tails_animated/mam_tails_animated/none
	name = "None"
	icon_state = "none"
	relevant_layers = null

/datum/sprite_accessory/tails/mam_tails/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/furdragon
	name = "Furred Dragon"
	icon_state = "fluffydragon"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/furdragon
	name = "Furred Dragon"
	icon_state = "fluffydragon"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/batl
	name = "Bat (Long)"
	icon_state = "batl"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/batl
	name = "Bat (Long)"
	icon_state = "batl"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/bats
	name = "Bat (Short)"
	icon_state = "bats"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/bats
	name = "Bat (Short)"
	icon_state = "bats"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/bee
	name = "Bee"
	icon_state = "bee"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/bee
	name = "Bee"
	icon_state = "bee"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/bee2
	name = "Bee w/ Stinger"
	icon_state = "bee2"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails_animated/mam_tails_animated/bee2
	name = "Bee w/ Stinger"
	icon_state = "bee2"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/mam_tails/bigring
	name = "Big Ring"
	icon_state = "bigring"
	matrixed_sections = MATRIX_RED_GREEN
	dimension_x = 64
	icon = 'modular_citadel/icons/mob/mam_tails_big.dmi'
	center = TRUE

/datum/sprite_accessory/tails/mam_tails/bushy
	name = "Bushy"
	icon_state = "ninetails"
	color_src = MUTCOLORS

/datum/sprite_accessory/tails/mam_tails/cat
	name = "Cat"
	icon_state = "cat"
	color_src = HAIR

/datum/sprite_accessory/tails_animated/mam_tails_animated/cat
	name = "Cat"
	icon_state = "cat"
	color_src = HAIR

/datum/sprite_accessory/tails/mam_tails/catbig
	name = "Cat, Big"
	icon_state = "catbig"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/catbig
	name = "Cat, Big"
	icon_state = "catbig"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/twocat
	name = "Cat, Double"
	icon_state = "twocat"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/twocat
	name = "Cat, Double"
	icon_state = "twocat"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/slugcat
	name = "Cat Slug"
	icon_state = "slugcat"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/pede
	name = "Centipede"
	icon_state = "pede"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/pede
	name = "Centipede"
	icon_state = "pede"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/clubtail
	name = "Club"
	icon_state = "clubtail"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/corgi
	name = "Corgi"
	icon_state = "corgi"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/corgi
	name = "Corgi"
	icon_state = "corgi"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/corvid
	name = "Corvid"
	icon_state = "crow"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/corvid
	name = "Corvid"
	icon_state = "crow"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/cow
	name = "Cow"
	icon_state = "cow"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/cow
	name = "Cow"
	icon_state = "cow"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/shark/datashark
	name = "DataShark"
	icon_state = "datashark"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/tails_animated/mam_tails_animated/shark/datashark
	name = "DataShark"
	icon_state = "datashark"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/tails/mam_tails/dtiger
	name = "Dark Tiger"
	icon_state = "dtiger"
	color_src = MUTCOLORS
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/tails_animated/mam_tails_animated/dtiger
	name = "Dark Tiger"
	icon_state = "dtiger"
	color_src = MUTCOLORS
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/tails/mam_tails/deathclaw
	name = "Deathclaw"
	icon_state = "deathclaw"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails/deathclaw
	name = "Deathclaw"
	icon_state = "deathclaw"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/deer
	name = "Deer"
	icon_state = "deer"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails/deer
	name = "Deer"
	icon_state = "deer"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/spade
	name = "Demon Spade"
	icon_state = "spade"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/spade
	name = "Demon Spade"
	icon_state = "spade"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/double
	name = "Double Fox"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	icon_state = "doublefox"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails_animated/mam_tails_animated/doublefox
	name = "Double Fox"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	icon_state = "doublefox"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/mam_tails/easterndragon
	name = "Eastern Dragon"
	icon_state = "easternd"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/easterndragon
	name = "Eastern Dragon"
	icon_state = "easternd"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/feathertail
	name = "Feather"
	icon_state = "feathertail"
	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/mam_tails/fennec
	name = "Fennec"
	icon_state = "fennec"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/fennec
	name = "Fennec"
	icon_state = "fennec"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/fennecalt
	name = "Fennec (Alt)"
	icon_state = "eevee"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/fennecalt
	name = "Fennec (Alt)"
	icon_state = "eevee"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/fennecalt2
	name = "Fennec (Alt 2)"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	icon_state = "umbreon"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/fennecalt2
	name = "Fennec (Alt 2)"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	icon_state = "umbreon"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/fennecalt3
	name = "Fennec (Alt 3)"
	icon_state = "vap"

/datum/sprite_accessory/tails/mam_tails/fennecalt4
	name = "Fennec (Alt 4)"
	icon_state = "glaceon"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/fennecbush
	name = "Fennec (Bushy)"
	icon_state = "flareon"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/fennecdown
	name = "Fennec (Downward)"
	icon_state = "downwardfennec"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/fennecrag
	name = "Fennec (Ragged)"
	icon_state = "leaf"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/ferret
	name = "Ferret"
	icon_state = "furret"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/human/fish
	name = "Fish"
	icon_state = "fish"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/human/fish
	name = "Fish"
	icon_state = "fish"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/fluffy
	name = "Fluffy"
	icon_state = "fluffy"
	color_src = MUTCOLORS

/datum/sprite_accessory/tails/mam_tails/fox
	name = "Fox"
	icon_state = "fox"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/fox
	name = "Fox"
	icon_state = "fox"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/gecko
	name = "Gecko"
	icon_state = "gecko"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/geckobig
	name = "Gecko Big"
	icon_state = "fatgecko"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails_animated/mam_tails_animated/geckobig
	name = "Gecko Big"
	icon_state = "fatgecko"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/mam_tails/hawk
	name = "Hawk"
	icon_state = "hawk"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/hawk
	name = "Hawk"
	icon_state = "hawk"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/shorthawk
	name = "Hawk - Short"
	icon_state = "shorthawk"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/shorthawk
	name = "Hawk - Short"
	icon_state = "shorthawk"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/horse
	name = "Horse"
	icon_state = "horse"
	color_src = HAIR

/datum/sprite_accessory/tails_animated/mam_tails_animated/horse
	name = "Horse"
	icon_state = "horse"
	color_src = HAIR

/datum/sprite_accessory/tails/mam_tails/husky
	name = "Husky"
	icon_state = "husky"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/husky
	name = "Husky"
	icon_state = "husky"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/insect
	name = "Insect"
	icon_state = "insect"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/insect
	name = "Insect"
	icon_state = "insect"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/bug2tone
	name = "Insect - 2-tone"
	icon_state = "bug2tone"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/tails_animated/mam_tails_animated/bug2tone
	name = "Insect - 2-tone"
	icon_state = "bug2tone"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/tails/mam_tails/jackal
	name = "Jackal"
	icon_state = "jackal"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/jackal
	name = "Jackal"
	icon_state = "jackal"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/kangaroo
	name = "Kangaroo"
	icon_state = "kangaroo"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/kangaroo
	name = "Kangaroo"
	icon_state = "kangaroo"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/kangaroo/alt
	name = "Kangaroo (Large)"
	icon_state = "kangaroo"
	dimension_x = 64
	icon = 'modular_citadel/icons/mob/mam_tails_big.dmi'
	center = TRUE
	color_src = MUTCOLORS

/datum/sprite_accessory/tails_animated/mam_tails_animated/kangaroo/alt
	name = "Kangaroo (Large)"
	icon_state = "kangaroo"
	dimension_x = 64
	icon = 'modular_citadel/icons/mob/mam_tails_big.dmi'
	center = TRUE
	color_src = MUTCOLORS

/datum/sprite_accessory/tails/mam_tails/kitsune
	name = "Kitsune"
	icon_state = "kitsune"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/kitsune
	name = "Kitsune"
	icon_state = "kitsune"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/lab
	name = "Lab"
	icon_state = "lab"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/lab
	name = "Lab"
	icon_state = "lab"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/leopard
	name = "Leopard"
	icon_state = "leopard"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/leopard
	name = "Leopard"
	icon_state = "leopard"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/ltiger
	name = "Light Tiger"
	icon_state = "ltiger"
	color_src = MUTCOLORS
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/tails_animated/mam_tails_animated/ltiger
	name = "Light Tiger"
	icon_state = "ltiger"
	color_src = MUTCOLORS
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/tails/mam_tails/lizardalt
	name = "Lizard"
	icon_state = "charmander"

/datum/sprite_accessory/tails/mam_tails/roiz
	name = "Lizard (Large)"
	icon_state = "roiz"
	color_src = MUTCOLORS
	dimension_x = 64
	icon = 'modular_citadel/icons/mob/mam_tails_big.dmi'
	center = TRUE

/datum/sprite_accessory/tails/mam_tails/longfluff
	name = "Long Fluff"
	icon_state = "longfluff"
	matrixed_sections = MATRIX_RED_GREEN
	dimension_x = 64
	icon = 'modular_citadel/icons/mob/mam_tails_big.dmi'
	center = TRUE

/datum/sprite_accessory/tails/mam_tails/lunasune
	name = "Lunasune"
	icon_state = "lunasune"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/lunasune
	name = "Lunasune"
	icon_state = "lunasune"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/murid
	name = "Murid"
	icon_state = "murid"
	matrixed_sections = MATRIX_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/murid
	name = "Murid"
	icon_state = "murid"
	matrixed_sections = MATRIX_GREEN

/datum/sprite_accessory/tails/mam_tails/mutant
	name = "Mutant"
	icon_state = "xeno"
	color_src = MUTCOLORS

/datum/sprite_accessory/tails/mam_tails/nightstalker
	name = "Nightstalker"
	icon_state = "nightstalker"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/nightstalker
	name = "Nightstalker"
	icon_state = "nightstalker"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/longstalker
	name = "Nightstalker (Large)"
	icon_state = "longstalker"
	matrixed_sections = MATRIX_RED_GREEN
	dimension_x = 64
	icon = 'modular_citadel/icons/mob/mam_tails_big.dmi'
	center = TRUE

/datum/sprite_accessory/tails/mam_tails/tent
	name = "Octopus"
	icon_state = "tent"
	color_src = MUTCOLORS

/datum/sprite_accessory/tails/mam_tails/orca
	name = "Orca"
	icon_state = "orca"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/orca
	name = "Orca"
	icon_state = "orca"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/otie
	name = "Otusian"
	icon_state = "otie"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/otie
	name = "Otusian"
	icon_state = "otie"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/malepeacock
	name = "Peacock Male"
	icon_state = "peacockmale"
	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/mam_tails/femalepeacock
	name = "Peacock Female"
	icon_state = "peacockfemale"
	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/mam_tails/pig
	name = "Pig"
	icon_state = "pig"
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/longpigeon
	name = "Pigeon - Long"
	icon_state = "longpigeon"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/longpigeon
	name = "Pigeon - Long"
	icon_state = "longpigeon"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/shortpigeon
	name = "Pigeon - Short"
	icon_state = "shortpigeon"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/shortpigeon
	name = "Pigeon - Short"
	icon_state = "shortpigeon"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/pony
	name = "Pony"
	icon_state = "pony"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/ponytail1
	name = "Pony (Alt 1)"
	icon_state = "pony1"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/ponytail2
	name = "Pony (Alt 2)"
	icon_state = "pony2"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/ponytail3
	name = "Pony (Alt 3)"
	icon_state = "pony3"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/poss
	name = "Possum"
	icon_state = "posstail"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/porkupine
	name = "Porkapine"
	icon_state = "porkupine"
	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/mam_tails/rabbit
	name = "Rabbit"
	icon_state = "rabbit"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/rabbit
	name = "Rabbit"
	icon_state = "rabbit"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/raccoon
	name = "Raccoon"
	icon_state = "raccoonalt"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/raptor
	name = "Raptor"
	icon_state = "raptor"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/tails/mam_tails/ailurus
	name = "Red Panda"
	icon_state = "wah"
	extra = TRUE
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/ailurus
	name = "Red Panda"
	icon_state = "wah"
	extra = TRUE
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/sabresune
	name = "Sabresune"
	icon_state = "sabresune"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/sabresune
	name = "Sabresune"
	icon_state = "sabresune"
	icon = 'modular_citadel/icons/mob/mam_tails.dmi'
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/sergal
	name = "Sergal"
	icon_state = "sergal"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/sergal
	name = "Sergal"
	icon_state = "sergal"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/shark
	name = "Shark"
	icon_state = "shark"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/shark
	name = "Shark"
	icon_state = "shark"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/shepherd
	name = "Shepherd"
	icon_state = "shepherd"
	matrixed_sections = MATRIX_GREEN_BLUE

/datum/sprite_accessory/tails_animated/mam_tails_animated/shepherd
	name = "Shepherd"
	icon_state = "shepherd"
	matrixed_sections = MATRIX_GREEN_BLUE

/datum/sprite_accessory/tails/mam_tails/snep
	name = "Snep"
	icon_state = "snep"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails/snep
	name = "Snep"
	icon_state = "snep"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/snaketail
	name = "Snake"
	icon_state = "snaketail"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/skunk
	name = "Skunk"
	icon_state = "skunk"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails_animated/mam_tails_animated/skunk
	name = "Skunk"
	icon_state = "skunk"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/mam_tails/skunkalt
	name = "Skunk Alt"
	icon_state = "skunkalt"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/smooth
	name = "Smooth"
	icon_state = "smooth"
	color_src = MUTCOLORS
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/tails_animated/mam_tails_animated/smooth
	name = "Smooth"
	icon_state = "smooth"
	color_src = MUTCOLORS
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/tails/mam_tails/snakelarge
	name = "Snake (Large)"
	icon_state = "snakelarge"
	color_src = MATRIXED
	dimension_x = 64
	icon = 'modular_citadel/icons/mob/mam_tails_big.dmi'
	center = TRUE
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails/snakelarge
	name = "Snake (Large)"
	icon_state = "snakelarge"
	color_src = MATRIXED
	dimension_x = 64
	icon = 'modular_citadel/icons/mob/mam_tails_big.dmi'
	center = TRUE
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/spiketail
	name = "Spike"
	icon_state = "spiketail"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/spikes
	name = "Spikes"
	icon_state = "spikes"
	color_src = MUTCOLORS
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/tails/mam_tails/spikes
	name = "Spikes"
	icon_state = "spikes"
	color_src = MUTCOLORS
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/tails/mam_tails/spade
	name = "Spade"
	icon_state = "spade"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/spade
	name = "Spade"
	icon_state = "spade"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/straighttail
	name = "Straight Tail"
	icon_state = "straighttail"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/straighttail
	name = "Straight Tail"
	icon_state = "straighttail"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/squirrel
	name = "Squirrel"
	icon_state = "squirrel"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/squirrel
	name = "Squirrel"
	icon_state = "squirrel"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/succubus
	name = "Succubus"
	icon_state = "succubus"
	color_src = MUTCOLORS

/datum/sprite_accessory/tails/mam_tails/swallow
	name = "Swallow"
	icon_state = "swallow"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/swallow
	name = "Swallow"
	icon_state = "swallow"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/swallowstripped
	name = "Swallow - Striped"
	icon_state = "swallowstriped"
	matrixed_sections = MATRIX_GREEN_BLUE

/datum/sprite_accessory/tails_animated/mam_tails_animated/swallowstripped
	name = "Swallow - Striped"
	icon_state = "swallowstriped"
	matrixed_sections = MATRIX_GREEN_BLUE

/datum/sprite_accessory/tails/mam_tails/tailmaw
	name = "Tail Maw"
	icon_state = "tailmaw"
	color_src = MUTCOLORS

/datum/sprite_accessory/tails_animated/mam_tails/tailmaw
	name = "Tail Maw"
	icon_state = "tailmaw"
	color_src = MUTCOLORS

/datum/sprite_accessory/tails/mam_tails/tamamo_kitsune
	name = "Tamamo Kitsune Tails"
	icon_state = "9sune"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/tamamo_kitsune
	name = "Tamamo Kitsune Tails"
	icon_state = "9sune"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/triple_kitsune
	name = "Triple Kitsune Tails"
	icon_state = "3sune"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/triple_kitsune
	name = "Triple Kitsune Tails"
	icon_state = "3sune"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/takahiro_kitsune
	name = "Takahiro Kitsune Tails" //takahiro had five tails i just wanted to follow the 'T' naming convention vs. tamamo and triple
	icon_state = "7sune"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/takahiro_kitsune
	name = "Takahiro Kitsune Tails"
	icon_state = "7sune"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/tentacle
	name = "Tentacle"
	icon_state = "tentacle"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/tentacle
	name = "Tentacle"
	icon_state = "tentacle"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/tiger
	name = "Tiger"
	icon_state = "tiger"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails_animated/mam_tails_animated/tiger
	name = "Tiger"
	icon_state = "tiger"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/mam_tails/turkey
	name = "Turkey"
	icon_state = "turkey"
	color_src = MUTCOLORS

/datum/sprite_accessory/tails/mam_tails/viper
	name = "Viper"
	icon_state = "seviper"
	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/tails/mam_tails/westerndragon
	name = "Western Dragon (Large)"
	icon_state = "westerndragon"
	dimension_x = 64
	icon = 'modular_citadel/icons/mob/mam_tails_big.dmi'
	center = TRUE
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails_animated/mam_tails_animated/westerndragon
	name = "Western Dragon (Large)"
	icon_state = "westerndragon"
	dimension_x = 64
	icon = 'modular_citadel/icons/mob/mam_tails_big.dmi'
	center = TRUE
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/tails/mam_tails/wolf
	name = "Wolf"
	icon_state = "wolf"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails_animated/mam_tails_animated/wolf
	name = "Wolf"
	icon_state = "wolf"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/tails/mam_tails/zorgia
	name = "Zorgoia"
	icon_state = "zorgoia"
	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL
