

/datum/weather/ash_storm/sandstorm
	telegraph_message = "<span class='userdanger'>A sandstorm is coming to the area, decreasing overall visibility outside.</span>"

	weather_message = "<span class='boldannounce'>The sand wafts down around you like grotesque, thick snow. The sandstorm is here...</span>"

	end_message = "<span class='boldannounce'>The sandstorm slows before stopping. Adding another layer of sand to the ground beneath your feet.</span>"

/*
This is a pre-destroyed nuclear reactor for the sake of mapping special fluff stuff.
Not actually a reactor, just uses the icon and irradiates the surrounding area a bit.
Nowhere else to really put this. Pulled from what I had done on Hyper. - Carl
*/

/obj/structure/fluff/destroyed_nuclear_reactor
	name = "Destroyed Nuclear Reactor"
	desc = "What in the hell happened here?"
	icon = 'modular_sunset/icons/obj/rbmk.dmi'
	icon_state = "reactor_slagged"
	pixel_x = -32
	pixel_y = -32
	density = FALSE
	anchored = TRUE
	deconstructible = FALSE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	light_color = LIGHT_COLOR_CYAN
	dir = 8 //Less headache inducing :))

/obj/structure/fluff/destroyed_nuclear_reactor/Initialize(mapload)
	. = ..()
	set_light(3)
//	AddComponent(/datum/component/radioactive, 15000 , src)
	START_PROCESSING(SSradiation,src)

/obj/structure/fluff/destroyed_nuclear_reactor/Destroy()
	STOP_PROCESSING(SSradiation,src)
	return ..()

/obj/structure/fluff/destroyed_nuclear_reactor/process()
	if(QDELETED(src))
		return PROCESS_KILL

	if(!z || !SSmobs.clients_by_zlevel[z].len) // we don't care about irradiating if no one is around to see it!
		return

	for(var/mob/living/carbon/human/victim in view(src,5))
		if(istype(victim) && victim.stat != DEAD)
			victim.rad_act(1500)//WHY ARE YOU STANDING NEAR IT?
