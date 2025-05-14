-- ConfigHelper.lua
---- Parses configuration into structured lua tables

local function getRootDirectory()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*[/\\])") or ""
end

local activeConfig = "config.ini"

local function readIniFile(configFilename)
    configFilename = configFilename or activeConfig
    activeConfig = configFilename
    
    local root = getRootDirectory()
    local configPath = root .. "config/" .. configFilename
    
    local file = io.open(configPath, "r")
    if not file then
        print("[OPPS] Error: Could not open " .. configFilename)
        return {}
    end
    
    local data = {}
    local currentSection = nil

    for line in file:lines() do
        local section = line:match("^%[([^%]]+)%]$")
        if section then
            currentSection = section
            data[currentSection] = {}
        else
            local key, value = line:match("^([^=]+)%s*=%s*(.-)%s*$")
            if key and value and currentSection then
                key = key:match("^%s*(.-)%s*$")
                data[currentSection][key] = value
            end
        end
    end

    file:close()
    return data
end

local function toggleConfigFile()
    if activeConfig == "config.ini" then
        activeConfig = "default.ini"
    else
        activeConfig = "config.ini"
    end
    
    print("[OPPS] Switched to " .. activeConfig)
    return readIniFile(activeConfig)
end

local function getActiveConfig()
    return activeConfig
end

return {
    readIniFile = readIniFile,
    toggleConfigFile = toggleConfigFile,
    getActiveConfig = getActiveConfig
}