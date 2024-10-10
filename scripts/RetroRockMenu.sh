#!/bin/bash
# Install KickPi-OS
# B.Titze 2023
BLACK='\033[0;39m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
RED='\033[1;31m'
clear

 
     echo "RetroRock OS 64 bit is running..."
     

HEIGHT=40
WIDTH=75
CHOICE_HEIGHT=8
BACKTITLE="Main"
TITLE="RetroRock-OS ROM Operating System"
MENU="RetroRock-OS for Rock5b (rk3588):"

OPTIONS=(e "EMULATIONSTATION (Retropie)                           "
         r "Retropie Setup                                        "
	       m "Download & Install MegaAGS 2022                       "
	       v "Download & Install AmigaVision (MegaAGS 2023)         "
	       w "Install ClasicWB (Amiga)                        "
	       o "Install OLED                                          "
         u "Update AmiRock-OS                                     "
         n "Update Amiberry                                       "
         p "Update Amiberry (DEV)                                 "
         c "Armbian-config                                        "
         s "Shutdown                                              ")
        

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITL" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
                


cd ~

clear


case $CHOICE in
          e)
           #***********************************************  #RetroRock-OS install script  ***********************************
             #************************************************  "Emulationstation"    **************************************
            clear
            echo "Emulationstation"
            e
            ;; 
        
          r)
           #***********************************************  #RetroRock-OS install script  ***********************************
             #************************************************  RetroPie-Setup    **************************************
            clear
            cd ~/RetroPie-Setup
            sudo  ./retropie_setup.sh 
            ;; 
                 
         s)
             #***********************************************  #RetroRock-OS install script  ***********************************
             #************************************************  Shootdown    **************************************
            clear
            s
            ;; 
         o)
             #***********************************************  #RetroRock-OS install script  ***********************************
             #************************************************  Install OLED SSD1306    **************************************
            clear
                cd

		git clone --depth=1 https://github.com/Jodels2002/Rock5b_SSD1308.git
		sudo chmod -R 775 Rock5b_SSD1308
		cd Rock5b_SSD1308
		./setup.sh		
	     ;; 
         i)
             #***********************************************  #RetroRock-OS install script  ***********************************
             #************************************************  Install ClassicWB     **************************************
            clear
            
            install_ClassicWB.sh
            aktivate.sh
            ;; 
            
                        
         u)
            #update
            clear
            u
            ;; 
	    
            
           m)
            #update
            clear
            ags
            ;;  
	    
	   v)
            #update
            clear
            vision
            ;;  
	    
	   w)
            #update
            clear
            install_ClassicWB.sh
            ;; 
	    
	    q)
            #update
            clear
            wine msiexec /i "$(zenity --file-selection)"
            ;;  
	    
            n)
       
              #***********************************************  #AmiRock-OS install script  ***********************************
              #************************************************  Compile Amiberry         ************************************** 
            clear
             sudo apt install -y cmake libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 flac mpg123 libmpeg2-4 libserialport0 libportmidi0
	     sudo apt install -y cmake libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libserialport-dev libportmidi-dev          
	    clear
            
           clear
      		toilet "AmiRock" --metal
      		echo " "
      		echo " "
       		echo "Compiling now ...Amiberry :-)"
        
	
            sudo rm -rf amiberry
            
	    git clone  https://github.com/midwan/amiberry
            cd amiberry

            cmake -B build && cmake --build build
		    # make -j8 PLATFORM=rk3588
		
            sudo chmod -R 777 $HOME/amiberry
	        
	        cp -rf /opt/Amiga/amiberry /opt/Amiga/amiberry_old
	        cp -rf $HOME/amiberry/build/amiberry  /opt/Amiga/amiberry
	        cp -rf $HOME/amiberry/data/ /opt/Amiga/
	        cp -rf $HOME/amiberry/plugins/ /opt/Amiga/
	        cp -rf $HOME/amiberry/external/ /opt/Amiga/
	        cp -rf $HOME/amiberry/whdboot/ /opt/Amiga/
	    
	       # Backup
	 
	    cp -rf  /opt/Amiga/amiberry_old /opt/Backup
            cp -rf  /opt/Amiga/amiberry /opt/Backup
	    cp -rf  /opt/Amiga/amiberry_dev /opt/Backup
	    cp -rf  /opt/Amiga/data/amiberry_dev.png /usr/share/applications/
	    cp -rf  /opt/AmiRock/Amiga/amiberry_dev.png /opt/Amiga/data/
      
	    
            cd
            rm -rf amiberry

     
            ;;  
       
       p)
           #***********************************************  #AmiRock-OS install script  ***********************************
           #************************************************  Compile Amiberry DEV        ************************************** 
	     sudo apt install -y cmake libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 flac mpg123 libmpeg2-4 libserialport0 libportmidi0
	     sudo apt install -y cmake libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libserialport-dev libportmidi-dev   
		clear
      		toilet "AmiRock" --metal
      		echo " "
      		echo " "
       		echo "Compiling now ...Amiberry :-)"

                sudo rm -rf amiberry
            
	    git clone -b preview https://github.com/midwan/amiberry
            cd amiberry

            cmake -B build && cmake --build build
		    # make -j8 PLATFORM=rk3588
		
            sudo chmod -R 777 $HOME/amiberry
	        
	        cp -rf /opt/Amiga/amiberry_dev /opt/Amiga/amiberry_dev_old
	        cp -rf $HOME/amiberry/build/amiberry  /opt/Amiga/amiberry_dev
	        cp -rf $HOME/amiberry/data/ /opt/Amiga/
	        cp -rf $HOME/amiberry/plugins/ /opt/Amiga/
	        cp -rf $HOME/amiberry/external/ /opt/Amiga/
	        cp -rf $HOME/amiberry/whdboot/ /opt/Amiga/
	    
	       # Backup
	 
	    cp -rf  /opt/Amiga/amiberry_dev_old /opt/Backup
            cp -rf  /opt/Amiga/amiberry /opt/Backup
	    cp -rf  /opt/Amiga/amiberry_dev /opt/Backup
	    cp -rf  /opt/Amiga/data/amiberry_dev.png /usr/share/applications/
	    cp -rf  /opt/AmiRock/Amiga/amiberry_dev.png /opt/Amiga/data/
      
	    
            cd
            rm -rf amiberry
         
            ;;    
            
          
            
           255) echo "[ESC] key pressed.";;
                           esac


cd
clear
toilet "RetroRock-OS" --metal
echo -e "$BLUE RetroRock-OS ROM Operating System and Libraries" 
echo " Version V2.0 2020-2021 RetroRock-OS "
echo " No Rights Reserved.  "
echo -e "$BLACK "
echo " Type 'd' to boot into RetroRock-OS Desktop"
echo ""
echo " 1.>  "
echo -e " 1.>  ( e ) Emulationstation                    "
echo -e " 1.>  ( u ) RetroRock-OS Update                     "
echo " 1.>  ( m ) RetroRock-OS Config                       " 
echo -e " 1.>  ( c ) Armbian-Config                       "
echo " 1.>  ( s ) Shutdown                                "  
echo ""
