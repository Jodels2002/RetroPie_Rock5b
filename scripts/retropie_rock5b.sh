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
sudo cp -rf ~/RetroPie_Rock5b /opt/
sudo cp -rf ~/RetroPie_Rock5b/config/rc.local /etc/
cp -rf ~/RetroPie_Rock5b/config/.bashrc ~/

clear
mkdir -p /etc/emulationstation
sudo chmod -R 777 /etc/emulationstation
mkdir -p /opt/retropie/emulators
sudo chmod -R 777 /opt/



if [  -f /lib/armbian/armbian-allwinner-battery ]; then
      sudo chmod -R 777 /lib/armbian/
      mkdir -p /lib/armbian/deaktiv
      sudo systemctl disable armbian-zram-config 
      sudo systemctl disable armbian-ramlog
      sudo systemctl disable console-setup
      sudo systemctl disable openvpn
 
      
      
       mv /lib/armbian/armbian-allwinner-battery /lib/armbian/deaktiv
       #mv /lib/armbian/armbian-common sudo /lib/armbian/deaktiv
       #mv /lib/armbian/armbian-hardware-monitor /lib/armbian/deaktiv
       #mv  /lib/armbian/armbian-hardware-optimization /lib/armbian/deaktiv
       #mv /lib/armbian/armbian-truncate-logs /lib/armbian/deaktiv
       #mv /lib/armbian/armbian-zram-config /lib/armbian/deaktiv
       #mv /lib/armbian/armbian-led-state-restore.sh /lib/armbian/deaktiv
       #mv /lib/armbian/armbian-ramlog /lib/armbian/deaktiv
fi

if [ ! -d /opt/retropie/emulators/retroarch/ ]; then
rm -rf ~/RetroPie-Setup

cd ~
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
sudo chmod -R 777 ~/RetroPie-Setup
cp -f -R /opt/RetroPie_Rock5b/retropie/system.sh ~/RetroPie-Setup/scriptmodules/
cp -f -R /opt/RetroPie_Rock5b/retropie/retropie_setup.sh /home/$USER/RetroPie-Setup/

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

