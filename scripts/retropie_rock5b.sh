#!/bin/bash
# B.Titze 2023      
      BLACK='\033[0;39m'
      BLUE='\033[1;34m'
      GREEN='\033[1;32m'
      RED='\033[1;31m'
      GREY='\033[1;30m'
power
sudo raspi-config nonint do_expand_rootfs
clear
sudo apt install -y p7zip-full

rm -rf /opt/RetroPie_Rock5b
sudo rm -rf /etc/update-motd.d/*
sudo cp -rf ~/RetroPie_Rock5b /opt/
sudo cp -rf ~/RetroPie_Rock5b/config/rc.local /etc/
cp -rf ~/RetroPie_Rock5b/config/.bashrc ~/

clear
sudo mkdir -p /etc/emulationstation
sudo chmod -R 777 /etc/emulationstation
mkdir -p /opt/retropie/emulators
sudo chmod -R 777 /opt
#***********************************************  #AmiRock-OS install script  ***********************************
#************************************************  Amiga        ************************************** 
cd
if [ ! -d /opt/Amiga/dir/ ]; then
sudo rm -rf /opt/Amiga

sudo mkdir /opt/Amiga
sudo ln -s /opt/Amiga/ Amiga

sudo mkdir ~/Amiberry
cd ~/Amiberry
sudo ln -s /opt/Amiga/conf/ conf

cd /opt/
unzip -u  /opt/AmiRock/Amiga/Amiga.zip
clear
toilet "AmiRock-OS" --metal
echo " "
echo " "
echo "  First installation "
echo " "

sudo rm -rf /opt/Amiga/conf/amiberry.conf
sudo rm -rf /opt/Amiga/conf/amiberry-osx.conf

sudo apt install -y worker
sudo apt install -y unadf
sudo apt install -y xdms
sudo apt install -y fonts-amiga

sudo apt install -y cmake libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 flac mpg123 libmpeg2-4 libserialport0 libportmidi0
sudo apt install -y cmake libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libserialport-dev libportmidi-dev 


fi
if [ ! -d /opt/retropie/emulators/retroarch/ ]; then
rm -rf ~/RetroPie-Setup

cd ~
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
sudo chmod -R 777 ~/RetroPie-Setup
cp -f -R /opt/RetroPie_Rock5b/retropie/system.sh ~/RetroPie-Setup/scriptmodules/
cp -f -R /opt/RetroPie_Rock5b/retropie/retropie_setup.sh ~/RetroPie-Setup/

cd RetroPie-Setup
sudo chmod -R 777 /opt
sudo __nodialog=1 __platform=rk3588 ./retropie_setup.sh basic_install
sudo  ./retropie_setup.sh basic_install


fi

if [ -d /opt/AmigaVision/games/Amiga/ ]; then
clear
 toilet "AmigaVision" --metal
      echo -e "$GREY RetroRock-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 AmiRock-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e "$BLUE"
      echo " AmigaVision"
      echo -e "$GREEN ready  --- have fun :-)"
      echo -e "$GREY "
      echo " "
      sudo chmod -R 777 /usr/share/applications/
      cp -rf /opt/RetroPie_Rock5b/Amiga/AmigaVision/AmigaVision.desktop /usr/share/applications/ 
      cp -rf /opt/RetroPie_Rock5b/Amiga/AmigaVision/AmigaVision.desktop ~/Desktop 
      cp -rf /opt/RetroPie_Rock5b/Amiga/AmigaVision/AmigaVision.uae /opt/Amiga/conf/
     
      
      cp -rf /opt/AmigaVision/games/Amiga/*.rom /opt/Amiga/kickstarts/
      cp -rf /opt/AmigaVision/games/Amiga500/*.rom /opt/Amiga/kickstarts/
      cd
      sudo ln -s /opt/Amiga/ ~/Amiga
fi 

      #Symbolic Links
      if [  -d /opt/Amiga/dir/pimiga3/disks/Games ]; then
      
      sudo chmod -R 777 /opt/Amiga/dir/Software
      rm -d -r /opt/Amiga/dir/Software/Games
      cd /opt/Amiga/dir/pimiga3/disks/Games/WHDLOAD/
      
      ln -s /opt/Amiga/dir/pimiga3/disks/Games/WHDLOAD/ /opt/Amiga/dir/Software/Games
      rm -d -r /opt/Amiga/dir/Software/Demos
      cd /opt/Amiga/dir/pimiga3/disks/Demos/WHDLOAD/
      
      ln -s /opt/Amiga/dir/pimiga3/disks/Demos/WHDLOAD/ /opt/Amiga/dir/Software/Demos
 fi
 if [  -d /opt/retropie/configs/all/retroarch ]; then
      rm -d -r /home/$USER/.config/retroarch
      ln -s /opt/retropie/configs/all/retroarch/ /home/$USER/.config/retroarch
 fi
clear
      sudo mkdir -p /media/pi
      
clear
      toilet "RetroRock" --metal
      sudo chmod -R 777  /usr/share/applications  
      sudo chmod -R 777 /etc/emulationstation
      sudo chmod -R 777 /opt 
      sudo chmod -R 777 ~/RetroPie
      sudo chmod -R 777 ~/RetroPie-Setup
   
      rm -rf ~/RetroPie_Rock5b
     

clear
 
cd
toilet "RetroRock" --metal
      echo -e "$BLUE RetroRock ROM Operating System and Libraries" 
      echo -e "$GREY Version V2.0 2020-2021 RetroRock-OS "
echo " No Rights Reserved.  "
echo -e "$BLACK "
echo " Type 'd' start Workbench "
echo -e "$BLUE "
echo " 1.>  "
echo -e " 1.>  ( e ) Emulationstation                    "
echo -e " 1.>  ( d ) Linux Desktop                       "
echo " 1.>  ( m ) Config Menu                            " 
echo " 1.>  ( u ) RetroRock update                       " 
echo " 1.>  ( s ) Shutdown                               "  
echo -e "$GREY "
cd

