// Shotgun

/obj/item/ammo_casing/shotgun
	name = "shotgun slug"
	desc = "A 12 gauge lead slug."
	icon = 'icons/fallout/objects/guns/ammo.dmi'
	icon_state = "bbshell"
	caliber = "shotgun"
	projectile_type = /obj/item/projectile/bullet/shotgun_slug
	custom_materials = list(/datum/material/iron=250, /datum/material/blackpowder=70)

/obj/item/ammo_casing/shotgun/buckshot
	name = "buckshot shell"
	desc = "A 12 gauge buckshot shell."
	icon_state = "gshell"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun_buckshot
	pellets = 6
	variance = 18

/obj/item/ammo_casing/shotgun/improvised
	name = "improvised shell"
	desc = "An extremely weak shotgun shell with multiple small pellets made out of metal shards."
	icon_state = "improvshell"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun_improvised
	custom_materials = list(/datum/material/iron=250)
	pellets = 10
	variance = 25

/obj/item/ammo_casing/shotgun/beanbag
	name = "beanbag slug"
	desc = "A weak beanbag slug for riot control."
	icon_state = "bshell"
	projectile_type = /obj/item/projectile/bullet/shotgun_beanbag
	custom_materials = list(/datum/material/iron=250, /datum/material/blackpowder=70)

/obj/item/ammo_casing/shotgun/incendiary
	name = "incendiary slug"
	desc = "A 12 gauge incendiary slug."
	icon_state = "ishell"
	projectile_type = /obj/item/projectile/bullet/incendiary/shotgun

/obj/item/ammo_casing/shotgun/dragonsbreath
	name = "dragonsbreath shell"
	desc = "A 12 gauge magnesium buckshot shell."
	icon_state = "ishell2"
	projectile_type = /obj/item/projectile/bullet/incendiary/shotgun/dragonsbreath
	pellets = 4
	variance = 35

/obj/item/ammo_casing/shotgun/rubbershot
	name = "rubber shot"
	desc = "A shotgun casing filled with densely-packed rubber balls, used to incapacitate crowds from a distance."
	icon_state = "bshell"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun_rubbershot
	pellets = 6
	variance = 25
	custom_materials = list(/datum/material/iron=500, /datum/material/blackpowder = 70)

/obj/item/ammo_casing/shotgun/ion
	name = "ion shell"
	desc = "An advanced shotgun shell which uses a subspace ansible crystal to produce an effect similar to a standard ion rifle. \
	The unique properties of the crystal split the pulse into a spread of individually weaker bolts."
	icon_state = "ionshell"
	projectile_type = /obj/item/projectile/ion/weak
	pellets = 4
	variance = 35

/obj/item/ammo_casing/shotgun/laserslug
	name = "scatter laser shell"
	desc = "An advanced shotgun shell that uses a micro laser to replicate the effects of a scatter laser weapon in a ballistic package."
	icon_state = "lshell"
	projectile_type = /obj/item/projectile/beam/scatter
	pellets = 6
	variance = 35

/obj/item/ammo_casing/shotgun/techshell
	name = "unloaded technological shell"
	desc = "A high-tech shotgun shell which can be loaded with materials to produce unique effects."
	icon_state = "cshell"
	projectile_type = null

/obj/item/ammo_casing/shotgun/dart
	name = "shotgun dart"
	desc = "A dart for use in shotguns. Can be injected with up to 30 units of any chemical."
	icon_state = "cshell"
	projectile_type = /obj/item/projectile/bullet/dart
	var/reagent_amount = 30

/obj/item/ammo_casing/shotgun/dart/Initialize(mapload)
	. = ..()
	create_reagents(reagent_amount, OPENCONTAINER)

/obj/item/ammo_casing/shotgun/dart/attackby()
	return

/obj/item/ammo_casing/shotgun/dart/noreact
	name = "cryostasis shotgun dart"
	desc = "A dart for use in shotguns. Uses technology similar to cryostasis beakers to keep internal reagents from reacting. Can be injected with up to 10 units of any chemical."
	icon_state = "cnrshell"
	reagent_amount = 10

/obj/item/ammo_casing/shotgun/dart/noreact/Initialize(mapload)
	. = ..()
	ENABLE_BITFIELD(reagents.reagents_holder_flags, NO_REACT)

/obj/item/ammo_casing/shotgun/dart/bioterror
	desc = "A shotgun dart filled with an obscene amount of lethal reagents. God help whoever is shot with this."
	projectile_type = /obj/item/projectile/bullet/dart/piercing
	reagent_amount = 50

/obj/item/ammo_casing/shotgun/dart/bioterror/Initialize(mapload)
	. = ..()
	reagents.add_reagent(/datum/reagent/toxin/amanitin, 12) //for a nasty surprise after you get shot and somehow escape and don't think to quickly purge, and even shock those who are loaded up on purging agents
	reagents.add_reagent(/datum/reagent/toxin/chloralhydrate, 6)
	reagents.add_reagent(/datum/reagent/toxin/mutetoxin, 6) //;HELPIES OPS IN MAINT
	reagents.add_reagent(/datum/reagent/impedrezene, 6)
	reagents.add_reagent(/datum/reagent/toxin/acid/fluacid, 5) //this and the acid equal about 25ish burn, not counting the minute toxin damage dealt by their metabolism, this makes each dart about as lethal as a stechkin shot in upfront damage
	reagents.add_reagent(/datum/reagent/toxin/acid, 5)
	reagents.add_reagent(/datum/reagent/consumable/frostoil, 10) //tempgun slowdown goes both ways and adds to the burn

/obj/item/ammo_casing/shotgun/incapacitate
	name = "custom incapacitating shot"
	desc = "A shotgun casing filled with... something. Used to incapacitate targets."
	icon_state = "bountyshell"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun_incapacitate
	pellets = 12//double the pellets, but half the stun power of each, which makes this best for just dumping right in someone's face.
	variance = 25
	custom_materials = list(/datum/material/iron=4000)


// BETA STUFF // Obsolete
/obj/item/ammo_casing/shotgun/buckshot/test
	name = "buckshot shell"
	desc = "A 12 gauge buckshot shell."
	icon_state = "gshell"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun_buckshot/test
	pellets = 6
	variance = 18
