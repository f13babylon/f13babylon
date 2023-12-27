/datum/sprite_accessory/snouts
	icon = 'icons/mob/mutant_bodyparts.dmi'
	mutant_part_string = "snout"
	relevant_layers = list(BODY_ADJ_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/snouts/is_not_visible(mob/living/carbon/human/H, tauric)
	var/obj/item/bodypart/head/HD = H.get_bodypart(BODY_ZONE_HEAD)
	return ((H.wear_mask && (H.wear_mask.flags_inv & HIDESNOUT)) || (H.head && (H.head.flags_inv & HIDESNOUT)) || !HD || (HD.status == BODYPART_ROBOTIC && !HD.render_like_organic))

/datum/sprite_accessory/snouts/round
	name = "Round"
	icon_state = "round"

/datum/sprite_accessory/snouts/sharp
	name = "Sharp"
	icon_state = "sharp"

/datum/sprite_accessory/snouts/sharplight
	name = "Sharp + Light"
	icon_state = "sharplight"

/datum/sprite_accessory/snouts/roundlight
	name = "Round + Light"
	icon_state = "roundlight"

/******************************************
************** Mammal Snouts **************
*******************************************/

/datum/sprite_accessory/snouts/mam_snouts
	color_src = MATRIXED
	icon = 'modular_citadel/icons/mob/mam_snouts.dmi'
	recommended_species = list("mammal", "slimeperson", "insect", "podweak", "lizard", "synthanthro")
	relevant_layers = list(BODY_ADJ_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/snouts/mam_snouts/is_not_visible(mob/living/carbon/human/H, tauric)
	var/obj/item/bodypart/head/HD = H.get_bodypart(BODY_ZONE_HEAD)
	return ((H.wear_mask && (H.wear_mask.flags_inv & HIDESNOUT)) || (H.head && (H.head.flags_inv & HIDESNOUT)) || !HD || (HD.status == BODYPART_ROBOTIC && !HD.render_like_organic))

/datum/sprite_accessory/snouts/mam_snouts/none
	name = "None"
	icon_state = "none"
	recommended_species = null
	relevant_layers = null

/datum/sprite_accessory/snouts/mam_snouts/anubis
	name = "Anubis"
	icon_state = "hanubus"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/bird
	name = "Beak"
	icon_state = "bird"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/bigbeak
	name = "Beak (Big)"
	icon_state = "bigbeak"
	matrixed_sections = MATRIX_BLUE

/datum/sprite_accessory/snouts/mam_snouts/fbigbeak
	name = "Beak (Big, Top)"
	icon_state = "fbigbeak"
	matrixed_sections = MATRIX_BLUE

/datum/sprite_accessory/snouts/mam_snouts/corvidbeak
	name = "Beak (Corvid)"
	icon_state = "corvidbeak"
	matrixed_sections = MATRIX_GREEN

/datum/sprite_accessory/snouts/mam_snouts/beaktiny
	name = "Beak (Tiny)"
	icon_state = "beaktiny"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/fbird
	name = "Beak (Top)"
	icon_state = "fbird"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/bug
	name = "Bug"
	icon_state = "bug"
	color_src = MUTCOLORS
	extra2 = TRUE
	extra2_color_src = MUTCOLORS3

/datum/sprite_accessory/snouts/mam_snouts/fbug
	name = "Bug (Top)"
	icon_state = "fbug"
	color_src = MUTCOLORS
	extra2 = TRUE
	extra2_color_src = MUTCOLORS3

/datum/sprite_accessory/snouts/mam_snouts/pede
	name = "Centipede"
	icon_state = "pede"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/fpede
	name = "Centipede (Top)"
	icon_state = "fpede"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/cow
	name = "Cow"
	icon_state = "cow"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/deer
	name = "Deer"
	icon_state = "deer"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/duck
	name = "Duck"
	icon_state = "duck"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/easterndw
	name = "Eastern Dragon"
	icon_state = "easterndw"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/feasterndw
	name = "Eastern Dragon (Female)"
	icon_state = "feasterndw"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/easterndnw
	name = "Eastern Dragon (No Whiskers)"
	icon_state = "easterndnw"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/feasterndnw
	name = "Eastern Dragon (No Whiskers, Female)"
	icon_state = "feasterndnw"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/elephant
	name = "Elephant"
	icon_state = "elephant"
	extra = TRUE
	extra_color_src = MUTCOLORS3
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/felephant
	name = "Elephant (Top)"
	icon_state = "felephant"
	extra = TRUE
	extra_color_src = MUTCOLORS3
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/fox
	name = "Fox"
	icon_state = "fox"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/foxalt
	name = "Fox (Alt)"
	icon_state = "foxalt"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/goose
	name = "Goose"
	icon_state = "goose"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/husky
	name = "Husky"
	icon_state = "husky"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/fhusky
	name = "Husky (Top)"
	icon_state = "fhusky"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/rhino
	name = "Horn"
	icon_state = "rhino"
	extra = TRUE
	extra_color_src = MUTCOLORS3
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/frhino
	name = "Horn (Top)"
	icon_state = "frhino"
	extra = TRUE
	extra_color_src = MUTCOLORS3
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/horse
	name = "Horse"
	icon_state = "hhorse"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/hyena
	name = "Hyena"
	icon_state = "hspots"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/jackal
	name = "Jackal"
	icon_state = "hjackal"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/leporid
	name = "Leporid"
	icon_state = "leporid"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/magus
	name = "Magus"
	icon_state = "magus"
	extra = TRUE
	extra_color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/lcanid
	name = "Mammal, Long"
	icon_state = "lcanid"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/lcanidalt
	name = "Mammal, Long (Alt)"
	icon_state = "lcanidalt"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/flcanid
	name = "Mammal, Long (Top)"
	icon_state = "flcanid"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/flcanidalt
	name = "Mammal, Long (Top Alt)"
	icon_state = "flcanidalt"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/scanid
	name = "Mammal, Short"
	icon_state = "scanid"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/scanidalt
	name = "Mammal, Short (Alt)"
	icon_state = "scanidalt"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/scanidalt2
	name = "Mammal, Short (Alt 2)"
	icon_state = "scanidalt2"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/fscanid
	name = "Mammal, Short (Top)"
	icon_state = "fscanid"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/fscanidalt
	name = "Mammal, Short (Top Alt)"
	icon_state = "fscanidalt"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/fscanidalt2
	name = "Mammal, Short (Top Alt 2)"
	icon_state = "fscanidalt2"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/wolf
	name = "Mammal, Thick"
	icon_state = "wolf"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/wolfalt
	name = "Mammal, Thick (Alt)"
	icon_state = "wolfalt"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/fwolf
	name = "Mammal, Thick (Top)"
	icon_state = "fwolf"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/fwolfalt
	name = "Mammal, Thick (Top Alt)"
	icon_state = "fwolfalt"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/bigmandible
	name = "Mandible (Big)"
	icon_state = "bigmandible"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/smallmandible
	name = "Mandible (Small)"
	icon_state = "smallmandible"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/orca
	name = "Orca"
	icon_state = "orca"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/otie
	name = "Otie"
	icon_state = "otie"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/fotie
	name = "Otie (Top)"
	icon_state = "fotie"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/otter
	name = "Otter"
	icon_state = "otter"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/owl
	name = "Owl"
	icon_state = "owl"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/panda
	name = "Panda"
	icon_state = "hpanda"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/proboscis
	name = "Proboscis"
	icon_state = "proboscis"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/rabbit
	name = "Rabbit"
	icon_state = "rabbit"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/chemlight
	name = "Rad-Dog"
	icon_state = "chemlight"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/fchemlight
	name = "Rad-Dog (Top)"
	icon_state = "fchemlight"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/rhinobeetle
	name = "Rhino Beetle"
	icon_state = "rhinobeetle"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/rodent
	name = "Rodent"
	icon_state = "rodent"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/frodent
	name = "Rodent (Top)"
	icon_state = "frodent"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/rodent_thick
	name = "Rodent (Thick)"
	icon_state = "rodentthick"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/round
	name = "Round"
	icon_state = "round"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/fround
	name = "Round (Top)"
	icon_state = "fround"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/roundlight
	name = "Round + Light"
	icon_state = "roundlight"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/froundlight
	name = "Round + Light (Top)"
	icon_state = "froundlight"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/sergal
	name = "Sergal"
	icon_state = "sergal"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/fsergal
	name = "Sergal (Top)"
	icon_state = "fsergal"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/shark
	name = "Shark"
	icon_state = "shark"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/hshark
	name = "Shark (Alt)"
	icon_state = "hshark"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/fshark
	name = "Shark (Top)"
	icon_state = "fshark"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/shortalt
	name = "Short"
	icon_state = "short"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/snub
	name = "Snub"
	icon_state = "snub"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/scarab
	name = "Scarab"
	icon_state = "scarab"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/sharp
	name = "Sharp"
	icon_state = "sharp"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/fsharpcolor
	name = "Sharp (Alt)"
	icon_state = "fsharpcolor"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/fsharp
	name = "Sharp (Top)"
	icon_state = "fsharp"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/sharplight
	name = "Sharp + Light"
	icon_state = "sharplight"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/fsharplight
	name = "Sharp + Light (Top)"
	icon_state = "fsharplight"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/skullbirdf
	name = "Skullbird (Female)"
	icon_state = "fskullbird"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/skullbirdm
	name = "Skullbird (Male)"
	icon_state = "skullbird"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/skulldog
	name = "Skulldog"
	icon_state = "skulldog"
	extra = TRUE
	extra_color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/sloog
	name = "Sloog"
	icon_state = "sloog"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/slooglips
	name = "Sloog (Alt)"
	icon_state = "slooglips"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/spider
	name = "Spider"
	icon_state = "spider"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/stubby
	name = "Stubby"
	icon_state = "stubby"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/tajaran
	name = "Tajaran"
	icon_state = "tajaran"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/tajaranshort
	name = "Tajaran (Short)"
	icon_state = "tajaranshort"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/tarantula
	name = "Tarantula"
	icon_state = "tarantula"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/snouts/mam_snouts/toucan
	name = "Toucan"
	icon_state = "toucan"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/snouts/mam_snouts/ftoucan
	name = "Toucan (Top)"
	icon_state = "ftoucan"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/snouts/mam_snouts/vulp
	name = "Vulp"
	icon_state = "vulp"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/snouts/mam_snouts/vulp2
	name = "Vulp (Alt)"
	icon_state = "vulp2"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/redpanda
	name = "WahCoon"
	icon_state = "wah"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/redpandaalt
	name = "WahCoon (Alt)"
	icon_state = "wahalt"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/fredpanda
	name = "WahCoon (Top)"
	icon_state = "fwah"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/snouts/mam_snouts/fredpanda/alt
	name = "WahCoon (Top Alt)"
	icon_state = "fwahalt"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/snouts/mam_snouts/zebra
	name = "Zebra"
	icon_state = "hzebra"
	matrixed_sections = MATRIX_RED_GREEN






































/datum/sprite_accessory/snouts/mam_snouts/roundclassic
	name = "Round (Classic)"
	icon_state = "roundclassic"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/roundlightclassic
	name = "Round + Light (Classic)"
	icon_state = "roundlightclassic"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/sharpclassic
	name = "Sharp (Classic)"
	icon_state = "sharpclassic"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/sharplightclassic
	name = "Sharp + Light (Classic)"
	icon_state = "sharplightclassic"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/froundclassic
	name = "Round (Top, Classic)"
	icon_state = "froundclassic"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/froundlightclassic
	name = "Round + Light (Top, Classic)"
	icon_state = "froundlightclassic"

/datum/sprite_accessory/snouts/mam_snouts/fsharpclassic
	name = "Sharp (Top, Classic)"
	icon_state = "fsharpclassic"
	color_src = MUTCOLORS

/datum/sprite_accessory/snouts/mam_snouts/fsharplightclassic
	name = "Sharp + Light (Top, Classic)"
	icon_state = "fsharplightclassic"
	color_src = MUTCOLORS
