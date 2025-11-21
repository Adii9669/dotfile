#!/bin/bash

HYPR_PIDS=$(hyprctl clients -j | jq -r '.[].pid')

find_graphical_pid() {
    local TARGET_PID="$1"

    while [[ "$TARGET_PID" -ne 1 ]]; do
        if echo "$HYPR_PIDS" | grep -qw "$TARGET_PID"; then
            echo $TARGET_PID
            return 0
        fi

        PARENT_PID=$(ps -o ppid= -p "$TARGET_PID" | xargs)

        if [ -z "$PARENT_PID" ]; then
            return 1
        fi

        TARGET_PID=$PARENT_PID
    done
}

AUDIO_PIDS=$(pw-dump | jq '. as $root | .[] | select(.info.props["media.class"] == "Stream/Output/Audio" and .info.state == "running") | {pid: (.info.props["application.process.id"] // ( .info.props["client.id"] as $client_id | $root[] | select(.id == $client_id) | .info.props["application.process.id"] )) } | .pid')
if [[ -z "$AUDIO_PIDS" ]]; then
    exit 0
fi

AUDIO_PIDS=($AUDIO_PIDS)
UNIQUE_AUDIO_PIDS=($(echo "${AUDIO_PIDS[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))

for AUDIO_PID in "${UNIQUE_AUDIO_PIDS[@]}"; do
    WINDOW_PID=$(find_graphical_pid "$AUDIO_PID")
    if [[ $? -eq 0 ]]; then
        WINDOW_PIDS+=("$WINDOW_PID")
    fi
done

if [ -z $WINDOW_PIDS ]; then
    exit 0
fi

UNIQUE_WINDOW_PIDS=($(echo "${WINDOW_PIDS[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))
CURRENT_FOCUSED_PID=$(hyprctl activewindow -j | jq '.pid')
TARGET_PID=""
WINDOW_PIDS=()

INDEX=0
for PID in "${UNIQUE_WINDOW_PIDS[@]}"; do
    if [[ $PID -eq $CURRENT_FOCUSED_PID ]]; then
        TARGET_PID="${UNIQUE_WINDOW_PIDS[$((INDEX + 1))]}"
        break
    fi

    ((INDEX++))
done

if [[ -z $TARGET_PID ]]; then
    TARGET_PID="${UNIQUE_WINDOW_PIDS[0]}"
fi

if [[ -z "$TARGET_PID" ]]; then
    exit 0
fi

WINDOW_ADDRESS=$(hyprctl clients -j | jq -r --argjson pid "$TARGET_PID" '.[] | select(.pid == $pid) | .address' | head -n 1)

if [[ -n "$WINDOW_ADDRESS" ]]; then
    hyprctl dispatch focuswindow "address:$WINDOW_ADDRESS"
fi
