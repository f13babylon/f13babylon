////////////////////////////////
///// Construction datums //////
////////////////////////////////
/datum/component/construction/mecha
	var/base_icon
	var/looky_helpy = TRUE

/datum/component/construction/mecha/examine(datum/source, mob/user, list/examine_list)
	. = ..()
	if(looky_helpy)
		switch(steps[index]["key"])
			if(TOOL_WRENCH)
				examine_list += "<span class='notice'>The mech could be <b>wrenched</b> into place.</span>"
			if(TOOL_SCREWDRIVER)
				examine_list += "<span class='notice'>The mech could be <b>screwed</b> into place.</span>"
			if(TOOL_WIRECUTTER)
				examine_list += "<span class='notice'>The mech wires could be <b>trimmed</b> into place.</span>"
			if(/obj/item/stack/cable_coil)
				examine_list += "<span class='notice'>The mech could use some <b>wiring</b>.</span>"
			if(/obj/item/circuitboard)
				examine_list += "<span class='notice'>The mech could use a type of<b>circuitboard</b>.</span>"
			if(/obj/item/stock_parts/scanning_module)
				examine_list += "<span class='notice'>The mech could use a <b>scanning stock part</b>.</span>"
			if(/obj/item/stock_parts/capacitor)
				examine_list += "<span class='notice'>The mech could use a <b>power based stock part</b>.</span>"
			if(/obj/item/stock_parts/cell)
				examine_list += "<span class='notice'>The mech could use a <b>power source</b>.</span>"
			if(/obj/item/stack/sheet/metal)
				examine_list += "<span class='notice'>The mech could use some <b>sheets of metal</b>.</span>"
			if(/obj/item/stack/sheet/plasteel)
				examine_list += "<span class='notice'>The mech could use some <b>sheets of strong steel</b>.</span>"
			if(/obj/item/mecha_parts/part)
				examine_list += "<span class='notice'>The mech could use a mech <b>part</b>.</span>"
			if(/obj/item/stack/ore/bluespace_crystal)
				examine_list += "<span class='notice'>The mech could use a <b>crystal</b> of sorts.</span>"
			if(/obj/item/assembly/signaler/anomaly)
				examine_list += "<span class='notice'>The mech could use a <b>anomaly</b> of sorts.</span>"

/datum/component/construction/mecha/spawn_result()
	if(!result)
		return
	// Remove default mech power cell, as we replace it with a new one.
	var/obj/mecha/M = new result(drop_location())
	QDEL_NULL(M.cell)

	var/obj/item/mecha_parts/chassis/parent_chassis = parent
	M.CheckParts(parent_chassis.contents)

	SSblackbox.record_feedback("tally", "mechas_created", 1, M.name)
	QDEL_NULL(parent)

/datum/component/construction/mecha/update_parent(step_index)
	..()
	// By default, each step in mech construction has a single icon_state:
	// "[base_icon][index - 1]"
	// For example, Ripley's step 1 icon_state is "ripley0".
	var/atom/parent_atom = parent
	if(!steps[index]["icon_state"] && base_icon)
		parent_atom.icon_state = "[base_icon][index - 1]"

/datum/component/construction/unordered/mecha_chassis/custom_action(obj/item/I, mob/living/user, typepath)
	. = user.transferItemToLoc(I, parent)
	if(.)
		var/atom/parent_atom = parent
		user.visible_message("[user] has connected [I] to [parent].", "<span class='notice'>You connect [I] to [parent].</span>")
		parent_atom.add_overlay(I.icon_state+"+o")
		qdel(I)

/datum/component/construction/unordered/mecha_chassis/spawn_result()
	var/atom/parent_atom = parent
	parent_atom.icon = 'icons/mecha/mech_construction.dmi'
	parent_atom.density = TRUE
	parent_atom.cut_overlays()
	..()


/datum/component/construction/unordered/mecha_chassis/ripley
	result = /datum/component/construction/mecha/ripley
	steps = list(
		/obj/item/mecha_parts/part/ripley_torso,
		/obj/item/mecha_parts/part/ripley_left_arm,
		/obj/item/mecha_parts/part/ripley_right_arm,
		/obj/item/mecha_parts/part/ripley_left_leg,
		/obj/item/mecha_parts/part/ripley_right_leg
	)

