#!/bin/bash
# B.Titze 2023      
      BLACK='\033[0;39m'
      BLUE='\033[1;34m'
      GREEN='\033[1;32m'
      RED='\033[1;31m'
      GREY='\033[1;30m'# https://florianmuller.com/quickly-resize-and-shrink-raspberry-pi-sd-card-image-on-macos
sudo mount /dev/sdb1 /media/sdb1
sudo fdisk -l

if [ ! -f /media/sdb1/nvme0n1.img ]; then
# sudo rm -rf /media/sdb1/nvme0n1.img
echo 
fi

sudo umount /dev/sda1
sudo mkdir /media/sda1
sudo umount /dev/sdb1
sudo mkdir /media/sdb1

sudo chmod -R 777 /media/usb
sudo mount /dev/sda1 /media/usb
sudo dd if=/dev/nvme0n1 of=/media/sdb1/nvme0n1.img bs=4M status=progr
#sudo dd if=/dev/mmcblk1 of=/media/usb/mmcblk1.img bs=4M status=progress




# Check that three arguments were passed
if [ $# -ne 3 ]; then
  echo "Usage: $0 <source file> <destination file> <size in MB>"
  exit 1
fi

# Assign arguments to variables
src_file="/media/sda1/nvme0n1.img"
dest_file="/media/sda1/SmallRock.img"
size_mb="$3"

# Calculate size in bytes
size_bytes=$(( $size_mb * 1024 * 1024 ))

# Get current size of source file
src_size=$(wc -c < "$src_file")

# Check that source file is larger than desired size
if [ $src_size -le $size_bytes ]; then
  echo "Error: source file is not larger than desired size"
  exit 1
fi

# Shrink source file to desired size
#truncate -s "$size_bytes" "$src_file"

# Copy shrunk file to destination file
cp "$src_file" "$dest_file"
