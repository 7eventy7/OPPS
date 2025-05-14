# OPPS - Configuration Reference
## This is a reference document explaining all available configuration options. You don't need to edit this!

## General
### `Enabled`
* **Config**: `true`
* **Default**: `true`
* **Range**: `true/false`
* **Effect**: Controls whether the entire mod is active or inactive.
---
## Fog
### `Enabled`
* **Config**: `true`
* **Default**: `true`
* **Range**: `true/false`
* **Effect**: Controls whether fog customization is active or inactive.
### `StartDistance`
* **Config**: `50000.0`
* **Default**: `0.0`
* **Range**: `1000.0` to `200000.0`
* **Effect**: Higher values push fog farther away creating clearer views; lower values bring fog closer to the camera.
### `ScatteringDistribution`
* **Config**: `0.5`
* **Default**: `0.4`
* **Range**: `0.0` to `1.0`
* **Effect**: Higher values create more directional scattering; lower values give more uniform fog.
### `NearFadeInDistance`
* **Config**: `5000.0`
* **Default**: `0.0`
* **Range**: `0.0` to `10000.0`
* **Effect**: Higher values push fog fade-in further from camera; lower values bring fade-in closer.
### `FogDensity`
* **Config**: `0.025`
* **Default**: `0.005`
* **Range**: `0.0` to `0.1`
* **Effect**: Higher values create thicker, more opaque fog; lower values create thinner, more transparent fog.
### `FogHeightFalloff`
* **Config**: `0.2`
* **Default**: `0.2`
* **Range**: `0.0` to `1.0`
* **Effect**: Higher values make fog diminish more quickly with height; lower values spread fog more evenly with altitude.
---

## VolumetricFog
### `Enabled`
* **Config**: `true`
* **Default**: `true`
* **Range**: `true/false`
* **Effect**: Controls whether volumetric fog effects are active or inactive.
### `Distance`
* **Config**: `6000.0`
* **Default**: `10000.0`
* **Range**: `1000.0` to `20000.0`
* **Effect**: Higher values extend volumetric fog effects further from the camera; lower values limit effects to closer areas.
### `ExtinctionScale`
* **Config**: `1.0`
* **Default**: `1.5`
* **Range**: `0.1` to `5.0`
* **Effect**: Higher values increase light absorption through fog; lower values allow more light to penetrate fog.
---

## Lens Flare
### `Enabled`
* **Config**: `true`
* **Default**: `false`
* **Range**: `true/false`
* **Effect**: Controls whether lens flare effects are active or inactive.
### `Intensity`
* **Config**: `0.05`
* **Default**: `1.0`
* **Range**: `0.00 to 1.00`
* **Effect**: Higher values create more noticeable lens flares; lower values make flares more subtle.
### `BokehSize`
* **Config**: `3.0`
* **Default**: `3.0`
* **Range**: `1.0 to 10.0`
* **Effect**: Higher values make flares appear larger and more diffuse; lower values make flares smaller and focused.
### `Threshold`
* **Config**: `20.0`
* **Default**: `8.0`
* **Range**: `1.0 to 20.0`
* **Effect**: Higher values reduce flares from dimmer light sources; lower values allow more objects to create flares.
---

## Bloom
### `Enabled`
* **Config**: `true`
* **Default**: `false`
* **Range**: `true/false`
* **Effect**: Controls whether bloom effects are active or inactive.
### `Intensity`
* **Config**: `3.0`
* **Default**: `0.675`
* **Range**: `0.0` to `10.0`
* **Effect**: Higher values create stronger glow around bright objects; 0.0 disables bloom entirely.
### `Threshold`
* **Config**: `0.5`
* **Default**: `-1.0`
* **Range**: `0.0` to `1.0`
* **Effect**: Lower values make more objects bloom; higher values restrict bloom to only the brightest elements.
### `SizeScale`
* **Config**: `20.0`
* **Default**: `4.0`
* **Range**: `1.0` to `50.0`
* **Effect**: Higher values create wider, more diffuse bloom; lower values make bloom tighter and focused.