/datum/component/construction/mecha/ripley
	result = /obj/mecha/working/ripley
	base_icon = "ripley"
	steps = list(
		//1
		list(
			"key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are disconnected."
		),

		//2
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are connected."
		),

		//3
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The hydraulic systems are active."
		),

		//4
		list(
			"key" = TOOL_WIRECUTTER,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is added."
		),

		//5
		list(
			"key" = /obj/item/circuitboard/mecha/ripley/main,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is adjusted."
		),

		//6
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Central control module is installed."
		),

		//7
		list(
			"key" = /obj/item/circuitboard/mecha/ripley/peripherals,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Central control module is secured."
		),

		//8
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Peripherals control module is installed."
		),

		//9
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Peripherals control module is secured."
		),

		//10
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The scanner module is installed."
		),

		//11
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Scanner module is secured."
		),

		//12
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Capacitor is installed."
		),

		//13
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Capacitor is secured."
		),

		//14
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The power cell is installed."
		),

		//15
		list(
			"key" = /obj/item/stack/sheet/metal,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured."
		),

		//16
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Internal armor is installed."
		),

		//17
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "Internal armor is wrenched."
		),

		//18
		list(
			"key" = /obj/item/stack/sheet/plasteel,
			"amount" = 5,
			"back_key" = TOOL_WELDER,
			"desc" = "Internal armor is welded."
		),

		//19
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is installed."
		),

		//20
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "External armor is wrenched."
		),
	)

/datum/component/construction/mecha/ripley/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	switch(index)
		if(1)
			user.visible_message("[user] connects [parent] hydraulic systems", "<span class='notice'>You connect [parent] hydraulic systems.</span>")
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] activates [parent] hydraulic systems.", "<span class='notice'>You activate [parent] hydraulic systems.</span>")
			else
				user.visible_message("[user] disconnects [parent] hydraulic systems", "<span class='notice'>You disconnect [parent] hydraulic systems.</span>")
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [parent].", "<span class='notice'>You add the wiring to [parent].</span>")
			else
				user.visible_message("[user] deactivates [parent] hydraulic systems.", "<span class='notice'>You deactivate [parent] hydraulic systems.</span>")
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [parent].", "<span class='notice'>You adjust the wiring of [parent].</span>")
			else
				user.visible_message("[user] removes the wiring from [parent].", "<span class='notice'>You remove the wiring from [parent].</span>")
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", "<span class='notice'>You install [I] into [parent].</span>")
			else
				user.visible_message("[user] disconnects the wiring of [parent].", "<span class='notice'>You disconnect the wiring of [parent].</span>")
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", "<span class='notice'>You secure the mainboard.</span>")
			else
				user.visible_message("[user] removes the central control module from [parent].", "<span class='notice'>You remove the central computer mainboard from [parent].</span>")
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", "<span class='notice'>You install [I] into [parent].</span>")
			else
				user.visible_message("[user] unfastens the mainboard.", "<span class='notice'>You unfasten the mainboard.</span>")
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", "<span class='notice'>You secure the peripherals control module.</span>")
			else
				user.visible_message("[user] removes the peripherals control module from [parent].", "<span class='notice'>You remove the peripherals control module from [parent].</span>")
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", "<span class='notice'>You install [I] into [parent].</span>")
			else
				user.visible_message("[user] unfastens the peripherals control module.", "<span class='notice'>You unfasten the peripherals control module.</span>")
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] secures the scanner module.", "<span class='notice'>You secure the scanner module.</span>")
			else
				user.visible_message("[user] removes the scanner module from [parent].", "<span class='notice'>You remove the scanner module from [parent].</span>")
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", "<span class='notice'>You install [I] to [parent].</span>")
			else
				user.visible_message("[user] unfastens the scanner module.", "<span class='notice'>You unfasten the scanner module.</span>")
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] secures [I].", "<span class='notice'>You secure [I].</span>")
			else
				user.visible_message("[user] removes the capacitor from [parent].", "<span class='notice'>You remove the capacitor from [parent].</span>")
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I].", "<span class='notice'>You install [I].</span>")
			else
				user.visible_message("[user] unsecures the capacitor from [parent].", "<span class='notice'>You unsecure the capacitor from [parent].</span>")
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] secures the power cell.", "<span class='notice'>You secure the power cell.</span>")
			else
				user.visible_message("[user] pries the power cell from [parent].", "<span class='notice'>You pry the power cell from [parent].</span>")
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] installs the internal armor layer to [parent].", "<span class='notice'>You install the internal armor layer to [parent].</span>")
			else
				user.visible_message("[user] unfastens the power cell.", "<span class='notice'>You unfasten the power cell.</span>")
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] secures the internal armor layer.", "<span class='notice'>You secure the internal armor layer.</span>")
			else
				user.visible_message("[user] pries internal armor layer from [parent].", "<span class='notice'>You pry internal armor layer from [parent].</span>")
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] welds the internal armor layer to [parent].", "<span class='notice'>You weld the internal armor layer to [parent].</span>")
			else
				user.visible_message("[user] unfastens the internal armor layer.", "<span class='notice'>You unfasten the internal armor layer.</span>")
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] installs the external reinforced armor layer to [parent].", "<span class='notice'>You install the external reinforced armor layer to [parent].</span>")
			else
				user.visible_message("[user] cuts the internal armor layer from [parent].", "<span class='notice'>You cut the internal armor layer from [parent].</span>")
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] secures the external armor layer.", "<span class='notice'>You secure the external reinforced armor layer.</span>")
			else
				user.visible_message("[user] pries external armor layer from [parent].", "<span class='notice'>You pry external armor layer from [parent].</span>")
		if(20)
			if(diff==FORWARD)
				user.visible_message("[user] welds the external armor layer to [parent].", "<span class='notice'>You weld the external armor layer to [parent].</span>")
			else
				user.visible_message("[user] unfastens the external armor layer.", "<span class='notice'>You unfasten the external armor layer.</span>")
	return TRUE

