  wget https://archive.raspberrypi.org/debian/pool/main/r/raspi-config/raspi-config_20230214_all.deb
	sudo dpkg -i raspi-config_20230214_all.deb
	rm -rf raspi-config_20230214_all.deb
  
  clear
      toilet "prepare" --metal
      echo " "
      echo " "
      echo "  First installation "
      echo " "
      

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

    
