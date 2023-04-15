sudo fdisk -l
sudo umount /dev/sdb1
sudo dd if=/dev/nvme0n1 of=/dev/sdb bs=4M status=progress