/datum/component/construction/unordered/mecha_chassis/firefighter
	result = /datum/component/construction/mecha/firefighter
	steps = list(
		/obj/item/mecha_parts/part/ripley_torso,
		/obj/item/mecha_parts/part/ripley_left_arm,
		/obj/item/mecha_parts/part/ripley_right_arm,
		/obj/item/mecha_parts/part/ripley_left_leg,
		/obj/item/mecha_parts/part/ripley_right_leg,
		/obj/item/clothing/suit/fire
	)

/datum/component/construction/mecha/firefighter
	result = /obj/mecha/working/ripley/firefighter
	base_icon = "fireripley"
	steps = list(
		//1
		list(
			"key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are disconnected."
		),

		//2
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are connected."
		),

		//3
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The hydraulic systems are active."
		),

		//4
		list(
			"key" = TOOL_WIRECUTTER,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is added."
		),

		//5
		list(
			"key" = /obj/item/circuitboard/mecha/ripley/main,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is adjusted."
		),

		//6
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Central control module is installed."
		),

		//7
		list(
			"key" = /obj/item/circuitboard/mecha/ripley/peripherals,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Central control module is secured."
		),

		//8
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Peripherals control module is installed."
		),

		//9
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Peripherals control module is secured."
		),

		//10
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The scanner module is installed."
		),

		//11
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The scanner module is secured."
		),

		//12
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The capacitor is installed."
		),

		//13
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The capacitor is secured."
		),

		//14
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The power cell is installed."
		),

		//15
		list(
			"key" = /obj/item/stack/sheet/plasteel,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured."
		),

		//16
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Internal armor is installed."
		),

		//17
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "Internal armor is wrenched."
		),

		//18
		list(
			"key" = /obj/item/stack/sheet/plasteel,
			"amount" = 5,
			"back_key" = TOOL_WELDER,
			"desc" = "Internal armor is welded."
		),

		//19
		list(
			"key" = /obj/item/stack/sheet/plasteel,
			"amount" = 5,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is being installed."
		),

		//20
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is installed."
		),

		//21
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "External armor is wrenched."
		),
	)

