
sudo fdisk -l
sudo umount /dev/sda1
sudo mount /dev/sda1 /mnt

sudo dd if=/dev/nvme0n1 of=/mnt/RockPi.img bs=4M status=progress
dd if=/dev/nvme0n1 of=/mnt bs=128K conv=noerror,sync

sudo losetup -fP /dev/sda/Rockpi.img
sudo resize2fs /dev/loop1 5G
sudo truncate -s 5G debian.img
