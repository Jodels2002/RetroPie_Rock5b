#!/bin/bash
# B.Titze 2023      
      BLACK='\033[0;39m'
      BLUE='\033[1;34m'
      GREEN='\033[1;32m'
      RED='\033[1;31m'
      GREY='\033[1;30m'
power
clear
rm -rf /opt/RetroPie_Rock5b
sudo rm -rf /etc/update-motd.d/*
sudo cp -rf ~/RetroPie_Rock5b /opt/
sudo cp -rf ~/RetroPie_Rock5b/config/rc.local /etc/
cp -rf ~/RetroPie_Rock5b/config/.bashrc ~/

clear
mkdir -p /etc/emulationstation
sudo chmod -R 777 /etc/emulationstation
mkdir -p /opt/retropie/emulators
sudo chmod -R 777 /opt/


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
clear
      toilet "RetroRock" --metal
      
clear
      toilet "RetroRock" --metal
      sudo chmod -R 777  /usr/share/applications/  
      sudo chmod -R 777 /etc/emulationstation
      sudo chmod -R 777 /opt 
      sudo chmod -R 777 ~/RetroPie
      sudo chmod -R 777 ~/RetroPie-Setup
        
          
      cp -rf /opt/AmiRock/retropie/Retropie.desktop /usr/share/applications/ 
      
      rm -rf ~/RetroPie_Rock5b
     

clear
 
cd
toilet "RetroRock" --metal
      echo -e "$BLUE RetroRock ROM Operating System and Libraries" 
      echo -e "$GREY Version V2.0 2020-2021 RetroRock-OS "
echo " No Rights Reserved.  "
echo -e "$BLACK "
echo " Type 'e' start Emulationstation (RetroPie)"
echo -e "$BLUE "
echo " 1.>  "
echo -e " 1.>  ( d ) Linux Desktop                    "
echo -e " 1.>  ( r ) Retropie setup                   "
echo " 1.>  ( m ) Config Menu                      " 
echo " 1.>  ( s ) Shutdown                                "  
echo -e "$GREY "
cd