/datum/component/construction/mecha/firefighter/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	//TODO: better messages.
	switch(index)
		if(1)
			user.visible_message("[user] connects [parent] hydraulic systems", "<span class='notice'>You connect [parent] hydraulic systems.</span>")
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] activates [parent] hydraulic systems.", "<span class='notice'>You activate [parent] hydraulic systems.</span>")
			else
				user.visible_message("[user] disconnects [parent] hydraulic systems", "<span class='notice'>You disconnect [parent] hydraulic systems.</span>")
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [parent].", "<span class='notice'>You add the wiring to [parent].</span>")
			else
				user.visible_message("[user] deactivates [parent] hydraulic systems.", "<span class='notice'>You deactivate [parent] hydraulic systems.</span>")
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [parent].", "<span class='notice'>You adjust the wiring of [parent].</span>")
			else
				user.visible_message("[user] removes the wiring from [parent].", "<span class='notice'>You remove the wiring from [parent].</span>")
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", "<span class='notice'>You install [I] into [parent].</span>")
			else
				user.visible_message("[user] disconnects the wiring of [parent].", "<span class='notice'>You disconnect the wiring of [parent].</span>")
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", "<span class='notice'>You secure the mainboard.</span>")
			else
				user.visible_message("[user] removes the central control module from [parent].", "<span class='notice'>You remove the central computer mainboard from [parent].</span>")
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I]into [parent].", "<span class='notice'>You install [I]into [parent].</span>")
			else
				user.visible_message("[user] unfastens the mainboard.", "<span class='notice'>You unfasten the mainboard.</span>")
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", "<span class='notice'>You secure the peripherals control module.</span>")
			else
				user.visible_message("[user] removes the peripherals control module from [parent].", "<span class='notice'>You remove the peripherals control module from [parent].</span>")
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", "<span class='notice'>You install [I] into [parent].</span>")
			else
				user.visible_message("[user] unfastens the peripherals control module.", "<span class='notice'>You unfasten the peripherals control module.</span>")
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] secures the scanner module.", "<span class='notice'>You secure the scanner module.</span>")
			else
				user.visible_message("[user] removes the scanner module from [parent].", "<span class='notice'>You remove the scanner module from [parent].</span>")
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", "<span class='notice'>You install [I] to [parent].</span>")
			else
				user.visible_message("[user] unfastens the scanner module.", "<span class='notice'>You unfasten the scanner module.</span>")
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] secures the capacitor.", "<span class='notice'>You secure the capacitor.</span>")
			else
				user.visible_message("[user] removes the capacitor from [parent].", "<span class='notice'>You remove the capacitor from [parent].</span>")
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", "<span class='notice'>You install [I] into [parent].</span>")
			else
				user.visible_message("[user] unfastens the capacitor.", "<span class='notice'>You unfasten the capacitor.</span>")
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] secures the power cell.", "<span class='notice'>You secure the power cell.</span>")
			else
				user.visible_message("[user] pries the power cell from [parent].", "<span class='notice'>You pry the power cell from [parent].</span>")
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] installs the internal armor layer to [parent].", "<span class='notice'>You install the internal armor layer to [parent].</span>")
			else
				user.visible_message("[user] unfastens the power cell.", "<span class='notice'>You unfasten the power cell.</span>")
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] secures the internal armor layer.", "<span class='notice'>You secure the internal armor layer.</span>")
			else
				user.visible_message("[user] pries internal armor layer from [parent].", "<span class='notice'>You pry internal armor layer from [parent].</span>")
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] welds the internal armor layer to [parent].", "<span class='notice'>You weld the internal armor layer to [parent].</span>")
			else
				user.visible_message("[user] unfastens the internal armor layer.", "<span class='notice'>You unfasten the internal armor layer.</span>")
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] starts to install the external armor layer to [parent].", "<span class='notice'>You install the external armor layer to [parent].</span>")
			else
				user.visible_message("[user] cuts the internal armor layer from [parent].", "<span class='notice'>You cut the internal armor layer from [parent].</span>")
		if(20)
			if(diff==FORWARD)
				user.visible_message("[user] installs the external reinforced armor layer to [parent].", "<span class='notice'>You install the external reinforced armor layer to [parent].</span>")
			else
				user.visible_message("[user] removes the external armor from [parent].", "<span class='notice'>You remove the external armor from [parent].</span>")
		if(21)
			if(diff==FORWARD)
				user.visible_message("[user] secures the external armor layer.", "<span class='notice'>You secure the external reinforced armor layer.</span>")
			else
				user.visible_message("[user] pries external armor layer from [parent].", "<span class='notice'>You pry external armor layer from [parent].</span>")
		if(22)
			if(diff==FORWARD)
				user.visible_message("[user] welds the external armor layer to [parent].", "<span class='notice'>You weld the external armor layer to [parent].</span>")
			else
				user.visible_message("[user] unfastens the external armor layer.", "<span class='notice'>You unfasten the external armor layer.</span>")
	return TRUE

