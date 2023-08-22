-- Define the waypoint index to retrieve data for
WAYPOINT_INDEX = 2  -- Replace with the desired waypoint index (zero-based)

-- Function to retrieve waypoint data
function getWaypointData()
    local waypoints = missionItems()
    
    if waypoints and #waypoints >= WAYPOINT_INDEX + 1 then
        local waypoint = waypoints[WAYPOINT_INDEX + 1]
        local lat = waypoint.x
        local lon = waypoint.y
        
        logMessage("Waypoint " .. WAYPOINT_INDEX .. " - Latitude: " .. lat .. ", Longitude: " .. lon)
    else
        logMessage("Waypoint " .. WAYPOINT_INDEX .. " not found or data not available.")
    end
end

-- Call the function to retrieve waypoint data
getWaypointData()
