#!/bin/sh

# Check for at least one argument
if [ $# -lt 1 ]; then
    echo "Usage: $0 <path-to-img-1> <path-to-img-2> ..."
    exit 1
fi

# Temporary file to store current wallpaper index
TEMP_FILE="~/.cache/cwi"

# Read images into an array
images=("$@")

# Check if the temporary file exists
if [ ! -f "$TEMP_FILE" ]; then
    echo "Error: Temporary file $TEMP_FILE does not exist."
    exit 1
fi

# Read current wallpaper index from the temp file
CURRENT_WALLPAPER=$(cat "$TEMP_FILE")

# Validate index
if [ "$CURRENT_WALLPAPER" -ge ${#images[@]} ] || [ "$CURRENT_WALLPAPER" -lt 0 ]; then
    echo "Error: Invalid index $CURRENT_WALLPAPER in $TEMP_FILE."
    exit 1
fi

# Set the wallpaper
swww img "${images[$CURRENT_WALLPAPER]}" \
    --transition-type random \
    --transition-step 1 \
    --transition-duration 1 \
    --transition-fps 144 \
    --filter Nearest

# Exit the script
exit 0
