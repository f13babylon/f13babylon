//FOR BOTH SUITS AND ARMORS BELONGING TO FACTIONS
//PLEASE PUT CUSTOM ARMORS IN f13armor.dm. All power armors are found in f13armor.dm.

//Raider

/obj/item/clothing/suit/armor/f13/raider
	name = "base raider armor"
	desc = "for testing"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35, "energy" = 5, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 0, "wound" = 15)
	strip_delay = 40
	slowdown = 0.06

/obj/item/clothing/suit/armor/f13/raider/supafly //melee spec
	name = "supa-fly raider armor"
	desc = "Fabulous mutant powers were revealed to me the day I held aloft my bumper sword and said...<br>BY THE POWER OF NUKA-COLA, I AM RAIDER MAN!"
	armor = list("melee" = 45, "bullet" = 30, "laser" = 30, "energy" = 5, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 0, "wound" = 15)
	icon_state = "supafly"
	item_state = "supafly"
	mutantrace_variation = STYLE_DIGITIGRADE

/obj/item/clothing/suit/armor/f13/raider/rebel
	name = "rebel raider armor"
	desc = "Rebel, rebel. Your face is a mess."
	icon_state = "raider_rebel_icon"
	item_state = "raider_rebel_armor"

/obj/item/clothing/suit/armor/f13/raider/sadist
	name = "sadist raider armor"
	desc = "A bunch of metal chaps adorned with severed hands at the waist with a leather plate worn on the left shoulder. Very intimidating."
	armor = list("melee" = 45, "bullet" = 30, "laser" = 30, "energy" = 5, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 0, "wound" = 15)
	icon_state = "sadist"
	item_state = "sadist"
	mutantrace_variation = STYLE_DIGITIGRADE

/obj/item/clothing/suit/armor/f13/raider/blastmaster
	name = "blastmaster raider armor"
	desc = "A suit composed largely of blast plating, though there's so many holes it's hard to say if it will protect against much."
	icon_state = "blastmaster"
	item_state = "blastmaster"
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	armor = list("melee" = 30, "bullet" = 45, "laser" = 30, "energy" = 10, "bomb" = 60, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 0, "wound" = 20)
	flash_protect = 2
	slowdown = 0.14
	mutantrace_variation = STYLE_DIGITIGRADE

/obj/item/clothing/suit/armor/f13/raider/yankee
	name = "yankee raider armor"
	desc = "A set of armor made from bulky plastic and rubber. A faded sports team logo is printed in various places. Go Desert Rats!"
	icon_state = "yankee"
	item_state = "yankee"
	mutantrace_variation = STYLE_DIGITIGRADE

/obj/item/clothing/suit/armor/f13/raider/badlands
	name = "badlands raider armor"
	desc = "A leather top with a bandolier over it and a straps that cover the arms. Comes with pockets."
	icon_state = "badlands"
	item_state = "badlands"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/bulletbelt
	mutantrace_variation = STYLE_DIGITIGRADE

/obj/item/clothing/suit/armor/f13/raider/painspike
	name = "painspike raider armor"
	desc = "A particularly unhuggable armor, even by raider standards. Extremely spiky."
	icon_state = "painspike"
	item_state = "painspike"
	armor = list("melee" = 45, "bullet" = 30, "laser" = 30, "energy" = 5, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 0, "wound" = 15)
	mutantrace_variation = STYLE_DIGITIGRADE

/obj/item/clothing/suit/armor/f13/raider/iconoclast
	name = "iconoclast raider armor"
	desc = "A rigid armor set that appears to be fashioned from a radiation suit, or a mining suit."
	icon_state = "iconoclast"
	item_state = "iconoclast"
	armor = list("melee" = 30, "bullet" = 30, "laser" = 45, "energy" = 5, "bomb" = 15, "bio" = 60, "rad" = 40, "fire" = 15, "acid" = 0, "wound" = 15)

/obj/item/clothing/suit/armor/f13/raider/combatduster
	name = "combat duster"
	desc = "An old military-grade pre-war combat armor under a weathered duster. It appears to be fitted with metal plates to replace the crumbling ceramic."
	icon_state = "combatduster"
	item_state = "combatduster"
	mutantrace_variation = STYLE_DIGITIGRADE
	armor = list("melee" = 45, "bullet" = 50, "laser" = 45, "energy" = 15, "bomb" = 20, "bio" = 10, "rad" = 10, "fire" = 20, "acid" = 0, "wound" = 20)
	slowdown = 0.14

/obj/item/clothing/suit/armor/f13/raider/combatduster/patrolduster
	name = "Patrol Duster"
	desc = "What appears to be an NCR patrol ranger's armor under a green tinted duster. The armor itself looks much more well kept then the duster itself, said duster looking somewhat faded. On the back of the duster, is a symbol of a skull with an arrow piercing through the eye."
	icon_state = "patrolduster"
	item_state = "patrolduster"

/obj/item/clothing/suit/armor/f13/exile
	name = "base faction exile armor"
	desc = "this is for testing."
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	icon = 'icons/fallout/clothing/armored_medium.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_medium.dmi'
	slowdown = 0.1

/obj/item/clothing/suit/armor/f13/exile/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/exile/ncrexile
	name = "modified NCR armor"
	desc = "A modified detoriated armor kit consisting of NCR gear and scrap metal."
	icon_state = "ncrexile"
	item_state = "ncrexile"
	armor = list("melee" = 10, "bullet" = 30, "laser" = 20, "energy" = 5, "bomb" = 15, "bio" = 30, "rad" = 20, "fire" = 15, "acid" = 0, "wound" = 20)

/obj/item/clothing/suit/armor/f13/exile/legexile
	name = "modified Legion armor"
	desc = "A modified detoriated armor kit consisting of Legion gear and scrap metal."
	armor = list("melee" = 30, "bullet" = 20, "laser" = 10, "energy" = 0, "bomb" = 15, "bio" = 30, "rad" = 20, "fire" = 15, "acid" = 0, "wound" = 15)
	icon_state = "legexile"
	item_state = "legexile"
	slowdown = 0.06

