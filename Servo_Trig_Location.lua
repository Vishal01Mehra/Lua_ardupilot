-- Define the target GPS coordinates
TARGET_LATITUDE = 42.123456  -- Replace with your desired latitude
TARGET_LONGITUDE = -71.987654 -- Replace with your desired longitude

-- Define the servo channel and positions
SERVO_CHANNEL = 6
SERVO_POSITION = 1500  -- Replace with your desired servo position

-- Function to check if the drone has reached the target location
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
            -- Move the servo to the desired position
            setServo(SERVO_CHANNEL, SERVO_POSITION)
        else
            -- If not at target, move the servo to a neutral position
            setServo(SERVO_CHANNEL, 1500)
        end
    end
end

-- Set up a timer to check target location every 5 seconds
timer = Timer.new(5, "checkTargetLocation")
timer:start()
