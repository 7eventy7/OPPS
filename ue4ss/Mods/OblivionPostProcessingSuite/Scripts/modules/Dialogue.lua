-- Dialogue.lua
---- Handles dialog/conversation state detection and visual settings

local UEHelpers = require("UEHelpers")

local module = {}

local lastDialogState = false
local ksl = UEHelpers.GetKismetSystemLibrary()
local engine = FindFirstOf('Engine')

function module.IsInConversation()
    local dialogText = FindFirstOf("dialog_text")
    if dialogText and dialogText.visible then
        return true
    end
    
    return false
end

function module.UpdateDialogState()
    local currentState = module.IsInConversation()
    local stateChanged = (currentState ~= lastDialogState)
    lastDialogState = currentState
    
    if stateChanged then
        module.ApplyDialogueSettings(currentState)
    end
    
    return stateChanged, currentState
end

function module.GetCurrentDialogState()
    return lastDialogState
end

function module.IsEnabled()
    local config = GetConfig()
    return config and config["Dialogue"] and config["Dialogue"].Enabled == "true"
end

function GetConfig()
    return _G.oblivionConfig
end

function module.ApplyDialogueSettings(inDialogue)
    if not module.IsEnabled() then
        return
    end
    
    local config = GetConfig()
    
    local playerCameras = FindAllOf("PlayerCameraManager")
    if playerCameras then
        for _, camera in ipairs(playerCameras) do
            if inDialogue then
                local dialogueScope = tonumber(config["Dialogue"].DialogueScope) or 75.0
                camera.DefaultFOV = dialogueScope
            end
        end
    end
    
    local dialogueLighting = tonumber(config["Dialogue"].DialogueLighting) or 1
    
    if inDialogue and dialogueLighting == 0 then
        local lights = FindAllOf("Light")
        if lights then
            for _, light in ipairs(lights) do
                light.Intensity = 0
            end
        end
    end
end

function module.Initialize(configData)
    _G.oblivionConfig = configData
    
    lastDialogState = module.IsInConversation()
    
    NotifyOnNewObject("/Script/Altar.DialogueSceneSubsystem", function(context)
        if not module.IsEnabled() then
            context.bOverrideTimeToReachIntensity = 0
            return
        end
        
        local config = GetConfig()
        local dialogueLighting = tonumber(config["Dialogue"].DialogueLighting) or 1
        
        if dialogueLighting == 0 then
            context.TimeToReachIntensity = -1.0
            context.bOverrideTimeToReachIntensity = 1
        else
            context.bOverrideTimeToReachIntensity = 0
        end
    end)
    
    module.UpdateVOblivionSettings()
    
    if lastDialogState then
        module.ApplyDialogueSettings(true)
    end
    
    return lastDialogState
end

function module.UpdateVOblivionSettings()
    local Settings = StaticFindObject("/Script/UE5AltarPairing.Default__VOblivionInitialSettings")
    if not Settings or not Settings:IsValid() then
        return
    end
    
    if not module.IsEnabled() then
        return
    end
    
    local config = GetConfig()
    
    local dialogueScope = tonumber(config["Dialogue"].DialogueScope) or 75.0
    local dialogueEntrySpeed = tonumber(config["Dialogue"].DialogueEntrySpeed) or 5.0
    
    Settings["FocusWhenDialogue"] = dialogueScope
    Settings["SpeedWhenStartTargetingInDialogue"] = dialogueEntrySpeed
end

function module.UpdateConfig(configData)
    _G.oblivionConfig = configData
    
    module.UpdateVOblivionSettings()
    
    module.ApplyDialogueSettings(lastDialogState)
end

return module