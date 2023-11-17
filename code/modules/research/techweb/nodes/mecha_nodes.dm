
////////////////////////mech technology////////////////////////

/datum/techweb_node/mech
	id = "mecha"
	display_name = "Mechanical Exosuits"
	description = "Mechanized exosuits that are several magnitudes stronger and more powerful than the average human."
	prereq_ids = list("robotics", "adv_engi")
	design_ids = list("mecha_tracking", "mechacontrol", "mechapower", "mech_recharger")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/mech_tools
	id = "mech_tools"
	starting_node = TRUE
	display_name = "Basic Exosuit Equipment"
	description = "Various tools fit for basic mech units"
	design_ids = list("mech_drill", "mech_mscanner", "mech_extinguisher", "mech_cable_layer", "mech_hydraulic_clamp")

/datum/techweb_node/ripley
	id = "mech_ripley"
	display_name = "EXOSUIT: Ripley"
	description = "Ripley exosuit designs."
	prereq_ids = list("mecha")
	design_ids = list("ripley_chassis", "ripley_torso", "ripley_left_arm", "ripley_right_arm", "ripley_left_leg", "ripley_right_leg", "ripley_main", "ripley_peri")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/clarke
	id = "mech_clarke"
	display_name = "EXOSUIT: Clarke"
	description = "Clarke exosuit designs"
	prereq_ids = list("mecha")
	design_ids = list("clarke_chassis", "clarke_torso", "clarke_head", "clarke_left_arm", "clarke_right_arm", "clarke_left_tread", "clarke_right_tread", "clarke_main", "clarke_peri")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/adv_mecha
	id = "adv_mecha"
	display_name = "Advanced Exosuits"
	description = "For when you just aren't Gundam enough."
	prereq_ids = list("mecha", "adv_robotics")
	design_ids = list("mech_repair_droid")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/odysseus
	id = "mecha_odysseus"
	display_name = "EXOSUIT: Odysseus"
	description = "Odysseus exosuit designs"
	prereq_ids = list("adv_mecha", "adv_biotech")
	design_ids = list("odysseus_chassis", "odysseus_torso", "odysseus_head", "odysseus_left_arm", "odysseus_right_arm" ,"odysseus_left_leg", "odysseus_right_leg",
	"odysseus_main", "odysseus_peri")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/adv_mecha_tools
	id = "adv_mecha_tools"
	display_name = "Advanced Exosuit Equipment"
	description = "Tools for high level mech suits"
	prereq_ids = list("adv_mecha")
	design_ids = list("mech_rcd")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/med_mech_tools
	id = "med_mech_tools"
	display_name = "Medical Exosuit Equipment"
	description = "Tools for high level mech suits"
	prereq_ids = list("adv_biotech")
	design_ids = list("mech_sleeper", "mech_syringe_gun", "mech_medi_beam")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2000)

/datum/techweb_node/mech_modules
	id = "adv_mecha_modules"
	display_name = "Simple Exosuit Modules"
	description = "An advanced piece of mech weaponry"
	prereq_ids = list("adv_mecha", "bluespace_power")
	design_ids = list(/*"mech_energy_relay",*/ "mech_ccw_armor", "mech_proj_armor", "mech_generator_nuclear")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

// ## Uncomment it after projectiles don't runtime anymore
// hello past coder, they no longer runtime
/datum/techweb_node/mech_scattershot
	id = "mecha_tools"
	display_name = "Exosuit Weapon (LBX AC 10 \"Scattershot\")"
	description = "An advanced piece of mech weaponry"
	prereq_ids = list("adv_weaponry")
	design_ids = list("mech_scattershot", "mech_scattershot_ammo")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/mech_seedscatter
	id = "mech_seedscatter"
	display_name = "Exosuit Weapon (Melon Seed \"Scattershot\")"
	description = "An advanced piece of mech weaponry"
	prereq_ids = list("adv_weaponry")
	design_ids = list("mech_seedscatter")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/mech_carbine
	id = "mech_carbine"
	display_name = "Exosuit Weapon (FNX-99 \"Hades\" Carbine)"
	description = "An advanced piece of mech weaponry"
	prereq_ids = list("adv_weaponry")
	design_ids = list("mech_carbine", "mech_carbine_ammo")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/mech_lmg
	id = "mech_lmg"
	display_name = "Exosuit Weapon (\"Ultra AC 2\" LMG)"
	description = "An advanced piece of mech weaponry"
	prereq_ids = list("adv_weaponry")
	design_ids = list("mech_lmg", "mech_lmg_ammo")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)