//ODYSSEUS

/datum/component/construction/unordered/mecha_chassis/odysseus
	result = /datum/component/construction/mecha/odysseus
	steps = list(
		/obj/item/mecha_parts/part/odysseus_torso,
		/obj/item/mecha_parts/part/odysseus_head,
		/obj/item/mecha_parts/part/odysseus_left_arm,
		/obj/item/mecha_parts/part/odysseus_right_arm,
		/obj/item/mecha_parts/part/odysseus_left_leg,
		/obj/item/mecha_parts/part/odysseus_right_leg
	)

/datum/component/construction/mecha/odysseus
	result = /obj/mecha/medical/odysseus
	base_icon = "odysseus"
	steps = list(
		//1
		list(
			"key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are disconnected."
		),

		//2
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are connected."
		),

		//3
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The hydraulic systems are active."
		),

		//4
		list(
			"key" = TOOL_WIRECUTTER,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is added."
		),

		//5
		list(
			"key" = /obj/item/circuitboard/mecha/odysseus/main,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is adjusted."
		),

		//6
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Central control module is installed."
		),

		//7
		list(
			"key" = /obj/item/circuitboard/mecha/odysseus/peripherals,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Central control module is secured."
		),

		//8
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Peripherals control module is installed."
		),
		//9
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Peripherals control module is secured."
		),

		//10
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Scanner module is installed."
		),

		//11
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Scanner module is secured."
		),

		//12
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Capacitor is installed."
		),

		//13
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Capacitor is secured."
		),

		//11
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The power cell is installed."
		),

		//12
		list(
			"key" = /obj/item/stack/sheet/metal,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured."
		),

		//13
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Internal armor is installed."
		),

		//14
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "Internal armor is wrenched."
		),

		//15
		list(
			"key" = /obj/item/stack/sheet/plasteel,
			"amount" = 5,
			"back_key" = TOOL_WELDER,
			"desc" = "Internal armor is welded."
		),

		//16
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is installed."
		),

		//17
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "External armor is wrenched."
		),
	)

