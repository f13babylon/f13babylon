/obj/item/storage/survivalkit
	name = "survival kit"
	desc = "A robust leather pouch containing the essentials for wasteland survival."
	icon_state = "survivalkit"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/survivalkit/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 7
	STR.max_w_class = WEIGHT_CLASS_TINY
	STR.max_combined_w_class = WEIGHT_CLASS_TINY * 7

/obj/item/storage/survivalkit/PopulateContents()
	new /obj/item/reagent_containers/hypospray/medipen/stimpak(src)
	new /obj/item/stack/medical/gauze/improvised(src)
	new /obj/item/stack/medical/suture/emergency(src)
	new /obj/item/stack/medical/mesh/aloe(src)
	new /obj/item/reagent_containers/pill/radx(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/reagent_containers/food/drinks/flask/survival(src)

/obj/item/storage/survivalkit/khan
	name = "khan survival kit"
	desc = "A robust leather pouch containing essentials a Khan might need in the wasteland."
	icon = 'icons/fallout/clothing/khans.dmi'

/obj/item/storage/survivalkit/khan/PopulateContents()
	new /obj/item/reagent_containers/hypospray/medipen/stimpak(src)
	new /obj/item/reagent_containers/hypospray/medipen/medx(src)
	new /obj/item/stack/medical/gauze/improvised(src)
	new /obj/item/stack/medical/suture/emergency(src)
	new /obj/item/stack/medical/mesh/aloe(src)
	new /obj/item/reagent_containers/pill/radx(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/reagent_containers/food/drinks/flask/survival(src)

/obj/item/storage/survivalkit/primitive		//Used by Legion and Tribals
	name = "primitive survival kit"
	desc = "A robust leather pouch containing the bare essentials for wasteland survival."

/obj/item/storage/survivalkit/primitive/PopulateContents()
	new /obj/item/reagent_containers/pill/patch/healingpowder(src)
	new /obj/item/stack/medical/gauze/improvised(src)
	new /obj/item/stack/medical/suture/emergency(src)
	new /obj/item/stack/medical/mesh/aloe(src)
	new /obj/item/flashlight/flare/torch(src)
	new /obj/item/reagent_containers/food/drinks/flask/survival(src)

/obj/item/storage/survivalkit/primitive/plus
	name = "improved primitive survival kit"

/obj/item/storage/survivalkit/primitive/plus/PopulateContents()
	new /obj/item/reagent_containers/pill/patch/healingpowder(src)
	new /obj/item/reagent_containers/pill/patch/healingpoultice(src)
	new /obj/item/stack/medical/gauze(src)
	new /obj/item/stack/medical/suture/emergency(src)
	new /obj/item/stack/medical/mesh/aloe(src)
	new /obj/item/flashlight/flare/torch(src)
	new /obj/item/reagent_containers/food/drinks/flask/survival(src)

/obj/item/storage/survivalkit/advanced
	name = "advanced survival kit"
	desc = "A robust leather pouch containing everything one might need for wasteland survival."

/obj/item/storage/survivalkit/advanced/PopulateContents()
	new /obj/item/reagent_containers/hypospray/medipen/stimpak(src)
	new /obj/item/stack/medical/gauze(src)
	new /obj/item/stack/medical/suture(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/reagent_containers/pill/radx(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/reagent_containers/food/drinks/flask(src)

/obj/item/storage/survivalkit/firstaid
	name = "first aid pouch"
	desc = "A robust leather pouch containing the essentials for trauma care."
	icon_state = "ifak"

/obj/item/storage/survivalkit/firstaid/PopulateContents()
	new /obj/item/reagent_containers/hypospray/medipen/stimpak(src)
	new /obj/item/reagent_containers/hypospray/medipen/stimpak(src)
	new /obj/item/stack/medical/gauze(src)
	new /obj/item/stack/medical/suture(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/reagent_containers/pill/radx(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/reagent_containers/food/drinks/flask/survival(src)

/obj/item/storage/survivalkit/firstaid/advanced
	name = "advanced first aid pouch"
	desc = "A robust leather pouch containing everything one might need for trauma care."

/obj/item/storage/survivalkit/firstaid/advanced/PopulateContents()
	new /obj/item/reagent_containers/hypospray/medipen/stimpak(src)
	new /obj/item/reagent_containers/hypospray/medipen/stimpak/super(src)
	new /obj/item/stack/medical/gauze/adv(src)
	new /obj/item/stack/medical/suture/medicated(src)
	new /obj/item/stack/medical/mesh/advanced(src)
	new /obj/item/reagent_containers/pill/radx(src)
	new /obj/item/reagent_containers/blood/radaway(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/reagent_containers/food/drinks/flask(src)

/obj/item/storage/survivalkit/empty
	name = "leather pouch"
	desc = "A robust leather pouch."

/obj/item/storage/survivalkit/empty/PopulateContents()
	return
