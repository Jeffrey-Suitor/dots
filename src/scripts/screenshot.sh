#!/bin/bash

DIR="${HOME}"
DATE="$(date +%Y%m%d-%H%M%S)"
NAME="${DIR}/screenshot-${DATE}.png"

# Check if the dir to store the screenshots exists, else create it:
if [ ! -d "${DIR}" ]; then mkdir -p "${DIR}"; fi

# Screenshot a selected window
if [ "$1" = "win" ]; then import -format png "${NAME}"; fi

# Screenshot the entire screen
if [ "$1" = "scr" ]; then import -format png -window root "${NAME}"; fi

# Screenshot a selected area
if [ "$1" = "area" ]; then import -format png "${NAME}"; fi