/datum/component/construction/mecha/odysseus/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	//TODO: better messages.
	switch(index)
		if(1)
			user.visible_message("[user] connects [parent] hydraulic systems", "<span class='notice'>You connect [parent] hydraulic systems.</span>")
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] activates [parent] hydraulic systems.", "<span class='notice'>You activate [parent] hydraulic systems.</span>")
			else
				user.visible_message("[user] disconnects [parent] hydraulic systems", "<span class='notice'>You disconnect [parent] hydraulic systems.</span>")
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [parent].", "<span class='notice'>You add the wiring to [parent].</span>")
			else
				user.visible_message("[user] deactivates [parent] hydraulic systems.", "<span class='notice'>You deactivate [parent] hydraulic systems.</span>")
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [parent].", "<span class='notice'>You adjust the wiring of [parent].</span>")
			else
				user.visible_message("[user] removes the wiring from [parent].", "<span class='notice'>You remove the wiring from [parent].</span>")
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", "<span class='notice'>You install [I] into [parent].</span>")
			else
				user.visible_message("[user] disconnects the wiring of [parent].", "<span class='notice'>You disconnect the wiring of [parent].</span>")
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", "<span class='notice'>You secure the mainboard.</span>")
			else
				user.visible_message("[user] removes the central control module from [parent].", "<span class='notice'>You remove the central computer mainboard from [parent].</span>")
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", "<span class='notice'>You install [I] into [parent].</span>")
			else
				user.visible_message("[user] unfastens the mainboard.", "<span class='notice'>You unfasten the mainboard.</span>")
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", "<span class='notice'>You secure the peripherals control module.</span>")
			else
				user.visible_message("[user] removes the peripherals control module from [parent].", "<span class='notice'>You remove the peripherals control module from [parent].</span>")
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", "<span class='notice'>You install [I] into [parent].</span>")
			else
				user.visible_message("[user] unfastens the peripherals control module.", "<span class='notice'>You unfasten the peripherals control module.</span>")
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] secures the scanner module.", "<span class='notice'>You secure the scanner module.</span>")
			else
				user.visible_message("[user] removes the scanner module from [parent].", "<span class='notice'>You remove the scanner module from [parent].</span>")
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", "<span class='notice'>You install [I] to [parent].</span>")
			else
				user.visible_message("[user] unfastens the scanner module.", "<span class='notice'>You unfasten the scanner module.</span>")
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] secures the capacitor.", "<span class='notice'>You secure the capacitor.</span>")
			else
				user.visible_message("[user] removes the capacitor from [parent].", "<span class='notice'>You remove the capacitor from [parent].</span>")
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", "<span class='notice'>You install [I] into [parent].</span>")
			else
				user.visible_message("[user] unfastens the capacitor.", "<span class='notice'>You unfasten the capacitor.</span>")
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] secures the power cell.", "<span class='notice'>You secure the power cell.</span>")
			else
				user.visible_message("[user] pries the power cell from [parent].", "<span class='notice'>You pry the power cell from [parent].</span>")
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] installs the internal armor layer to [parent].", "<span class='notice'>You install the internal armor layer to [parent].</span>")
			else
				user.visible_message("[user] unfastens the power cell.", "<span class='notice'>You unfasten the power cell.</span>")
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] secures the internal armor layer.", "<span class='notice'>You secure the internal armor layer.</span>")
			else
				user.visible_message("[user] pries internal armor layer from [parent].", "<span class='notice'>You pry internal armor layer from [parent].</span>")
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] welds the internal armor layer to [parent].", "<span class='notice'>You weld the internal armor layer to [parent].</span>")
			else
				user.visible_message("[user] unfastens the internal armor layer.", "<span class='notice'>You unfasten the internal armor layer.</span>")
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] installs the external armor layer to [parent].", "<span class='notice'>You install the external reinforced armor layer to [parent].</span>")
			else
				user.visible_message("[user] cuts the internal armor layer from [parent].", "<span class='notice'>You cut the internal armor layer from [parent].</span>")
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] secures the external armor layer.", "<span class='notice'>You secure the external reinforced armor layer.</span>")
			else
				user.visible_message("[user] pries the external armor layer from [parent].", "<span class='notice'>You pry the external armor layer from [parent].</span>")
		if(20)
			if(diff==FORWARD)
				user.visible_message("[user] welds the external armor layer to [parent].", "<span class='notice'>You weld the external armor layer to [parent].</span>")
			else
				user.visible_message("[user] unfastens the external armor layer.", "<span class='notice'>You unfasten the external armor layer.</span>")
	return TRUE

/datum/component/construction/unordered/mecha_chassis/ripley/clarke
	result = /datum/component/construction/mecha/ripley/clarke
	steps = list(
		/obj/item/mecha_parts/part/clarke_head,
		/obj/item/mecha_parts/part/clarke_torso,
		/obj/item/mecha_parts/part/clarke_left_arm,
		/obj/item/mecha_parts/part/clarke_right_arm,
		/obj/item/mecha_parts/part/clarke_left_tread,
		/obj/item/mecha_parts/part/clarke_right_tread
	)

