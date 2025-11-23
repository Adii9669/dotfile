#!/bin/bash

# Options
options=" Lock\n Sleep\n Reboot\n Shutdown\n Exit"

# Run rofi with custom keybinds
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" \
    -theme ~/.config/rofi/themes/power.rasi \
    -kb-custom-1 l \
    -kb-custom-2 s \
    -kb-custom-3 r \
    -kb-custom-4 p \
    -kb-custom-5 e)

case $? in
    10) swaylock ;;                    # Pressed "l"
    11) systemctl suspend ;;           # Pressed "s"
    12) systemctl reboot ;;            # Pressed "r"
    13) systemctl poweroff ;;          # Pressed "p"
    14) hyprctl dispatch exit ;;       # Pressed "e"
    0)  # Selected with Enter
        case $chosen in
            " Lock") swaylock ;;
            " Sleep") systemctl suspend ;;
            " Reboot") systemctl reboot ;;
            " Shutdown") systemctl poweroff ;;
            " Exit") hyprctl dispatch exit ;;
        esac
    ;;
esac