/obj/item/clothing/suit/armor/f13/exile/bosexile
	name = "modified Brotherhood armor"
	desc = "A modified detoriated armor kit consisting of brotherhood combat armor and scrap metal."
	icon = 'icons/fallout/clothing/armored_heavy.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_heavy.dmi'
	icon_state = "exile_bos"
	item_state = "exile_bos"
	armor = list("melee" = 10, "bullet" = 20, "laser" = 30, "energy" = 5, "bomb" = 15, "bio" = 30, "rad" = 20, "fire" = 15, "acid" = 0, "wound" = 20)

/obj/item/clothing/suit/armor/f13/raider/raidercombat
	name = "combat raider armor"
	desc = "An old military-grade pre-war combat armor. It appears to be fitted with metal plates to replace the crumbling ceramic."
	icon_state = "raider_combat"
	item_state = "raider_combat"
	armor = list("melee" = 40, "bullet" = 40, "laser" = 40, "energy" = 10, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 0, "wound" = 15)
	slowdown = 0.1

/obj/item/clothing/suit/armor/f13/raider/raidermetal
	name = "metal raider armor"
	desc = "A suit of welded, fused metal plates. Looks bulky, with great protection."
	icon_state = "raider_metal"
	item_state = "raider_metal"
	armor = list("melee" = 55, "bullet" = 55, "laser" = 35, "energy" = 15, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 0, "wound" = 25)
	slowdown = 0.2

//////////
//LEGION//
//////////

//NON-COMBAT ROLES
/obj/item/clothing/suit/f13/legion/servant		//Legion Auxilia suit, Servant loadout
	name = "old leather strips"
	desc = "Worn leather strips, used as makeshift protection from chafing and sharp stones by labor slaves."
	icon = 'icons/fallout/clothing/suits_utility.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/suit_utility.dmi'
	icon_state = "legion_slaveleather"
	item_state = "legion_slaveleather"
	armor = list("melee" = 20, "bullet" = 15, "laser" = 10, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 5)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/crafter

/obj/item/clothing/suit/f13/legion/orator		//Legion Orator suit
	name = "legion orator armor"
	desc = "A ceremonial outfit consisting of a heavy wool cape paired with some golden bracers. The design leaves the chest exposed, so try not to get shot there."
	icon = 'icons/fallout/clothing/armored_light.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_light.dmi'
	icon_state = "oratorcape"
	item_state = "oratorcape"
	armor = list("melee" = 20, "bullet" = 15, "laser" = 10, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 5)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/treasurer
	slowdown = 0.05

//COMBAT ROLES
/obj/item/clothing/suit/armor/f13/legion
	name = "LEGION ARMOR TEMPLATE"
	desc = "You're not supposed to see this."
	icon = 'icons/fallout/clothing/armored_light.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_light.dmi'
	icon_state = "legrecruit"
	item_state = "legarmor"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor = list("melee" = 30, "bullet" = 30, "laser" = 10, "energy" = 5, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 0, "wound" = 10)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/bulletbelt
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 2)
	slowdown = 0.06

/obj/item/clothing/suit/armor/f13/legion/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/legion/recruit			//Legion Recruit armor
	name = "legion recruit armor"
	desc = "Well, it's better than nothing."
	icon_state = "legion_recruit"
	item_state = "legion_recruit"
	armor = list("melee" = 30, "bullet" = 20, "laser" = 10, "energy" = 0, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 0, "wound" = 15)
	slowdown = 0.04

/obj/item/clothing/suit/armor/f13/legion/recruit/decanus	//Legion Recruit Decanus armor
	name = "legion recruit decanus armor"
	desc = "Recruit Decani receive slightly better protection than regular recruits. Slightly."
	armor = list("melee" = 30, "bullet" = 25, "laser" = 10, "energy" = 0, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 0, "wound" = 20)

/obj/item/clothing/suit/armor/f13/legion/prime
	name = "legion prime armor"
	desc = "Legion Primes have survived some skirmishes, and when promoted often recieve a set of armor, padded leather modeled on ancient baseball catcher uniforms and various plates of metal or boiled leather."
	icon_state = "legion_prime"
	item_state = "legion_prime"
	armor = list("melee" = 35, "bullet" = 25, "laser" = 15, "energy" = 5, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0, "wound" = 20)
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 4)

/obj/item/clothing/suit/armor/f13/legion/prime/explorer		//Legion Explorer armor
	name = "legion explorer armor"
	desc = "Armor based on layered strips of laminated linen and leather, the technique giving it surprising resilience for low weight."
	icon_state = "legion_explorer"
	item_state = "legion_explorer"
	armor = list("melee" = 30, "bullet" = 25, "laser" = 10, "energy" = 5, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 0, "wound" = 20)
	slowdown = 0.04

/obj/item/clothing/suit/armor/f13/legion/prime/decanus		//Legion Prime Decanus armor
	name = "legion prime decanus armor"
	desc = "Legion prime decanus armor-an extra reinforced baseball uniform."
	armor = list("melee" = 35, "bullet" = 30, "laser" = 15, "energy" = 5, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0, "wound" = 25)
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 6)

/obj/item/clothing/suit/armor/f13/legion/veteran			//Legion Veteran armor
	name = "legion veteran armor"
	desc = "Armor worn by veterans, salvaged bits of enemy armor and scrap metal often reinforcing the armor."
	icon = 'icons/fallout/clothing/armored_medium.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_medium.dmi'
	icon_state = "legion_veteran"
	item_state = "legion_veteran"
	armor = list("melee" = 45, "bullet" = 35, "laser" = 25, "energy" = 5, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 0, "wound" = 30)
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 6)
	slowdown = 0.08

/obj/item/clothing/suit/armor/f13/legion/veteran/vexillarius	//Legion Vexillarius armor
	name = "legion vexillarius armor"
	desc = " Worn by Vexillarius, this armor has been reinforced with circular metal plates on the chest and a back mounted pole for the flag of the Bull, making the wearer easy to see at a distance."
	icon_state = "legion_vex"
	item_state = "legion_vex"
	armor = list("melee" = 45, "bullet" = 40, "laser" = 30, "energy" = 10, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 0, "wound" = 30)
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 8)
	slowdown = 0.1

