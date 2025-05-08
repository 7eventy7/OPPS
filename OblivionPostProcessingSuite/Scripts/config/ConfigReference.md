# OPPS - Configuration Reference

## Reference Format
`Parameter = Default Value`
`Range: min to max`
`Short description of how changing the parameter effects the visuals.`

## General

`Enabled = true`
`Range: true/false`
`Controls whether the entire mod is active or inactive.`

## Fog

`Enabled = true`
`Range: true/false`
`Controls whether fog customization is active or inactive.`

`StartDistance = 50000.0`
`Range: 1000.0 to 200000.0`
`Higher values push fog farther away creating clearer views; lower values bring fog closer to the camera.`

`ScatteringDistribution = 0.5`
`Range: 0.0 to 1.0`
`Higher values create more directional scattering; lower values give more uniform fog.`

`NearFadeInDistance = 5000.0`
`Range: 0.0 to 10000.0`
`Higher values push fog fade-in further from camera; lower values bring fade-in closer.`

`FogDensity = 0.025`
`Range: 0.0 to 0.1`
`Higher values create thicker, more opaque fog; lower values create thinner, more transparent fog.`

`FogHeightFalloff = 0.2`
`Range: 0.0 to 1.0`
`Higher values make fog diminish more quickly with height; lower values spread fog more evenly with altitude.`

`VolumetricFogDistance = 6000.0`
`Range: 1000.0 to 20000.0`
`Higher values extend volumetric fog effects further from the camera; lower values limit effects to closer areas.`

`VolumetricFogExtinctionScale = 1.0`
`Range: 0.1 to 5.0`
`Higher values increase light absorption through fog; lower values allow more light to penetrate fog.`

## Lens Flare

`Enabled = true`
`Range: true/false`
`Controls whether lens flare effects are active or inactive.`

`Intensity = 0.1`
`Range: 0.0 to 1.0`
`Higher values create more noticeable lens flares; lower values make flares more subtle.`

`BokehSize = 5.0`
`Range: 1.0 to 10.0`
`Higher values make flares appear larger and more diffuse; lower values make flares smaller and focused.`

`Threshold = 16.0`
`Range: 1.0 to 20.0`
`Higher values reduce flares from dimmer light sources; lower values allow more objects to create flares.`

## Bloom

`Enabled = true`
`Range: true/false`
`Controls whether bloom effects are active or inactive.`

`Intensity = 5.0`
`Range: 0.0 to 10.0`
`Higher values create stronger glow around bright objects; 0.0 disables bloom entirely.`

`Threshold = 0.5`
`Range: 0.0 to 1.0`
`Lower values make more objects bloom; higher values restrict bloom to only the brightest elements.`

`SizeScale = 20.0`
`Range: 1.0 to 50.0`
`Higher values create wider, more diffuse bloom; lower values make bloom tighter and focused.`

## Chromatic Aberration

`Enabled = true`
`Range: true/false`
`Controls whether chromatic aberration is active or inactive.`

`Intensity = 0.025`
`Range: 0.0 to 0.1`
`Higher values increase color separation at screen edges; 0.0 disables the effect completely.`

## Sharpening

`Enabled = true`
`Range: true/false`
`Controls whether image sharpening is active or inactive.`

`Amount = 1.0`
`Range: 0.0 to 3.0`
`Higher values increase edge definition and texture clarity; too high values may cause artifacts.`

## Ambient Occlusion

`Enabled = true`
`Range: true/false`
`Controls whether ambient occlusion is active or inactive.`

`Intensity = 0.5`
`Range: 0.0 to 2.0`
`Higher values create stronger shadowing in corners; lower values create subtler shadows.`

`Radius = 100.0`
`Range: 10.0 to 500.0`
`Higher values affect larger areas; lower values create more localized shadowing.`

`Quality = 50.0`
`Range: 0.0 to 100.0`
`Higher values improve the quality but may impact performance; lower values prioritize speed.`

## Depth of Field

`Enabled = true`
`Range: true/false`
`Controls whether depth of field blur is active or inactive.`

`FocalDistance = 1000.0`
`Range: 0.0 to 10000.0`
`Higher values set focus farther away; lower values focus on closer objects.`

`FocalRegion = 500.0`
`Range: 0.0 to 5000.0`
`Higher values create a larger in-focus area; lower values create a narrower focus plane.`

`BokehSize = 5.0`
`Range: 0.0 to 15.0`
`Higher values create larger out-of-focus highlights; lower values create smaller blur circles.`

`NearTransition = 300.0`
`Range: 0.0 to 1000.0`
`Higher values make near-blur transition more gradual; lower values create sharper transitions.`

`FarTransition = 1000.0`
`Range: 0.0 to 5000.0`
`Higher values make far-blur transition more gradual; lower values create sharper transitions.`

## Vignette

`Enabled = true`
`Range: true/false`
`Controls whether vignette effect is active or inactive.`

`Intensity = 0.4`
`Range: 0.0 to 1.0`
`Higher values darken screen edges more intensely; lower values create a subtler effect.`

## Film Grain

`Enabled = true`
`Range: true/false`
`Controls whether film grain effect is active or inactive.`

`Intensity = 0.1`
`Range: 0.0 to 1.0`
`Higher values increase grain visibility; lower values make grain more subtle.`

`Response = 0.8`
`Range: 0.0 to 1.0`
`Higher values make grain respond more to scene brightness; lower values create more uniform grain.`

## Skylight

`Enabled = true`
`Range: true/false`
`Controls whether skylight intensity adjustments are active or inactive.`

`IntensityWithRayTracing = 0.78`
`Range: 0.0 to 1.0`
`Higher values create brighter shadows with ray tracing; lower values make shadows darker.`

`IntensityWithoutRayTracing = 0.52`
`Range: 0.0 to 1.0`
`Higher values create brighter shadows without ray tracing; lower values make shadows darker.`

## Eye Adaptation

`Enabled = true`
`Range: true/false`
`Controls whether eye adaptation settings are active or inactive.`

`LensAttenuation = 0.86`
`Range: 0.0 to 1.0`
`Higher values slow camera adaptation to brightness changes; lower values create faster adaptation.`

`ExponentialTransition = 4.2`
`Range: 0.1 to 10.0`
`Higher values create more dramatic transitions between dark/bright areas; lower values are subtler.`

`MethodOverride = 2`
`Range: 0, 1, or 2`
`Sets the eye adaptation algorithm (2 is recommended for best results).`

## Reflections

`Mode = ScreenSpace`
`Range: RayTracing/ScreenSpace`
`Controls the reflection method used. RayTracing uses ray-traced reflections for higher quality, while ScreenSpace uses traditional screen space reflections.`

### RayTracing Parameters

`CullingRadius = 60000`
`Range: 1000 to 100000`
`Controls the radius at which ray traced reflections are culled. Higher values show reflections at greater distances.`

`SampleFog = 1`
`Range: 0/1`
`When set to 1, ray traced reflections will sample fog; when 0, reflections ignore fog effects.`

### ScreenSpace Parameters

`SSQuality = 25.0`
`Range: 0.0 to 100.0`
`Higher values improve screen space reflection quality at performance cost; lower values prioritize performance.`

`SSMaxRoughness = 0.2`
`Range: 0.0 to 1.0`
`Higher values show reflections on rougher surfaces; lower values limit reflections to smoother surfaces.`

`SSIntensity = 0.3`
`Range: 0.0 to 2.0`
`Higher values create stronger reflections; lower values make reflections more subtle.`