#!/bin/sh

# Check for at least one argument
if [ $# -lt 1 ]; then
    echo "Usage: $0 <path-to-img-1> <path-to-img-2> ..."
    exit 1
fi

# Read the images into an array
images=("$@")

# Set the wallpaper using swww
swww img "${images[$CURRENT_WALLPAPER]}" \
    --transition-type random \
    --transition-step 1 \
    --transition-duration 1 \
    --transition-fps 144 \
    --filter Nearest