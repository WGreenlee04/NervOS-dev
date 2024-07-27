#!/bin/sh

# Check for at least two arguments
if [ $# -lt 2 ]; then
    echo "Usage: $0 <path-to-switch-script> <path-to-img-1> <path-to-img-2> ..."
    exit 1
fi

# Extract the path to the switch script and images
SWITCH_SCRIPT="$1"
shift
images=("$@")

# Check if the switch script exists and is executable
if [ ! -x "$SWITCH_SCRIPT" ]; then
    echo "Error: Switch script '$SWITCH_SCRIPT' is not executable or does not exist."
    exit 1
fi

# This controls (in seconds) when to switch to the next image
INTERVAL=300

while true; do
    # Call the script at the path provided in the args and pass in the images
    "$SWITCH_SCRIPT" "${images[@]}"
    
    # Check if the switch script ran successfully
    if [ $? -ne 0 ]; then
        echo "Error: Failed to execute switch script '$SWITCH_SCRIPT'."
        exit 1
    fi

    # Sleep for the specified interval
    sleep "$INTERVAL"
done