//OFFICER ROLES
/obj/item/clothing/suit/armor/f13/legion/veteran/decanus		//Legion Veteran Decanus armor
	name = "legion veteran decanus armor"
	desc = "A veteran's armor reinforced with a patched bulletproof vest, the wearer has the markings of a Decanus."
	icon = 'icons/fallout/clothing/armored_heavy.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_heavy.dmi'
	icon_state = "legion_heavy"
	item_state = "legion_heavy"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 30, "energy" = 10, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 0, "wound" = 35)
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 8)
	slowdown = 0.12

/obj/item/clothing/suit/armor/f13/legion/centurion					//Legion Centurion armor
	name = "legion centurion armor"
	desc = "Every Centurion is issued some of the best armor available in the Legion, and adds better pieces from slain opponents over time."
	icon = 'icons/fallout/clothing/armored_heavy.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_heavy.dmi'
	icon_state = "legion_centurion"
	item_state = "legion_centurion"
	armor = list("melee" = 55, "bullet" = 45, "laser" = 35, "energy" = 15, "bomb" = 35, "bio" = 0, "rad" = 0, "fire" = 35, "acid" = 45, "wound" = 40)
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 10)
	slowdown = 0.12

/obj/item/clothing/suit/armor/f13/legion/centurion/paladinslayer	//Legion Centurion armor, Paladin-Slayer loadout
	name = "paladin-slayer centurion armor"
	desc = "A Centurion able to defeat a Brotherhood Paladin gets the honorific title 'Paladin-Slayer', and adds bits of the looted armor to his own."
	icon_state = "legion_palacent"
	item_state = "legion_palacent"
	armor = list("melee" = 45, "bullet" = 40, "laser" = 50, "energy" = 20, "bomb" = 35, "bio" = 0, "rad" = 0, "fire" = 35, "acid" = 0, "wound" = 45)
	slowdown = 0.2		//0.25 with helmet

/obj/item/clothing/suit/armor/f13/legion/centurion/rangerhunter		//Legion Centurion armor, Ranger-Hunter loadout
	name = "ranger-hunter centurion armor"
	desc = "Centurions who have led many patrols and ambushes against NCR Rangers have a distinct look from the many looted pieces of Ranger armor, and are often experienced in skirmishing."
	icon_state = "legion_rangercent"
	item_state = "legion_rangercent"
	armor = list("melee" = 35, "bullet" = 45, "laser" = 30, "energy" = 15, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 0, "wound" = 40)
	slowdown = 0.08

/obj/item/clothing/suit/armor/f13/legion/centurion/legate			//Legion Legate armor
	name = "legion legate armor"
	desc = " Made by the most skilled blacksmiths in Arizona, the bronzed steel of this rare armor offers good protection, and the scars on its metal proves it has seen use on the field."
	icon_state = "legion_legate"
	item_state = "legion_legate"
	armor = list("melee" = 60, "bullet" = 50, "laser" = 40, "energy" = 20, "bomb" = 55, "bio" = 65, "rad" = 55, "fire" = 85, "acid" = 0, "wound" = 50)

/obj/item/clothing/suit/armor/f13/combat/legion						//Legion Combat armor
	name = "legion combat armor"
	desc = "Pre-war military style armor, patched and missing some parts. Modified and repainted to declare the user a fighter for Caesar's Legion."
	icon = 'icons/fallout/clothing/armored_medium.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_medium.dmi'
	icon_state = "legion_combat"
	item_state = "legion_combat"

/obj/item/clothing/suit/armor/f13/combat/mk2/legion					//Legion Reinforced Combat armor
	name = "reinforced legion combat armor"
	icon = 'icons/fallout/clothing/armored_medium.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_medium.dmi'
	desc = "Pre-war military style armor, a full set with bracers and reinforcements. Modified and repainted to declare the user a fighter for Caesar's Legion."
	icon_state = "legion_combat2"
	item_state = "legion_combat2"

///////
//NCR//
///////

//NON-COMBAT ROLES
/obj/item/clothing/suit/f13/ncr/utilityvest		//NCR Off-Duty vest
	name = "\improper NCR utility vest"
	desc = "A practical utility vest with pockets for tools and such. Offers little in terms of protection."
	icon_state = "vest_utility"
	item_state = "vest_utility"
	icon = 'icons/fallout/clothing/suits_utility.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/suit_utility.dmi'
	armor = list("melee" = 10, "bullet" = 20, "laser" = 15, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 10)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/crafter
	slowdown = 0.04

/obj/item/clothing/suit/f13/ncr/labcoat			//NCR Medical Officer labcoat
	name = "\improper NCR labcoat"
	desc = "A standard labcoat with a two headed bear sewn onto the shoulder."
	icon_state = "ncr_labcoat"
	item_state = "ncr_labcoat"
	armor = list("melee" = 10, "bullet" = 15, "laser" = 20, "energy" = 0, "bomb" = 0, "bio" = 70, "rad" = 40, "fire" = 0, "acid" = 50, "wound" = 0)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/medical
	slowdown = 0.04

//DRESS JACKETS
/obj/item/clothing/suit/f13/ncr/dressjack
	name = "NCR dress jacket"
	desc = "A brown dress uniform jacket for enlisted NCRA personnel."
	icon_state = "ncr_dressjack"
	item_state = "ncr_dressjack"
	armor = list("melee" = 10, "bullet" = 20, "laser" = 15, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0, "wound" = 10)
	slowdown = 0.04

/obj/item/clothing/suit/f13/ncr/dressjack/commissioned
	name = "NCR commissioned dress jacket"
	desc = "A brown dress uniform jacket for commissioned NCRA personnel."
	icon_state = "ncr_codressjack"
	item_state = "ncr_codressjack"

//PRISONER JACKET
/obj/item/clothing/suit/f13/ncr/ncrcfjacket
	name = "NCRCF jacket"
	icon_state = "ncrcfjacket"
	item_state = "ncrcfjacket"
	desc = "A cheap, standard issue teal canvas jacket issued to poor suckers who find themselves at the butt-end of the NCR's judiciary system."

