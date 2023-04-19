   sudo apt install -y dialog mc zip unzip wget toilet ksnip
  sudo apt install -y gparted ntfs-3g nemo
  #sudo apt install build-essential -y
  sudo apt install arqiver geany -y
  sudo apt install 7zip -y
  #sudo apt install cockpit -y
  sudo apt install pt2-clone -y
  clear
  sudo apt install -y synaptic chromium 
  sudo apt install -y chromium-b* 
  clear
  sudo apt install autofs -y
  
  wget https://archive.raspberrypi.org/debian/pool/main/r/raspi-config/raspi-config_20230214_all.deb
	sudo dpkg -i raspi-config_20230214_all.deb
	sudo raspi-config nonint do_expand_rootfs
	rm -rf raspi-config_20230214_all.deb


sudo mkdir /usr/share/boot-video
sudo mkdir /usr/share/boot-video
sudo cp /opt/RetroPie_Rock5b/config/boot-video.mp4 /usr/share/boot-video/
sudo apt-get update -y
sudo apt-get install mpv -y

sudo apt-get -y install grafx2 protracker worker 
      cd ~
      unzip -o  /opt/RetroPie_Rock5b/config/worker.zip
      sudo chmod -R 777 /home/$USER/.worker/
      sudo mkdir /media/pi
	sudo mkdir /media/pi
	sudo mkdir /media/pi/USB1
	sudo mkdir /media/pi/USB2
	sudo mkdir /media/pi/USB3
	sudo mkdir /media/pi/USB4


  clear
      toilet "prepare" --metal
      echo " "
      echo " "
      echo "  First installation "
      echo " "
      


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

      cd /usr/share/icons
      sudo cp -rf /opt/RetroPie_Rock5b/config/AMIGAOSLINUX.zip /usr/share/icons
      sudo unzip -u  /usr/share/icons/AMIGAOSLINUX.zip
  
      sudo rm -rf /usr/share/icons/default
      sudo cp -rf /usr/share/icons/AMIGAOSLINUX/ /usr/share/icons/default/
      clear
      toilet "RetroPie_Rock5b" --metal
      echo " "
      echo " "
      echo "  First installation "
      echo " "
      cd /opt/RetroPie_Rock5b/
      git clone --depth=1 https://github.com/x64k/amitk
      clear
      sudo cp -rf /opt/RetroPie_Rock5b/amitk /usr/share/themes
      
      # sudo rm -rf $HOME/.config/
      #unzip -o  $HOME/AmiRock/config/config.zip
      
      cd /opt/RetroPie_Rock5b/
      git clone --depth=1 https://github.com/lordwolfchild/amigaos_xfwm4_themes
      clear

      sudo cp -rf /opt/RetroPie_Rock5b/amigaos_xfwm4_themes/* /usr/share/themes/
      sudo rm -rf /usr/share/themes/Default/xfwm4/
      sudo cp -rf /usr/share/themes/Amiga3.x_hidpi/* /usr/share/themes/Default/xfwm4/
      sudo cp -rf /opt/RetroPie_Rock5b/config/rpd-wallpaper/Commodore/* /usr/share/backgrounds/  

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
echo -e " 1.>  ( r ) Retropie setup                      "
echo " 1.>  ( m ) Config Menu                            " 
echo " 1.>  ( u ) RetroRock update                       " 
echo " 1.>  ( s ) Shutdown                               "  
echo -e "$GREY "
cd
