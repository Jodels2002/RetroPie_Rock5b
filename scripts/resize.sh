#!/bin/bash

# Check if the script is running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Get the device name of the disk
device=$(lsblk -lp | grep "disk" | awk '{print $1}')

# Get the mountpoint of the root file system
root_mount=$(df / | tail -n 1 | awk '{print $6}')

# Get the name of the last partition on the device
last_part=$(lsblk -lp | grep "part $" | tail -n 1 | awk '{print $1}')

# Get the start and end positions of the largest free space
largest_free=$(parted $device print free | awk '/Free Space/ {print $1,$3}' | sort -n -k 2 | tail -n 1)

# Get the start position and size of the last partition
last_part_start=$(parted $device print | grep "^ *[0-9]" | tail -n 1 | awk '{print $2}')
last_part_size=$(parted $device print | grep "^ *[0-9]" | tail -n 1 | awk '{print $4}')

# Check if the last partition is already using the largest free space
if [[ "$largest_free" =~ "$last_part_start" ]] && [[ "$largest_free" =~ "$last_part_size" ]]
then
    echo "The last partition is already using the largest free space."
    exit
fi

# Calculate the end position of the largest free space
largest_free_end=$(echo $largest_free | awk '{print $2}')

# Calculate the new end position and size of the last partition
new_last_part_end=$((largest_free_end - 1))
new_last_part_size=$((new_last_part_end - last_part_start + 1))

# Resize the last partition to the new size
parted -s $device resizepart $(lsblk -lp | grep "part $" | tail -n 1 | awk '{print $1}') ${new_last_part_size}s

# Resize the file system on the partition to the maximum available size
resize2fs $last_part

# Get the new file system size
new_size=$(df -h $root_mount | awk 'NR==2{print $2}')

# Print the current and new file system sizes
echo "File system size before resize: $last_part_size"
echo "File system size after resize: $new_size"
