-- DialogState.lua
---- Handles dialog/conversation state detection and tracking

local module = {}

local lastDialogState = false

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
    return stateChanged, currentState
end

function module.GetCurrentDialogState()
    return lastDialogState
end

function module.Initialize()
    lastDialogState = module.IsInConversation()
    return lastDialogState
end

return module