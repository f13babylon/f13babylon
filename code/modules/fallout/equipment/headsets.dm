//FALLOUT
/obj/item/radio/headset/headset_overseer
	name = "\proper the overseer's radio headset"
	desc = "This is used by the vault overseer.\nChannels are as follows: .b - Vault, .c - Command, .s - Security, .e - Engineering, .m - Medical, .n - Science."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_overseer
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE

/obj/item/radio/headset/headset_vault_hos
	name = "\proper the chief of security's radio headset"
	desc = "The headset of the man in charge of keeping order and protecting the vault.\nChannels are as follows: .b - Vault, .c - Command, .s - Security."
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault_hos
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE

/obj/item/radio/headset/headset_vault_hos/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_vault
	name = "\proper vault radio headset"
	desc = "A vault-tec radio.\nUse .b To access the Vault channel."
	keyslot = new /obj/item/encryptionkey/headset_vault
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE

/obj/item/radio/headset/headset_vaultsec
	name = "security radio headset"
	desc = "This is used by your elite security force.\nChannels are as follows: .b - Vault, .s - Security."
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/headset_vault_security
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE

/obj/item/radio/headset/headset_vaultsec/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_vault_hos/alt
	name = "\proper the head of security's bowman headset"
	desc = "The headset of the man in charge of keeping order and protecting the station. Protects ears from flashbangs.\nChannels are as follows: .b - Vault, .c - Command, .s - Security."
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"
	frequency = FREQ_VAULT
	freerange = TRUE
	freqlock = TRUE

/obj/item/radio/headset/headset_ncr
	name = "\improper NCR radio headset"
	desc = "This is used by the New California Republic.\nUse .w To access the NCR channel."
	icon_state = "mine_headset"
	keyslot = new /obj/item/encryptionkey/headset_ncr
	linked_faction = FACTION_NCR
	factionized = TRUE

/obj/item/radio/headset/headset_ranger
	name = "ranger radio headset"
	desc = "This is used by the Rangers of the New California Republic.\nChannels are as follows: .w - NCR, .r - Ranger."
	icon_state = "mine_headset"
	keyslot = new /obj/item/encryptionkey/headset_ranger
	linked_faction = FACTION_NCR
	factionized = TRUE

/obj/item/radio/headset/headset_ncr/command
	name = "\improper NCR command radio headset"
	desc = "This is used by the Command of the New California Republic. Protects ears from flashbangs.\nChannels are as follows: .w - NCR, .r - Ranger."
	icon_state = "com_headset_alt"
	item_state = "com_headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_ranger
	command = TRUE

/obj/item/radio/headset/headset_ncr/command/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_legion
	name = "legion radio headset"
	desc = "This is used by Caesar's Legion.\nUse .l To access the Legion channel."
	icon_state = "sec_headset"
	item_state = "headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_legion
	linked_faction = FACTION_LEGION
	factionized = TRUE

/obj/item/radio/headset/headset_legion/command
	desc = "This is used by the Command of Caesar's Legion. Protects ears from flashbangs.\nUse .l To access the Legion channel."
	icon_state = "sec_headset_alt"
	item_state = "sec_headset_alt"
	command = TRUE

/obj/item/radio/headset/headset_legion/command/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_bos
	name = "brotherhood radio headset"
	desc = "This is used by the Brotherhood of Steel. Protects ears from flashbangs.\nUse .q To access the Brotherhood channel."
	icon_state = "cent_headset"
	keyslot = new /obj/item/encryptionkey/headset_bos
	linked_faction = FACTION_BROTHERHOOD
	factionized = TRUE

/obj/item/radio/headset/headset_bos/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_bos/command
	name = "brotherhood command radio headset"
	desc = "This is used by the leaders of the Brotherhood of Steel. Protects ears from flashbangs.\nUse .q To access the Brotherhood channel."
	command = TRUE
	icon_state = "cent_headset_alt"

/obj/item/radio/headset/headset_enclave
	name = "enclave radio headset"
	desc = "This is used by the Enclave. Protects ears from flashbangs.\nUse .z To access the Enclave channel."
	icon_state = "syndie_headset"
	keyslot = new /obj/item/encryptionkey/headset_enclave
	linked_faction = FACTION_ENCLAVE
	factionized = TRUE

/obj/item/radio/headset/headset_enclave/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_EARS))

/obj/item/radio/headset/headset_enclave/command
	name = "enclave command radio headset"
	desc = "This is used by the Command of the Enclave. Protects ears from flashbangs.\nUse .z To access the Enclave channel."
	command = TRUE

/obj/item/radio/headset/headset_khans
	name = "khan radio headset"
	desc = "This is used by the Khans.\nUse .a To access the Khan channel."
	icon_state = "syndie_headset"
	item_state = "headset_alt"
	keyslot = new /obj/item/encryptionkey/headset_khans

/obj/item/radio/headset/headset_town
	name = "town radio headset"
	desc = "This is used by the town.\nUse .f To access the Town channel."
	icon_state = "mine_headset"
	keyslot = new /obj/item/encryptionkey/headset_town

/obj/item/radio/headset/headset_sheriff
	name = "peacekeeper radio headset"
	desc = "This is used by the peacekeeping force of the town.\nChannels are as follows: .f - Town, .s - Security."
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/headset_sec
	keyslot2 = new /obj/item/encryptionkey/headset_town

/obj/item/radio/headset/headset_followers
	name = "followers radio headset"
	desc = "This is used by the followers.\nChannels are as follows: .f - Town, .m - Medical."
	icon_state = "med_headset"
	keyslot = new /obj/item/encryptionkey/headset_med
	keyslot2 = new /obj/item/encryptionkey/headset_town

/obj/item/radio/headset/headset_den
	name = "den radio headset"
	desc = "This is used by the den.\nUse .j To access the Den channel."
	icon_state = "mine_headset"
	keyslot = new /obj/item/encryptionkey/headset_den

/obj/item/radio/headset/headset_cent
	name = "\improper Vault-Tec headset"
	desc = "A headset used by the upper echelons of Vault-Tec.\nUse .y To access the Vault-Tec channel."
	icon_state = "cent_headset"
	keyslot = new /obj/item/encryptionkey/headset_com
	keyslot2 = new /obj/item/encryptionkey/headset_cent

/obj/item/radio/headset/headset_cent/empty
	keyslot = null
	keyslot2 = null

/obj/item/radio/headset/headset_cent/commander
	keyslot = new /obj/item/encryptionkey/heads/captain

/obj/item/radio/headset/headset_cent/alt
	name = "\improper Vault-Tec bowman headset"
	desc = "A headset especially for emergency response personnel. Protects ears from flashbangs.\nUse .y To access the Vault-Tec channel."
	icon_state = "cent_headset_alt"
	item_state = "cent_headset_alt"
	keyslot = null
