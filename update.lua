-- 0.1.0
local updater = {}

function updater.update()
    local monitor = peripheral.find("monitor")
    monitor.setBackgroundColor(colors.black)
    monitor.clear()
    monitor.setCursorPos(1, 1)
    monitor.write("Updating...")

    shell.run("delete", "display.lua")
    os.sleep(.4)
    shell.run("delete", "error_handler.lua")
    os.sleep(.4)
    shell.run("delete", "hex_compiler.lua")
    os.sleep(.4)
    shell.run("delete", "patterns.lua")
    os.sleep(.4)
    shell.run("delete", "includes.lua")
    os.sleep(.4)
    shell.run("delete", "spells.lua")
    os.sleep(.4)
    
    monitor.setCursorPos(1, 2)
    monitor.write("Main files deleted")
    monitor.setCursorPos(1, 3)
    monitor.write("Downloading main files...")

    shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/display.lua", "display.lua")
    os.sleep(.4)
    shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/error_handler.lua", "error_handler.lua")
    os.sleep(.4)
    shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/hex_compiler.lua", "hex_compiler.lua")
    os.sleep(.4)
    shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/patterns.lua", "patterns.lua")
    os.sleep(.4)
    shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/includes.lua", "includes.lua")
    os.sleep(.4)
    shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/spells.lua", "spells.lua")
    os.sleep(.4)
    
    monitor.setCursorPos(1, 4)
    monitor.write("Main files downloaded")
    monitor.setCursorPos(1, 5)
    monitor.write("Updating includes...")

    local includes = require("includes")
    local spells = require("spells")

    for i,filename in ipairs(includes) do
        shell.run("delete", "include/" .. filename)
        os.sleep(.4)
        shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/include/" .. filename, "include/" .. filename)
        os.sleep(.4)
    end
    
    monitor.setCursorPos(1, 6)
    monitor.write("Finished updating includes")
    monitor.setCursorPos(1, 7)
    monitor.write("Updating spells...")

    for i,filename in ipairs(spells) do
        shell.run("delete", "spells/" .. filename)
        os.sleep(.4)
        shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/spells/" .. filename, "spells/" .. filename)
        os.sleep(.4)
    end
    
    monitor.setCursorPos(1, 8)
    monitor.write("Finished updating spells")
    monitor.setCursorPos(1, 9)
    monitor.write("Finished updating!")
end

return updater