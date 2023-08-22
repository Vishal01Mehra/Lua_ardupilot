-- Define the system and component IDs for the message
SYSID = 1  -- Replace with your vehicle's system ID
COMPID = 1 -- Replace with your desired component ID

-- Function to send a custom message to GCS
function sendCustomMessage(message)
    local msg = mavlink_msg_custom_msg_pack(
        SYSID,                  -- System ID
        COMPID,                 -- Component ID
        message                 -- Message content
    )
    mavlink_send_message(msg)
end

-- Function to receive and process messages from GCS
function receiveMessages()
    local msg = mavlink_read_msg()
    if msg then
        if msg.msgid == MAVLINK_MSG_ID_CUSTOM_MSG then
            local customMsg = mavlink_msg_custom_msg_decode(msg)
            logMessage("Received Custom Message from GCS: " .. customMsg.message)
        end
    end
end

-- Set up a timer to check for received messages every 1 second
timer = Timer.new(1, "receiveMessages")
timer:start()

-- Send a custom message to GCS every 5 seconds
sendTimer = Timer.new(5, function()
    local messageToSend = "Hello GCS! This is a custom message from the UAV."
    sendCustomMessage(messageToSend)
    logMessage("Sent Custom Message to GCS: " .. messageToSend)
end)
sendTimer:start()
