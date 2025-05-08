-- main.lua
---- Main coordinator module for the modular post-processing system

local UEHelpers = require("UEHelpers")
local ConfigHelper = require("ConfigHelper")

local GlobalSettings = require("modules.GlobalSettings")
local Effects = require("modules.Effects")
local DoF = require("modules.DoF")
local DialogState = require("modules.DialogState")
local FogEffects = require("modules.FogEffects")
local Keybinds = require("modules.Keybinds")

local engine = FindFirstOf('Engine')
local ksl = UEHelpers.GetKismetSystemLibrary()

local config = ConfigHelper.readIniFile()

local effectsEnabled = true

local function UpdateAllEffects()
    GlobalSettings.ApplyGlobalSettings(engine, ksl, config, effectsEnabled)
    
    local volumes = FindAllOf("PostProcessVolume")
    if volumes then
        for _, volume in ipairs(volumes) do
            Effects.ApplyNonDoFEffects(volume, config, effectsEnabled)
            DoF.UpdateDoFEffects(volume, config, DialogState.GetCurrentDialogState(), effectsEnabled)
        end
    end
    
    local components = FindAllOf("PostProcessComponent")
    if components then
        for _, component in ipairs(components) do
            Effects.ApplyNonDoFEffects(component, config, effectsEnabled)
            DoF.UpdateDoFEffects(component, config, DialogState.GetCurrentDialogState(), effectsEnabled)
        end
    end
    
    FogEffects.UpdateAllFogEffects(config, effectsEnabled)
end

NotifyOnNewObject("/Script/Altar.AltarCommonGameViewportClient", function(viewPort)
    GlobalSettings.ApplyGlobalSettings(engine, ksl, config, effectsEnabled)
end)

NotifyOnNewObject("/Script/Engine.PostProcessVolume", function(postProcessVolume)
    ExecuteWithDelay(500, function()
        Effects.ApplyNonDoFEffects(postProcessVolume, config, effectsEnabled)
        local inConversation = DialogState.IsInConversation()
        DoF.UpdateDoFEffects(postProcessVolume, config, inConversation, effectsEnabled)
        DialogState.Initialize()
    end)
end)

NotifyOnNewObject("/Script/Engine.PostProcessComponent", function(postProcessComponent)
    ExecuteWithDelay(500, function()
        Effects.ApplyNonDoFEffects(postProcessComponent, config, effectsEnabled)
        local inConversation = DialogState.IsInConversation()
        DoF.UpdateDoFEffects(postProcessComponent, config, inConversation, effectsEnabled)
        DialogState.Initialize()
    end)
end)

NotifyOnNewObject("/Script/Engine.PlayerController", function(playerController)
    RegisterHook("/Script/Engine.Actor:ReceiveTick", function(self, deltaTime)
        if self == playerController then
            local stateChanged, inConversation = DialogState.UpdateDialogState()
            
            if stateChanged then
                DoF.UpdateAllDoFEffects(config, inConversation, effectsEnabled)
            end
        end
        return false
    end)
end)

if config["Fog"] and config["Fog"].Enabled == "true" then
    FogEffects.SetupFogComponentHandler(config, function() return effectsEnabled end)
end

Keybinds.RegisterToggleEffectsKeybind(function()
    effectsEnabled = not effectsEnabled
    UpdateAllEffects()
    print("[OPPS] Global effects " .. (effectsEnabled and "enabled" or "disabled"))
end)

GlobalSettings.ApplyGlobalSettings(engine, ksl, config, effectsEnabled)

print("[OPPS] Loaded with modular architecture")