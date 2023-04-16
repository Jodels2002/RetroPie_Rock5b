#!/bin/bash
# Install Retrorock
# B.Titze 2023


BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
GREY='\033[1;30m'

 # Add the Raspberry Pi software repository to the sources.list file
      echo "deb http://archive.raspberrypi.org/debian/ buster main" | sudo tee -a /etc/apt/sources.list

   
      curl -1sLf https://archive.raspberrypi.org/debian/raspberrypi.gpg.key | sudo apt-key add -
      sudo apt update -y
      sudo apt install raspi-config -y
      sudo raspi-config nonint do_expand_rootfs
      line="deb http://archive.raspberrypi.org/debian/ buster main"
      sed -i "/$line/d" /etc/apt/sources.list

      sudo apt update -y


#************************************************  usefull Tools        **************************************  
 
  sudo apt install -y dialog mc zip unzip wget toilet 
  sudo apt install -y pulseaudio-*
  sudo apt install -y pavucontrol
  sudo apt install -y csound-u*
  sudo apt install -y ntfs-3g 
  sudo apt install autofs -y
  sudo apt install -y autoconf 
  sudo apt install -y build-essential 
  sudo apt install raspi-config -y
  sudo raspi-config nonint do_expand_rootfs
  
  
        sudo apt-get -y remove pulseaudio
	sudo apt-get -y install pulseaudio
	sudo /etc/init.d/alsa-utils reset
	sudo apt-get -y install pi-bluetooth
	sudo apt-get -y install bluez bluez-firmware baobab 
	sudo usermod -G bluetooth -a pi
        sudo usermod -G audio -a pi
        sudo usermod -G video -a pi  
	
 #************************************************  Install Desktop       **************************************   
 sudo apt install -y xserver-xorg xfce4 xfce4-goodies lxinput xini* 
	sudo apt install -y xfce4-te*
	sudo apt install -y chromium gparted
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
