local voltage_threshold = 50.0
function check_battery_voltage()
    local battery_voltage = battery:voltage(0) 
    if battery_voltage < voltage_threshold then
        gcs:send_text(0, "Critical: Power switched to backup battery") 
    end

end
function update()
    check_battery_voltage()
    return update, 1000 
end

return update()