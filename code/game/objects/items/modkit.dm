/obj/item/modkit
	name = "modkit"
	desc = "A small container of parts made to modify a specific item. Use the target item on this kit to convert it."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "modkit"
	w_class = WEIGHT_CLASS_NORMAL
	var/list/target_items = list()
	var/result_item = null

/obj/item/modkit/pre_attack(obj/item/I, mob/user)
	if(is_type_in_list(I, target_items))
		var/obj/item/R = new result_item(get_turf(user))
		to_chat(user, "<span class='notice'>You apply the [src] to [I], using the custom parts to turn it into [R].</span>")
		remove_item_from_storage(I)
		qdel(I)
		user.put_in_hands(R)
		qdel(src)
		return TRUE
	else
		return ..()

/obj/item/modkit/riotgear
	name = "desert ranger riot gear modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/ncr/vetranger)
	result_item = /obj/item/clothing/suit/armor/f13/ncr/vetranger/desert

/obj/item/modkit/trenchcoatfollowers
	name = "followers trenchcoat modkit"
	target_items = list(/obj/item/clothing/suit/armor/vest)
	result_item = /obj/item/clothing/suit/armor/vest/trench

/obj/item/modkit/patrolduster
	name = "patrol duster modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/raider)
	result_item = /obj/item/clothing/suit/armor/f13/raider/combatduster/patrolduster

//YEEHAWGUVNAH/Trinity Kemble
/obj/item/modkit/kemblevest
	name = "light riot armour modkit"
	target_items = list(/obj/item/clothing/suit/armor/f13/ncr/trailranger)
	result_item = /obj/item/clothing/suit/armor/f13/ncr/trailranger/kemble

/obj/item/modkit/kemblehat
	name = "ranger slouch hat modkit"
	target_items = list(/obj/item/clothing/head/helmet/f13/ncr/trailranger)
	result_item = /obj/item/clothing/head/helmet/f13/ncr/trailranger/kemble