---
## Chromatic Aberration
### `Enabled`
* **Config**: `true`
* **Default**: `false`
* **Range**: `true/false`
* **Effect**: Controls whether chromatic aberration is active or inactive.
### `Intensity`
* **Config**: `0.025`
* **Default**: `0.0`
* **Range**: `0.0` to `0.1`
* **Effect**: Higher values increase color separation at screen edges; 0.0 disables the effect completely.

---
## Sharpening
### `Enabled`
* **Config**: `true`
* **Default**: `false`
* **Range**: `true/false`
* **Effect**: Controls whether image sharpening is active or inactive.
### `Amount`
* **Config**: `1.0`
* **Default**: `0.0`
* **Range**: `0.0` to `3.0`
* **Effect**: Higher values increase edge definition and texture clarity; too high values may cause artifacts.

---
## Ambient Occlusion
### `Enabled`
* **Config**: `true`
* **Default**: `false`
* **Range**: `true/false`
* **Effect**: Controls whether ambient occlusion is active or inactive.
### `Intensity`
* **Config**: `0.5`
* **Default**: `0.5`
* **Range**: `0.0` to `2.0`
* **Effect**: Higher values create stronger shadowing in corners; lower values create subtler shadows.
### `Radius`
* **Config**: `100.0`
* **Default**: `200.0`
* **Range**: `10.0` to `500.0`
* **Effect**: Higher values affect larger areas; lower values create more localized shadowing.
### `Quality`
* **Config**: `50.0`
* **Default**: `50.0`
* **Range**: `0.0` to `100.0`
* **Effect**: Higher values improve the quality but may impact performance; lower values prioritize speed.

---
## Light Sources
### `Enabled`
* **Config**: `true`
* **Default**: `true`
* **Range**: `true/false`
* **Effect**: Controls whether light source distance customization is active or inactive.
### `DistanceScale`
* **Config**: `1`
* **Default**: `1`
* **Range**: `1` to `3`
* **Effect**: Controls how far light sources are visible from the player. Higher values increase the distance at which lights are rendered.

---
## Depth of Field
### `Enabled`
* **Config**: `true`
* **Default**: `false`
* **Range**: `true/false`
* **Effect**: Controls whether depth of field blur is active or inactive.
### `FocalDistance`
* **Config**: `1000.0`
* **Default**: `0.0`
* **Range**: `0.0` to `10000.0`
* **Effect**: Higher values set focus farther away; lower values focus on closer objects.
### `FocalRegion`
* **Config**: `500.0`
* **Default**: `0.0`
* **Range**: `0.0` to `5000.0`
* **Effect**: Higher values create a larger in-focus area; lower values create a narrower focus plane.
### `BokehSize`
* **Config**: `5.0`
* **Default**: `0.0`
* **Range**: `0.0` to `15.0`
* **Effect**: Higher values create larger out-of-focus highlights; lower values create smaller blur circles.
### `NearTransition`
* **Config**: `300.0`
* **Default**: `300.0`
* **Range**: `0.0` to `1000.0`
* **Effect**: Higher values make near-blur transition more gradual; lower values create sharper transitions.
### `FarTransition`
* **Config**: `1000.0`
* **Default**: `500.0`
* **Range**: `0.0` to `5000.0`
* **Effect**: Higher values make far-blur transition more gradual; lower values create sharper transitions.

---
## Dialogue
### `Enabled`
* **Config**: `true`
* **Default**: `true`
* **Range**: `true/false`
* **Effect**: Controls whether dialogue customization features are active or inactive.
### `DialogueScope`
* **Config**: `75.0`
* **Default**: `75.0`
* **Range**: `45.0` to `120.0`
* **Effect**: Controls the camera Field of View when in dialogue. Lower values create a more focused, zoomed-in view; higher values create a wider perspective.
### `DialogueLighting`
* **Config**: `1`
* **Default**: `1`
* **Range**: `0` or `1`
* **Effect**: Controls lighting during dialogues. When set to 0, lighting is disabled during dialogues; when set to 1, lighting is preserved while in dialogue.
### `DialogueEntrySpeed`
* **Config**: `5.0`
* **Default**: `2.0`
* **Range**: `1.0` to `20.0`
* **Effect**: Controls the speed of camera transition when entering dialogue. Higher values create faster transitions; lower values create slower, smoother transitions.

