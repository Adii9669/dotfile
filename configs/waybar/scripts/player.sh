#!/bin/bash

# Get the internal name of the current media player
PLAYER=$(playerctl metadata --format '{{ playerName }}')

# Default window class (empty)
WINDOW_CLASS=""

# Map the player name to a Hyprland window class
# NOTE: Class names are case-sensitive! Find them with `hyprctl clients`
case $PLAYER in
    "spotify")
        WINDOW_CLASS="Spotify"
        ;;
    "chromium" | "Brave")
        # This works for Brave Browser, Vivaldi, Chrome etc.
        # You might need to change "Brave-browser" to your specific class
        WINDOW_CLASS="Brave-browser" 
        ;;
    "firefox")
        WINDOW_CLASS="firefox"
        ;;
    "zen")
        WINDOW_CLASS="zen"
        ;;
    "vlc")
        WINDOW_CLASS="vlc"
        ;;
    # Add more cases for other players you use here
esac

# If we found a matching class, tell Hyprland to focus it
if [ -n "$WINDOW_CLASS" ]; then
    hyprctl dispatch focuswindow "class:^($WINDOW_CLASS)$"
fi
