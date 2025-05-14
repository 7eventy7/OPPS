-- Effects.lua
--- Manages post-processing effects (except for Depth of Field)

local module = {}

function module.ApplyNonDoFEffects(postProcess, config, effectsEnabled)
    module.ResetPostProcessEffects(postProcess)
    
    if config["LensFlare"] and config["LensFlare"].Enabled == "true" then
        postProcess.Settings.bOverride_LensFlareIntensity = true
        postProcess.Settings.bOverride_LensFlareBokehSize = true
        postProcess.Settings.bOverride_LensFlareThreshold = true
        postProcess.Settings.LensFlareIntensity = tonumber(config["LensFlare"].Intensity)
        postProcess.Settings.LensFlareBokehSize = tonumber(config["LensFlare"].BokehSize)
        postProcess.Settings.LensFlareThreshold = tonumber(config["LensFlare"].Threshold)
    end
    
    if config["Bloom"] and config["Bloom"].Enabled == "true" then
        postProcess.Settings.bOverride_BloomIntensity = true
        postProcess.Settings.bOverride_BloomThreshold = true
        postProcess.Settings.bOverride_BloomSizeScale = true
        postProcess.Settings.BloomIntensity = tonumber(config["Bloom"].Intensity)
        postProcess.Settings.BloomThreshold = tonumber(config["Bloom"].Threshold)
        postProcess.Settings.BloomSizeScale = tonumber(config["Bloom"].SizeScale)
    end
    
    if config["ChromaticAberration"] and config["ChromaticAberration"].Enabled == "true" then
        postProcess.Settings.bOverride_SceneFringeIntensity = true
        postProcess.Settings.SceneFringeIntensity = tonumber(config["ChromaticAberration"].Intensity)
    end
    
    if config["Sharpening"] and config["Sharpening"].Enabled == "true" then
        postProcess.Settings.bOverride_Sharpen = true
        postProcess.Settings.Sharpen = tonumber(config["Sharpening"].Amount)
    end

    if config["AmbientOcclusion"] and config["AmbientOcclusion"].Enabled == "true" then
        postProcess.Settings.bOverride_AmbientOcclusionIntensity = true
        postProcess.Settings.bOverride_AmbientOcclusionRadius = true
        postProcess.Settings.bOverride_AmbientOcclusionQuality = true
        postProcess.Settings.AmbientOcclusionIntensity = tonumber(config["AmbientOcclusion"].Intensity)
        postProcess.Settings.AmbientOcclusionRadius = tonumber(config["AmbientOcclusion"].Radius)
        postProcess.Settings.AmbientOcclusionQuality = tonumber(config["AmbientOcclusion"].Quality)
    end
    
    if config["Vignette"] and config["Vignette"].Enabled == "true" then
        postProcess.Settings.bOverride_VignetteIntensity = true
        postProcess.Settings.VignetteIntensity = tonumber(config["Vignette"].Intensity)
    end
    
    if config["Reflections"] then
        if config["Reflections"].Mode == "ScreenSpace" then
            postProcess.Settings.bOverride_ScreenSpaceReflectionQuality = true
            postProcess.Settings.bOverride_ScreenSpaceReflectionMaxRoughness = true
            postProcess.Settings.bOverride_ScreenSpaceReflectionIntensity = true
            postProcess.Settings.ScreenSpaceReflectionQuality = tonumber(config["Reflections"].SSQuality)
            postProcess.Settings.ScreenSpaceReflectionMaxRoughness = tonumber(config["Reflections"].SSMaxRoughness)
            postProcess.Settings.ScreenSpaceReflectionIntensity = tonumber(config["Reflections"].SSIntensity)
        else
            postProcess.Settings.bOverride_ScreenSpaceReflectionQuality = false
            postProcess.Settings.bOverride_ScreenSpaceReflectionMaxRoughness = false
            postProcess.Settings.bOverride_ScreenSpaceReflectionIntensity = false
        end
    end
    
    if config["FilmGrain"] and config["FilmGrain"].Enabled == "true" then
        postProcess.Settings.bOverride_FilmGrainIntensity = true
        postProcess.Settings.bOverride_FilmGrainIntensityShadows = true
        postProcess.Settings.FilmGrainIntensity = tonumber(config["FilmGrain"].Intensity)
        postProcess.Settings.FilmGrainIntensityShadows = tonumber(config["FilmGrain"].Response)
    end
end

function module.ResetPostProcessEffects(postProcess)
    postProcess.Settings.bOverride_LensFlareIntensity = false
    postProcess.Settings.bOverride_LensFlareBokehSize = false
    postProcess.Settings.bOverride_LensFlareThreshold = false
    postProcess.Settings.bOverride_BloomIntensity = false
    postProcess.Settings.bOverride_BloomThreshold = false
    postProcess.Settings.bOverride_BloomSizeScale = false
    postProcess.Settings.bOverride_SceneFringeIntensity = false
    postProcess.Settings.bOverride_Sharpen = false
    postProcess.Settings.bOverride_AmbientOcclusionIntensity = false
    postProcess.Settings.bOverride_AmbientOcclusionRadius = false
    postProcess.Settings.bOverride_AmbientOcclusionQuality = false
    postProcess.Settings.bOverride_VignetteIntensity = false
    postProcess.Settings.bOverride_ScreenSpaceReflectionQuality = false
    postProcess.Settings.bOverride_ScreenSpaceReflectionMaxRoughness = false
    postProcess.Settings.bOverride_ScreenSpaceReflectionIntensity = false
    postProcess.Settings.bOverride_FilmGrainIntensity = false
    postProcess.Settings.bOverride_FilmGrainIntensityShadows = false
    postProcess.Settings.bOverride_WhiteTemp = false
    postProcess.Settings.bOverride_BlueCorrection = false
    postProcess.Settings.bOverride_DepthOfFieldFocalDistance = false
    postProcess.Settings.bOverride_DepthOfFieldFocalRegion = false
    postProcess.Settings.bOverride_DepthOfFieldNearTransitionRegion = false
    postProcess.Settings.bOverride_DepthOfFieldFarTransitionRegion = false
    postProcess.Settings.bOverride_DepthOfFieldScale = false
end

return module