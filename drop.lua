-- 0.1.0
local modem = peripheral.find("modem") or error("No modem found", 0)
modem.open(1695)

local function channel_listen()
    local event, side, channel, replyChannel, message, distance
    repeat
        event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    until channel == 1695
    
    return message
end

while true do
    local count = channel_listen()
    print(count)
    
    local s=1
    for i=64,count+64,64 do
        turtle.select(s)
        if i>count then
            turtle.dropDown(count-(i-64))
        else
            turtle.dropDown()
        end
        s=s+1
    end
    --os.sleep(1.5)
    modem.transmit(1696, 1695, "dropped")
    
    channel_listen()
    
    
    turtle.select(1)
    for j=2,s do
        turtle.suckDown()
    end
    modem.transmit(1696, 1695, "dropped")
end