//ENLISTED COMBAT ROLES
/obj/item/clothing/suit/armor/f13/ncr				//NCR Trooper armor
	name = "NCR ARMOR TEMPLATE"
	desc = "You're not supposed to see this."
	icon_state = "ncr_infantry_vest"
	item_state = "ncr_infantry_vest"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor = list("melee" = 15, "bullet" = 35, "laser" = 25, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0, "wound" = 25)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/bulletbelt
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 2)
	slowdown = 0.1

/obj/item/clothing/suit/armor/f13/ncr/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/ncr/trooper		//NCR Trooper armor
	name = "\improper NCR patrol vest"
	desc = "A standard issue NCR infantry vest."

/obj/item/clothing/suit/armor/f13/ncr/conscript		//NCR Conscript armor
	name = "\improper NCR flak vest"
	desc = "A cheap flak vest, typically commonly worn by fresh conscripts of the NCRA."
	icon_state = "ncr_kelvar_vest"
	item_state = "ncr_kelvar_vest"
	armor = list("melee" = 10, "bullet" = 30, "laser" = 20, "energy" = 5, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 0, "wound" = 20)

/obj/item/clothing/suit/armor/f13/ncr/conscript/ncrwarrior		//NCR Conscript armor, Desert Warrior loadout
	name = "\improper NCR desert warrior vest"
	desc = "A modified version of the NCR flak vest with shoulder pads and a white piece of cloth with a red stripe, to let everyone know God is on your side."
	icon = 'icons/fallout/clothing/armored_light.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_light.dmi'
	icon_state = "ncr_warrior_vest"
	item_state = "ncr_warrior_vest"
	armor = list("melee" = 30, "bullet" = 20, "laser" = 10, "energy" = 0, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 0, "wound" = 15)

/obj/item/clothing/suit/armor/f13/ncr/reinforced/mantle			//NCR Corporal armor
	name = "\improper NCR mantle vest"
	desc = "A standard issue NCR infantry vest with a mantle on the shoulder."
	icon_state = "ncr_standard_mantle"
	item_state = "ncr_standard_mantle"

/obj/item/clothing/suit/armor/f13/ncr/reinforced				//NCR Combat Medic armor
	name = "\improper NCR reinforced patrol vest"
	desc = "A standard issue NCR infantry vest reinforced with a groinpad."
	icon_state = "ncr_reinforced_vest"
	item_state = "ncr_reinforced_vest"
	armor = list("melee" = 15, "bullet" = 35, "laser" = 25, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0, "wound" = 30)
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 4)

/obj/item/clothing/suit/armor/f13/ncr/reinforced/engineer		//NCR Combat Engineer armor
	name = "\improper NCR blast-padded patrol vest"
	desc = "A standard issue NCR Infantry vest reinforced with a groinpad. A portion of its ceramic was replaced with blast-resistant padding."
	armor = list("melee" = 15, "bullet" = 30, "laser" = 30, "energy" = 10, "bomb" = 50, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 0, "wound" = 30)

/obj/item/clothing/suit/armor/f13/ncr/reinforced/mantle/sergeant					//NCR Sergeant armor
	name = "\improper NCR reinforced mantle vest"
	desc = "A standard issue NCR Infantry vest reinforced with a groinpad and a mantle."
	icon_state = "ncr_reinforced_mantle"
	armor = list("melee" = 20, "bullet" = 40, "laser" = 30, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0, "wound" = 35)
	slowdown = 0.12
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 6)

/obj/item/clothing/suit/armor/f13/ncr/reinforced/mantle/sergeant/trenchraider		//NCR Sergeant armor, Trench Raider loadout
	name = "\improper NCR reinforced trench mantle vest"
	desc = "A standard issue NCR Infantry vest reinforced with a groinpad and a mantle. A portion of its ceramics was replaced with shock-resistant plates."
	armor = list("melee" = 40, "bullet" = 30, "laser" = 20, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0, "wound" = 35)

//HEAVY GUNNER
/obj/item/clothing/suit/armored/heavy/salvaged_pa/t45d/ncr				//NCR Heavy Gunner armor
	name = "\improper NCR salvaged power armor"
	desc = "A set of salvaged T-45d power armor, with its servomotors and joint reinforcements having been long removed. The paintjob on it shows it belongs to the NCR. A rare sight after General Lee Oliver's death, and often outfitted to troops expected to be at the frontlines."
	icon_state = "ncr_salvaged"
	item_state = "ncr_salvaged"
	armor = list("melee" = 45, "bullet" = 65, "laser" = 50, "energy" = 20, "bomb" = 40, "bio" = 0, "rad" = 0, "fire" = 40, "acid" = 0, "wound" = 50)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/bulletbelt
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 8)
	slowdown = 0.25		//0.35 with helmet

/obj/item/clothing/suit/armor/f13/ncr/heavygunner						//NCR Heavy Gunner armor, Flamethrower loadout
	name = "\improper NCR heavy plate vest"
	desc = "A heavily reinforced NCR vest. Rumors say that the leather for the lining comes from the best-fed Brahmins, and complete with extra armor padding. It is often seen used as a supplement for the rarer T-45d salvaged power armor."
	icon = 'icons/fallout/clothing/armored_medium.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_medium.dmi'
	icon_state = "steel_bib_ncra"
	item_state = "steel_bib_ncra"
	armor = list("melee" = 45, "bullet" = 45, "laser" = 35, "energy" = 15, "bomb" = 35, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 0, "wound" = 45)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/bulletbelt
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 8)
	slowdown = 0.18		//0.22 with helmet

//OFFICER ROLES
/obj/item/clothing/suit/armor/f13/ncr/reinforced/mantle/officer						//NCR Lieutenant armor
	name = "\improper NCR officer mantle vest"
	desc = "A standard issue NCR infantry vest reinforced with a groinpad and a mantle. Additional plating was added to protect the shoulders. Intended for use by the officers of the NCRA."
	icon_state = "ncr_lt_armour"
	item_state = "ncr_lt_armour"
	armor = list("melee" = 30, "bullet" = 45, "laser" = 35, "energy" = 15, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 0, "wound" = 40)
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 8)
	slowdown = 0.14

