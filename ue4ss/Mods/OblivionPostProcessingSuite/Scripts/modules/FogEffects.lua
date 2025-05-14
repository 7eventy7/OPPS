-- FogEffects.lua
---- Manages fog-related effects and components

local module = {}

function module.ApplyFogSettings(fogComponent, config, effectsEnabled)
    if not config["Fog"] or config["Fog"].Enabled ~= "true" then
        return
    end
    
    fogComponent.StartDistance = config["Fog"].StartDistance and tonumber(config["Fog"].StartDistance) or 0.0
    fogComponent.VolumetricFogScatteringDistribution = config["Fog"].ScatteringDistribution and tonumber(config["Fog"].ScatteringDistribution) or 0.2
    fogComponent.VolumetricFogNearFadeInDistance = config["Fog"].NearFadeInDistance and tonumber(config["Fog"].NearFadeInDistance) or 0.0
    fogComponent.FogDensity = config["Fog"].FogDensity and tonumber(config["Fog"].FogDensity) or 0.025
    fogComponent.FogHeightFalloff = config["Fog"].FogHeightFalloff and tonumber(config["Fog"].FogHeightFalloff) or 0.2
    
    fogComponent.VolumetricFogDistance = config["VolumetricFog"] and config["VolumetricFog"].Distance and tonumber(config["VolumetricFog"].Distance) or 6000.0
    fogComponent.VolumetricFogExtinctionScale = config["VolumetricFog"] and config["VolumetricFog"].ExtinctionScale and tonumber(config["VolumetricFog"].ExtinctionScale) or 1.0
end

function module.UpdateAllFogEffects(config, effectsEnabled)
    local fogComponents = FindAllOf("ExponentialHeightFogComponent")
    if not fogComponents then
        return
    end
    
    if not config["Fog"] or config["Fog"].Enabled ~= "true" then
        return
    end
    
    for _, fogComp in ipairs(fogComponents) do
        module.ApplyFogSettings(fogComp, config, effectsEnabled)
    end
end

function module.SetupFogComponentHandler(config, getEffectsEnabledFn)
    NotifyOnNewObject("/Script/Engine.ExponentialHeightFogComponent", function(exponentialHeightFogComponent)
        ExecuteWithDelay(500, function()
            module.ApplyFogSettings(exponentialHeightFogComponent, config, true)
        end)
    end)
end

return module