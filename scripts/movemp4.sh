#!/bin/bash

# Replace "source_dir" with the path to the directory containing the .m4 files
source_dir="/home/pi/RetroPie/"

# Replace "destination_dir" with the path to the directory where you want to move the .m4 files
destination_dir="/home/pi/RetroPie_MP4/"

# Create the destination directory if it doesn't exist
mkdir -p "$destination_dir"

# Move all .m4 files to the destination directory while preserving subdirectories
find "$source_dir" -name "*.mp4" -type f -exec sh -c '
  for file do
    dest="$destination_dir/${file#$source_dir/}"
    mkdir -p "$(dirname "$dest")"
    mv "$file" "$dest"
  done' sh {} +








