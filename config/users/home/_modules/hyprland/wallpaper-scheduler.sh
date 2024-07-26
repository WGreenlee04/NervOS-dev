#!/bin/bash

if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
	echo "Usage:
	$0 <path-to-img-1> <path-to-img-2> ..."
	exit 1
fi

# This controls (in seconds) when to switch to the next image
INTERVAL=300

for img in "$@"
do
	swww img "$img" \ 
	--transition-type grow \
	--transition-step 1 \
	--transition-duration 1 \
	--transition-fps 144 \
	--filter Nearest
	sleep $INTERVAL
done