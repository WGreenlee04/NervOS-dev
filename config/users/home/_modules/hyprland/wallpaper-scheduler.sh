#!/bin/sh

# Check for at least one argument
if [ $# -lt 1 ]; then
    echo "Usage: $0 <path-to-img-1> <path-to-img-2> ..."
    exit 1
fi

# Read images into an array
images=("$@")

# This controls (in seconds) when to switch to the next image
INTERVAL=10

while true; do
    while [[ $CURRENT_WALLPAPER -lt ${#images[@]} ]]; do
        swww img "${images[$CURRENT_WALLPAPER]}" \
            --transition-type random \
            --transition-step 1 \
            --transition-duration 1 \
            --transition-fps 144 \
            --filter Nearest
        sleep "$INTERVAL"
        CURRENT_WALLPAPER=$(($CURRENT_WALLPAPER + 1))
    done
    # Reset TEMP to 0 to loop through images again
    CURRENT_WALLPAPER=0
done
