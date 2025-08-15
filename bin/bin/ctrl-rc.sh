#!/bin/bash

# Get keycode for Right Control (Control_R)
KEYCODE=105

# Get current modifier mapping
CURRENT_STATE=$(xmodmap -pm | grep control | grep -q "Control_R" && echo "IN_CONTROL" || echo "NOT_IN_CONTROL")

if [ "$CURRENT_STATE" = "IN_CONTROL" ]; then
    echo "Removing Right Ctrl from Control modifier and assigning to Mod3..."
    xmodmap -e "remove control = Control_R"
    xmodmap -e "keycode $KEYCODE = Control_R"
    xmodmap -e "add mod3 = Control_R"
else
    echo "Removing Right Ctrl from Mod3 and restoring to Control modifier..."
    xmodmap -e "remove mod3 = Control_R"
    xmodmap -e "keycode $KEYCODE = Control_R"
    xmodmap -e "add control = Control_R"
fi
