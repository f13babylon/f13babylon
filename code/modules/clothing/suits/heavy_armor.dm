// In this document: Heavy armor (not powerarmor)


///////////////
// WASTELAND //
///////////////

// Recipe Firesuit + metal chestplate + 50 welding fuel + 1 HQ + 1 plasteel
/obj/item/clothing/suit/armored/heavy/sulphite
	name = "sulphite raider suit"
	desc = "There are still some old asbestos fireman suits laying around from before the war. How about adding a ton of metal, plasteel and a combustion engine to one? The resulting armor is surprisingly effective at dissipating energy."
	icon_state = "sulphite"
	item_state = "sulphite"
	armor = list("melee" = 55, "bullet" = 40, "laser" = 50, "energy" = 20, "bomb" = 30, "bio" = 25, "rad" = 30, "fire" = 95, "acid" = 15)
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/armored/heavy/metal
	name = "metal armor suit"
	desc = "A suit of welded, fused metal plates. Bulky, but with great protection."
	icon_state = "raider_metal"
	item_state = "raider_metal"
	armor = list("melee" = 60, "bullet" = 45, "laser" = 30, "energy" = 10, "bomb" = 30, "bio" = 10, "rad" = 25, "fire" = 20, "acid" = 20, "wound" = 10)

/obj/item/clothing/suit/armored/heavy/recycled_power
	name = "recycled power armor"
	desc = "Taking pieces off from a wrecked power armor will at least give you thick plating, but don't expect too much of this shot up, piecemeal armor.."
	icon_state = "recycled_power"
	armor = list("melee" = 50, "bullet" = 45, "laser" = 30, "energy" = 10, "bomb" = 35, "bio" = 5, "rad" = 15, "fire" = 15, "acid" = 5, "wound" = 10)

/obj/item/clothing/suit/armored/heavy/raidermetal
	name = "iron raider suit"
	desc = "More rust than metal, with gaping holes in it, this armor looks like a pile of junk. Under the rust some quality steel still remains however."
	icon_state = "raider_metal"
	item_state = "raider_metal"
	armor = list("melee" = 55, "bullet" = 40, "laser" = 15, "energy" = 5, "bomb" = 25, "bio" = 0, "rad" = 15, "fire" = 20, "acid" = 0, "wound" = 10)

/obj/item/clothing/suit/armored/heavy/wardenplate
	name = "warden plates"
	desc = "Thick metal breastplate with a decorative skull on the shoulder."
	icon_state = "wardenplate"
	armor = list("melee" = 55, "bullet" = 50, "laser" = 35, "energy" = 10, "bomb" = 30, "bio" = 0, "rad" = 15, "fire" = 10, "acid" = 10, "wound" = 10)

/obj/item/clothing/suit/armored/heavy/bosexile
	name = "modified Brotherhood armor"
	desc = "A modified detoriated armor kit consisting of brotherhood combat armor and lots of scrap metal."
	icon_state = "exile_bos"
	item_state = "exile_bos"
	armor = list("melee" = 30, "bullet" = 40, "laser" = 40, "energy" = 20, "bomb" = 25, "bio" = 10, "rad" = 10, "fire" = 20, "acid" = 10, "wound" = 10)

/obj/item/clothing/suit/armored/heavy/riotpolice
	name = "riot police armor"
	icon_state = "bulletproof_heavy"
	item_state = "bulletproof_heavy"
	desc = "Heavy armor with ballistic inserts, sewn into a padded riot police coat."
	armor = list("melee" = 70, "bullet" = 45, "laser" = 20, "energy" = 5, "bomb" = 45, "bio" = 35, "rad" = 10, "fire" = 50, "acid" = 10, "wound" = 10)

//Recipe bone armor + metal and leather
/obj/item/clothing/suit/armored/heavy/tribal
	name = "tribal heavy carapace"
	desc = "Thick layers of leather and bone, with metal reinforcements, surely this will make the wearer tough and uncaring for claws and blades."
	icon_state = "tribal_heavy"
	item_state = "tribal_heavy"
	armor = list("melee" = 55, "bullet" = 20, "laser" = 25, "energy" = 5, "bomb" = 45, "bio" = 5, "rad" = 10, "fire" = 30, "acid" = 10, "wound" = 10)
	allowed = list(/obj/item/twohanded, /obj/item/melee/onehanded, /obj/item/melee/smith, /obj/item/melee/smith/twohand, /obj/item/shield)

