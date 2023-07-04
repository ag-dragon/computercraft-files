-- 0.2.3
local updater = {}

local function download_file(filename, monitor)
    local old_version = string.sub(fs.open(filename, "r").readLine(), 4)
    shell.run("delete", filename)
    shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/" .. filename, filename)
    local new_version = string.sub(fs.open(filename, "r").readLine(), 4)
    
    if old_version ~= new_version then
        local _,y = monitor.getCursorPos()
        monitor.setCursorPos(1, y+1)
        monitor.write(string.format("%s: %s -> %s", filename, old_version, new_version))
    end
end

function updater.update(monitor)
    monitor.setBackgroundColor(colors.black)
    monitor.setTextColor(colors.white)
    monitor.clear()
    monitor.setCursorPos(1, 1)
    monitor.write("Updating...")
    
    download_file("display.lua", monitor)
    download_file("error_handler.lua", monitor)
    download_file("hex_compiler.lua", monitor)
    download_file("patterns.lua", monitor)
    download_file("includes.lua", monitor)
    download_file("spells.lua", monitor)

    local includes = require("includes")
    local spells = require("spells")

    for i,filename in ipairs(includes) do
        download_file("include/" .. filename, monitor)
    end

    for i,filename in ipairs(spells) do
        download_file("spells/" .. filename, monitor)
    end
    
    local _,y = monitor.getCursorPos()
    monitor.setCursorPos(1, y+1)
    monitor.write("Finished updating! Click to continue...")
    
    os.pullEvent("monitor_touch")
end

return updater