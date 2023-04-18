#!/bin/bash
# B.Titze 2023      
# https://florianmuller.com/quickly-resize-and-shrink-raspberry-pi-sd-card-image-on-macos

sudo fdisk -l
sudo umount /dev/sda1
sudo mkdir /media/usb
sudo chmod -R 777 /media/usb
sudo mount /dev/sda1 /media/usb
sudo dd if=/dev/nvme0n1 of=/dev/sda1/nvme0n1.img bs=4M status=progress
#sudo dd if=/dev/mmcblk1 of=/dev/sda1/mmcblk1.img bs=4M status=progress
