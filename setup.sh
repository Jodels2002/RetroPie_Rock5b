#!/bin/bash
# Install AmiRock
# B.Titze 2023


BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
GREY='\033[1;30m'

# Add Raspberry Pi source list
echo "deb http://archive.raspberrypi.org/debian/ buster main" | sudo tee /etc/apt/sources.list.d/raspi.list
wget -qO - https://archive.raspberrypi.org/debian/raspberrypi.gpg.key | sudo apt-key add -

# Update package list
sudo apt update -y
echo '[Service]' | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo 'ExecStart=' | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
echo 'ExecStart=-/sbin/agetty --autologin pi --noclear %I $TERM' | sudo tee -a /etc/systemd/system/getty@tty1.service.d/autologin.conf
sudo systemctl daemon-reload

#************************************************  usefull Tools        **************************************  
 
  sudo apt install -y dialog mc zip unzip wget toilet 
  sudo apt install -y pulseaudio-*
  sudo apt install -y csound-u*
  sudo apt install -y ntfs-3g 
  sudo apt install autofs -y
  sudo apt install raspi-config -y
  sudo raspi-config nonint do_expand_rootfs
#************************************************  Fan Control by pymumu        **************************************   

clear
      		toilet "RetroRock5b" --metal
      		echo " "
      		echo " Fan-Control by pymumu"
          
git clone https://github.com/pymumu/fan-control-rock5b
cd fan-control-rock5b
make package
sudo dpkg -i fan-control*.deb
sudo systemctl enable fan-control
sudo systemctl start fan-control 
#************************************************  Install RetroRock Tools       **************************************   
 sudo cp -f -R ~/RetroPie_Rock5b/scripts/* /usr/local/bin
      sudo cp -f -R ~/RetroPie_Rock5b/ /opt
      sudo chmod -R 777 /usr/local/bin
      sudo chmod -R 777 /opt/RetroPie_Rock5b/
      
      
~/RetroPie_Rock5b/scripts/retropie_rock5b.sh
