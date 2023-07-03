local included_files = {}
-- include
-- kinda lazy solution to include macro problem
local function include_file(filename)
    table.insert(included_files, filename)
    local include = {}
    for line in io.lines(filename) do
        if string.sub(line, 1, 9) == "#include " and included_files[string.sub(line, 10, -1)] == nil then
            local include_output = include_file(string.sub(line, 10, -1))
            
            for _,in_line in ipairs(include_output) do
                table.insert(include, in_line)
            end
        else
            table.insert(include, line)
        end
    end
    
    return include
end

-- precompile
-- handles various precompile process such as
-- removing whitespace, including files, and
-- macros
-- @arg filename name of file to precompile
local function precompile(filename)
    -- include statements
    local include = include_file(filename)
    
    -- remove whitespace
    local no_whitespace = {}
    for _,line in ipairs(include) do
        if line and line ~= "" and string.sub(line, 1, 2) ~= "--" then
            while string.sub(line, 1, 1) == " " do
                line = string.sub(line, 2, -1)
            end
            table.insert(no_whitespace, line)
        end
    end
    
    -- macro defines
    local macros = {}
    local output = {}
    local skip = 0
    for i=1,#no_whitespace do
        if i > skip then
            if string.sub(no_whitespace[i], 1, 8) == "#define " then
                local macro = {}
                local key = string.sub(no_whitespace[i], 9, -1)
                
                for j=i+1,#no_whitespace do
                    if string.sub(no_whitespace[j], 1, 10) == "#enddefine" then
                        skip = j
                        break
                    else
                        table.insert(macro, no_whitespace[j])
                    end
                end
                
                macros[key] = macro
            else
                table.insert(output, no_whitespace[i])
            end
        end
    end
    
    -- macro replace
    local index = 1
    local change = true
    while change do
        change = false
        index = 1
        while index<=#output do
            if macros[output[index]] then
                change = true
                local k = output[index]
                table.remove(output, index)
                for _,macro_line in ipairs(macros[k]) do
                    table.insert(output, index, macro_line)
                    index = index + 1
                end
                index = index - 1
            end
            index = index + 1
        end
    end
    
    return output
end

-- draw
-- draws compiler process to monitor
-- @arg monitor the monitor to draw on
-- @output lines to print
local function draw(monitor, output)
    local m_width, m_height = monitor.getSize()
    monitor.setBackgroundColor(colors.black)
    monitor.clear()
    
    local start = 0
    local i = 1
    if #output > m_height then
        start = #output - m_height
        i = start
    end
    
    while i <= #output do
        if i == #output then
            monitor.setBackgroundColor(colors.purple)
        else
            monitor.setBackgroundColor(colors.black)
        end
            
        local line = i .. " " .. output[i]
        monitor.setCursorPos(1, i-start)
        local format = "%." .. m_width .. "s"
        monitor.write(string.format(format, line))
        
        i = i + 1
    end
end

local function channel_listen()
    local e, s, ch, rch, m, d
    repeat
        e, s, ch, rch, m, d = os.pullEvent("modem_message")
    until ch == 1696
end

-- compile
-- compiles hex to focus while drawing visualization
-- on monitor
-- @arg filename filename of hex file to compile
function compile(filename)
    -- patern dict setup
    local patterns = require("patterns")
    local ipatterns = {}
    for i,v in ipairs(patterns) do
        ipatterns[v] = i
    end
    
    -- modem setup
    local modem = peripheral.find("modem") or error("No modem found", 0)
    modem.open(1696)
    
    -- monitor setup
    local monitor = peripheral.find("monitor")
    local m_width, m_height = monitor.getSize()
    
    local output = precompile(filename)
    
    -- draw and send output to turtle
    local draw_output = {}
    for _,line in ipairs(output) do
        local pindex = ipatterns[line]
        table.insert(draw_output, line)
        draw(monitor, draw_output)
        
        modem.transmit(1695, 1696, pindex)
        channel_listen()
        rs.setOutput("back", true)
        sleep(0.1)
        rs.setOutput("back", false)
        modem.transmit(1695, 1696, 0)
        channel_listen()
    end
end

compile(arg[1])