//////////////////////////
// Salvaged Power Armor //
//////////////////////////

//GAMEPLAY: SALVAGED POWER ARMOR IS MEANT TO BE THE ABSOLUTE BEST SUIT OF ARMOR YOU CAN ACHIEVE AS A SIMPLE SILLY LITTLE MAN. THIS COMES AT THE PRICE OF SLOWDOWN.
//PREVIOUSLY, SALVAGED POWER ARMOR HAD /ABSOLUTELY MASSIVE/ MOVEMENT DRAWBACKS THAT MADE IT EFFECTIVELY NOT WORTH TO USE WHATSOEVER. YOU'D RATHER PICK THE MORE COMMON
//REINFORCED COMBAT ARMOR, OR BROKEN RIOT ARMOR - BECAUSE THEY HAD LITERALLY 85 LESS SLOWDOWN THAN SAID SPA IN QUESTION WHILE BEING 10 TO 15 POINTS WEAKER.
//NOW, SALVAGED POWER ARMOR SERVES ITS PURPOSE AS AN ACTUALLY VIABLE SET IN PROPER GAMEPLAY AND IS NO LONGER A GIMMICK. PING Dragonfruits ON DISCORD TO DISCUSS CHANGES.

/obj/item/clothing/suit/armored/heavy/salvaged_pa
	name = "salvaged power armor"
	desc = "It's a set of early-model SS-13 power armor, except it isn't real. Stop looking at it, go ping coders or something. \
	It's literally not meant to be here, you are just wasting your time reading some text that someone wrote for you \
	because he thought it'd be funny, or expected someone to check GitHub for once, hello by the way. \
	If you still don't understand - it's a 'master' item, basically main type/parent object or something. \
	It isn't meant to be used, it just dictates procs and all that stuff to the subtypes, such as t45d and so on. \
	Now begone, report this to coders. NOW!"
	slowdown = 0.35	//When helmeted, 0.45

// T-45D
/obj/item/clothing/suit/armored/heavy/salvaged_pa/t45d
	name = "salvaged T-45d power armor"
	desc = "T-45d power armor with servomotors and all valuable components stripped out of it."
	icon_state = "t45d_salvaged"
	item_state = "t45d_salvaged"
	armor = list("melee" = 60, "bullet" = 60, "laser" = 45, "energy" = 20, "bomb" = 35, "bio" = 30, "rad" = 20, "fire" = 35, "acid" = 0, "wound" = 40)

/obj/item/clothing/suit/armored/heavy/salvaged_pa/t45d/raider
	name = "salvaged raider power armor"
	desc = "A salvaged set of T-45d power armor, which has been brought back to life with the help of a welder and lots of scrap metal."
	icon_state = "raider_salvaged"
	item_state = "raider_salvaged"

/obj/item/clothing/suit/armored/heavy/salvaged_pa/t45d/hotrod
	name = "salvaged hotrod power armor"
	desc = "A salvaged set of T-45d power armor, with a with some of its plating removed. This set has exhaust pipes piped to the pauldrons, flames erupting from them."
	icon_state = "t45hotrod"
	item_state = "t45hotrod"

/obj/item/clothing/suit/armored/heavy/salvaged_pa/t45d/tribal
	name = "salvaged tribal power armor"
	desc = "A salvaged set of T-45d power armor, with certain bits of plating stripped out to retain more freedom of movement. No cooling module, though."
	icon_state = "tribal_power_armor"
	item_state = "tribal_power_armor"
	mutantrace_variation = STYLE_DIGITIGRADE
	armor = list("melee" = 60, "bullet" = 55, "laser" = 45, "energy" = 15, "bomb" = 35, "bio" = 30, "rad" = 20, "fire" = 35, "acid" = 0, "wound" = 35)
	slowdown = 0.3		//0.35 with armor

// T-51B
/obj/item/clothing/suit/armored/heavy/salvaged_pa/t51b
	name = "salvaged T-51b power armor"
	desc = "T-51b power armor with servomotors and all valuable components stripped out of it."
	icon_state = "t51b_salvaged"
	item_state = "t51b_salvaged"
	armor = list("melee" = 75, "bullet" = 75, "laser" = 65, "energy" = 15, "bomb" = 65, "bio" = 100, "rad" = 99, "fire" = 90, "acid" = 40, "wound" = 50)
	slowdown = 0.4