/datum/techweb_node/mech_ion
	id = "mmech_ion"
	display_name = "Exosuit Weapon (MKIV Ion Heavy Cannon)"
	description = "An advanced piece of mech weaponry"
	prereq_ids = list("adv_weaponry")
	design_ids = list("mech_ion")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/mech_tesla
	id = "mech_tesla"
	display_name = "Exosuit Weapon (MKI Tesla Cannon)"
	description = "An advanced piece of mech weaponry"
	prereq_ids = list("adv_weaponry")
	design_ids = list("mech_tesla")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/mech_laser
	id = "mech_laser"
	display_name = "Exosuit Weapon (CH-PS \"Immolator\" Laser)"
	description = "A basic piece of mech weaponry"
	prereq_ids = list("adv_weaponry")
	design_ids = list("mech_laser")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/mech_laser_heavy
	id = "mech_laser_heavy"
	display_name = "Exosuit Weapon (CH-LC \"Solaris\" Laser Cannon)"
	description = "An advanced piece of mech weaponry"
	prereq_ids = list("adv_weaponry")
	design_ids = list("mech_laser_heavy")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/mech_pulse_rifle
	id = "mech_pulse_rifle"
	display_name = "eZ-13 MK2 heavy pulse rifle"
	description = "An advanced piece of mech weaponry"
	prereq_ids = list("adv_weaponry")
	design_ids = list("mech_pulse_rifle")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/mech_grenade_launcher
	id = "mech_grenade_launcher"
	display_name = "Exosuit Weapon (SGL-6 Grenade Launcher)"
	description = "An advanced piece of mech weaponry"
	prereq_ids = list("adv_weaponry")
	design_ids = list("mech_grenade_launcher", "mech_grenade_launcher_ammo")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/mech_breaching_missile_rack
	id = "mech_breaching_missile_rack"
	display_name = "Exosuit Weapon (BRM-6 Missile Rack)"
	description = "Missile launcher developed for breaching"
	prereq_ids = list("adv_weaponry")
	design_ids = list("mech_breaching_missile_rack", "mech_breaching_missile_rack_ammo")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/mech_missile_rack
	id = "mech_missile_rack"
	display_name = "Exosuit Weapon (SRM-8 Missile Rack)"
	description = "Missile launcher intended for use in active combat"
	prereq_ids = list("adv_weaponry")
	design_ids = list("mech_missile_rack", "mech_missile_rack_ammo")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/*
/datum/techweb_node/clusterbang_launcher
	id = "clusterbang_launcher"
	display_name = "Exosuit Module (SOB-3 Clusterbang Launcher)"
	description = "An advanced piece of mech weaponry"
	prereq_ids = list("adv_weaponry")
	design_ids = list("clusterbang_launcher", "clusterbang_launcher_ammo")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
*/
/datum/techweb_node/mech_teleporter
	id = "mech_teleporter"
	display_name = "Exosuit Module (Teleporter Module)"
	description = "An advanced piece of mech Equipment"
	prereq_ids = list("adv_bluespace")
	design_ids = list("mech_teleporter")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
/*
/datum/techweb_node/mech_wormhole_gen
	id = "mech_wormhole_gen"
	display_name = "Exosuit Module (Localized Wormhole Generator)"
	description = "An advanced piece of mech weaponry"
	prereq_ids = list("adv_bluespace")
	design_ids = list("mech_wormhole_gen")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
*/
/datum/techweb_node/mech_taser
	id = "mech_taser"
	display_name =  "Exosuit Weapon (PBT \"Pacifier\" Mounted Taser)"
	description = "A basic piece of mech weaponry"
	prereq_ids = list("adv_weaponry")
	design_ids = list("mech_taser")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)

/datum/techweb_node/mech_diamond_drill
	id = "mech_diamond_drill"
	display_name =  "Exosuit Diamond Drill"
	description = "A diamond drill fit for a large exosuit"
	prereq_ids = list("adv_mining")
	design_ids = list("mech_diamond_drill")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
