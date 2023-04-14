#!/bin/bash
# Install AmiRock
# B.Titze 2023


BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
GREY='\033[1;30m'

   sudo echo "bootlogo=true" >> /boot/armbianEnv.txt
	 sudo echo "overlays=rk3588-i2c0-m1" >> /boot/armbianEnv.txt
#************************************************  usefull Tools        **************************************  
  sudo apt install -y dialog mc zip unzip wget toilet 
  sudo apt install -y ntfs-3g 
  sudo apt install autofs -y
  sudo apt install raspi-config -y
  sudo raspi-config nonint do_expand_rootfs
#************************************************  Fan Control by pymumu        **************************************   

clear
      		toilet "AmiRock" --metal
      		echo " "
      		echo " Fan-Control by pymumu"
          
git clone https://github.com/pymumu/fan-control-rock5b
cd fan-control-rock5b
make package
sudo dpkg -i fan-control*.deb
sudo systemctl enable fan-control
sudo systemctl start fan-control 

~/RetroPie_Rock5b/scripts/retropie_rock5b.sh
