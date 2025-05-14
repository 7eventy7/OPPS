# OPPS - Mod Changelog
## See what has changed in every publicly releaed version of the Oblivion Post Processing Suite.

## 1.0.0
- Initial mod release

## 1.1.0
- Added hotkey to toggle suite visuals
- Post Processing effects now apply indoors
- Depth of Field is now disabled during dialogue

## 1.2.0
- Refactored code into modules to simplify maintenance
- Fixed standardized naming of several effects
- Fixed fog not getting disabled on hotkey press
- Moved all enduser configuration files to /config
- Moved ScreenSpace to new Reflections module
- Added RayTracing to new Reflections module
- Added new fog parameter: FogDensity
- Added new fog parameter: FogHeightFalloff
- Added new fog parameter: VolumetricFogDistance
- Added new fog parameter: VolumetricFogExtinctionScale

## 1.3.0
- Added ALT+O hotkey to toggle hot reload config
- Added ALT+P hotkey to toggle in game hud
- Added full UE4SS path to support mod managers
- Added new file to read the vanilla values: defaults.ini
- Added new module: LightSources
- Added new parameter: DialogueScope
- Added new parameter: DialogueLighting
- Added new parameter: DialogueEntrySpeed
- Moved DialogueState to new module: Dialogue
- Moved some fog paramaters to new module: VolumetricFog
- Changed default Bloom Intensity to 3.0
- Changed default SSQuality to 50.0
- Changed default LensFlare Intensity to 0.05
- Changed default LensFlare BokehSize to 3.0
- Changed default LensFlare Threshold to 20.0
- Fixed crashing to desktop when loading certain areas
- Reformatted ConfigReference.md for better readibility