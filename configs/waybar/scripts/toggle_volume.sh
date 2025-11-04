#!/bin/bash

# The SINK is your main output device. @DEFAULT_SINK@ typically works.
SINK_NAME="@DEFAULT_SINK@"

# Get the current mute status (0 for unmuted, 1 for muted)
IS_MUTED=$(pactl get-sink-mute "$SINK_NAME" | awk '{print $2}')

if [ "$IS_MUTED" == "yes" ]; then
    # If currently Muted, Unmute and set to 100%
    pactl set-sink-mute "$SINK_NAME" 0
    pactl set-sink-volume "$SINK_NAME" 100%
else
    # If currently Unmuted, Mute it
    pactl set-sink-mute "$SINK_NAME" 1
fi

# Optional: Send a notification to confirm the action
# This is highly recommended for visual feedback
~/.local/bin/notify_volume update
