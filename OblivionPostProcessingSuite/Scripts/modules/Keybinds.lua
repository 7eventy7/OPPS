-- Keybinds.lua
---- Manages keyboard shortcuts for toggling effects

local module = {}

function module.RegisterToggleEffectsKeybind(effectsToggleCallback)
    RegisterKeyBind(Key.P, { ModifierKey.ALT }, function()
        effectsToggleCallback()
    end)
end

return module