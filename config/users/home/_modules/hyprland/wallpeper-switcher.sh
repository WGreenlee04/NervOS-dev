#!/bin/sh

# Check for at least one argument
if [ $# -lt 1 ]; then
    echo "Usage: $0 <path-to-img-1> <path-to-img-2> ..."
    exit 1
fi

TEMPFILE="$HOME/.cache/cwi"
images=("$@")

# Ensure the temporary file exists; if not, create it with a default value
if [ ! -f "$TEMPFILE" ]; then
    echo 0 > "$TEMPFILE"
fi

# Read the current wallpaper index from the temporary file
CURRENT_WALLPAPER=$(cat "$TEMPFILE")

# Calculate the index of the next wallpaper
NUM_IMAGES=${#images[@]}
CURRENT_WALLPAPER=$(( (CURRENT_WALLPAPER + 1) % NUM_IMAGES ))

# Set the wallpaper using swww
swww img "${images[$CURRENT_WALLPAPER]}" \
            --transition-type center \
            --transition-step 1 \
            --transition-duration 1 \
            --transition-fps 255 \
            --filter CatmullRom

# Save the new wallpaper index to the temporary file
echo "$CURRENT_WALLPAPER" > "$TEMPFILE"
