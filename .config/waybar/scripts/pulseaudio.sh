#!/bin/bash

# Get default sink
sink=$(pactl get-default-sink)

# Check if Bluetooth (replace 'bluez' with your BT sink name pattern)
if [[ $sink == *"bluez"* ]]; then
    # Fetch battery percentage (same command from earlier)
    battery=$(bluetoothctl info | awk -F '[()]' '/Battery Percentage/{print $2}')
    
    # Output JSON for Waybar
    echo "{\"volume\": $(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}'), \"battery\": \"$battery\", \"icon\": \"󰂰\"}"
else
    # Non-Bluetooth output
    echo "{\"volume\": $(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}'), \"icon\": \"\"}"
fi
