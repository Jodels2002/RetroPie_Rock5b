
sudo fdisk -l
sudo umount /dev/sda1
sudo dd if=/dev/nvme0n1 of=/dev/sda bs=4M status=progress
sudo dd if=/dev/sda of=Rockpi.img bs=4M status=progress

sudo losetup -fP /dev/sda/Rockpi.img
sudo resize2fs /dev/loop1 5G
sudo truncate -s 5G debian.img
