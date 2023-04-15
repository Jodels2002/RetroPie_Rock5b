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
MENU="RetroRock-OS for RockPie5b:"

OPTIONS=(e "EMULATIONSTATION (Retropie)                           "
         r "Retropie Setup                                        "
	       m "Download & Install MegaAGS 2022                       "
	       v "Download & Install AmigaVision (MegaAGS 2023)         "
	       w "Download & Install WHDL Games&Demos                   "
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
           #***********************************************  #AmiRock-OS install script  ***********************************
             #************************************************  Armbian-config    **************************************
            clear
            echo "Emulationstation"
            emulationstation
            ;; 
        
          r)
           #***********************************************  #AmiRock-OS install script  ***********************************
             #************************************************  Armbian-config    **************************************
            clear
            cd ~/RetroPie-Setup
            sudo __platform=rk3588 ./retropie_setup.sh 
            ;; 
                 
         s)
             #***********************************************  #AmiRock-OS install script  ***********************************
             #************************************************  Shootdown    **************************************
            clear
            s
            ;; 
         o)
             #***********************************************  #AmiRock-OS install script  ***********************************
             #************************************************  Install OLED SSD1306    **************************************
            clear
                cd

		git clone --depth=1 https://github.com/Jodels2002/Rock5b_SSD1308.git
		sudo chmod -R 775 Rock5b_SSD1308
		cd Rock5b_SSD1308
		./setup.sh		
	     ;; 
         i)
             #***********************************************  #AmiRock-OS install script  ***********************************
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
            whd
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
           
             sudo apt install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 flac mpg123 libmpeg2-4 libserialport0
	     sudo apt-get -y install libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libraspberrypi-dev
          
	    clear
            
           clear
      		toilet "AmiRock" --metal
      		echo " "
      		echo " "
       		echo "Compiling now ...Amiberry :-)"

            sudo rm -rf amiberry
            git clone https://github.com/midwan/amiberry
            cd amiberry


     	    make -j8 PLATFORM=rk3588
            
	    sudo chmod -R 777 $HOME/amiberry
	    
	    mkdir /opt/Amiga/
            cp -rf $HOME/Amiga/amiberry  /opt/Amiga/amiberry_old
            cp -rf $HOME/amiberry/*  /opt/Amiga/
             sudo rm -rf $HOME/amiberry
	     sudo rm -rf /opt/Amiga/abr
	     sudo rm -rf /opt/Amiga/cmake
	     sudo rm -rf /opt/Amiga/external
	     sudo rm -rf /opt/Amiga/src
	     sudo rm -rf /opt/Amiga/Android.mk
	     sudo rm -rf /opt/Amiga/whdboot-src
	     sudo rm -rf /opt/Amiga/VSLinux
	     sudo rm -rf /opt/Amiga/Info.plist.template
	     sudo rm -rf /opt/Amiga/CMakeSettings.json
	     sudo rm -rf /opt/Amiga/Makefile
	     sudo rm -rf /opt/Amiga/Entitlements.plist
	     sudo rm -rf /opt/Amiga/CMakeLists.txt
	     sudo rm -rf /opt/Amiga/PULL_REQUEST_TEMPLATE
	     sudo rm -rf /opt/Amiga/macos_init_amiberry.zsh
	     sudo rm -rf /opt/Amiga/make-bundle.sh
	    
	      mkdir /opt/Backup
	    
	    # Backup
	 
	    cp -rf  /opt/Amiga/amiberry_old /opt/Backup
            cp -rf  /opt/Amiga/amiberry /opt/Backup
	    cp -rf  /opt/Amiga/amiberry_dev /opt/Backup
	    cp -rf  /opt/Amiga/data/amiberry.png /usr/share/applications/ 
             
	
            cd
            sudo rm -rf amiberry
           
            ;;  
       
       p)
           #***********************************************  #AmiRock-OS install script  ***********************************
           #************************************************  Compile Amiberry DEV        ************************************** 
	        sudo apt install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 flac mpg123 libmpeg2-4 libserialport0
		sudo apt-get -y install libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libflac-dev libmpg123-dev libpng-dev libmpeg2-4-dev libserialport-dev	   clear
      		toilet "AmiRock" --metal
      		echo " "
      		echo " "
       		echo "Compiling now ...Amiberry :-)"

            sudo rm -rf amiberry
            git clone -b dev https://github.com/midwan/amiberry
            cd amiberry


     	make -j8 PLATFORM=rk3588
            
	    sudo chmod -R 777 $HOME/amiberry
	    
	    mkdir /opt/Amiga/
            cp -rf $HOME/Amiga/amiberry  /opt/Amiga/amiberry_old
            cp -rf $HOME/amiberry/*  /opt/Amiga/
             sudo rm -rf $HOME/amiberry
	     sudo rm -rf /opt/Amiga/abr
	     sudo rm -rf /opt/Amiga/cmake
	     sudo rm -rf /opt/Amiga/external
	     sudo rm -rf /opt/Amiga/src
	     sudo rm -rf /opt/Amiga/Android.mk
	     sudo rm -rf /opt/Amiga/whdboot-src
	     sudo rm -rf /opt/Amiga/VSLinux
	     sudo rm -rf /opt/Amiga/Info.plist.template
	     sudo rm -rf /opt/Amiga/CMakeSettings.json
	     sudo rm -rf /opt/Amiga/Makefile
	     sudo rm -rf /opt/Amiga/Entitlements.plist
	     sudo rm -rf /opt/Amiga/CMakeLists.txt
	     sudo rm -rf /opt/Amiga/PULL_REQUEST_TEMPLATE
	     sudo rm -rf /opt/Amiga/macos_init_amiberry.zsh
	     sudo rm -rf /opt/Amiga/make-bundle.sh
	    
	      mkdir /opt/Backup
	    
	    # Backup
	 
	    cp -rf  /opt/Amiga/amiberry_old /opt/Backup
            cp -rf  /opt/Amiga/amiberry /opt/Backup
	    cp -rf  /opt/Amiga/amiberry_dev /opt/Backup
	    cp -rf  /opt/Amiga/data/amiberry.png /usr/share/applications/ 
             
	
            cd
            sudo rm -rf amiberry
         
            ;;  
            
                               255) echo "[ESC] key pressed.";;
                           esac


cd
clear
toilet "AmiRock" --metal
echo -e "$BLUE AmiRock-OS ROM Operating System and Libraries" 
echo " Version V2.0 2020-2021 KickPi-OS "
echo " No Rights Reserved.  "
echo -e "$BLACK "
echo " Type 'd' to boot into AmiRock Workbench"
echo ""
echo " 1.>  "
echo -e " 1.>  ( u ) AmiRock-OS Update                     "
echo " 1.>  ( m ) ArmRock-OS Config                       " 
echo -e " 1.>  ( c ) Armbian-Config                       "
echo " 1.>  ( s ) Shutdown                                "  
echo ""