/obj/item/clothing/suit/armor/f13/ncr/reinforced/mantle/officer/captain				//NCR Captain Armor, Frontline loadout
	name = "\improper NCR reinforced officer mantle vest"
	desc = "A standard issue NCR infantry vest reinforced with a groinpad and a mantle. Additional plating was added to protect the shoulders and arms. Intended for use by high ranking officers of the NCRA."
	icon_state = "ncr_captain_armour"
	item_state = "ncr_captain_armour"
	armor = list("melee" = 35, "bullet" = 50, "laser" = 40, "energy" = 20, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 0, "wound" = 45)
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 10)

/obj/item/clothing/suit/armor/f13/ncr/reinforced/mantle/officer/captain/coat		//NCR Captain Armor, Backline loadout
	name = "\improper NCR officer greatcoat"
	desc = "A special issue NCR officer's greatcoat with heavy ballistic padding sewn-in for protection."
	icon_state = "ncr_officer_coat"
	item_state = "ncr_officer_coat"

/obj/item/clothing/suit/armor/f13/combat/ncr
	name = "\improper NCR combat armor"
	desc = "An old military grade pre war combat armor and, repainted to the colour scheme of the New California Republic."
	icon_state = "ncr_armor"
	item_state = "ncr_armor"

/obj/item/clothing/suit/armor/f13/combat/mk2/ncr
	name = "reinforced NCR combat armor"
	desc = "A reinforced set of bracers, greaves, and torso plating of prewar design. This one is kitted with additional plates and, repainted to the colour scheme of the New California Republic."
	icon_state = "ncr_armor_mk2"
	item_state = "ncr_armor_mk2"

//RANGERS
/obj/item/clothing/suit/toggle/armor/f13/reconranger		//Recon Ranger armor
	name = "recon ranger duster"
	desc = "A thicker than average duster worn by NCR Recon Rangers out in the field. It's not heavily armored by any means, but is easy to move around in and provides excellent protection from the harsh desert environment."
	icon_state = "duster_recon"
	item_state = "duster_recon"
	armor = list("melee" = 15, "bullet" = 35, "laser" = 30, "energy" = 10, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 0, "wound" = 25)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/bulletbelt
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 6)
	slowdown = 0.08

/obj/item/clothing/suit/toggle/armor/f13/reconranger/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/ncr/trailranger			//Trail Ranger armor
	name = "trail ranger vest"
	desc = "A quaint little jacket and scarf worn by NCR Trail Rangers. Its lightweight padding allows for faster movement."
	icon_state = "cowboyrang"
	item_state = "cowboyrang"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor = list("melee" = 20, "bullet" = 30, "laser" = 25, "energy" = 5, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 0, "wound" = 20)
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 6)
	slowdown = 0.06
	unique_reskin = list(
		"M1" = "vest_utility",
		"M2" = "modif_r_vest",
		"M3" = "blueshift",
		"M4" = "bulletproof",
		"M5" = "cowboyrang"
	)

/obj/item/clothing/suit/armor/f13/combat/ncr/patrol			//Patrol Ranger armor
	name = "ranger patrol armor"
	desc = "A set of standard issue Ranger patrol armor that provides defense similar to a suit of pre-war combat armor. It's got NCR markings, making it clear who it was made by."
	icon_state = "ncr_patrol"
	item_state = "ncr_patrol"
	armor = list("melee" = 30, "bullet" = 50, "laser" = 40, "energy" = 10, "bomb" = 20, "bio" = 10, "rad" = 10, "fire" = 20, "acid" = 0, "wound" = 30)
	mutantrace_variation = STYLE_DIGITIGRADE
	unique_reskin = list(
		"M1" = "ncr_patrol_old",
		"M2" = "thaxarmor",
		"M3" = "sergeant",
		"M4" = "ncr_patrol"
	)

//VETERAN RANGER
/obj/item/clothing/suit/armor/f13/ncr/vetranger				//Veteran Ranger armor
	name = "veteran ranger riot suit"
	desc = "The NCR Veteran Ranger's armor consists of a pre-war L.A.P.D. riot suit under a duster with rodeo jeans. Considered one of the most prestigious suits of armor to earn and wear while in service of the NCR Rangers."
	icon_state = "ranger"
	item_state = "ranger"
	armor = list("melee" = 25, "bullet" = 50, "laser" = 30, "energy" = 15, "bomb" = 25, "bio" = 20, "rad" = 20, "fire" = 25, "acid" = 0, "wound" = 40)
	salvage_loot = list(/obj/item/stack/crafting/armor_plate = 8)
	mutantrace_variation = STYLE_DIGITIGRADE
	slowdown = 0.08
	unique_reskin = list(
		"M1" = "ranger_old",
		"M2" = "foxranger",
		"M3" = "price_ranger",
		"M4" = "desert_ranger",
		"M5" = "elite_riot",
		"M6" = "ranger"
	)

//Brotherhood of Steel (PA in f13armor.dm)

/obj/item/clothing/suit/armor/f13/headscribecoat
	name = "Head Scribe's field coat"
	desc = "A thick coat with a fur inlay and soft armor padding, perfect for intimidating subordinates and captives alike."
	icon_state = "hoccoat"
	item_state = "hoccoat"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 20, "bomb" = 30, "bio" = 100, "rad" = 10, "fire" = 30, "acid" = 30, "wound" = 30)

/obj/item/clothing/suit/armor/f13/headscribe
	name = "brotherhood head scribe robe"
	desc = " A red cloth robe with gold trimmings, worn eclusively by the Head Scribe of a chapter."
	icon_state = "headscribe"
	item_state = "headscribe"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS
	armor = list("melee" = 20, "bullet" = 35, "laser" = 35, "energy" = 15, "bomb" = 15, "bio" = 100, "rad" = 20, "fire" = 15, "acid" = 70, "wound" = 15)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets

/obj/item/clothing/suit/f13/scribe
	name = "Brotherhood Scribe's robe"
	desc = "A red cloth robe worn by the Brotherhood of Steel Scribes."
	icon_state = "scribe"
	item_state = "scribe"
	body_parts_covered = CHEST|ARMS|LEGS
	armor = list("melee" = 10, "bullet" = 25, "laser" = 25, "energy" = 10, "bomb" = 10, "bio" = 100, "rad" = 10, "fire" = 10, "acid" = 35, "wound" = 10)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets

/obj/item/clothing/suit/f13/seniorscribe
	name = "Brotherhood Senior Scribe's robe"
	desc = "A red cloth robe with silver gildings worn by the Brotherhood of Steel Senior Scribes."
	icon_state = "seniorscribe"
	item_state = "seniorscribe"
	body_parts_covered = CHEST|ARMS|LEGS
	armor = list("melee" = 15, "bullet" = 30, "laser" = 30, "energy" = 10, "bomb" = 15, "bio" = 100, "rad" = 15, "fire" = 15, "acid" = 50, "wound" = 15)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets

/obj/item/clothing/suit/f13/elder
	name = "Brotherhood Elder's robe"
	desc = "A blue cloth robe with some scarlet red parts, traditionally worn by the Brotherhood of Steel Elder."
	icon_state = "elder"
	item_state = "elder"
	body_parts_covered = CHEST|ARMS|LEGS
	armor = list("melee" = 20, "bullet" = 35, "laser" = 35, "energy" = 15, "bomb" = 15, "bio" = 100, "rad" = 20, "fire" = 15, "acid" = 70, "wound" = 15)
	allowed = list(/obj/item/gun)

/obj/item/clothing/suit/armor/f13/combat/brotherhood
	name = "brotherhood armor"
	desc = "A combat armor set made by the Brotherhood of Steel, standard issue for all Knights. It bears a red stripe."
	icon_state = "brotherhood_armor_knight"
	item_state = "brotherhood_armor_knight"
	armor = list("melee" = 45, "bullet" = 45, "laser" = 55, "energy" = 20, "bomb" = 20, "bio" = 15, "rad" = 15, "fire" = 20, "acid" = 0, "wound" = 20)

/obj/item/clothing/suit/armor/f13/combat/brotherhood/senior
	name = "brotherhood senior knight armor"
	desc = "A renforced combat armor set made by the Brotherhood of Steel, standard issue for all Senior Knights. It bears a silver stripe."
	icon_state = "brotherhood_armor_senior"
	item_state = "brotherhood_armor_senior"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 60, "energy" = 25, "bomb" = 25, "bio" = 20, "rad" = 20, "fire" = 25, "acid" = 0, "wound" = 25)

/obj/item/clothing/suit/armor/f13/combat/brotherhood/captain	//UNUSED
	name = "brotherhood head knight armor"
	desc = "A renforced combat armor set made by the Brotherhood of Steel, standard issue for all Head Knights. It bears golden embroidery."
	icon_state = "brotherhood_armor_captain"
	item_state = "brotherhood_armor_captain"
	armor = list("melee" = 55, "bullet" = 55, "laser" = 65, "energy" = 30, "bomb" = 30, "bio" = 25, "rad" = 25, "fire" = 30, "acid" = 0, "wound" = 30)
	slowdown = 0.15

/obj/item/clothing/suit/armor/f13/combat/brotherhood/initiate
	name = "initiate armor"
	desc = "An old degraded pre war combat armor, repainted to the colour scheme of the Brotherhood of Steel."
	icon_state = "brotherhood_armor"
	item_state = "brotherhood_armor"
	armor = list("melee" = 35, "bullet" = 35, "laser" = 30, "energy" = 15, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 15, "acid" = 0, "wound" = 15)
	mutantrace_variation = STYLE_DIGITIGRADE

/obj/item/clothing/suit/armor/f13/combat/brotherhood/initiate/mk2
	name = "reinforced knight armor"
	desc = "A reinforced set of bracers, greaves, and torso plating of prewar design This one is kitted with additional plates and, repainted to the colour scheme of the Brotherhood of Steel."
	icon_state = "brotherhood_armor_mk2"
	item_state = "brotherhood_armor_mk2"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 55, "energy" = 25, "bomb" = 25, "bio" = 20, "rad" = 20, "fire" = 25, "acid" = 0, "wound" = 25)
	slowdown = 0.15
	mutantrace_variation = STYLE_DIGITIGRADE

//Oasis/Town
/obj/item/clothing/suit/armor/f13/town
	name = "town trenchcoat"
	desc = "A non-descript black trenchcoat."
	icon_state = "towntrench"
	item_state = "hostrench"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	mutantrace_variation = STYLE_DIGITIGRADE
	armor = list("melee" = 25, "bullet" = 25, "laser" = 20, "energy" = 5, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 0, "wound" = 15)
	slowdown = 0.04

/obj/item/clothing/suit/armor/f13/town/mayor
	name = "mayor trenchcoat"
	desc = "A symbol of the mayor's authority (or lack thereof). It has discrete armor plating in the lining, to foil assassination attempts."
	armor = list("melee" = 35, "bullet" = 35, "laser" = 30, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0, "wound" = 20)
	slowdown = 0.06

/obj/item/clothing/suit/armor/f13/town/sheriff
	name = "town combat coat"
	desc = " A trenchcoat which does not attempt to hide the full-body combat armor beneath it."
	icon_state = "towntrench_heavy"
	mutantrace_variation = STYLE_DIGITIGRADE
	armor = list("melee" = 45, "bullet" = 55, "laser" = 45,  "energy" = 20, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 0, "wound" = 30)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/small/holdout
	slowdown = 0.14

/obj/item/clothing/suit/armor/f13/town/chief
	name = "BPD Chief's jacket"
	desc = "A navy-blue jacket with blue shoulder designations, '/BPD/' stitched into one of the chest pockets, and hidden ceramic trauma plates. It has a small compartment for a holdout pistol."
	icon = 'icons/fallout/clothing/suits_cosmetic.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/suit_cosmetic.dmi'
	icon_state = "police_chief"
	item_state = "police_chief"
	armor = list("melee" = 45, "bullet" = 55, "laser" = 45,  "energy" = 20, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 0, "wound" = 30)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/small/holdout
	slowdown = 0.14

