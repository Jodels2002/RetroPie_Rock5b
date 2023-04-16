

echo "deb http://archive.raspberrypi.org/debian/ buster main" >> /etc/apt/sources.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7FA3303E
sudo apt install raspi-config
sudo /etc/init.d/resize2fs start

sudo wget https://raw.githubusercontent.com/canonical/cloud-utils/main/bin/growpart -P /usr/local/bin/
sudo chmod +x /usr/local/bin/growpart

# assuming we are resizing an ext4 partition "/dev/mmcblk1p1":
sudo growpart /dev/mmcblk1 1
sudo resize2fs /dev/mmcblk1p1
