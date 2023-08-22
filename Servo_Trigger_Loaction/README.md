# Servo Control on specific Waypoint
In this script:

1. The target GPS coordinates are defined using TARGET_LATITUDE and TARGET_LONGITUDE.

2. The servo channel and desired position are defined using SERVO_CHANNEL and SERVO_POSITION.

3. The checkTargetLocation function uses the sensorValues function to get the current GPS coordinates of the drone. It then calculates the distance between the current location and the target location using the gpsDistance function.

4. If the distance is less than or equal to the defined threshold (5 meters in this case), the servo is moved to the desired position. Otherwise, the servo is moved to a neutral position.

5. The timer is set up to call the checkTargetLocation function every 5 seconds to continuously monitor the drone's location.

**Please ensure that you replace the placeholder values with your actual target GPS coordinates, servo channel, and desired servo position. Test the script in a controlled environment to ensure it behaves as expected in your UAV system.**