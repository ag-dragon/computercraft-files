-- 0.4.3

local d = {}

local function draw_square(monitor, x, y, width, height, text)
    for i=y,y+height-1 do
        if i == y+math.floor(height/2) then
            monitor.setCursorPos(x, i)
            monitor.write(text)
            monitor.write(string.rep(" ", width-string.len(text)))
        else
            monitor.setCursorPos(x, i)
            monitor.write(string.rep(" ", width))
        end
    end
end

-- draw
-- draws display to monitor
-- @arg monitor the monitor to draw on
local function draw(monitor, list, current)
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
        if i == current then
            monitor.setBackgroundColor(colors.purple)
        else
            monitor.setBackgroundColor(colors.black)
        end
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
        monitor.write("#")
    end
    
    monitor.setCursorPos((m_width/2)+2, m_height/2)
    monitor.write(string.rep("#", (m_width/2)))
    
    monitor.setBackgroundColor(colors.black)
    monitor.setTextColor(colors.white)
    
    -- Buttons
    monitor.setBackgroundColor(colors.red)
    draw_square(monitor, m_width-17, m_height-11, 7, 5, "/\\")
    draw_square(monitor, m_width-17, m_height-5, 7, 5, "\\/")
    draw_square(monitor, m_width-7, m_height-11, 7, 5, "->")
    draw_square(monitor, m_width-7, m_height-5, 7, 5, "reload")
    monitor.setBackgroundColor(colors.black)
    
    -- File Information
    if fs.exists("spells/" .. list[current]) then
        local file = fs.open("spells/" .. list[current], "r")
        
        monitor.setCursorPos((m_width/2)+2, 1)
        monitor.write(list[current])
        monitor.setCursorPos((m_width/2)+2, 2)
        monitor.write(string.sub(file.readLine(), 4))
        local desc = file.readLine()
        if string.sub(desc, 1, 9) == "-- desc: " then
            desc = string.sub(desc, 10)
            local _,y = monitor.getCursorPos()
            y = y + 1
            while string.len(desc) > 0 and y < m_height/2 do
                monitor.setCursorPos((m_width/2)+2, y)
                monitor.write(desc)
                if string.len(desc) > m_width/2 then
                    desc = string.sub(desc, (m_width/2)+1)
                else
                    desc = ""
                end
                y = y + 1
            end
            
            monitor.setCursorPos((m_width/2)+2, 3)
            monitor.write(string.sub(desc, 10))
        end
    end
end

local function channel_listen()
    local e, s, ch, rch, m, d
    repeat
        e, s, ch, rch, m, d = os.pullEvent("modem_message")
    until ch == 1698
    
    return m
end

function d.display()
    local compiler = require("hex_compiler")
    local updater = require("update")

    local modem = peripheral.find("modem")
    modem.open(1698)

    local monitor = peripheral.find("monitor")
    local m_width, m_height = monitor.getSize()

    local spells = require("spells")

    local selected = 1
    draw(monitor, spells, selected)
    while true do
        local event_data = {os.pullEvent()};
        local event = event_data[1]
        
        if event == "monitor_touch" then
            local x, y = event_data[3], event_data[4]
            if x >= (m_width-17) and x < (m_width-10) then
                if y >= (m_height-11) and y < (m_height-6) then
                    selected = (selected > 1) and (selected-1) or selected
                elseif y >= (m_height-5) and y < (m_height) then
                    selected = (selected < #spells) and (selected+1) or selected
                end
            elseif x >= (m_width-7) and x < (m_width) then
                if y >= (m_height-11) and y < (m_height-6) then
                    compiler.compile("spells/" .. spells[selected])
                elseif y >= (m_height-5) and y < (m_height) then
                    updater.update(monitor)
                    package.loaded.hex_compiler = nil
                    compiler = require("hex_compiler")
                end
            end
        elseif event == "modem_message" then
            if event_data[3] == 1698 then
                local f = fs.open("downloads/" .. event_data[5][1], "w")
                fs.write(event_data[5][2])
                f.close()
            end
        end
        
        package.loaded.spells = nil
        spells = require("spells")
        draw(monitor, spells, selected)
    end
end

return d