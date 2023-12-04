## MAPS

All maps have their own code file that is in the base of the `_maps` directory, or elsewhere in the codebase. For example, all of the station maps in rotation each have a corresponding JSON file and are loaded using the server's configuration passed onto the Mapping subsystem. Maps are loaded dynamically when the game starts. Follow this guideline when adding your own map, to your fork, for easy compatibility.

The map that will be loaded for the upcoming round is determined by reading `data/next_map.json`, which is a copy of the JSON files found in the `_maps` tree. If this file does not exist, the default map from `config/maps.txt` will be loaded. Failing that, Pahrump will be loaded. If you want to set a specific map to load next round you can use the Change Map verb in game before restarting the server or copy a JSON from `_maps` to `data/next_map.json` before starting the server. Also, for debugging purposes, ticking a corresponding map's code file in Dream Maker will force that map to load every round.

If you are hosting a server, and want randomly picked maps to be played each round, you can enable map rotation in `config/config.txt` and then set the maps to be picked in the `config/maps.txt` file.

## EDITING MAPS

### [Click here for a Quick-Start Guide To Mapping.](https://hackmd.io/@tgstation/SyVma0dS5)

<b>It is absolutely inadvisable to <i>ever</i> use the mapping utility offered by Dream Maker</b>. It is clunky and dated software that will steal your time, patience, and creative desires.

Instead, /tg/station map maintainers will always recommend using one of two modern and actively maintained programs.

-   [StrongDMM](https://github.com/SpaiR/StrongDMM) (Windows/Linux/MacOS)
-   [FastDMM2](https://github.com/monster860/FastDMM2) (Web-based Utility)

Both of the above programs have native TGM support, which is mandatory for all maps being submitted to this repository. Anytime you want to make changes to a map, it is imperative you use the [Map Merging tools](https://tgstation13.org/wiki/Map_Merger). When you clone your repository onto your machine for mapping, it's always a great idea to run `tools/hooks/Install.bat` at the very start of your mapping endeavors, as this will install Git hooks that help you automatically resolve any merge conflicts that come up while mapping.

## MAP DEPOT

For sentimental purposes, /tg/station hosts a [Map Depot](https://github.com/tgstation/map_depot) for any unused maps since retired from active use in the codebase. A lot of maps present in said depot do get severely outdated within weeks of their initial uploading, so do keep in mind that a bit of setup is required since active maintenance is not enforced there the same way as this repository.
