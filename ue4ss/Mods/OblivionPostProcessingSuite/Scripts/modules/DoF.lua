-- DoF.lua
---- Manages Depth of Field effects with special handling for dialog state

local module = {}

function module.UpdateDoFEffects(postProcess, config, inConversation, effectsEnabled)
    module.ResetDoFSettings(postProcess)
    
    if config["DepthOfField"] and config["DepthOfField"].Enabled == "true" and not inConversation then
        postProcess.Settings.bOverride_DepthOfFieldFocalDistance = true
        postProcess.Settings.bOverride_DepthOfFieldFocalRegion = true
        postProcess.Settings.bOverride_DepthOfFieldNearTransitionRegion = true
        postProcess.Settings.bOverride_DepthOfFieldFarTransitionRegion = true
        postProcess.Settings.bOverride_DepthOfFieldScale = true
        postProcess.Settings.DepthOfFieldFocalDistance = tonumber(config["DepthOfField"].FocalDistance)
        postProcess.Settings.DepthOfFieldFocalRegion = tonumber(config["DepthOfField"].FocalRegion)
        postProcess.Settings.DepthOfFieldNearTransitionRegion = tonumber(config["DepthOfField"].NearTransition)
        postProcess.Settings.DepthOfFieldFarTransitionRegion = tonumber(config["DepthOfField"].FarTransition)
        postProcess.Settings.DepthOfFieldScale = tonumber(config["DepthOfField"].BokehSize)
    else
        module.ResetDoFSettings(postProcess)
    end
end

function module.ResetDoFSettings(postProcess)
    postProcess.Settings.bOverride_DepthOfFieldFocalDistance = false
    postProcess.Settings.bOverride_DepthOfFieldFocalRegion = false
    postProcess.Settings.bOverride_DepthOfFieldNearTransitionRegion = false
    postProcess.Settings.bOverride_DepthOfFieldFarTransitionRegion = false
    postProcess.Settings.bOverride_DepthOfFieldScale = false
end

function module.UpdateAllDoFEffects(config, inConversation, effectsEnabled)
    local volumes = FindAllOf("PostProcessVolume")
    if volumes then
        for _, volume in ipairs(volumes) do
            module.UpdateDoFEffects(volume, config, inConversation, effectsEnabled)
        end
    end
    
    local components = FindAllOf("PostProcessComponent")
    if components then
        for _, component in ipairs(components) do
            module.UpdateDoFEffects(component, config, inConversation, effectsEnabled)
        end
    end
end

return module