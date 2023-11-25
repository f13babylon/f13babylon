/// Module is compatible with Security Cyborg models
#define BORG_MODULE_SECURITY 		(1<<0)
/// Module is compatible with Miner Cyborg models
#define BORG_MODULE_MINER			(1<<1)
/// Module is compatible with Janitor Cyborg models
#define BORG_MODULE_JANITOR			(1<<2)
/// Module is compatible with Medical Cyborg models
#define BORG_MODULE_MEDICAL			(1<<3)
/// Module is compatible with Engineering Cyborg models
#define BORG_MODULE_ENGINEERING		(1<<4)

/// Module is compatible with Ripley Exosuit models
#define EXOSUIT_MODULE_RIPLEY		(1<<0)
/// Module is compatible with Odyseeus Exosuit models
#define EXOSUIT_MODULE_ODYSSEUS		(1<<1)
/// Module is compatible with Clarke Exosuit models. Rebranded to firefighter because tg nerfed it to this.
#define EXOSUIT_MODULE_FIREFIGHTER	(1<<2)

/// Module is compatible with "Working" Exosuit models - Ripley and Clarke
#define EXOSUIT_MODULE_WORKING		EXOSUIT_MODULE_RIPLEY | EXOSUIT_MODULE_FIREFIGHTER // | EXOSUIT_MODULE_CLARKE

#define EXOSUIT_MODULE_MEDICAL		EXOSUIT_MODULE_ODYSSEUS
