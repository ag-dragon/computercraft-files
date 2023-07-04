local function draw_square(monitor, x, y, width, height, text)
    for i=y,y+height do
        monitor.setCursorPos(x, i)
        monitor.write(string.rep(" ", width))
    end
end

-- draw
-- draws display to monitor
-- @arg monitor the monitor to draw on
local function draw(monitor, list)
    local m_width, m_height = monitor.getSize()
    monitor.setBackgroundColor(colors.black)
    monitor.clear()
    
    -- File list
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
    
    -- Dividers
    monitor.setBackgroundColor(colors.lightGray)
    monitor.setTextColor(colors.gray)
    for div=1,m_height do
        monitor.setCursorPos((m_width/2)+1, div)
        monitor.write("~")
    end
    
    monitor.setCursorPos((m_width/2)+2, m_height/2)
    monitor.write(string.rep("~", (m_width/2)))
    
    monitor.setBackgroundColor(colors.black)
    monitor.setTextColor(colors.white)
    
    -- Buttons
    monitor.setBackgroundColor(colors.red)
    draw_square(monitor, m_width-10, m_height-10, 5, 5, "")
    monitor.setBackgroundColor(colors.black)
end

local compiler = require("hex_compiler")
local monitor = peripheral.find("monitor")

local spells = require("spells")

draw(monitor, spells)