/obj/structure/sign
	icon = 'icons/obj/decals.dmi'
	anchored = TRUE
	opacity = 0
	density = FALSE
	plane = ABOVE_WALL_PLANE
	layer = SIGN_LAYER
	max_integrity = 100
	armor = list("melee" = 50, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	var/buildable_sign = 1 //unwrenchable and modifiable
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE

/obj/structure/sign/basic
	name = "blank sign"
	desc = "How can signs be real if our eyes aren't real?"
	icon_state = "backing"

/obj/structure/sign/play_attack_sound(damage_amount, damage_type = BRUTE, damage_flag = 0)
	switch(damage_type)
		if(BRUTE)
			if(damage_amount)
				playsound(src.loc, 'sound/weapons/slash.ogg', 80, 1)
			else
				playsound(loc, 'sound/weapons/tap.ogg', 50, 1)
		if(BURN)
			playsound(loc, 'sound/items/welder.ogg', 80, 1)

/obj/structure/sign/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/wrench) && buildable_sign)
		user.visible_message("<span class='notice'>[user] starts removing [src]...</span>", \
							"<span class='notice'>You start unfastening [src].</span>")
		I.play_tool_sound(src)
		if(I.use_tool(src, user, 40))
			playsound(src, 'sound/items/deconstruct.ogg', 50, 1)
			user.visible_message("<span class='notice'>[user] unfastens [src].</span>", \
								"<span class='notice'>You unfasten [src].</span>")
			var/obj/item/sign_backing/SB = new (get_turf(user))
			SB.icon_state = icon_state
			SB.set_custom_materials(custom_materials) //This is here so picture frames and wooden things don't get messed up.
			SB.sign_path = type
			SB.setDir(dir)
			qdel(src)
		return
	else if(istype(I, /obj/item/pen) && buildable_sign)
		var/list/sign_types = list("Secure Area", "Biohazard", "High Voltage", "Radiation", "Hard Vacuum Ahead", "Disposal: Leads To Space", "Danger: Fire", "No Smoking", "Medbay", "Science", "Chemistry", \
		"Hydroponics", "Xenobiology")
		var/obj/structure/sign/sign_type
		switch(input(user, "Select a sign type.", "Sign Customization") as null|anything in sign_types)
			if("Blank")
				sign_type = /obj/structure/sign/basic
			if("Secure Area")
				sign_type = /obj/structure/sign/warning/securearea
			if("Biohazard")
				sign_type = /obj/structure/sign/warning/biohazard
			if("High Voltage")
				sign_type = /obj/structure/sign/warning/electricshock
			if("Radiation")
				sign_type = /obj/structure/sign/warning/radiation
			if("Hard Vacuum Ahead")
				sign_type = /obj/structure/sign/warning/vacuum
			if("Disposal: Leads To Space")
				sign_type = /obj/structure/sign/warning/deathsposal
			if("Danger: Fire")
				sign_type = /obj/structure/sign/warning/fire
			if("No Smoking")
				sign_type = /obj/structure/sign/warning/nosmoking/circle
			if("Medbay")
				sign_type = /obj/structure/sign/departments/medbay/alt
			if("Science")
				sign_type = /obj/structure/sign/departments/science
			if("Chemistry")
				sign_type = /obj/structure/sign/departments/chemistry
			if("Hydroponics")
				sign_type = /obj/structure/sign/departments/botany
			if("Xenobiology")
				sign_type = /obj/structure/sign/departments/xenobio

		//Make sure user is adjacent still
		if(!Adjacent(user))
			return

		if(!sign_type)
			return

		//It's import to clone the pixel layout information
		//Otherwise signs revert to being on the turf and
		//move jarringly
		var/obj/structure/sign/newsign = new sign_type(get_turf(src))
		newsign.pixel_x = pixel_x
		newsign.pixel_y = pixel_y
		qdel(src)
	else
		return ..()

/obj/item/sign_backing
	name = "sign backing"
	desc = "A sign with adhesive backing."
	icon = 'icons/obj/decals.dmi'
	icon_state = "backing"
	w_class = WEIGHT_CLASS_NORMAL
	resistance_flags = FLAMMABLE
	var/sign_path = /obj/structure/sign/basic //the type of sign that will be created when placed on a turf

/obj/item/sign_backing/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(isturf(target) && proximity)
		var/turf/T = target
		user.visible_message("<span class='notice'>[user] fastens [src] to [T].</span>", \
							"<span class='notice'>You attach the sign to [T].</span>")
		playsound(T, 'sound/items/deconstruct.ogg', 50, 1)
		var/obj/structure/sign/S = new sign_path(T)
		S.setDir(dir)
		qdel(src)

/obj/item/sign_backing/Move(atom/new_loc, direct = 0)
	// pulling, throwing, or conveying a sign backing does not rotate it
	var/old_dir = dir
	. = ..()
	setDir(old_dir)

/obj/item/sign_backing/attack_self(mob/user)
	. = ..()
	setDir(turn(dir, 90))

/obj/structure/sign/nanotrasen
	name = "\improper Navitron Logo"
	desc = "A sign with the Navitron Logo on it. Why save Earth, when we have space!"
	icon_state = "nanotrasen"

/obj/structure/sign/logo
	name = "nanotrasen logo"
	desc = "The Nanotrasen corporate logo."
	icon_state = "nanotrasen_sign1"



// Sunset Signs - SMALL
/obj/structure/sign/highway_sign
	name = "highway sign"
	desc = "A metal highway sign. This one is blank."
	icon = 'icons/fallout/structures/signs.dmi'
	icon_state = "sign_template"
	density = TRUE

/obj/structure/sign/highway_sign/casper
	name = "Casper"
	desc = "An aged highway sign indicating the road leads to Casper."
	icon_state = "sign_casper"

/obj/structure/sign/highway_sign/bighorn
	name = "Bighorn National Park"
	desc = "An aged highway sign indicating the road leads to the Bighorn National Park."
	icon_state = "sign_bighorn"

/obj/structure/sign/highway_sign/gillette
	name = "Gillette"
	desc = "An aged highway sign indicating the road leads to Gillette."
	icon_state = "sign_gillette"

/obj/structure/sign/highway_sign/rocksprings
	name = "Rock Springs"
	desc = "An aged highway sign indicating the road leads to Rock Springs."
	icon_state = "sign_rocksprings"

/obj/structure/sign/highway_sign/warren
	name = "Warren"
	desc = "An aged highway sign indicating the road leads to the city of Warren."
	icon_state = "sign_warren"

/obj/structure/sign/minefield
	name = "Minefield Warning"
	desc = "Appears to be warning that there is a minefield in the area. Watch your step."
	icon = 'icons/fallout/structures/signs.dmi'
	icon_state = "sign_minefield"
	density = TRUE

/obj/structure/sign/bee_warning
	name = "Beeware, Bees"
	desc = "Appears to be warning of a potential dangerous bee hive and that ample protection should be worn."
	icon_state = "beewarning"
	density = TRUE

// Sunset Signs - LARGE

/obj/structure/sign/bighorn_sign
	name = "Bighorn sign"
	desc = "A repurposed highway sign with the spray painted name of 'Bighorn'."
	icon = 'icons/fallout/structures/signs_large.dmi'
	icon_state = "bighorn_hvysign"
	density = TRUE
	bound_width = 64

/obj/structure/sign/trade_sign
	name = "Trade sign"
	desc = "A wooden sign with seemingly hand forged lettering bolted to it."
	icon = 'icons/fallout/structures/signs_large.dmi'
	icon_state = "sign_trade_south"
	density = TRUE
	bound_width = 64