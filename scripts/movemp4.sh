#!/bin/bash

# Replace "source_dir" with the path to the directory containing the .m4 files
source_dir="~/RetroPie"

# Replace "destination_dir" with the path to the directory where you want to move the .m4 files
destination_dir="~/RetroPie_MP4"

# Create the destination directory if it doesn't exist
mkdir -p "$destination_dir"

# Move all .m4 files to the destination directory
find "$source_dir" -name "*.mp4" -type f -exec mv {} "$destination_dir" \;
