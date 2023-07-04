-- 0.1.0
local error_handler = {}

function error_handler.message(monitor, contents)
    monitor.setBackgroundColor(colors.red)
    monitor.setTextColor(colors.white)
    monitor.setCursorPos(1, 1)
    monitor.write(contents)
    monitor.setCursorPos(1, 2)
    monitor.write("Click to continue...")
    
    os.pullEvent("monitor_touch")
end

return error_handler