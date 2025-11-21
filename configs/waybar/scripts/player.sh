#!/usr/bin/env bash

# Get active player (Spotify, Firefox, etc.)
player=$(playerctl -l 2>/dev/null | head -n 1)

if [ -z "$player" ]; then
  notify-send "🎵 No active media player found"
  exit 1
fi

# Try to get media URL and title
url=$(playerctl metadata --player="$player" --format '{{xesam:url}}' 2>/dev/null)
title=$(playerctl metadata --player="$player" --format '{{xesam:title}}' 2>/dev/null)

case "$player" in
  spotify)
    if pgrep -x spotify >/dev/null; then
      # Focus Spotify if already running
      hyprctl dispatch focuswindow "class:^(Spotify)$"
    else
      # Launch Spotify if not running
      (spotify >/dev/null 2>&1 &) || (flatpak run com.spotify.Client &)
    fi
    ;;

  firefox|chromium|brave|google-chrome|vivaldi)
    if [ -n "$url" ]; then
      # Open media link in an existing browser session
      if command -v firefox &>/dev/null; then
        firefox --new-tab "$url" >/dev/null 2>&1 &
      elif command -v brave &>/dev/null; then
        brave --new-tab "$url" >/dev/null 2>&1 &
      elif command -v chromium &>/dev/null; then
        chromium --new-tab "$url" >/dev/null 2>&1 &
      else
        xdg-open "$url" >/dev/null 2>&1 &
      fi

      # Try to focus browser window (Hyprland)
      sleep 0.2
      hyprctl dispatch focuswindow "class:^(firefox|Brave|Chromium|Google-chrome|vivaldi)$"
    else
      notify-send "🌐 No media URL found for $player"
    fi
    ;;

  mpv)
    hyprctl dispatch focuswindow "class:^(mpv)$" || mpv &
    ;;

  vlc)
    hyprctl dispatch focuswindow "class:^(vlc)$" || vlc &
    ;;

  *)
    notify-send "❓ Unknown player: $player"
    ;;
esac
