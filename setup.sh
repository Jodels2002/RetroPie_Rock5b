#!/bin/bash
# RetroRock
# B.Titze 2023


BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
GREY='\033[1;30m'
      sudo update-locale LANG=en_US.UTF-8
      setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,gb,de,fr,it,gr,dk
      sudo echo "pi ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
      
sudo systemctl disable getty@tty1.service

sudo tee /etc/systemd/system/autologin@.service > /dev/null <<EOT
[Unit]
Description=Autologin to console as %I
After=getty.target

[Service]
ExecStart=-/sbin/agetty --autologin pi --noclear %I 38400 linux

[Install]
WantedBy=multi-user.target
EOT
sudo systemctl daemon-reload
sudo systemctl enable autologin@tty1.service
echo "Autologin enabled for user pi"
sudo apt-get update -y

if [ ! -d /opt/retropie/emulators/retroarch/ ]; then
rm -rf ~/RetroPie-Setup
cd ~
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
sudo chmod -R 777 ~/RetroPie-Setup
cp -f -R /opt/RetroPie_Rock5b/retropie/system.sh ~/RetroPie-Setup/scriptmodules/
cp -f -R /opt/RetroPie_Rock5b/retropie/retropie_setup.sh /home/$USER/RetroPie-Setup/

cd RetroPie-Setup
sudo chmod -R 777 /opt
sudo  ./retropie_setup.sh 


fi
#************************************************  usefull Tools        **************************************  
         sudo cp -f -R ~/RetroPie_Rock5b/scripts/* /usr/local/bin
         sudo cp -f -R ~/RetroPie_Rock5b/ /opt
         sudo chmod -R 777 /usr/local/bin
         sudo chmod -R 777 /opt/RetroPie_Rock5b/
	sudo apt install -y dialog mc zip unzip wget toilet 
        sudo apt install -y ntfs-3g 
        sudo apt install autofs -y
        sudo apt install -y autoconf 
        #sudo apt install -y build-essential 
       	sudo apt install -y pulseaudio-*
        sudo apt install -y pavucontrol
        sudo apt install -y csound-u*
	sudo /etc/init.d/alsa-utils reset
	sudo apt-get -y install pi-bluetooth
	sudo apt-get -y install bluez bluez-firmware baobab 
	sudo usermod -G bluetooth -a pi
        sudo usermod -G audio -a pi
        sudo usermod -G video -a pi 
	sudo dpkg -i raspi-config_20230214_all.deb
	#sudo dpkg -i --force-overwrite /opt/RetroPie_Rock5b/config/linux-gpu-mali-wayland_1.1-g6p0-20230406_arm64.deb 
	rm -rf raspi-config_20230214_all.deb
	
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
 
    
      
      sudo raspi-config nonint do_expand_rootfs

      
~/RetroPie_Rock5b/scripts/retropie_rock5b.sh
