/obj/item/storage/pouch
	name = "SPECIALIZED POUCH TEMPLATE"
	desc = "You're not supposed to see this."
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_POCKET

/obj/item/storage/pouch/ammo
	name = "ammo pouch"
	desc = "A robust leather pouch that allows for more ammo storage."
	icon_state = "pouch_ammo"
	component_type = /datum/component/storage/concrete/pouch/ammo

/obj/item/storage/pouch/ammo/big
	name = "large ammo pouch"
	desc = "A spacious leather pouch with room for a couple large magazines."
	icon_state = "pouch_ammo_big"
	component_type = /datum/component/storage/concrete/pouch/ammo/big

/obj/item/storage/pouch/ammo/shotgun
	name = "shotgun ammo pouch"
	desc = "A robust leather pouch for storing shotgun shells."
	icon_state = "pouch_shotgun"
	component_type = /datum/component/storage/concrete/pouch/ammo/shotgun

/obj/item/storage/pouch/grenade
	name = "grenadier pouch"
	desc = "A robust leather pouch with room for a small amount of grenades and other explosives."
	icon_state = "pouch_grenade"
	component_type = /datum/component/storage/concrete/pouch/grenade

/obj/item/storage/pouch/utility
	name = "tool pouch"
	desc = "A pouch designed for storing basic tools."
	icon_state = "pouch_utility"
	component_type = /datum/component/storage/concrete/pouch/tool
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/pouch/medical
	name = "medical pouch"
	desc = "A pouch designed for storing basic medical items."
	icon_state = "pouch_medical"
	component_type = /datum/component/storage/concrete/pouch/medical
	w_class = WEIGHT_CLASS_SMALL

/obj/item/storage/pouch/medical/full/PopulateContents()
	new /obj/item/reagent_containers/hypospray/medipen/stimpak(src)
	new /obj/item/reagent_containers/hypospray/medipen/stimpak(src)
	new /obj/item/stack/medical/gauze(src)
	new /obj/item/stack/medical/suture(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/reagent_containers/pill/radx(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/reagent_containers/food/drinks/flask/survival(src)

/obj/item/storage/pouch/medical/advanced
	name = "advanced medical pouch"
	desc = "A medical pouch, meant for storing advanced trauma care equipment."
	icon_state = "pouch_medical_advanced"
	component_type = /datum/component/storage/concrete/pouch/medical/advanced

/obj/item/storage/pouch/medical/advanced/full/PopulateContents()
	new /obj/item/reagent_containers/hypospray/medipen/stimpak(src)
	new /obj/item/reagent_containers/hypospray/medipen/stimpak/super(src)
	new /obj/item/stack/medical/gauze/adv(src)
	new /obj/item/stack/medical/suture/medicated(src)
	new /obj/item/stack/medical/mesh/advanced(src)
	new /obj/item/reagent_containers/pill/radx(src)
	new /obj/item/reagent_containers/blood/radaway(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/reagent_containers/food/drinks/flask(src)
