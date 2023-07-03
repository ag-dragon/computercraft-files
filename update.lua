-- 0.1.0

shell.run("delete", "masterlist.hex")
os.sleep(.4)
shell.run("delete", "hex_compiler.lua")
os.sleep(.4)
shell.run("delete", "patterns.lua")
os.sleep(.4)

shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/masterlist.hex", "masterlist.hex")
os.sleep(.4)
shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/hex_compiler.lua", "hex_compiler.lua")
os.sleep(.4)
shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/patterns.lua", "patterns.lua")
os.sleep(.4)


-- shell.run("delete", "spells")
-- os.sleep(.4)
-- shell.run("delete", "include")
-- os.sleep(.4)

-- shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/spells", "spells")
-- os.sleep(.4)
-- shell.run("wget", "https://raw.githubusercontent.com/ag-dragon/computercraft-files/master/include", "include")
-- os.sleep(.4)