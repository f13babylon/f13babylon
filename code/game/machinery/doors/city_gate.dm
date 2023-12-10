/obj/machinery/door/poddoor/gate
	name = "city gate"
	desc = "A heavy duty gate that opens mechanically."
	icon = 'icons/fallout/structures/city_gate.dmi'
	icon_state = "closed"
	armor = list("melee" = 50, "bullet" = 100, "laser" = 100, "energy" = 100, "bomb" = 70, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 70)
	id = 333
	bound_width = 96
	ertblast = TRUE

/obj/machinery/door/poddoor/gate/preopen
	icon_state = "open"
	density = FALSE
	opacity = FALSE


/obj/machinery/door/poddoor/gate/open()
	. = ..()
	if(!.)
		return
	set_opacity(FALSE)


/obj/machinery/door/poddoor/gate/close()
	. = ..()
	if(!.)
		return
	set_opacity(TRUE)

/obj/machinery/door/poddoor/gate/bunker
	name = "bunker door"
	icon = 'icons/fallout/structures/brotherhood_gate.dmi'
	icon_state = "closed"
	id = 444

/obj/machinery/door/poddoor/gate/bunker/preopen
	icon_state = "open"
	density = FALSE
	opacity = FALSE

/obj/machinery/door/poddoor/gate/buildable
	name = "weak city gate"
	desc = "A heavy duty gate that opens mechanically. This one looks newly built and not as strong as a standard gate."
	icon_state = "open"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 25, "energy" = 75, "bomb" = 25, "bio" = 100, "rad" = 100, "fire" = 100, "acid" = 70) //same armor as regular, basic shutters. Can be adjusted later if need be.
	damage_deflection = 25 //How much force a melee weapon needs to damage it.
	proj_resist = 16
	max_integrity = 200 //Health is the same as a shutter. Can be changed later if need be.
	id = 451
	ertblast = FALSE //Can be hooked up to remote signalers and button frames.
	density = FALSE
	opacity = FALSE