/datum/component/construction/mecha/ripley/clarke
	result = /obj/mecha/working/ripley/clarke
	base_icon = "clarke"
	steps = list(
		//1
		list(
			"key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are disconnected."
		),

		//2
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_WRENCH,
			"desc" = "The hydraulic systems are connected."
		),

		//3
		list(
			"key" = /obj/item/stack/cable_coil,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The hydraulic systems are active."
		),

		//4
		list(
			"key" = TOOL_WIRECUTTER,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is added."
		),

		//5
		list(
			"key" = /obj/item/circuitboard/mecha/clarke/main,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The wiring is adjusted."
		),

		//6
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Central control module is installed."
		),

		//7
		list(
			"key" = /obj/item/circuitboard/mecha/clarke/peripherals,
			"action" = ITEM_DELETE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Central control module is secured."
		),

		//8
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Peripherals control module is installed."
		),

		//9
		list(
			"key" = /obj/item/stock_parts/scanning_module,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Peripherals control module is secured."
		),

		//10
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The scanner module is installed."
		),

		//11
		list(
			"key" = /obj/item/stock_parts/capacitor,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Scanner module is secured."
		),

		//12
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Capacitor is installed."
		),

		//13
		list(
			"key" = /obj/item/stock_parts/cell,
			"action" = ITEM_MOVE_INSIDE,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "Capacitor is secured."
		),

		//14
		list(
			"key" = TOOL_SCREWDRIVER,
			"back_key" = TOOL_CROWBAR,
			"desc" = "The power cell is installed."
		),

		//15
		list(
			"key" = /obj/item/stack/sheet/metal,
			"amount" = 5,
			"back_key" = TOOL_SCREWDRIVER,
			"desc" = "The power cell is secured."
		),

		//16
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "Internal armor is installed."
		),

		//17
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "Internal armor is wrenched."
		),

		//18
		list(
			"key" = /obj/item/stack/sheet/plasteel,
			"amount" = 5,
			"back_key" = TOOL_WELDER,
			"desc" = "Internal armor is welded."
		),

		//19
		list(
			"key" = TOOL_WRENCH,
			"back_key" = TOOL_CROWBAR,
			"desc" = "External armor is installed."
		),

		//20
		list(
			"key" = TOOL_WELDER,
			"back_key" = TOOL_WRENCH,
			"desc" = "External armor is wrenched."
		),
	)

