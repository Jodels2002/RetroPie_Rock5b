#!/bin/bash
# B.Titze 2023      
      BLACK='\033[0;39m'
      BLUE='\033[1;34m'
      GREEN='\033[1;32m'
      RED='\033[1;31m'
      GREY='\033[1;30m'
power
clear
rm -rf /opt/retropie_rock5b
sudo cp -rf ~/retropie_rock5b /opt/

rm -rf ~/RetroPie-Setup
clear
mkdir -p /etc/emulationstation
sudo chmod -R 777 /etc/emulationstation
mkdir -p /opt/retropie/emulators
sudo chmod -R 777 /opt

if [ ! -d ~/RetroPie/BIOS/mame2003/ ]; then
mkdir ~/RetroPie
mkdir -p ~/RetroPie/BIOS

sudo chmod -R 777 /home/$USER/RetroPie
sudo apt install feh -y
clear
      toilet "Retropie" --metal
cd ~ 
git clone --depth=1 https://github.com/archtaurus/RetroPieBIOS.git
sudo cp -rf ~/RetroPieBIOS/BIOS/* /home/$USER/RetroPie/BIOS
fi

if [ ! -d /etc/emulationstation/themes/magazinemadness/ ]; then

      sudo mkdir -p /etc/emulationstation/themes
      sudo chmod -R 777 /etc/emulationstation
fi

clear
      toilet "Retropie" --metal
cd ~
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git

cd ~

sudo chmod -R 777 ~/RetroPie-Setup
cp -f -R /opt/retropie_rock5b/retropie/system.sh /home/$USER/RetroPie-Setup/scriptmodules/
cd RetroPie-Setup
sudo chmod -R 777 /opt
sudo __nodialog=1 __platform=rk3588 ./retropie_setup.sh basic_install

rm -rf ~/RetroPieBIOS 
clear
      toilet "Retropie" --metal
      
#First install
if [ ! -d /etc/emulationstation/themes/magazinemadness/ ]; then

sudo chmod -R 777 /etc/emulationstation
git clone --recursive --depth 1 --branch master "https://github.com/RetroHursty69/es-theme-magazinemadness.git" "/etc/emulationstation/themes/magazinemadness"
fi

clear
      toilet "Retropie" --metal
      sudo chmod -R 777  /usr/share/applications/ 
      sudo chmod -R 777 ~/RetroPie
      sudo chmod -R 777 /etc/emulationstation
      sudo chmod -R 777 /opt   
      cp -rf /opt/AmiRock/retropie/Retropie.desktop /usr/share/applications/ 
      
      if [ ! -f ~/RetroPie/roms/gba/gamelist.xml ]; then
      #Install Basic Roms from archive.org
      sudo chmod -R 777 /home/$USER/RetroPie
      cd /home/$USER/RetroPie
      wget https://archive.org/download/archive_20190819/Romset.zip
          
      cd ~/RetroPie/roms
      sudo unzip -o  /home/$USER/RetroPie/Romset.zip
      rm -rf /home/$USER/RetroPie/Romset.zip
      #BezelProject. https://www.youtube.com/watch?v=uq8IecVQ6yY
      cd /home/pi/RetroPie/retropiemenu/
      wget https://raw.githubusercontent.com/thebezelproject/BezelProject/master/bezelproject.sh
      chmod +x "bezelproject.sh"
      
      #Eazy-Hax-RetroPie-Toolkit
      curl https://raw.githubusercontent.com/Shakz76/Eazy-Hax-RetroPie-Toolkit/master/cfg/Install%20Eazy%20Hax%20RetroPie%20Toolkit.sh | bash
      
      
      fi

clear
 
cd /opt/retropie/configs/all/retroarch-joypads/
#unzip -u  /opt/AmiRock/retropie/Gamepad.zip
#cp -f -R  /opt/retropie/configs/all/retroarch-joypads/Gamepad/* /opt/retropie/configs/all/retroarch-joypads/
#mv /opt/retropie/configs/all/retroarch-joypads/es_input.cfg /opt/retropie/configs/all/emulationstation/
#rm -rf /opt/retropie/configs/all/retroarch-joypads/Gamepad 
cd
toilet "AmiRock-OS" --metal
      echo -e "$BLUE RetroRock ROM Operating System and Libraries" 
      echo -e "$GREY Version V2.0 2020-2021 RetroRock-OS "
echo " No Rights Reserved.  "
echo -e "$BLACK "
echo " Type 'e' start Emulationstation"
echo -e "$BLUE "
echo " 1.>  "
echo -e " 1.>  ( r ) Retropie setup                   "
echo " 1.>  ( m ) Retropie Menu                      " 
echo " 1.>  ( s ) Shutdown                                "  
echo -e "$GREY "
