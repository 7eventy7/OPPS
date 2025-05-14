-- GlobalSettings.lua
---- Manages global engine-level settings via console commands

local UEHelpers = require("UEHelpers")

local module = {}

function module.ApplyGlobalSettings(engine, ksl, config, effectsEnabled)
    if config["EyeAdaptation"] and config["EyeAdaptation"].Enabled == "true" then
        ksl:ExecuteConsoleCommand(engine, "r.EyeAdaptation.LensAttenuation " .. config["EyeAdaptation"].LensAttenuation, nil)
        ksl:ExecuteConsoleCommand(engine, "r.EyeAdaptation.ExponentialTransitionDistance " .. config["EyeAdaptation"].ExponentialTransition, nil)
        ksl:ExecuteConsoleCommand(engine, "r.EyeAdaptation.MethodOverride " .. config["EyeAdaptation"].MethodOverride, nil)
    end
    
    ksl:ExecuteConsoleCommand(engine, "r.VolumetricFog.Emissive 0", nil)
    
    if config["Reflections"] and config["Reflections"].Mode == "RayTracing" then
        if config["Reflections"].SampleFog then
            ksl:ExecuteConsoleCommand(engine, "r.Lumen.SampleFog " .. config["Reflections"].SampleFog, nil)
        end
        
        if config["Reflections"].CullingRadius then
            ksl:ExecuteConsoleCommand(engine, "r.RayTracing.Culling.Radius " .. config["Reflections"].CullingRadius, nil)
        end
    end
    
    if config["Skylight"] and config["Skylight"].Enabled == "true" then
        if (ksl:GetConsoleVariableBoolValue("r.Lumen.HardwareRayTracing") == false) then
            ksl:ExecuteConsoleCommand(engine, "r.SkylightIntensityMultiplier " .. config["Skylight"].IntensityWithoutRayTracing, nil)
        else
            ksl:ExecuteConsoleCommand(engine, "r.SkylightIntensityMultiplier " .. config["Skylight"].IntensityWithRayTracing, nil)
        end
    else
        ksl:ExecuteConsoleCommand(engine, "r.SkylightIntensityMultiplier 1.0", nil)
    end
end

return module