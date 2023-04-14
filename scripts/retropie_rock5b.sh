 BLACK='\033[0;39m'
      BLUE='\033[1;34m'
      GREEN='\033[1;32m'
      RED='\033[1;31m'
      GREY='\033[1;30m'
power
clear
rm -rf /home/$USER/RetroPie-Setup
clear

sudo chmod -R 777 /etc/emulationstation
mkdir -p /opt/retropie/emulators
sudo chmod -R 777 /opt

if [ ! -d /home/$USER/RetroPie/BIOS/mame2003/ ]; then
mkdir /home/$USER/RetroPie
mkdir /home/$USER/RetroPie/BIOS

sudo chmod -R 777 /home/$USER/RetroPie
sudo apt install feh -y
clear
      toilet "Retropie" --metal
cd  
git clone --depth=1 https://github.com/archtaurus/RetroPieBIOS.git
sudo cp -rf $HOME/RetroPieBIOS/BIOS/* /home/$USER/RetroPie/BIOS
fi

if [ ! -d /etc/emulationstation/themes/magazinemadness/ ]; then

      sudo mkdir -p /etc/emulationstation/themes
      sudo chmod -R 777 /etc/emulationstation
fi

clear
      toilet "Retropie" --metal
cd
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git

cd ~
git clone https://github.com/zerojay/RetroPie-Extra.git
cd RetroPie-Extra/
sudo chmod -R 777 /home/$USER/RetroPie-Extra
./install-extras.sh
rm -rf /home/$USER/RetroPie-Extra

cd
sudo chmod -R 777 /home/$USER/RetroPie-Setup
cp -f -R /opt/AmiRock/retropie/system.sh /home/$USER/RetroPie-Setup/scriptmodules/
cd RetroPie-Setup
sudo chmod -R 777 /opt
sudo __nodialog=1 __platform=rk3588 ./retropie_setup.sh basic_install
cd /opt/retropie/configs/all/retroarch-joypads/
unzip -u  /opt/AmiRock/retropie/Gamepad.zip
cp -f -R  /opt/retropie/configs/all/retroarch-joypads/Gamepad/* /opt/retropie/configs/all/retroarch-joypads/
mv /opt/retropie/configs/all/retroarch-joypads/es_input.cfg /opt/retropie/configs/all/emulationstation/
rm -rf /opt/retropie/configs/all/retroarch-joypads/Gamepad 
rm -rf /home/$USER/RetroPieBIOS 
clear
      toilet "Retropie" --metal
      
#First install
if [ ! -d /etc/emulationstation/themes/magazinemadness/ ]; then
sudo chmod -R 777 /etc/emulationstation
git clone --recursive --depth 1 --branch master "https://github.com/RetroHursty69/es-theme-magazinemadness.git" "/etc/emulationstation/themes/magazinemadness"
fi

clear
      toilet "Retropie" --metal
      
if [ ! -f /home/$USER/RetroPie/Romset.zip ]; then
      sudo chmod -R 777 /home/$USER/RetroPie
      cd /home/$USER/RetroPie
      wget https://archive.org/download/archive_20190819/Romset.zip
      cd /home/$USER/RetroPie/roms
      sudo unzip -o  /home/$USER/RetroPie/Romset.zip
fi

      sudo chmod -R 777  /usr/share/applications/ 
      sudo chmod -R 777 /home/$USER/RetroPie
      sudo chmod -R 777 /etc/emulationstation
      sudo chmod -R 777 /opt
cp -rf /opt/AmiRock/retropie/Retropie.desktop /usr/share/applications/ 
 
 
 if [ ! -d /home/rock/wine/share/wine ]; then
      clear
      toilet "Retropie" --metal
      cp -rf /opt/AmiRock/retropie/Retropie.desktop /home/$USER/Desktop/
 fi

clear
cd
toilet "AmiRock-OS" --metal
      echo -e "$BLUE AmiRock-OS ROM Operating System and Libraries" 
      echo -e "$GREY Version V2.0 2020-2021 AmiRock-OS "
echo " No Rights Reserved.  "
echo -e "$BLACK "
echo " Type 'd' to boot into AmiRock Workbench"
echo -e "$BLUE "
echo " 1.>  "
echo -e " 1.>  ( u ) AmiRock-OS Update                     "
echo " 1.>  ( m ) ArmRock-OS Config                       " 
echo -e " 1.>  ( c ) Armbian-Config                       "
echo " 1.>  ( s ) Shutdown                                "  
echo -e "$GREY "