/obj/item/clothing/suit/armor/f13/town/deputy
	name = "armored town trenchcoat"
	desc = "An armored trench coat with added shoulderpads, a chestplate, and legguards."
	icon_state = "towntrench_medium"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 40,  "energy" = 15, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 0, "wound" = 25)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/small/holdout
	slowdown = 0.12

/obj/item/clothing/suit/armor/vest/oasis
	name = "\improper BPD vest"
	desc = "A ballistic vest that combines protection and comfort. This one has pockets sewn into the front and a badge pinned on it."
	icon_state = "blueshift"
	item_state = "blueshift"
	armor = list("melee" = 40, "bullet" = 50, "laser" = 40,  "energy" = 15, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 25, "acid" = 0, "wound" = 25)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets
	slowdown = 0.12

/obj/item/clothing/suit/armor/f13/metalarmor/steelbib/oasis
	name = "heavy steel breastplate"
	desc = "a steel breastplate, inspired by a pre-war design. Looks like Bighorn citizens added an additional layer of metal on the front face."
	icon_state = "steel_bib"
	item_state = "steel_bib"
	armor = list("melee" = 45, "bullet" = 60, "laser" = 45,  "energy" = 20, "bomb" = 35, "bio" = 0, "rad" = 0, "fire" = 35, "acid" = 0, "wound" = 35)
	slowdown = 0.3

//Great Khan
/obj/item/clothing/suit/armor/khan_jacket
	name = "khan armored jacket"
	desc = "The symbol of the greatest pushers."
	icon_state = "khan_jacket"
	item_state = "khan_jacket"
	armor = list("melee" = 30, "bullet" = 30, "laser" = 35, "energy" = 10, "bomb" = 30, "bio" = 0, "rad" = 0, "fire" = 30, "acid" = 30, "wound" = 25)
	pocket_storage_component_path = /datum/component/storage/concrete/pockets
	slowdown = 0.06

/obj/item/clothing/suit/armor/khan_jacket/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/armor_plate)

//Wayfarer
/obj/item/clothing/suit/armor/f13/lightcloak
	name = "light tribal cloak"
	desc = "Light cloak armor, made of gecko skins and minor metal plating to protect against light weaponry, a favorite amongst scouts of the tribe."
	icon_state = "lightcloak"
	item_state = "lightcloak"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/small
	armor = list("melee" = 40, "bullet" = 20, "laser" = 30, "energy" = 0, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0, "wound" = 10)
	slowdown = 0.04

/obj/item/clothing/suit/armor/f13/combat/tribal
	name = "tribal combat armor"
	desc = "An old military grade pre war combat armor, now decorated with sinew and the bones of the hunted for its new wearer."
	icon_state = "tribecombatarmor"
	item_state = "tribecombatarmor"

/obj/item/clothing/suit/armor/f13/combat/mk2/tribal
	name = "tribal reinforced combat armor"
	desc = "An old military grade pre-war reinforced combat armor, now decorated with sinew and the bones of the hunted for its new wearer."
	icon_state = "tribecombatarmor"
	item_state = "tribecombatarmor"

/obj/item/clothing/suit/armor/f13/tribe_armor
	name = "light tribal armor"
	desc = "Light armor made of leather stips and a large, flat piece of turquoise. Armor commonplace among the Wayfinders."
	icon_state = "tribal_armor"
	item_state = "tribal_armor"
	armor = list("melee" = 40, "bullet" = 20, "laser" = 30, "energy" = 0, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0, "wound" = 10)
	slowdown = 0.04

/obj/item/clothing/suit/armor/f13/tribe_heavy_armor
	name = "heavy tribal armor"
	desc = "Heavy armor make of sturdy leather and pieces of bone. Worn by seasoned veterans within the Wayfinder tribe."
	icon = 'icons/fallout/clothing/armored_heavy.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/armor_heavy.dmi'
	icon_state = "tribal_heavy"
	item_state = "tribal_heavy"
	armor = list("melee" = 50, "bullet" = 30, "laser" = 40, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0, "wound" = 20)
	slowdown = 0.1

//Vault

/obj/item/clothing/suit/armor/f13/riot/vault
	name = "VTCC riot armour"
	desc = "A suit of riot armour adapted from the design of the pre-war U.S.M.C. armour, painted blue and white."
	icon_state = "vtcc_riot_gear"
	item_state = "vtcc_riot_gear"
	armor = list("melee" = 50, "bullet" = 40, "laser" = 35, "energy" = 15, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0, "wound" = 20)
	slowdown = 0.1

//Old World Law Enforcement
//Police

/obj/item/clothing/suit/f13/police
	name = "police officer's jacket"
	desc = "A simple dark navy jacket, worn by police."
	icon = 'icons/fallout/clothing/suits_cosmetic.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/suit_cosmetic.dmi'
	icon_state = "police_officer"
	item_state = "police_officer"
	mutantrace_variation = STYLE_DIGITIGRADE
	armor = list("melee" = 15, "bullet" = 15, "laser" = 15, "energy" = 0, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 10, "acid" = 0, "wound" = 10)

/obj/item/clothing/suit/f13/police/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/f13/police/lieutenant
	name = "police lieutenant's jacket"
	desc = " A simple dark navy jacket, worn by police."
	icon = 'icons/fallout/clothing/suits_cosmetic.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/suit_cosmetic.dmi'
	icon_state = "police_lieutenant"
	item_state = "police_lieutenant"
	armor = list("melee" = 15, "bullet" = 20, "laser" = 15, "energy" = 0, "bomb" = 15, "bio" = 0, "rad" = 0, "fire" = 15, "acid" = 0, "wound" = 15)
	mutantrace_variation = STYLE_DIGITIGRADE

/obj/item/clothing/suit/f13/police/chief
	name = "police chief's jacket"
	desc = "A simple dark navy jacket, worn by police."
	icon = 'icons/fallout/clothing/suits_cosmetic.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/suit_cosmetic.dmi'
	icon_state = "police_chief"
	item_state = "police_chief"
	armor = list("melee" = 15, "bullet" = 25, "laser" = 15, "energy" = 0, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0, "wound" = 20)
	mutantrace_variation = STYLE_DIGITIGRADE

