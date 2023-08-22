-- Define the switch channel for the button
BUTTON_CHANNEL = 7

-- Define the threshold value for button press (PWM value)
BUTTON_PRESS_THRESHOLD = 1600

-- Define takeoff parameters
TAKEOFF_ALTITUDE = 10  -- Replace with your desired takeoff altitude in meters

-- Function to check if the button is pressed
function checkButtonPress()
    local buttonValue = channelInput(BUTTON_CHANNEL)
    
    if buttonValue >= BUTTON_PRESS_THRESHOLD then
        -- Perform the takeoff
        takeoffAltitude(TAKEOFF_ALTITUDE)
        logMessage("Button pressed. Initiating takeoff to " .. TAKEOFF_ALTITUDE .. " meters.")
    end
end

-- Set up a timer to check button press every 1 second
timer = Timer.new(1, "checkButtonPress")
timer:start()
