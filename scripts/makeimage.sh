sudo fdisk -l
sudo umount /dev/sdb1
sudo dd if=/dev/sda of=/dev/sdb bs=4M status=progress
