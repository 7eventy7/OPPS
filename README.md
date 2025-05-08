![opps-header](https://github.com/user-attachments/assets/e0ce1637-ee0a-4cd5-8a14-c44a0a979214)

# OPPS - Oblivion Post Processing Suite

## Overview

A suite of extensively configurable parameters to fine-tune visual effects and post processing inside Unreal Engine. The default configuration pushes outdoor fog back to reveal more of the landscape, deepens shadows from lumen, and adds subtle lens flares to light sources. These are just some of the highlights, there are other subtle changes that you can configure if you'd like! Most visual effects in this mod have more than one parameter to alter their characteristics; currently this mod allows you to configure:

- Fog
- Lens Flare
- Bloom
- Chromatic Aberration
- Sharpening
- Ambient Occlusion
- Depth of Field
- Vignette
- Reflections
- Film Grain
- Skylight
- Eye Adaptation

## Notes

- This suite looks best when paired with a ReShade, my current favorite is: *[A Painted World Remastered](https://www.nexusmods.com/oblivionremastered/mods/44)*
- Use the hotkey *<u>ALT+P</u>* to toggle all the visual post processing effects available in the suite
- RayTracing mode in the Reflections module requires hardware lumen and is disabled by default

## Purpose

- Provides a configuration that enhances the Oblivion Remastered vanilla graphics, designed to complement your favorite ReShade preset
- Offers a starting point and customizable suite of post-processing options for mod authors and users to create their perfect visual experience

## Installation

1. Install [UE4SS](https://www.nexusmods.com/oblivionremastered/mods/32) following their guide
2. Download and extract this mod
3. Place the "OblivionPostProcessingSuite" folder into your UE4SS Mods folder:  
   ***Oblivion Remastered/OblivionRemastered/Binaries/Win64/ue4ss/Mods/***
4. Verify you have the following folder structure:  
   ***Oblivion Remastered/OblivionRemastered/Binaries/Win64/ue4ss/Mods/OblivionPostProcessingSuite/***

## Configuration

Customizing the mod is quite simple, both important files can be found in **/Scripts/config:**

- Simply open the **config.ini** file in any text editor and adjust the values to your desired preference, don't be afraid to tinker around with it
- Refer to the **ConfigHelper.md** file which provides value ranges and descriptions for each parameter, making it easy to fine-tune your settings

If you wish to edit just the fog, a single parameter change is usually enough for most users, see the following: *[Fog Reference](https://imgur.com/gallery/opps-oblivion-post-processing-suite-fog-reference-T6lMfeh)*

## Credits

This mod was inspired by and builds upon the excellent work of:

- [Xorberax's Clarity](https://www.nexusmods.com/oblivionremastered/mods/2338) - For pioneering the visual effect changes that make this mod possible
- [Lumen Remastered](https://www.nexusmods.com/oblivionremastered/mods/1129) - For inspiring the intuitive approach to lua scripting configuration

## Compatibility

Compatible with any mods that do not edit Unreal Engine visual effects. Works best alongside ReShade presets to recolor the world environment.


## Contributing

We welcome contributions to the Oblivion Post Processing Suite! Whether you're fixing bugs, adding new features, or improving documentation, your help is appreciated. To contribute, simply fork the repository, make your changes, and submit a pull request. For major changes, please open an issue first to discuss what you'd like to change. Be sure to test your modifications thoroughly before submitting. Join our community and help make OPPS even better!