//Enclave

/obj/item/clothing/suit/armor/f13/combat/enclave	//its mk2 for salvaging purposes, mostly
	name = "enclave combat armor"
	desc = "An old set of pre-war combat armor, painted black."
	icon_state = "enclave_new"
	item_state = "enclave_new"
	armor = list("melee" = 45, "bullet" = 45, "laser" = 45, "energy" = 15, "bomb" = 20, "bio" = 10, "rad" = 10, "fire" = 20, "acid" = 0, "wound" = 20)

/obj/item/clothing/suit/armor/f13/combat/mk2/enclave	//Technically it's own armor, but for balance simplicity, it's RCA
	name = "old United States Marine Corp Armor"
	desc = "An advanced model of combat armor worn by marines aboard the USS Democracy, second only to power armor in protection used by the USMC For various tasks and operations, it's handled the nuclear wasteland somewhat better than the rest of the armors you've seen."
	icon_state = "enclave_marine"
	item_state = "enclave_marine"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 20, "bomb" = 25, "bio" = 20, "rad" = 20, "fire" = 25, "acid" = 0, "wound" = 25)

/obj/item/clothing/suit/armor/f13/usmcriot
	name = "old United States Marine Corp riot suit"
	desc = "A pre-war riot suit used by the USCM For various tasks and operations, it's handled the nuclear wasteland somewhat better than the rest of the armors you've seen."
	icon_state = "usmc_riot_gear"
	item_state = "usmc_riot_gear"
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35, "energy" = 35, "bomb" = 20, "bio" = 25, "rad" = 25, "fire" = 20, "acid" = 20, "wound" = 20)

/obj/item/clothing/suit/armor/f13/usmcriot/Initialize(mapload) //HQ parts reinforcement
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/usmcriot/armypilot
	name = "enclave officer pilot suit"
	desc = "A pre-war riot suit, repurposed for duty aboard aircraft."

/obj/item/clothing/suit/armor/f13/enclavetrenchcoat
	name = "enclave officer trenchcoat"
	desc = "Premium prewar military armor worn under a coat for Enclave officers."
	icon_state = "armor_enclave_officer"
	item_state = "armor_enclave_officer"
	armor = list("melee" = 35, "bullet" = 35, "laser" = 35, "energy" = 35, "bomb" = 20, "bio" = 25, "rad" = 25, "fire" = 20, "acid" = 20, "wound" = 20)
	mutantrace_variation = STYLE_DIGITIGRADE

/obj/item/clothing/suit/armor/f13/enclavetrenchcoat/Initialize(mapload) //HQ parts reinforcement
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/suit/armor/f13/environmentalsuit
	name = "enclave envirosuit"
	desc = "An advanced white and airtight environmental suit. It seems to be equipped with a fire-resistant seal and a refitted internals system. This one looks to have been developed by the Enclave sometime after the Great War. You'd usually exclusively see this on scientists of the Enclave."
	icon_state = "envirosuit"
	item_state = "envirosuit"
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.9
	permeability_coefficient = 0.5
	clothing_flags = THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list("melee" = 25, "bullet" = 15, "laser" = 45, "energy" = 15, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 40, "acid" = 40, "wound" = 10)
	strip_delay = 60
	equip_delay_other = 60
	flags_inv = HIDEJUMPSUIT
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE

/obj/item/clothing/suit/armor/f13/combat/mk2/remnant
	name = "remnant combat armor"
	desc = "A dark armor, used commonly in espionage or shadow ops."
	icon_state = "remnant"
	item_state = "remnant"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 50, "energy" = 20, "bomb" = 25, "bio" = 20, "rad" = 20, "fire" = 25, "acid" = 0, "wound" = 25)

//THE GRAVEYARD
//UNUSED or LEGACY - RETAINED IN CASE DESIRED FOR ADMIN SPAWN OR REIMPLEMENATION. MAY NOT BE EVERYTHING THAT'S UNUSED. TEST BEFORE USING
//IF PUT BACK INTO USE, PLEASE FILE IT BACK SOMEWHERE ABOVE

/obj/item/clothing/suit/armor/f13/town/embroidered
	name = "embroidered trenchcoat"
	desc = "A custom armored trench coat with extra-length and a raised collar. There's a flower embroidered onto the back, although the color is a little faded."
	icon_state = "towntrench_special"
	item_state = "towntrench_special"
	armor = list("melee" = 60, "bullet" = 60, "laser" = 60, "energy" = 20, "bomb" = 55, "bio" = 60, "rad" = 10, "fire" = 60, "acid" = 20, "wound" = 10)

/obj/item/clothing/suit/armor/f13/ncr/vetranger/desert
	name = "desert ranger combat armor"
	desc = "This is the original armor the NCR Ranger Combat armor was based off of. An awe inspiring suit of armor used by the legendary Desert Rangers."
	icon_state = "desert_ranger"
	item_state = "desert_ranger"
	mutantrace_variation = STYLE_DIGITIGRADE

//NCR

//Town

/obj/item/clothing/suit/armor/f13/combat/sierra
	name = "mercenary combat armor"
	desc = "An old military grade pre war combat armor, repainted to the colour scheme of the Sierra Trading Company."
	icon = 'icons/fallout/clothing/armored_medium.dmi'
	mob_overlay_icon = 'icons/mob/clothing/suit.dmi'
	icon_state = "combat_armor_sierra"
	item_state = "combat_armor_sierra"

/obj/item/clothing/suit/armor/f13/combat/mk2/sierra
	name = "reinforced mercenary combat armor"
	desc = "A reinforced set of bracers, greaves, and torso plating of prewar design. This one is kitted with additional plates, repainted to the colour scheme of the Sierra Trading Company."
	icon = 'icons/fallout/clothing/armored_medium.dmi'
	mob_overlay_icon = 'icons/mob/clothing/suit.dmi'
	icon_state = "combat_armor_sierra_mk2"
	item_state = "combat_armor_sierra_mk2"
