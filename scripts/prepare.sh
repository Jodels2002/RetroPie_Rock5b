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
      toilet "AmiRock-OS" --metal
      echo " "
      echo " "
      echo "  First installation "
      echo " "
      cd /opt/RetroPie_Rock5b/
      git clone --depth=1 https://github.com/x64k/amitk
      clear
      sudo cp -rf /opt/RetroPie_Rock5b/amitk /usr/share/themes
      sudo cp -rf /opt/RetroPie_Rock5b/config/Logo/* /usr/share/
  

    
