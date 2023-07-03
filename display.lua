-- draw
-- draws display to monitor
-- @arg monitor the monitor to draw on
local function draw(monitor, list)
    local m_width, m_height = monitor.getSize()
    monitor.setBackgroundColor(colors.black)
    monitor.clear()
    
    local start = 0
    local i = 1
    if #list > m_height then
        start = #list - m_height
        i = start
    end
    
    while i <= #list do
        local line = string.sub(list[i], 1, -5)
        monitor.setCursorPos(1, i-start)
        local format = "%." .. m_width .. "s"
        monitor.write(string.format(format, line))
        
        i = i + 1
    end
    
    monitor.setBackgroundColor(colors.lightGray)
    monitor.setTextColor(colors.gray)
    for div=1,m_height do
        monitor.setCursorPos(m_width/2, div)
    end
    monitor.setBackgroundColor(colors.black)
    monitor.setTextColor(colors.white)
end

local compiler = require("hex_compiler")
local monitor = peripheral.find("monitor")

local spells = require("spells")

draw(monitor, spells)