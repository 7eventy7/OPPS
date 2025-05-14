-- main.lua
---- Main coordinator module for the modular post-processing system

local UEHelpers = require("UEHelpers")
local ConfigHelper = require("ConfigHelper")

local GlobalSettings = require("modules.GlobalSettings")
local Effects = require("modules.Effects")
local DoF = require("modules.DoF")
local Dialogue = require("modules.Dialogue")
local FogEffects = require("modules.FogEffects")
local LightSources = require("modules.LightSources")
local Keybinds = require("modules.Keybinds")

local engine = FindFirstOf('Engine')
local ksl = UEHelpers.GetKismetSystemLibrary()

local config = ConfigHelper.readIniFile()

local function UpdateAllEffects()
    local enabled = true
    
    GlobalSettings.ApplyGlobalSettings(engine, ksl, config, enabled)
    
    local volumes = FindAllOf("PostProcessVolume")
    if volumes then
        for _, volume in ipairs(volumes) do
            Effects.ApplyNonDoFEffects(volume, config, enabled)
            DoF.UpdateDoFEffects(volume, config, Dialogue.GetCurrentDialogState(), enabled)
        end
    end
    
    local components = FindAllOf("PostProcessComponent")
    if components then
        for _, component in ipairs(components) do
            Effects.ApplyNonDoFEffects(component, config, enabled)
            DoF.UpdateDoFEffects(component, config, Dialogue.GetCurrentDialogState(), enabled)
        end
    end
    
    FogEffects.UpdateAllFogEffects(config, enabled)
    LightSources.UpdateAllLightSettings(engine, ksl, config, enabled)
end

local function HotReloadConfig()
    config = ConfigHelper.readIniFile()
    Dialogue.UpdateConfig(config)
    UpdateAllEffects()
    print("[OPPS] Hot reloaded config")
end

NotifyOnNewObject("/Script/Altar.AltarCommonGameViewportClient", function(viewPort)
    GlobalSettings.ApplyGlobalSettings(engine, ksl, config, true)
    LightSources.ApplyLightSettings(engine, ksl, config, true)
end)

Dialogue.Initialize(config)

NotifyOnNewObject("/Script/Engine.PostProcessVolume", function(postProcessVolume)
    ExecuteWithDelay(500, function()
        Effects.ApplyNonDoFEffects(postProcessVolume, config, true)
        local inConversation = Dialogue.IsInConversation()
        DoF.UpdateDoFEffects(postProcessVolume, config, inConversation, true)
    end)
end)

NotifyOnNewObject("/Script/Engine.PostProcessComponent", function(postProcessComponent)
    ExecuteWithDelay(500, function()
        Effects.ApplyNonDoFEffects(postProcessComponent, config, true)
        local inConversation = Dialogue.IsInConversation()
        DoF.UpdateDoFEffects(postProcessComponent, config, inConversation, true)
    end)
end)

NotifyOnNewObject("/Script/Engine.PlayerController", function(playerController)
    RegisterHook("/Script/Engine.Actor:ReceiveTick", function(self, deltaTime)
        if self == playerController then
            local stateChanged, inConversation = Dialogue.UpdateDialogState()
            
            if stateChanged then
                DoF.UpdateAllDoFEffects(config, inConversation, true)
            end
        end
        return false
    end)
end)

if config["Fog"] and config["Fog"].Enabled == "true" then
    FogEffects.SetupFogComponentHandler(config, function() return true end)
end

Keybinds.RegisterToggleEffectsKeybind(function()
    config = ConfigHelper.toggleConfigFile()
    Dialogue.UpdateConfig(config)
    UpdateAllEffects()
    print("[OPPS] Switched to " .. ConfigHelper.getActiveConfig() .. " settings")
end)

Keybinds.RegisterHotReloadKeybind(HotReloadConfig)
Keybinds.RegisterHUDToggleKeybind()

GlobalSettings.ApplyGlobalSettings(engine, ksl, config, true)

print("[OPPS] Loaded with modular architecture")