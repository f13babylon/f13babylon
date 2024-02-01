/obj/item/musictape
	name = "music tape"
	desc = "A magnetic tape that can hold a variety of songs."
	icon_state = "tape_white"
	icon = 'icons/obj/device.dmi'
	item_state = "analyzer"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	custom_materials = list(/datum/material/iron=20, /datum/material/glass=5)
	force = 1
	throwforce = 0
	var/music_category = null

/*
/obj/item/musictape/basetwo
	name = "base music tape"
	desc = "A magnetic tape that holds a variety of songs. This tape includes:<span class='notice'>\n\
	California Dreamin'\n\
	Paint It, Black\n\
	The End of the World\n\
	The Wanderer\n\
	White Rabbit</span>"
	icon_state = "tape_red"
	music_category = "Base2"
*/
