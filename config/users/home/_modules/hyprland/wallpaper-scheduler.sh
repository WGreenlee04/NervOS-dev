#!/bin/sh

# Check for at least one argument
if [ $# -lt 1 ]; then
    echo "Usage: $0 <path-to-img-1> <path-to-img-2> ..."
    exit 1
fi

# Temporary file to store current wallpaper index
TEMP_FILE="~/.cache/cwi"

# Initialize current wallpaper index or reset it to 0
if [ ! -f "$TEMP_FILE" ]; then
    echo 0 > "$TEMP_FILE"
fi

# Read images into an array
images=("$@")

# This controls (in seconds) when to switch to the next image
INTERVAL=30

while true; do
    # Read current wallpaper index from the temp file
    CURRENT_WALLPAPER=$(cat "$TEMP_FILE")

    while [ $CURRENT_WALLPAPER -lt ${#images[@]} ]; do
        swww img "${images[$CURRENT_WALLPAPER]}" \
            --transition-type random \
            --transition-step 1 \
            --transition-duration 1 \
            --transition-fps 144 \
            --filter Nearest
        sleep "$INTERVAL"

        # Increment current wallpaper index and save back to temp file
        CURRENT_WALLPAPER=$(($CURRENT_WALLPAPER + 1))
        echo $CURRENT_WALLPAPER > "$TEMP_FILE"
    done

    # Reset index to loop through images again
    echo 0 > "$TEMP_FILE"
done
