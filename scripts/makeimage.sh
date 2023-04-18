#!/bin/bash
# B.Titze 2023      
      BLACK='\033[0;39m'
      BLUE='\033[1;34m'
      GREEN='\033[1;32m'
      RED='\033[1;31m'
      GREY='\033[1;30m'# https://florianmuller.com/quickly-resize-and-shrink-raspberry-pi-sd-card-image-on-macos

sudo fdisk -l
sudo umount /dev/sda1
sudo mkdir /media/sda1
sudo umount /dev/sdb1
sudo mkdir /media/sdb1

sudo chmod -R 777 /media/usb
sudo mount /dev/sda1 /media/usb
sudo dd if=/dev/nvme0n1 of=/media/sda1/nvme0n1.img bs=4M status=progr
#sudo dd if=/dev/mmcblk1 of=/media/usb/mmcblk1.img bs=4M status=progress