---
## Vignette
### `Enabled`
* **Config**: `true`
* **Default**: `true`
* **Range**: `true/false`
* **Effect**: Controls whether vignette effect is active or inactive.
### `Intensity`
* **Config**: `0.4`
* **Default**: `0.4`
* **Range**: `0.0` to `1.0`
* **Effect**: Higher values darken screen edges more intensely; lower values create a subtler effect.

---
## Film Grain
### `Enabled`
* **Config**: `true`
* **Default**: `false`
* **Range**: `true/false`
* **Effect**: Controls whether film grain effect is active or inactive.
### `Intensity`
* **Config**: `0.1`
* **Default**: `0.0`
* **Range**: `0.0` to `1.0`
* **Effect**: Higher values increase grain visibility; lower values make grain more subtle.
### `Response`
* **Config**: `0.8`
* **Default**: `1.0`
* **Range**: `0.0` to `1.0`
* **Effect**: Higher values make grain respond more to scene brightness; lower values create more uniform grain.

---
## Skylight
### `Enabled`
* **Config**: `true`
* **Default**: `false`
* **Range**: `true/false`
* **Effect**: Controls whether skylight intensity adjustments are active or inactive.
### `IntensityWithRayTracing`
* **Config**: `0.78`
* **Default**: `0.0`
* **Range**: `0.0` to `1.0`
* **Effect**: Higher values create brighter shadows with ray tracing; lower values make shadows darker.
### `IntensityWithoutRayTracing`
* **Config**: `0.52`
* **Default**: `1.0`
* **Range**: `0.0` to `1.0`
* **Effect**: Higher values create brighter shadows without ray tracing; lower values make shadows darker.

---
## Eye Adaptation
### `Enabled`
* **Config**: `true`
* **Default**: `false`
* **Range**: `true/false`
* **Effect**: Controls whether eye adaptation settings are active or inactive.
### `LensAttenuation`
* **Config**: `0.86`
* **Default**: `0.78`
* **Range**: `0.0` to `1.0`
* **Effect**: Higher values slow camera adaptation to brightness changes; lower values create faster adaptation.
### `ExponentialTransition`
* **Config**: `4.2`
* **Default**: `1.5`
* **Range**: `0.1` to `10.0`
* **Effect**: Higher values create more dramatic transitions between dark/bright areas; lower values are subtler.
### `MethodOverride`
* **Config**: `2`
* **Default**: `-1`
* **Range**: `0`, `1`, or `2`
* **Effect**: Sets the eye adaptation algorithm (2 is recommended for best results).

---
## Reflections
### `Mode`
* **Config**: `ScreenSpace`
* **Default**: `ScreenSpace`
* **Range**: `RayTracing`/`ScreenSpace`
* **Effect**: Controls the reflection method used. RayTracing uses ray-traced reflections for higher quality, while ScreenSpace uses traditional screen space reflections.
---
## RayTracing Parameters
### `CullingRadius`
* **Config**: `60000`
* **Default**: `30000.0`
* **Range**: `1000` to `100000`
* **Effect**: Controls the radius at which ray traced reflections are culled. Higher values show reflections at greater distances.
### `SampleFog`
* **Config**: `1`
* **Default**: `0`
* **Range**: `0`/`1`
* **Effect**: When set to 1, ray traced reflections will sample fog; when 0, reflections ignore fog effects.
---
## ScreenSpace Parameters
### `SSQuality`
* **Config**: `50.0`
* **Default**: `50.0`
* **Range**: `0.0` to `100.0`
* **Effect**: Higher values improve screen space reflection quality at performance cost; lower values prioritize performance.
### `SSMaxRoughness`
* **Config**: `0.2`
* **Default**: `0.6`
* **Range**: `0.0` to `1.0`
* **Effect**: Higher values show reflections on rougher surfaces; lower values limit reflections to smoother surfaces.
### `SSIntensity`
* **Config**: `0.3`
* **Default**: `100.0`
* **Range**: `0.0` to `2.0`
* **Effect**: Higher values create stronger reflections; lower values make reflections more subtle.