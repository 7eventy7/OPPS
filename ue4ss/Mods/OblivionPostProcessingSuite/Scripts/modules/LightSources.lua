-- LightSources.lua
---- Manages light source distance settings

local module = {}

function module.ApplyLightSettings(engine, ksl, config, effectsEnabled)
    if not config["LightSources"] or config["LightSources"].Enabled ~= "true" then
        return
    end

    local distanceScale = tonumber(config["LightSources"].DistanceScale)
    if not distanceScale or distanceScale < 1 or distanceScale > 3 then
        distanceScale = 1
    end

    ksl:ExecuteConsoleCommand(engine, "r.LightMaxDrawDistanceScale " .. distanceScale, nil)
end

function module.UpdateAllLightSettings(engine, ksl, config, effectsEnabled)
    module.ApplyLightSettings(engine, ksl, config, effectsEnabled)
end

return module 