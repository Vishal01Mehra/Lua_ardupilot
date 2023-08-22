-- Define the target GPS coordinates
TARGET_LATITUDE = 42.123456  -- Replace with your desired latitude
TARGET_LONGITUDE = -71.987654 -- Replace with your desired longitude

-- Define the LED channel for blinking
LED_CHANNEL = 5

-- Define blinking parameters
BLINK_DURATION = 1  -- Duration in seconds for each blink
BLINK_INTERVAL = 2  -- Interval in seconds between blinks

-- Function to toggle the LED state
local ledState = false
function toggleLED()
    ledState = not ledState
    setChannelOutput(LED_CHANNEL, ledState and 1000 or 2000) -- Adjust PWM values as needed
end

-- Function to check if drone has reached the target location
function checkTargetLocation()
    local gps = sensorValues("GPS")
    
    if gps then
        local lat = gps.Latitude
        local lon = gps.Longitude
        
        -- Calculate the distance to the target location
        local distance = gpsDistance(lat, lon, TARGET_LATITUDE, TARGET_LONGITUDE)
        
        -- Define a threshold distance for reaching the target (in meters)
        local threshold = 5
        
        if distance <= threshold then
            -- Start blinking the LED
            timer = Timer.new(BLINK_INTERVAL, toggleLED, BLINK_DURATION)
            timer:start()
        end
    end
end

-- Set up a timer to check target location every 5 seconds
timer = Timer.new(5, "checkTargetLocation")
timer:start()
