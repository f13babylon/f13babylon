/datum/sprite_accessory/ears
	icon = 'icons/mob/mutant_bodyparts.dmi'
	mutant_part_string = "ears"
	relevant_layers = list(BODY_BEHIND_LAYER, BODY_ADJ_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/ears/is_not_visible(mob/living/carbon/human/H, tauric)
	var/obj/item/bodypart/head/HD = H.get_bodypart(BODY_ZONE_HEAD)
	return (!H.dna.features["ears"] || H.dna.features["ears"] == "None" || H.head && (H.head.flags_inv & HIDEEARS) || (H.wear_mask && (H.wear_mask.flags_inv & HIDEEARS)) || !HD || (HD.status == BODYPART_ROBOTIC && !HD.render_like_organic))

/datum/sprite_accessory/ears/none
	name = "None"
	icon_state = "none"
	relevant_layers = null

/******************************************
*************** Human Ears ****************
*******************************************/

/datum/sprite_accessory/ears/human/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/bat
	name = "Bat"
	icon_state = "bat"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/bear
	name = "Bear"
	icon_state = "bear"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/bigwolf
	name = "Big Wolf"
	icon_state = "bigwolf"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/human/bigwolfinner
	name = "Big Wolf (ALT)"
	icon_state = "bigwolfinner"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	extra = TRUE
	extra_color_src = NONE
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/bigwolfdark //alphabetical sort ignored here for ease-of-use
	name = "Dark Big Wolf"
	icon_state = "bigwolfdark"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/human/bigwolfinnerdark
	name = "Dark Big Wolf (ALT)"
	icon_state = "bigwolfinnerdark"
	extra = TRUE
	extra_color_src = NONE
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/bunny
	name = "Bunny"
	icon_state = "bunny"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/bunnyalt
	name = "Bunny (ALT)"
	icon_state = "bunnyalt"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/buny2
	name = "Bunny Long"
	icon_state = "bunny2"
	color_src = MUTCOLORS

/datum/sprite_accessory/ears/mam_ears/longbunnyalt
	name = "Bunny Long (Alt)"
	icon_state = "bunny"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/bnnuy
	name = "Bunny Tall"
	icon = 'icons/mob/mutant_bodyparts_large.dmi'
	icon_state = "bnnuy"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/bunnytall
	name = "Bunny (Tall Alt)"
	icon = 'icons/mob/mutant_bodyparts_large.dmi'
	icon_state = "bunnytall"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/bnnuy2
	name = "Bunny (Tall Alt 2)"
	icon = 'icons/mob/mutant_bodyparts_large.dmi'
	icon_state = "bnnuy2"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/bunnyfloppy
	name = "Bunny Floppy"
	icon_state = "bunnyfloppy"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/ears/human/cat
	name = "Cat"
	icon_state = "cat"
	icon = 'icons/mob/mutant_bodyparts.dmi'
	color_src = HAIR
	extra = TRUE
	extra_color_src = NONE

/datum/sprite_accessory/ears/human/catbig
	name = "Cat, Big"
	icon_state = "catbig"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/cobra
	name = "Cobra Hood"
	icon_state = "cobra"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = SKINTONE

/datum/sprite_accessory/ears/human/cow
	name = "Cow"
	icon_state = "cow"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/curled
	name = "Curled Horn"
	icon_state = "horn1"
	color_src = MUTCOLORS3

/datum/sprite_accessory/ears/human/deer
	name = "Deer"
	icon_state = "deer"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/dearalt
	name = "Deer Alt"
	icon_state = "deeralt"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/ears/human/dog
	name = "Dog"
	icon_state = "lab"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/eevee
	name = "Eevee"
	icon_state = "eevee"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/eeveealt
	name = "Eevee Alt"
	icon_state = "eeveealt"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/eeveetorn
	name = "Eeeve Torn"
	icon_state = "eeveetorn"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/elf
	name = "Elf"
	icon_state = "elf"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MUTCOLORS3

/datum/sprite_accessory/ears/human/elephant
	name = "Elephant"
	icon_state = "elephant"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/fennec
	name = "Fennec"
	icon_state = "fennec"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/human/fennec2
	name = "Fennec (ALT)"
	icon_state = "fennec2"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/human/fennec2bp
	name = "Fennec (Alt) - Both Piercings"
	icon_state = "fennec2bp"
	matrixed_sections = MATRIX_ALL
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/ears/human/fennec2lp
	name = "Fennec (Alt) - Left Piercing"
	icon_state = "fennec2lp"
	matrixed_sections = MATRIX_ALL
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/ears/human/fennec2rp
	name = "Fennec (Alt) - Right Piercing"
	icon_state = "fennec2rp"
	matrixed_sections = MATRIX_ALL
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/ears/human/fish
	name = "Fish"
	icon_state = "fish"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/fox
	name = "Fox"
	icon_state = "fox"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/gret
	name = "Gret Alt"
	icon_state = "gret"
	color_src = SKINTONE
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/ears/human/husky
	name = "Husky"
	icon_state = "wolf"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/human/jackalope
	name = "Jackalope (Tall)"
	icon = 'icons/mob/mutant_bodyparts_large.dmi'
	icon_state = "jackalope"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/human/jellyfish
	name = "Jellyfish"
	icon_state = "jellyfish"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = HAIR

/datum/sprite_accessory/ears/human/kangaroo
	name = "Kangaroo"
	icon_state = "kangaroo"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/miqote
	name = "Miqo'te"
	icon_state = "miqote"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/ears/human/murid
	name = "Murid"
	icon_state = "murid"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/otie
	name = "Otusian"
	icon_state = "otie"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/rabbit
	name = "Rabbit"
	icon_state = "rabbit"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/rabbitalt
	name = "Rabbit (ALT)"
	icon_state = "rabbitalt"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/ears/human/pede
	name = "Scolipede"
	icon_state = "pede"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/rosey
	name = "Rosey"
	icon_state = "rosey"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/ears/human/sandfox
	name = "Sandfox (Tall)"
	icon = 'icons/mob/mutant_bodyparts_large.dmi'
	icon_state = "sandfox"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/sergal
	name = "Sergal"
	icon_state = "sergal"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/shadekinround
	name = "Shadekin (Tall)"
	icon = 'icons/mob/mutant_bodyparts_large.dmi'
	icon_state = "shadekinround"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/shock
	name = "Shock"
	icon_state = "shock"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/ears/human/skunk
	name = "Skunk"
	icon_state = "skunk"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/spaniel
	name = "Spaniel"
	icon_state = "spaniel"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

/datum/sprite_accessory/ears/human/squirrel
	name = "Squirrel"
	icon_state = "squirrel"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/human/wolf
	name = "Wolf"
	icon_state = "wolf"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'

	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/human/zorgoia
	name = "Zorgoia"
	icon_state = "zorgoia"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/******************************************
*************** Furry Ears ****************
*******************************************/

/datum/sprite_accessory/ears/mam_ears
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = MATRIXED
	relevant_layers = list(BODY_BEHIND_LAYER, BODY_ADJ_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/ears/mam_ears/is_not_visible(mob/living/carbon/human/H, tauric)
	var/obj/item/bodypart/head/HD = H.get_bodypart(BODY_ZONE_HEAD)
	return (!H.dna.features["mam_ears"] || H.dna.features["mam_ears"] == "None" || H.head && (H.head.flags_inv & HIDEEARS) || (H.wear_mask && (H.wear_mask.flags_inv & HIDEEARS)) || !HD || (HD.status == BODYPART_ROBOTIC && !HD.render_like_organic))

/datum/sprite_accessory/ears/mam_ears/none
	name = "None"
	icon_state = "none"
	relevant_layers = null

/datum/sprite_accessory/ears/mam_ears/faceant
	name = "Antennae Face"
	icon_state = "faceant"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/faceant2
	name = "Antennae Face Alt"
	icon_state = "faceant2"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/moth
	name = "Antennae Moth"
	icon_state = "moth"
	matrixed_sections = MATRIX_GREEN

/datum/sprite_accessory/ears/mam_ears/plumeant
	name = "Antennae Plume"
	icon_state = "plumeant"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/roundant
	name = "Antennae Round"
	icon_state = "roundant"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/thinant
	name = "Antennae Thin"
	icon_state = "thinant"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/avali
	name = "Avali"
	icon_state = "avali"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/axolotl
	name = "Axolotl"
	icon_state = "axolotl"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/bat
	name = "Bat"
	icon_state = "bat"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/bear
	name = "Bear"
	icon_state = "bear"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/bigwolf
	name = "Big Wolf"
	icon_state = "bigwolf"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/bigwolfinner
	name = "Big Wolf (ALT)"
	icon_state = "bigwolfinner"
	extra = TRUE
	extra_color_src = NONE
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/bigwolfbp
	name = "Big Wolf (Both Piercings)"
	icon_state = "bigwolfbp"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/ears/mam_ears/bigwolflp
	name = "Big Wolf (Left Piercing)"
	icon_state = "bigwolflp"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/ears/mam_ears/bigwolfrp
	name = "Big Wolf (Right Piercing)"
	icon_state = "bigwolfrp"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/ears/mam_ears/bigwolfdark //alphabetical sort ignored here for ease-of-use
	name = "Big Wolf (Dark)"
	icon_state = "bigwolfdark"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/bigwolfinnerdark
	name = "Big Wolf (Dark Alt)"
	icon_state = "bigwolfinnerdark"
	extra = TRUE
	extra_color_src = NONE
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/bunny
	name = "Bunny"
	icon_state = "bunny"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/bunnyalt
	name = "Bunny (Alt)"
	icon_state = "bunnyalt"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/bunnyfloppy
	name = "Bunny (Floppy)"
	icon_state = "bunnyfloppy"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/bnnuy
	name = "Bunny (Tall)"
	icon = 'icons/mob/mutant_bodyparts_large.dmi'
	icon_state = "bnnuy"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/bnnuy2
	name = "Bunny (Tall Alt)"
	icon = 'icons/mob/mutant_bodyparts_large.dmi'
	icon_state = "bnnuy2"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/bunnytall
	name = "Bunny (Tall Alt 2)"
	icon = 'icons/mob/mutant_bodyparts_large.dmi'
	icon_state = "bunnytall"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/cat
	name = "Cat"
	icon_state = "cat"
	icon = 'icons/mob/mutant_bodyparts.dmi'
	color_src = HAIR
	extra = TRUE
	extra_color_src = NONE

/datum/sprite_accessory/ears/mam_ears/cat_normal
	name = "Cat (Alt)"
	icon_state = "catnormal"
	matrixed_sections = MATRIX_RED_GREEN


/datum/sprite_accessory/ears/mam_ears/catbig
	name = "Cat, (Big)"
	icon_state = "catbig"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/cobra
	name = "Cobra Hood"
	icon_state = "cobra"
	icon = 'modular_citadel/icons/mob/mam_ears.dmi'
	color_src = SKINTONE

/datum/sprite_accessory/ears/mam_ears/cow
	name = "Cow"
	icon_state = "cow"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/curled
	name = "Curled Horn"
	icon_state = "horn1"
	color_src = MUTCOLORS3

/datum/sprite_accessory/ears/mam_ears/deer
	name = "Deer"
	icon_state = "deer"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/dearalt
	name = "Deer Alt"
	icon_state = "deeralt"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/dog
	name = "Dog"
	icon_state = "lab"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/easterndragon
	name = "Eastern Dragon"
	icon_state = "easternd"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/eevee
	name = "Eevee"
	icon_state = "eevee"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/eeveealt
	name = "Eevee Alt"
	icon_state = "eeveealt"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/eeveetorn
	name = "Eeeve Torn"
	icon_state = "eeveetorn"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/elf
	name = "Elf"
	icon_state = "elf"
	color_src = MUTCOLORS3

/datum/sprite_accessory/ears/mam_ears/elephant
	name = "Elephant"
	icon_state = "elephant"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/fam
	name = "Fan"
	icon_state = "fan"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/fennec
	name = "Fennec"
	icon_state = "fennec"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/fennec2
	name = "Fennec (ALT)"
	icon_state = "fennec2"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/fish
	name = "Fish"
	icon_state = "fish"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/fox
	name = "Fox"
	icon_state = "fox"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/frills/full
	name = "Frill Full"
	icon_state = "fullfrill"
	color_src = MUTCOLORS

/datum/sprite_accessory/ears/mam_ears/frills/long
	name = "Frill Long"
	icon_state = "longfrill"
	color_src = MUTCOLORS

/datum/sprite_accessory/ears/mam_ears/frills/split
	name = "Frill Split"
	icon_state = "splitfrill"
	color_src = MUTCOLORS

/datum/sprite_accessory/ears/mam_ears/undergoat
	name = "Goat"
	icon_state = "goat"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/goathorns
	name = "Goat Horns"
	icon_state = "goathorns"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/ears/mam_ears/gret
	name = "Gret"
	icon_state = "gret"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/ears/mam_ears/husky
	name = "Husky"
	icon_state = "wolf"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/jackal
	name = "Jackal"
	icon_state = "jackal"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/jackalope
	name = "Jackalope (Tall)"
	icon = 'icons/mob/mutant_bodyparts_large.dmi'
	icon_state = "jackalope"
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/jellyfish
	name = "Jellyfish"
	icon_state = "jellyfish"
	color_src = HAIR

/datum/sprite_accessory/ears/mam_ears/kangaroo
	name = "Kangaroo"
	icon_state = "kangaroo"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/lunasune
	name = "Lunasune"
	icon_state = "lunasune"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/ears/mam_ears/miqote
	name = "Miqo'te"
	icon_state = "miqote"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/mousealt
	name = "Mouse"
	icon_state = "mouse"
	color_src = MUTCOLORS

/datum/sprite_accessory/ears/mam_ears/murid
	name = "Murid"
	icon_state = "murid"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/noodle
	name = "Noodle Dragon"
	icon_state = "noodledragon"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/otie
	name = "Otusian"
	icon_state = "otie"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/pig
	name = "Pig"
	icon_state = "pig"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/pointy
	name = "Pointy"
	icon_state = "pointy"
	color_src = MUTCOLORS

/datum/sprite_accessory/ears/mam_ears/rabbit
	name = "Rabbit"
	icon_state = "rabbit"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/rabbitalt
	name = "Rabbit (ALT)"
	icon_state = "rabbitalt"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/ears/mam_ears/rosey
	name = "Rosey"
	icon_state = "rosey"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/sabresune
	name = "Sabresune"
	icon_state = "sabresune"
	matrixed_sections = MATRIX_ALL
	extra = TRUE
	extra_color_src = MATRIX_ALL

/datum/sprite_accessory/ears/mam_ears/sandfox
	name = "Sandfox (Tall)"
	icon = 'icons/mob/mutant_bodyparts_large.dmi'
	icon_state = "sandfox"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/pede
	name = "Scolipede"
	icon_state = "pede"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/sergal
	name = "Sergal"
	icon_state = "sergal"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/shadekinround
	name = "Shadekin (Tall)"
	icon = 'icons/mob/mutant_bodyparts_large.dmi'
	icon_state = "shadekinround"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/shock
	name = "Shock"
	icon_state = "shock"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/skunk
	name = "Skunk"
	icon_state = "skunk"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/spaniel
	name = "Spaniel"
	icon_state = "spaniel"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/squirrel
	name = "Squirrel"
	icon_state = "squirrel"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/sylveon
	name = "Sylveon"
	icon = 'icons/mob/mutant_bodyparts_large.dmi'
	icon_state = "sylveon"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/ears/mam_ears/teppi
	name = "Teppi"
	icon = 'icons/mob/mutant_bodyparts_large.dmi'
	icon_state = "teppi"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/trike
	name = "Trike"
	icon_state = "trike"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED

/datum/sprite_accessory/ears/mam_ears/umbreon
	name = "Umbreon"
	icon = 'icons/mob/mutant_bodyparts_large.dmi'
	icon_state = "umbreon"
	matrixed_sections = MATRIX_RED_GREEN

/datum/sprite_accessory/ears/mam_ears/vap
	name = "Vaporeon"
	icon_state = "vap"
	matrixed_sections = MATRIX_ALL

/datum/sprite_accessory/ears/mam_ears/wolf
	name = "Wolf"
	icon_state = "wolf"
	matrixed_sections = MATRIX_RED_BLUE

/datum/sprite_accessory/ears/mam_ears/zorgoia
	name = "Zorgoia"
	icon_state = "zorgoia"
	color_src = MATRIXED
	matrixed_sections = MATRIX_RED