/datum/component/construction/mecha/clarke/custom_action(obj/item/I, mob/living/user, diff)
	if(!..())
		return FALSE

	switch(index)
		if(1)
			user.visible_message("[user] connects [parent] hydraulic systems", "<span class='notice'>You connect [parent] hydraulic systems.</span>")
		if(2)
			if(diff==FORWARD)
				user.visible_message("[user] activates [parent] hydraulic systems.", "<span class='notice'>You activate [parent] hydraulic systems.</span>")
			else
				user.visible_message("[user] disconnects [parent] hydraulic systems", "<span class='notice'>You disconnect [parent] hydraulic systems.</span>")
		if(3)
			if(diff==FORWARD)
				user.visible_message("[user] adds the wiring to [parent].", "<span class='notice'>You add the wiring to [parent].</span>")
			else
				user.visible_message("[user] deactivates [parent] hydraulic systems.", "<span class='notice'>You deactivate [parent] hydraulic systems.</span>")
		if(4)
			if(diff==FORWARD)
				user.visible_message("[user] adjusts the wiring of [parent].", "<span class='notice'>You adjust the wiring of [parent].</span>")
			else
				user.visible_message("[user] removes the wiring from [parent].", "<span class='notice'>You remove the wiring from [parent].</span>")
		if(5)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", "<span class='notice'>You install [I] into [parent].</span>")
			else
				user.visible_message("[user] disconnects the wiring of [parent].", "<span class='notice'>You disconnect the wiring of [parent].</span>")
		if(6)
			if(diff==FORWARD)
				user.visible_message("[user] secures the mainboard.", "<span class='notice'>You secure the mainboard.</span>")
			else
				user.visible_message("[user] removes the central control module from [parent].", "<span class='notice'>You remove the central computer mainboard from [parent].</span>")
		if(7)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", "<span class='notice'>You install [I] into [parent].</span>")
			else
				user.visible_message("[user] unfastens the mainboard.", "<span class='notice'>You unfasten the mainboard.</span>")
		if(8)
			if(diff==FORWARD)
				user.visible_message("[user] secures the peripherals control module.", "<span class='notice'>You secure the peripherals control module.</span>")
			else
				user.visible_message("[user] removes the peripherals control module from [parent].", "<span class='notice'>You remove the peripherals control module from [parent].</span>")
		if(9)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] into [parent].", "<span class='notice'>You install [I] into [parent].</span>")
			else
				user.visible_message("[user] unfastens the peripherals control module.", "<span class='notice'>You unfasten the peripherals control module.</span>")
		if(10)
			if(diff==FORWARD)
				user.visible_message("[user] secures the scanner module.", "<span class='notice'>You secure the scanner module.</span>")
			else
				user.visible_message("[user] removes the scanner module from [parent].", "<span class='notice'>You remove the scanner module from [parent].</span>")
		if(11)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I] to [parent].", "<span class='notice'>You install [I] to [parent].</span>")
			else
				user.visible_message("[user] unfastens the scanner module.", "<span class='notice'>You unfasten the scanner module.</span>")
		if(12)
			if(diff==FORWARD)
				user.visible_message("[user] secures [I].", "<span class='notice'>You secure [I].</span>")
			else
				user.visible_message("[user] removes the capacitor from [parent].", "<span class='notice'>You remove the capacitor from [parent].</span>")
		if(13)
			if(diff==FORWARD)
				user.visible_message("[user] installs [I].", "<span class='notice'>You install [I].</span>")
			else
				user.visible_message("[user] unsecures the capacitor from [parent].", "<span class='notice'>You unsecure the capacitor from [parent].</span>")
		if(14)
			if(diff==FORWARD)
				user.visible_message("[user] secures the power cell.", "<span class='notice'>You secure the power cell.</span>")
			else
				user.visible_message("[user] pries the power cell from [parent].", "<span class='notice'>You pry the power cell from [parent].</span>")
		if(15)
			if(diff==FORWARD)
				user.visible_message("[user] installs the internal armor layer to [parent].", "<span class='notice'>You install the internal armor layer to [parent].</span>")
			else
				user.visible_message("[user] unfastens the power cell.", "<span class='notice'>You unfasten the power cell.</span>")
		if(16)
			if(diff==FORWARD)
				user.visible_message("[user] secures the internal armor layer.", "<span class='notice'>You secure the internal armor layer.</span>")
			else
				user.visible_message("[user] pries internal armor layer from [parent].", "<span class='notice'>You pry internal armor layer from [parent].</span>")
		if(17)
			if(diff==FORWARD)
				user.visible_message("[user] welds the internal armor layer to [parent].", "<span class='notice'>You weld the internal armor layer to [parent].</span>")
			else
				user.visible_message("[user] unfastens the internal armor layer.", "<span class='notice'>You unfasten the internal armor layer.</span>")
		if(18)
			if(diff==FORWARD)
				user.visible_message("[user] installs the external reinforced armor layer to [parent].", "<span class='notice'>You install the external reinforced armor layer to [parent].</span>")
			else
				user.visible_message("[user] cuts the internal armor layer from [parent].", "<span class='notice'>You cut the internal armor layer from [parent].</span>")
		if(19)
			if(diff==FORWARD)
				user.visible_message("[user] secures the external armor layer.", "<span class='notice'>You secure the external reinforced armor layer.</span>")
			else
				user.visible_message("[user] pries external armor layer from [parent].", "<span class='notice'>You pry external armor layer from [parent].</span>")
		if(20)
			if(diff==FORWARD)
				user.visible_message("[user] welds the external armor layer to [parent].", "<span class='notice'>You weld the external armor layer to [parent].</span>")
			else
				user.visible_message("[user] unfastens the external armor layer.", "<span class='notice'>You unfasten the external armor layer.</span>")
	return TRUE
