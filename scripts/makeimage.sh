
sudo fdisk -l
sudo umount /dev/sda1
sudo dd if=/dev/nvme0n1 of=/dev/sda bs=4M status=progress
