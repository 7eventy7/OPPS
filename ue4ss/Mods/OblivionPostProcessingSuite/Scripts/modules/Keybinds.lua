-- Keybinds.lua
---- Manages keyboard shortcuts for toggling effects

local module = {}

function module.RegisterToggleEffectsKeybind(effectsToggleCallback)
    RegisterKeyBind(Key.P, { ModifierKey.ALT }, function()
        effectsToggleCallback()
    end)
end

function module.RegisterHotReloadKeybind(hotReloadCallback)
    RegisterKeyBind(Key.O, { ModifierKey.ALT }, function()
        hotReloadCallback()
    end)
end

function module.RegisterHUDToggleKeybind()
    local visibleUI = true
    RegisterKeyBind(Key.L, { ModifierKey.ALT }, function()
        local altarUI = FindFirstOf("VAltarUISubsystem")
        if altarUI then
            visibleUI = not visibleUI
            altarUI:ToggleHUDVisibility(visibleUI)
        end
    end)
end

return module