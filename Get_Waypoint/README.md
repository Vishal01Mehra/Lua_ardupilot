# Retrieve specific Waypoint GPS coordinates 
In this script:

1. The desired waypoint index is defined using WAYPOINT_INDEX. Keep in mind that waypoint indices are zero-based.

2. The getWaypointData function uses the missionItems function to retrieve the list of mission items (waypoints). It then checks if the list exists and if the specified waypoint index is within the range of available waypoints.

3. If the waypoint data is available, the latitude and longitude of the specified waypoint are extracted from the waypoints list and logged using the logMessage function.

4. If the waypoint data is not available or the specified index is out of range, an appropriate log message is displayed.

5. The getWaypointData function is called immediately after definition to retrieve and display the waypoint data.

**Replace the WAYPOINT_INDEX value with the desired waypoint index that you want to retrieve data for. Keep in mind that you need to have a mission loaded on your UAV before running the script. Test the script on a mission with waypoints to ensure it retrieves the correct data.**