#!/bin/bash

# Check if the script is running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Get the device name of the last partition
device=$(lsblk -lp | grep "part $" | tail -n 1 | awk '{print $1}')

# Get the current file system size
current_size=$(df -h $device | awk 'NR==2{print $2}')

# Resize the partition to the maximum available size
parted -s $device resizepart $(parted $device print free | grep 'Free Space' | tail -n 1 | awk '{print $1}') 100%

# Resize the file system on the partition to the maximum available size
resize2fs $device

# Get the new file system size
new_size=$(df -h $device | awk 'NR==2{print $2}')

# Print the current and new file system sizes
echo "File system size before resize: $current_size"
echo "File system size after resize: $new_size"
