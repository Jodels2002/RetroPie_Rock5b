#!/bin/bash
# Install Retrorock
# B.Titze 2023
#extraargs="console=tty3 consoleblank=0 loglevel=1 quiet"

BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
GREY='\033[1;30m'


      sudo cp -f -R ~/RetroPie_Rock5b/scripts/* /usr/local/bin
      sudo cp -f -R ~/RetroPie_Rock5b/ /opt
      sudo chmod -R 777 /usr/local/bin
      sudo chmod -R 777 /opt/RetroPie_Rock5b/
 
       sudo apt update -y
       
      
#************************************************  Make User pi       **************************************        
      sudo useradd -m pi
      sudo usermod -G audio -a pi
      sudo usermod -G video -a pi  
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

#************************************************  Needed stuff        **************************************  
  sudo install -y raspi-config
  sudo raspi-config nonint do_expand_rootfs   
	
sudo apt install -y dialog mc zip unzip wget toilet ksnip
sudo apt install -y gparted ntfs-3g nemo feh
sudo apt install build-essential -y
sudo apt install arqiver geany -y
sudo apt install 7zip -y
sudo apt purge lightd* -y
#sudo apt install cockpit -y
sudo apt purge -y lxde  lxde-common lxde-core openbox-lxde-session
sudo apt purge -y raspberrypi-ui-mods 
sudo apt purge -y xser* xor* xin*
sudo apt purge -y gnome*
sudo rm -rf /home/$USER/.cache/*  	
 
  
  sudo apt install -y worker 
      mkdir -p ~/.worker 
      cd
      sudo unzip -o  /opt/RetroPie_Rock5b/config/worker.zip 
      sudo cp -rf /opt/RetroPie_Rock5/config/config ~/.worker/   
      cp -rf /opt/RetroPie_Rock5b/retropie/Retropie.desktop /usr/share/applications/ 
     
  
        #sudo apt install libegl-mesa0 libegl1-mesa-dev libgbm-dev libgl1-mesa-dev libgles2-mesa-dev libglx-mesa0 mesa-common-dev mesa-vulkan-drivers -y  
          
	
 #************************************************  Install Desktop       **************************************   
        sudo apt install -y xserver-xorg xini* 
	#sudo apt install -y xfce4-te* xfce4 xfce4-goodies lxinput
	#sudo apt install -y chromium gparted
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

sudo chmod -R 775 /usr/share/plymouth/
	 sudo rm -rf /usr/share/plymouth/themes/spinner/watermark.png
	 sudo cp -rf /opt/RetroPie_Rock5b/config/Retrorock.png /usr/share/plymouth/themes/spinner/watermark.png
	 sudo cp -rf /opt/RetroPie_Rock5b/config/Retrorock.png /usr/share/plymouth/ubuntu-logo.png
	 
	  sudo rm -rf /usr/share/plymouth/themes/armbian/watermark.png
	 sudo cp -rf /opt/RetroPie_Rock5b/config/Retrorock.png /usr/share/plymouth/themes/armbian/watermark.png
	 sudo cp -rf /opt/RetroPie_Rock5b/config/Retrorock.png /usr/share/plymouth/ubuntu-logo.png
  	
  	sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/spinner/spinner.plymouth 500
	sudo update-initramfs -u

 #***********************************************  #AmiRock-OS install script  ***********************************

cd
	unzip -o  $HOME/RetroPie_Rock5b/config/config.zip
	unzip -o  $HOME/RetroPie_Rock5b/config/worker.zip

	~/RetroPie_Rock5b/scripts/retropie_rock5b.sh
