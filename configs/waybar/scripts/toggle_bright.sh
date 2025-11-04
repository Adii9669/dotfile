#!/bin/bash

# Define your low and high brightness targets
LOW_BRIGHTNESS="5%"
HIGH_BRIGHTNESS="100%"

# Get the current brightness percentage (using brightnessctl)
CURRENT_BRIGHTNESS=$(brightnessctl -m | awk -F, '{print $4}' | sed 's/%//')

# Check the current level and toggle
if [ "$CURRENT_BRIGHTNESS" -ge 50 ]; then
    # If currently high (>= 50%), switch to low
    brightnessctl set "$LOW_BRIGHTNESS"
else
    # If currently low (< 50%), switch to high
    brightnessctl set "$HIGH_BRIGHTNESS"
fi
