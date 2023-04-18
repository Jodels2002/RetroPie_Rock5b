#************************************************  Amiga        ************************************** 
 
 if [ ! -d /opt/Amiga/ ]; then
 
	     
	     sudo mkdir /opt/Amiga
	     chmod -R 777 /opt/Amiga
	     ln -s /opt/Amiga/ ~/Amiga
	     cd /opt/
             unzip -u  /opt/RetroPie_Rock5b/Amiga/Amiga.zip
       clear
       toilet „Amiga“ --metal
      echo " "
      echo " "
      echo "  First installation "
      echo " "
      
       sudo rm -rf /opt/Amiga/conf/amiberry.conf
       sudo rm -rf /opt/Amiga/conf/amiberry-osx.conf
      
      sudo apt install worker unadf xdms fonts-amiga -y
      sudo apt install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 flac mpg123 libmpeg2-4 
	clear
      
        toilet „Amiga“ --metal
      echo " "
      echo " "
      echo "  First installation "
      echo " "
      cd 
      unzip -u  /opt/RetroPie_Rock5b/config/worker.zip
      
      sudo cp -rf /opt/Amiga/data/AmigaTopaz.ttf /usr/share/fonts/truetype/amiga/
      
      sudo cp -R /opt/Amiga/data/amiberry.png /usr/share/applications/
      sudo cp -R /opt/Amiga/data/amiberry_dev.png /usr/share/applications/
      
      
            clear
      toilet „Amiga“ --metal
      echo " "
      echo " "
      echo "  First installation "
      echo " "
      
      cd 
      git clone --depth=1 https://github.com/rewtnull/amigafonts
      sudo cp -rf /home/$USER/amigafonts/ttf/* /usr/share/fonts/truetype/
      sudo rm -rf /home/$USER/amigafonts/
      sudo rm -rf /opt/Amiga/conf/am*
      

     
      clear
        toilet „Amiga“ --metal
      echo " "
      echo " "
      echo "  First installation "
      echo " "
      sudo ln -s /opt/vc/lib/libbcm_host.so /usr/lib/aarch64-linux-gnu/libbcm_host.so.0
fi
