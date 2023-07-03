-- 0.1.0

shell.run("delete", "masterlist.hex")
os.sleep(.4)
shell.run("delete", "display.lua")
os.sleep(.4)
shell.run("delete", "hex_compiler.lua")
os.sleep(.4)
shell.run("delete", "patterns.lua")
os.sleep(.4)
shell.run("delete", "includes.lua")
os.sleep(.4)
shell.run("delete", "spells.lua")
os.sleep(.4)

shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/masterlist.hex", "masterlist.hex")
os.sleep(.4)
shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/display.lua", "display.lua")
os.sleep(.4)
shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/hex_compiler.lua", "hex_compiler.lua")
os.sleep(.4)
shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/patterns.lua", "patterns.lua")
os.sleep(.4)
shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/includes.lua", "includes.lua")
os.sleep(.4)
shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/spells.lua", "spells.lua")
os.sleep(.4)

local includes = require("includes")
local spells = require("spells")

for i,filename in ipairs(includes) do
    shell.run("delete", "include/" .. filename)
    os.sleep(.4)
    shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/include/" .. filename, "include/" .. filename)
    os.sleep(.4)
end

for i,filename in ipairs(spells) do
    shell.run("delete", "spells/" .. filename)
    os.sleep(.4)
    shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/spells/" .. filename, "spells/" .. filename)
    os.sleep(.4)
end