// Midwest
/obj/item/clothing/suit/armored/heavy/salvaged_pa/midwest
	name = "Salvaged midwestern T-51b power armor"
	desc = "This set of power armor belongs to the Midwestern branch of the Brotherhood of Steel. Its servomotors and valauble components have been stripped out of it."
	icon_state = "midwestgrey_pa_salvaged"
	item_state = "midwestgrey_pa_salvaged"
	armor = list("melee" = 70, "bullet" = 70, "laser" = 60, "energy" = 20, "bomb" = 45, "bio" = 70, "rad" = 50, "fire" = 75, "acid" = 35, "wound" = 50)
	slowdown = 0.4

// Hardened Midwest
/obj/item/clothing/suit/armored/heavy/salvaged_pa/midwest/hardened
	name = "Salvaged hardened midwestern T-51b power armor"
	desc = "This set of power armor belongs to the Midwestern branch of the Brotherhood of Steel. This particular one has gone through a chemical hardening process, increasing its armor capabilities. Its servomotors and valuable components have been stripped out of it."
	icon_state = "midwestpa_salvaged"
	item_state = "midwestpa_salvaged"
	armor = list("melee" = 70, "bullet" = 70, "laser" = 65, "energy" = 20, "bomb" = 50, "bio" = 80, "rad" = 60, "fire" = 80, "acid" = 35, "wound" = 50)
	slowdown = 0.85

// T-60A
/obj/item/clothing/suit/armored/heavy/salvaged_pa/t60
	name = "salvaged T-60a power armor"
	desc = "T-60a power armor with servomotors and all valuable components stripped out of it."
	icon_state = "t60_salvaged"
	item_state = "t60_salvaged"
	armor = list("melee" = 75, "bullet" = 70, "laser" = 65, "energy" = 25, "bomb" = 55, "bio" = 70, "rad" = 60, "fire" = 80, "acid" = 35, "wound" = 50)
	slowdown = 0.35

// X-02
/obj/item/clothing/suit/armored/heavy/salvaged_pa/x02
	name = "\improper salvaged APA Mk II"
	desc = "X-02 power armor with servomotors and all valuable components stripped out of it."
	icon_state = "advanced_salvaged"
	item_state = "advanced_salvaged"
	armor = list("melee" = 75, "bullet" = 75, "laser" = 75, "energy" = 40, "bomb" = 70, "bio" = 100, "rad" = 100, "fire" = 90, "acid" = 50, "wound" = 50)
	slowdown = 0.35

////////////
// LEGION //
////////////

// Recipe combine veteran armor with a kevlar vest
/obj/item/clothing/suit/armored/heavy/legion/breacher
	name = "legion breacher armor"
	desc = "A suit with the standard metal reinforcements of a veteran and a patched bulletproof vest worn over it."
	icon_state = "legion_heavy"
	item_state = "legion_heavy"
	armor = list("melee" = 65, "bullet" = 45, "laser" = 30, "energy" = 10, "bomb" = 30, "bio" = 20, "rad" = 25, "fire" = 30, "acid" = 5, "wound" = 10)

/obj/item/clothing/suit/armored/heavy/legion/centurion
	name = "legion centurion armor"
	desc = "The Legion centurion armor is by far the strongest suit of armor available to Caesar's Legion. The armor is composed from other pieces of armor taken from that of the wearer's defeated opponents in combat."
	icon_state = "legion_centurion"
	armor = list("melee" = 60, "bullet" = 50, "laser" = 35, "energy" = 10, "bomb" = 45, "bio" = 20, "rad" = 20, "fire" = 45, "acid" = 45, "wound" = 32)
	slowdown = 0.1
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 10) // Rest in pieces

/obj/item/clothing/suit/armored/heavy/legion/palacent
	name = "paladin-slayer centurion armor"
	desc = "The armor of a Centurion who has bested one or more Brotherhood Paladins, adding pieces of his prizes to his own defense. The symbol of the Legion is crudely painted on this once-marvelous suit of armor."
	icon_state = "legion_palacent"
	armor = list("melee" = 55, "bullet" = 45, "laser" = 70, "energy" = 40, "bomb" = 55, "bio" = 20, "rad" = 20, "fire" = 25, "acid" = 0, "wound" = 45)

