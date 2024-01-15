/*
Deletes spent ammo casings stored in the global spent_bullet_casings list.
Certain casings are a bigger priority for deletion, their calibers are stored in var/priority_casings_list.
These are usually casings that are prone to being spammed by high-firerate guns, therefore causing lag. They get deleted every time the Casing Cleaner is fired.
var/deleting_all_casings determines if any casings not in var/priority_casings_list need to be deleted, such as casings from rifle rounds. These casings get deleted on every second Casing Cleaner fire.
*/

SUBSYSTEM_DEF(casingcleaner)
	name = "Casing Cleaner"
	wait = 150 SECONDS
	var/priority_casings_list = list("10mm", "9mm", ".22lr", ".45")
	var/deleting_all_casings = FALSE

/datum/controller/subsystem/casingcleaner/fire(resumed = 0)
	cleanup_casings()
	deleting_all_casings = !deleting_all_casings

/datum/controller/subsystem/casingcleaner/proc/cleanup_casings()
	for(var/obj/item/ammo_casing/iter_casing in GLOB.spent_bullet_casings)
		if(((iter_casing.caliber in priority_casings_list) || deleting_all_casings) && isturf(iter_casing.loc))
			qdel(iter_casing)
