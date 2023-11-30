/obj/structure/closet/crate/footlocker
	desc = "Low metal locker for personal effects."
	name = "footlocker"
	icon_state = "footlocker"

/obj/structure/closet/crate/footlocker/add_debris_element()
	AddElement(/datum/element/debris, DEBRIS_SPARKS, -15, 8, 1)

/obj/structure/closet/crate/footchest
	desc = "A wooden chest with iron bands."
	name = "personal chest"
	icon_state = "footchest"

/obj/structure/closet/crate/footchest/add_debris_element()
	AddElement(/datum/element/debris, DEBRIS_WOOD, -10, 5)
