#!/bin/bash

# Define the USB drive name and mount point
drive_name="USB_Rom"
mount_point="/media/$drive_name"

# Check if the USB drive is already mounted
if grep -qs "$mount_point" /proc/mounts; then
  echo "The USB drive is already mounted at $mount_point"
else
  # If the USB drive is not mounted, find its device path
  device_path=$(lsblk -o NAME,LABEL | grep "$drive_name" | awk '{print "/dev/"$1}')

  # If the device path is not found, exit with an error message
  if [ -z "$device_path" ]; then
    echo "Unable to find the USB drive with name $drive_name"
    exit 1
  fi

  # Create the mount point directory if it doesn't already exist
  if [ ! -d "$mount_point" ]; then
    sudo mkdir "$mount_point"
  fi

  # Mount the USB drive
  sudo mount -t ntfs "$device_path" "$mount_point"
fi

# Move the roms folder to the USB drive
sudo mv /home/pi/retropie/roms "$mount_point"

# Create a symbolic link from the original roms folder to the USB drive
sudo ln -s "$mount_point/roms" /home/pi/retropie/roms

echo "USB drive mounted and roms folder moved." 
