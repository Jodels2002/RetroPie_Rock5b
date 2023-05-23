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


if [ ! -d /opt/retropie/emulators/retroarch/ ]; then
rm -rf ~/RetroPie-Setup
sudo apt install -y p7zip-full
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

