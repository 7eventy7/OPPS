-- FogEffects.lua
---- Manages fog-related effects and components

local module = {}

function module.ResetFogSettings(fogComponent)
    -- Reset fog to standard game defaults
    fogComponent.StartDistance = 0.0
    fogComponent.VolumetricFogScatteringDistribution = 0.2
    fogComponent.VolumetricFogNearFadeInDistance = 0.0
    fogComponent.FogDensity = 0.025
    fogComponent.FogHeightFalloff = 0.2
    fogComponent.VolumetricFogDistance = 6000.0
    fogComponent.VolumetricFogExtinctionScale = 1.0
end

function module.ApplyFogSettings(fogComponent, config, effectsEnabled)
    if not effectsEnabled or not config["Fog"] or config["Fog"].Enabled ~= "true" then
        module.ResetFogSettings(fogComponent)
        return
    end
    
    -- Apply all fog parameters with fallbacks to default values if missing from config
    fogComponent.StartDistance = config["Fog"].StartDistance and tonumber(config["Fog"].StartDistance) or 0.0
    fogComponent.VolumetricFogScatteringDistribution = config["Fog"].ScatteringDistribution and tonumber(config["Fog"].ScatteringDistribution) or 0.2
    fogComponent.VolumetricFogNearFadeInDistance = config["Fog"].NearFadeInDistance and tonumber(config["Fog"].NearFadeInDistance) or 0.0
    fogComponent.FogDensity = config["Fog"].FogDensity and tonumber(config["Fog"].FogDensity) or 0.025
    fogComponent.FogHeightFalloff = config["Fog"].FogHeightFalloff and tonumber(config["Fog"].FogHeightFalloff) or 0.2
    fogComponent.VolumetricFogDistance = config["Fog"].VolumetricFogDistance and tonumber(config["Fog"].VolumetricFogDistance) or 6000.0
    fogComponent.VolumetricFogExtinctionScale = config["Fog"].VolumetricFogExtinctionScale and tonumber(config["Fog"].VolumetricFogExtinctionScale) or 1.0
end

function module.UpdateAllFogEffects(config, effectsEnabled)
    local fogComponents = FindAllOf("ExponentialHeightFogComponent")
    if not fogComponents then
        return
    end
    
    if not effectsEnabled then
        -- Actively reset all fog components when effects are disabled
        for _, fogComp in ipairs(fogComponents) do
            module.ResetFogSettings(fogComp)
        end
        return
    end
    
    if not config["Fog"] or config["Fog"].Enabled ~= "true" then
        -- Reset fog if the fog feature is explicitly disabled in config
        for _, fogComp in ipairs(fogComponents) do
            module.ResetFogSettings(fogComp)
        end
        return
    end
    
    for _, fogComp in ipairs(fogComponents) do
        module.ApplyFogSettings(fogComp, config, effectsEnabled)
    end
end

function module.SetupFogComponentHandler(config, getEffectsEnabledFn)
    NotifyOnNewObject("/Script/Engine.ExponentialHeightFogComponent", function(exponentialHeightFogComponent)
        ExecuteWithDelay(500, function()
            -- Get the current effects state when the callback is executed
            local currentEffectsEnabled = getEffectsEnabledFn()
            module.ApplyFogSettings(exponentialHeightFogComponent, config, currentEffectsEnabled)
        end)
    end)
end

return module