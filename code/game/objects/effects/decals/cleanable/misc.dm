/obj/effect/decal/cleanable/generic
	name = "clutter"
	desc = "Someone should clean that up."
	icon = 'icons/obj/objects.dmi'
	icon_state = "shards"
	beauty = -50

/obj/effect/decal/cleanable/ash
	name = "ashes"
	desc = "Ashes to ashes, dust to dust, and into space."
	icon = 'icons/obj/objects.dmi'
	icon_state = "ash"
	mergeable_decal = FALSE
	beauty = -50

/obj/effect/decal/cleanable/ash/Initialize(mapload)
	. = ..()
	reagents.add_reagent(/datum/reagent/ash, 30)
	pixel_x = rand(-5, 5)
	pixel_y = rand(-5, 5)

/obj/effect/decal/cleanable/ash/crematorium
//crematoriums need their own ash cause default ash deletes itself if created in an obj
	turf_loc_check = FALSE

/obj/effect/decal/cleanable/ash/large
	name = "large pile of ashes"
	icon_state = "big_ash"
	beauty = -100

/obj/effect/decal/cleanable/ash/large/Initialize(mapload)
	. = ..()
	reagents.add_reagent(/datum/reagent/ash, 30) //double the amount of ash.

/obj/effect/decal/cleanable/glass
	name = "tiny shards"
	desc = "Back to sand."
	icon = 'icons/obj/shards.dmi'
	icon_state = "tiny"
	beauty = -100

/obj/effect/decal/cleanable/glass/Initialize(mapload)
	. = ..()
	setDir(pick(GLOB.cardinals))

/obj/effect/decal/cleanable/glass/ex_act()
	qdel(src)

/obj/effect/decal/cleanable/glass/plasma
	icon_state = "plasmatiny"

/obj/effect/decal/cleanable/dirt
	name = "dirt"
	desc = "Someone should clean that up."
	icon_state = "dirt"
	canSmoothWith = list(/obj/effect/decal/cleanable/dirt, /turf/closed/wall, /obj/structure/falsewall)
	smooth = SMOOTH_FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	beauty = -75

/obj/effect/decal/cleanable/dirt/Initialize(mapload)
	. = ..()
	var/turf/T = get_turf(src)
	if(T.tiled_dirt)
		smooth = SMOOTH_MORE
		icon = 'icons/effects/dirt.dmi'
		icon_state = ""
		queue_smooth(src)
	queue_smooth_neighbors(src)

/obj/effect/decal/cleanable/dirt/Destroy()
	queue_smooth_neighbors(src)
	return ..()

/obj/effect/decal/cleanable/flour
	name = "flour"
	desc = "It's still good. Four second rule!"
	icon_state = "flour"

/obj/effect/decal/cleanable/dirt/dust
	name = "dust"
	desc = "A thin layer of dust coating the floor."

/obj/effect/decal/cleanable/greenglow/ecto
	name = "ectoplasmic puddle"
	desc = "You know who to call."
	light_power = 2

/obj/effect/decal/cleanable/greenglow
	name = "glowing goo"
	desc = "Jeez. I hope that's not for lunch."
	light_power = 1
	light_range = 2
	light_color = LIGHT_COLOR_GREEN
	icon_state = "greenglow"
	beauty = -300

/obj/effect/decal/cleanable/greenglow/ex_act()
	return

/obj/effect/decal/cleanable/greenglow/radioactive
	name = "glowing goo"
	desc = "Jeez. I hope that's not for lunch."
	light_power = 3
	light_range = 3
	beauty = -450
	var/range = 2
	var/intensity = 20



/obj/effect/decal/cleanable/greenglow/radioactive/Initialize(mapload)
	. = ..()
	reagents.add_reagent(/datum/reagent/uranium, rand(5,15))
//	AddComponent(/datum/component/radioactive, 200, src, 0, TRUE, TRUE) //half-life of 0 because we keep on going.
//NO BAD. The radiation component SUCKS ASS - these components self-propagate into 500+ "radiation waves"
	START_PROCESSING(SSradiation,src) //Let's do this in a far more reasonable way- radiate players around us on a pulse. That's it.

/obj/effect/decal/cleanable/greenglow/radioactive/Destroy()
	STOP_PROCESSING(SSradiation,src)
	return ..()

//Bing bang boom done
/obj/effect/decal/cleanable/greenglow/radioactive/process()
	if(QDELETED(src))
		return PROCESS_KILL

	if(!z || !SSmobs.clients_by_zlevel[z].len) // we don't care about irradiating if no one is around to see it!
		return

	for(var/mob/living/carbon/human/victim in view(src,range))
		if(istype(victim) && victim.stat != DEAD)
			victim.rad_act(intensity)
	for(var/obj/item/geiger_counter/geiger in view(src,range))
		if(istype(geiger))
			geiger.rad_act(intensity)

/obj/effect/decal/cleanable/greenglow/radioactive/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/crafting/abraxo))
		user.show_message(span_notice("You start sprinkling \the [I.name] onto the puddle of goo..."), MSG_VISUAL)
		if(do_after(user, 30, target = src))
			user.show_message(span_notice("You neutralize the radioactive goo!"), MSG_VISUAL)
			new /obj/effect/decal/cleanable/chem_pile(src.loc) //Leave behind some cleanable chemical powder
			STOP_PROCESSING(SSradiation,src)
			qdel(src)
			qdel(I)
	else
		return ..()

