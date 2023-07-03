-- draw
-- draws display to monitor
-- @arg monitor the monitor to draw on
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

local compiler = require("hex_compiler")
local monitor = peripheral.find("monitor")

local spells = require("spells")

draw(monitor, spells)