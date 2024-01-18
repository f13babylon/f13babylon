
// see code/module/crafting/table.dm

////////////////////////////////////////////////PIES////////////////////////////////////////////////



/datum/crafting_recipe/food/meatpie
	name = "Meat pie"
	reqs = list(
		/datum/reagent/consumable/blackpepper = 1,
		/datum/reagent/consumable/sodiumchloride = 1,
		/obj/item/reagent_containers/food/snacks/pie/plain = 1,
		/obj/item/reagent_containers/food/snacks/meat/steak/plain = 1
	)
	result = /obj/item/reagent_containers/food/snacks/pie/meatpie
	subcategory = CAT_PIE

/datum/crafting_recipe/food/burek
	name = "Burek"
	reqs = list(
		/datum/reagent/consumable/blackpepper = 3,
		/datum/reagent/consumable/sodiumchloride = 3,
		/obj/item/reagent_containers/food/snacks/pizzabread = 2,
		/obj/item/reagent_containers/food/snacks/meat/cutlet/plain = 6,
		/obj/item/reagent_containers/food/snacks/butter = 1,
	)
	result = /obj/item/reagent_containers/food/snacks/pie/burek
	subcategory = CAT_PIE

/* requires code
/datum/crafting_recipe/food/brahminpotpie
	name = "Brahmin potpie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/rawbrahmintongue = 2,
		/obj/item/reagent_containers/food/snacks/grown/xander = 1,
		/obj/item/reagent_containers/food/snacks/pie/plain = 1,
		/obj/item/reagent_containers/food/snacks/cheesewedge = 1
	)
	result = /obj/item/reagent_containers/food/snacks/pie/brahminpotpie
	subcategory = CAT_PIE
*/

////////////////////////////////////////////SWEETS////////////////////////////////////////////


/datum/crafting_recipe/food/goldenappletart
	name = "Golden apple tart"
	reqs = list(
		/datum/reagent/consumable/milk = 5,
		/datum/reagent/consumable/sugar = 5,
		/obj/item/reagent_containers/food/snacks/pie/plain = 1,
		/obj/item/reagent_containers/food/snacks/grown/apple/gold = 1
	)
	result = /obj/item/reagent_containers/food/snacks/pie/appletart
	subcategory = CAT_PIE

/datum/crafting_recipe/food/bearypie
	name = "Beary Pie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/pie/plain = 1,
		/obj/item/reagent_containers/food/snacks/grown/berries = 1,
		/obj/item/reagent_containers/food/snacks/meat/steak/bear = 1
	)
	result = /obj/item/reagent_containers/food/snacks/pie/bearypie
	subcategory = CAT_PIE

/datum/crafting_recipe/food/amanitapie
	name = "Amanita pie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/pie/plain = 1,
		/obj/item/reagent_containers/food/snacks/grown/mushroom/amanita = 1
	)
	result = /obj/item/reagent_containers/food/snacks/pie/amanita_pie
	subcategory = CAT_PIE

/datum/crafting_recipe/food/cocolavatart
	name = "Chocolate Lava tart"
	always_available = FALSE
	reqs = list(
			/datum/reagent/consumable/milk = 5,
			/datum/reagent/consumable/sugar = 5,
			/obj/item/reagent_containers/food/snacks/pie/plain = 1,
			/obj/item/reagent_containers/food/snacks/chocolatebar = 3,
			/obj/item/slime_extract = 1
			)
	result = /obj/item/reagent_containers/food/snacks/pie/cocolavatart
	subcategory = CAT_PIE


// see code/datums/recipe.dm


// see code/module/crafting/table.dm

////////////////////////////////////////////////SANDWICHES////////////////////////////////////////////////

/datum/crafting_recipe/food/sandwich
	name = "Sandwich"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/breadslice/plain = 2,
		/obj/item/reagent_containers/food/snacks/meat/steak = 1,
		/obj/item/reagent_containers/food/snacks/cheesewedge = 1
	)
	result = /obj/item/reagent_containers/food/snacks/sandwich
	subcategory = CAT_PIE

/datum/crafting_recipe/food/grilledcheesesandwich
	name = "Grilled cheese sandwich"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/breadslice = 2,
		/obj/item/reagent_containers/food/snacks/cheesewedge = 2
	)
	result = /obj/item/reagent_containers/food/snacks/grilledcheese
	subcategory = CAT_PIE

/datum/crafting_recipe/food/baconlettucetomato
	name = "BLT sandwich"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/meat/bacon = 2,
		/obj/item/reagent_containers/food/snacks/grown/cabbage = 1,
		/obj/item/reagent_containers/food/snacks/grown/tomato = 1,
		/datum/reagent/consumable/mayonnaise = 5
	)
	result = /obj/item/reagent_containers/food/snacks/baconlettucetomato
	subcategory = CAT_PIE


/datum/crafting_recipe/food/pbj_sandwich
	name = "PB&J sandwich"
	reqs = list(
		/datum/reagent/consumable/cherryjelly = 5,
		/datum/reagent/consumable/peanut_butter = 5,
		/obj/item/reagent_containers/food/snacks/breadslice/plain = 2,
	)
	result = /obj/item/reagent_containers/food/snacks/jellysandwich/pbj/cherry
	subcategory = CAT_PIE

/datum/crafting_recipe/food/pbj_sandwich/alt
	reqs = list(
		/obj/item/reagent_containers/food/snacks/jelliedtoast/cherry = 1,
		/obj/item/reagent_containers/food/snacks/peanut_buttertoast = 1,
	)

/datum/crafting_recipe/peanutbutter_sandwich
	name = "Peanut butter sandwich"
	reqs = list(
		/datum/reagent/consumable/peanut_butter = 5,
		/obj/item/reagent_containers/food/snacks/breadslice/plain = 2,
	)
	result = /obj/item/reagent_containers/food/snacks/peanutbutter_sandwich
	subcategory = CAT_PIE

/datum/crafting_recipe/food/tunasandwich
	name = "Tuna sandwich"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/breadslice/plain = 2,
		/obj/item/reagent_containers/food/snacks/tuna = 1,
		/obj/item/reagent_containers/food/snacks/grown/onion = 1,
		/datum/reagent/consumable/mayonnaise = 5
	)
	result = /obj/item/reagent_containers/food/snacks/tuna_sandwich
	subcategory = CAT_PIE

/datum/crafting_recipe/food/meatballsub
	name = "Meatball sub"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/meatball = 3,
		/obj/item/reagent_containers/food/snacks/bun = 1
	)
	result = /obj/item/reagent_containers/food/snacks/meatballsub
	subcategory = CAT_PIE

/datum/crafting_recipe/food/hotdog
	name = "Hot dog"
	reqs = list(
		/datum/reagent/consumable/ketchup = 5,
		/obj/item/reagent_containers/food/snacks/bun = 1,
		/obj/item/reagent_containers/food/snacks/sausage = 1
	)
	result = /obj/item/reagent_containers/food/snacks/hotdog
	subcategory = CAT_PIE
