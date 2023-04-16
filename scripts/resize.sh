#!/bin/bash

# Check if the script is running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Get the current home directory
home_dir=$(eval echo ~${SUDO_USER})

# Get the current file system size
current_size=$(df -h $home_dir | awk 'NR==2{print $2}')

# Resize the file system to the maximum available size
resize2fs $(df $home_dir | awk 'NR==2{print $1}')

# Get the new file system size
new_size=$(df -h $home_dir | awk 'NR==2{print $2}')

# Print the current and new file system sizes
echo "File system size before resize: $current_size"
echo "File system size after resize: $new_size"