/obj/item/clothing/suit/armored/heavy/legion/rangercent
	name = "ranger-hunter centurion armor"
	desc = "A suit of armor collected over the years by the deaths of countless NCR rangers."
	icon_state = "legion_rangercent"
	item_state = "legion_rangercent"
	armor = list("melee" = 40, "bullet" = 45, "laser" = 25, "energy" = 10, "bomb" = 55, "bio" = 60, "rad" = 60, "fire" = 90, "acid" = 20, "wound" = 35) //Mimics vet ranger stuff, higher melee and lower laser
	slowdown = 0.03

/obj/item/clothing/suit/armored/heavy/legion/legate
	name = "legion legate armor"
	desc = "The armor appears to be a full suit of heavy gauge steel and offers full body protection. It also has a cloak in excellent condition, but the armor itself bears numerous battle scars and the helmet is missing half of the left horn. The Legate's suit appears originally crafted, in contrast to other Legion armor which consists of repurposed pre-War sports equipment."
	icon_state = "legion_legate"
	armor = list("melee" = 60, "bullet" = 60, "laser" = 40, "energy" = 10, "bomb" = 45, "bio" = 60, "rad" = 20, "fire" = 80, "acid" = 0, "wound" = 10)
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 15) // Wouldn't it be hilarious if we just tore apart the Legate's armor?

/*

/obj/item/clothing/suit/armored/heavy/eliteriot
	name = "elite riot gear"
	desc = "A heavily reinforced set of military grade armor, commonly seen in the Divide now repurposed and reissued to Chief Rangers."
	icon_state = "elite_riot"
	item_state = "elite_riot"
	armor = list("melee" = 70, "bullet" = 60, "laser" = 40, "energy" = 35, "bomb" = 45, "bio" = 40, "rad" = 30, "fire" = 50, "acid" = 0, "wound" = 10)

/obj/item/clothing/suit/armored/heavy/tesla
	name = "tesla armor"
	desc = "A prewar armor design by Nikola Tesla before being confinscated by the U.S. government. Has a chance to deflect energy projectiles."
	icon_state = "tesla_armor"
	item_state = "tesla_armor"
	blood_overlay_type = "armor"
	armor = list("melee" = 35, "bullet" = 35, "laser" = 60, "energy" = 60, "bomb" = 35, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 90)
	resistance_flags = FIRE_PROOF
	var/hit_reflect_chance = 40
	protected_zones = list(BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)

/obj/item/clothing/suit/armored/heavy/tesla/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	if(is_energy_reflectable_projectile(object) && (attack_type == ATTACK_TYPE_PROJECTILE) && (def_zone in protected_zones))
		if(prob(hit_reflect_chance))
			block_return[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_DEFLECT
			return BLOCK_SHOULD_REDIRECT | BLOCK_REDIRECTED | BLOCK_SUCCESS | BLOCK_PHYSICAL_INTERNAL
	return ..()

/obj/item/clothing/suit/armored/heavy/salvagedpowerarmor
	name = "tribal full plate armor"
	desc = "A set of power armor, now reborn in the paints of the Wayfarers, it serves its new owners as an idol to Kwer, as well as being a piece of heavy covering, with removed parts to allow for quick nimble speed, its hardly what it used to be long ago."
	icon_state = "tribal_power_armor"
	item_state = "tribal_power_armor"
	armor = list("melee" = 65, "bullet" = 65, "laser" = 45, "energy" = 40, "bomb" = 45, "bio" = 30, "rad" = 30, "fire" = 60, "acid" = 10, "wound" = 10)
	allowed = list(/obj/item/twohanded, /obj/item/melee/onehanded, /obj/item/melee/smith, /obj/item/melee/smith/twohand)


/obj/item/clothing/suit/armored/heavy/environmental
	name = "environmental armor"
	desc = "Developed for use in heavily contaminated environments, this suit is prized in the Wasteland for its ability to protect against biological threats."
	icon_state = "environmental_armor"
	item_state = "environmental_armor"
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.9
	permeability_coefficient = 0.5
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list("melee" = 35, "bullet" = 30, "laser" = 20, "energy" = 15, "energy" = 45, "bomb" = 55, "bio" = 70, "rad" = 100, "fire" = 60, "acid" = 50)
	equip_delay_other = 60
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/armored/medium/environmental/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/rad_insulation, RAD_NO_INSULATION, TRUE, FALSE)
*/