/obj/effect/decal/cleanable/cobweb
	name = "cobweb"
	desc = "Somebody should remove that."
	gender = NEUTER
	layer = WALL_OBJ_LAYER
	icon_state = "cobweb1"
	resistance_flags = FLAMMABLE
	beauty = -100

/obj/effect/decal/cleanable/cobweb/cobweb2
	icon_state = "cobweb2"

/obj/effect/decal/cleanable/molten_object
	name = "gooey grey mass"
	desc = "It looks like a melted... something."
	gender = NEUTER
	icon = 'icons/effects/effects.dmi'
	icon_state = "molten"
	mergeable_decal = FALSE
	beauty = -150

/obj/effect/decal/cleanable/molten_object/large
	name = "big gooey grey mass"
	icon_state = "big_molten"
	beauty = -300

//Vomit (sorry)
/obj/effect/decal/cleanable/vomit
	name = "vomit"
	desc = "Gosh, how unpleasant."
	icon = 'icons/effects/blood.dmi'
	icon_state = "vomit_1"
	random_icon_states = list("vomit_1", "vomit_2", "vomit_3", "vomit_4")
	beauty = -150

/obj/effect/decal/cleanable/vomit/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(isflyperson(H))
			playsound(get_turf(src), 'sound/items/drink.ogg', 50, 1) //slurp
			H.visible_message("<span class='alert'>[H] extends a small proboscis into the vomit pool, sucking it with a slurping sound.</span>")
			if(reagents)
				for(var/datum/reagent/consumable/R in reagents.reagent_list)
					if(R.nutriment_factor > 0)
						H.adjust_nutrition(R.nutriment_factor * R.volume)
						reagents.del_reagent(R.type)
			reagents.trans_to(H, reagents.total_volume)
			qdel(src)

/obj/effect/decal/cleanable/vomit/old
	name = "crusty dried vomit"
	desc = "You try not to look at the chunks, and fail."

/obj/effect/decal/cleanable/vomit/old/Initialize(mapload, list/datum/disease/diseases)
	. = ..()
	icon_state += "-old"

/obj/effect/decal/cleanable/tomato_smudge
	name = "tomato smudge"
	desc = "It's red."
	gender = NEUTER
	icon = 'icons/effects/tomatodecal.dmi'
	random_icon_states = list("tomato_floor1", "tomato_floor2", "tomato_floor3")
	beauty = -100

/obj/effect/decal/cleanable/plant_smudge
	name = "plant smudge"
	gender = NEUTER
	icon = 'icons/effects/tomatodecal.dmi'
	random_icon_states = list("smashed_plant")

/obj/effect/decal/cleanable/egg_smudge
	name = "smashed egg"
	desc = "Seems like this one won't hatch."
	gender = NEUTER
	icon = 'icons/effects/tomatodecal.dmi'
	random_icon_states = list("smashed_egg1", "smashed_egg2", "smashed_egg3")

/obj/effect/decal/cleanable/pie_smudge //honk
	name = "smashed pie"
	desc = "It's pie cream from a cream pie."
	gender = NEUTER
	icon = 'icons/effects/tomatodecal.dmi'
	random_icon_states = list("smashed_pie")

/obj/effect/decal/cleanable/chem_pile
	name = "chemical pile"
	desc = "A pile of chemicals. You can't quite tell what's inside it."
	gender = NEUTER
	icon = 'icons/obj/objects.dmi'
	icon_state = "ash"

/obj/effect/decal/cleanable/shreds
	name = "shreds"
	desc = "The shredded remains of what appears to be clothing."
	icon_state = "shreds"
	gender = PLURAL
	mergeable_decal = FALSE

/obj/effect/decal/cleanable/shreds/ex_act(severity, target)
	if(severity == 1) //so shreds created during an explosion aren't deleted by the explosion.
		qdel(src)

/obj/effect/decal/cleanable/shreds/Initialize(mapload)
	pixel_x = rand(-10, 10)
	pixel_y = rand(-10, 10)
	. = ..()

/obj/effect/decal/cleanable/salt
	name = "salt pile"
	desc = "A sizable pile of table salt. Someone must be upset."
	icon = 'icons/effects/tomatodecal.dmi'
	icon_state = "salt_pile"
	gender = NEUTER

/obj/effect/decal/cleanable/glitter
	name = "generic glitter pile"
	desc = "The herpes of arts and crafts."
	icon = 'icons/effects/atmospherics.dmi'
	gender = NEUTER

/obj/effect/decal/cleanable/glitter/pink
	name = "pink glitter"
	icon_state = "plasma_old"

/obj/effect/decal/cleanable/glitter/white
	name = "white glitter"
	icon_state = "nitrous_oxide_old"

/obj/effect/decal/cleanable/glitter/blue
	name = "blue glitter"
	icon_state = "freon_old"

/obj/effect/decal/cleanable/plasma
	name = "stabilized plasma"
	desc = "A puddle of stabilized plasma."
	icon_state = "flour"
	color = "#9e0089"

/obj/effect/decal/cleanable/insectguts
	name = "insect guts"
	desc = "One bug squashed. Four more will rise in its place."
	icon = 'icons/effects/blood.dmi'
	icon_state = "xfloor1"
	random_icon_states = list("xfloor1", "xfloor2", "xfloor3", "xfloor4", "xfloor5", "xfloor6", "xfloor7")
