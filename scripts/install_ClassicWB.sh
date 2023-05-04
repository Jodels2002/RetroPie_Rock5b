#!/bin/bash
#***********************************************  #RetroPie_Rock5b install script  ***********************************
# Install RetroPie_Rock5b
# B.Titze 2023

#************************************************************************************************************


BLACK='\033[0;39m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
GREY='\033[1;30m'

      chmod -R 777 /opt
      power
      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
      
      sudo apt install -y libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 flac mpg123 libmpeg2-4 libserialport0
      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
      sudo apt install python3-pip  python3-dev  -y
      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
      sudo python3 -m pip install -U setuptools
      sudo python3 -m pip install -U amitools   
      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "


      
 
      mkdir -p /opt/Amiga/dir/
      mkdir -p /opt/Amiga/dir/Work/Software
      mkdir -p /opt/Amiga/dir/Software
      mkdir -p /opt/Amiga/Install/
      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$BLUE RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
  	 
      echo ""   

 if [ ! -d /opt/Amiga/Install/DF0 ]; then
 
     
     
      #CreateDF0
         mkdir /opt/Amiga/Install/DF0
      cd /opt/RetroPie_Rock5b/Amiga/ClassicWB/
      unzip -o -q ./DF0.zip
         mv /opt/RetroPie_Rock5b/Amiga/ClassicWB/DF0/* /opt/Amiga/Install/DF0
         chmod -R 777 /opt/Amiga/Install/DF0
      rm -d -r /opt/RetroPie_Rock5b/Amiga/ClassicWB/DF0/
      rm -d -r /opt/Amiga/Install/DF0/*.info
 fi 

ClassicWB()
{
     
      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo "RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo "Version V1.5 2020-2021 RetroPie_Rock5b-OS "
      echo "No Rights Reserved.  "
      echo ""
      echo -e -n "$GREEN Found Amiga Files ..."
      echo -e -n "$BLUE "
      sleep 3
      
      
    if [ ! -f /opt/Amiga/Install/ClassicWB_UAE_v28.zip ]; then
          
    
      
      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e -n "$BLUE Downloading  ClassicWB_UAE_v28..."
      echo ""
      echo -e "$GRAY "
        cd /opt/Amiga/Install
      wget http://download.abime.net/classicwb/ClassicWB_UAE_v28.zip
    
    fi
    
    if [ ! -f /opt/Amiga/Install/ClassicWB_UAE_v28.zip ]; then
    
        
      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e -n "$BLUE Downloading  ClassicWB_UAE_v28..."
      echo ""
      echo -e "$GRAY "

      cd /opt/Amiga/Install

      wget http://download.abime.net/classicwb/ClassicWB_LITE_v28.zip
     fi
    
      if [ ! -d /opt/Amiga/Install/ClassicWB_UAE_v28/ ]; then
      

      
      
      
      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo "ClassicWB extracting... "
      cd /opt/Amiga/Install/
      unzip -o -q ./ClassicWB_UAE_v28.zip
      clear
     
      
    else 
      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
      echo " "
        echo "ClassicWB already downloaded"
        
      fi
      
if [ ! -d /opt/Amiga/Install/ClassicWB_LITE_v28/ ]; then
      

      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo "ClassicWB_LITE_v28 extracting... "
      unzip -o -q ./ClassicWB_LITE_v28.zip
      clear
fi 
#***********************************************  #Restet folders ***********************************

sudo rm -d -r /opt/Amiga/dir/System_ADVSP
sudo rm -d -r /opt/Amiga/dir/System_P96
sudo rm -d -r /opt/Amiga/dir/Software
sudo cp -rf "/opt/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/Software" /opt/Amiga/dir/

#***********************************************  #System_ADVSP ***********************************
if [ ! -d /opt/Amiga/dir/System_ADVSP ]; then

    
     mkdir /opt/Amiga/dir/System_ADVSP

   
     clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo " "
      echo -e -n "$BLUE "
      echo "  Configure System_ADVSP ...   " 
	     
      
      cd "/opt/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_ADVSP.hdf unpack /opt/Amiga/dir/System_ADVSP
     
      cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/CWB3.pac /opt/Amiga/dir/System_ADVSP/System/T/
      cd /opt/Amiga/dir/System_ADVSP/System/T/
      unzip -u /opt/Amiga/dir/System_ADVSP/System/T/CWB3.pac
      cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/Startup-Sequence /opt/Amiga/dir/System_ADVSP/System/S/
      
      cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/Activate /opt/Amiga/dir/System_ADVSP/System/S/
      cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/Science /opt/Amiga/dir/System_ADVSP/System/S/
      
      cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/ClassicWB-ADVSP.uae /opt/Amiga/conf/
      cp -rf /opt/Amiga/dir/Work/Software /opt/Amiga/dir/System_ADVSP/System/
      
      cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/ClassicWB-ADVSP.desktop /home/$USER/Desktop/
         cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/ClassicWB-ADVSP.desktop /usr/share/applications/
      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
      echo " "
  	 
      echo ""
      
     #ClassicWB-ADVSP_run
       
    fi
  
#***********************************************  #System_P96 ***********************************    
      if [ ! -d /opt/Amiga/dir/System_P96/ ]; then
	  
      cd /opt/Amiga/hdf
	  
      mkdir /opt/Amiga/dir/System_P96
    
     
      
      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo -e -n "$BLUE "
      echo "  Configure System_P96 ...   " 
      
      
      cd "/opt/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/"
      xdftool System_P96.hdf unpack /opt/Amiga/dir/System_P96
      cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/CWB3.pac /opt/Amiga/dir/System_P96/System/T/
      cd /opt/Amiga/dir/System_P96/System/T/
      unzip -o -q /opt/Amiga/dir/System_P96/System/T/CWB3.pac
      
      cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/Startup-Sequence /opt/Amiga/dir/System_P96/System/S/
      cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/Science /opt/Amiga/dir/System_P96/System/S/
      cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/Activate /opt/Amiga/dir/System_P96/System/S/
      cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/screenmode.prefs /opt/Amiga/dir/System_P96/System/Prefs/Env-Archive/Sys/
      cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/ClassicWB-P96.uae /opt/Amiga/conf/
    
          
      
      cp -rf /opt/RetroPie_Rock5b/config/ClassicWB-P96.desktop /home/$USER/Desktop/
         cp -rf /opt/RetroPie_Rock5b/config/ClassicWB-P96.desktop /usr/share/applications/
      cp -rf /opt/Amiga/dir/System_P96/System/Prefs/Patterns/Amiga_1024x768.jpg /opt/Amiga/dir/System_P96/System/Prefs/Patterns/bsg_pm2_800x600.png
      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
      echo " "
  	#ClassicWB-P96_run 
      echo ""   
 fi
 
 if [ ! -d /opt/Amiga/dir/Amiga1000/ ]; then
   cd /opt/Amiga/dir/
   unzip -u /opt/RetroPie_Rock5b/Amiga/Amiga1000.zip
   cp -rf "/opt/RetroPie_Rock5b/Amiga/ClassicWB/Amiga1000.uae" /opt/Amiga/conf/
   
   
 fi  
}
   
ClassicWB13()
{


      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
      echo " "
      
if [ ! -f /opt/Amiga/Install/ClassicWB_LITE_v28.zip ]; then
      echo -e -n "$BLUE Downloading  ClassicWB_UAE_v28..."
      echo ""
      echo -e "$GRAY "

      cd /opt/Amiga/Install

      wget http://download.abime.net/classicwb/ClassicWB_LITE_v28.zip

      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
      echo " "
      echo "ClassicWB extracting... "
      unzip -o -q ./ClassicWB_LITE_v28.zip
      clear
fi 


}






ClassicWB
ClassicWB13



else
clear
          toilet "RetroPie_Rock5b-OS" --metal
          echo " "
	  echo " "
	  whiptail --msgbox "Information: AmigaForever * by Cloanto 
	  \n 1>Please note that the Kickroms and Workbench
	  files are still under copyright! 
	  \n 1>So only use this image if you own  
	  original Amiga(s) or Amiga Forever. 
	  \n 1>CLI:               
	  \n 1>Assign >NIL: Greetings your´s B. Titze
     
	  \n " 20 50 1
	  
	 rm -d -r /opt/Amiga/Install/DF0/  
     
       
      cd
	  
	  exit
	  
fi

if [ -d /opt/Amiga/dir/System_P96/ ]; then

         cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/ClassicWB-P96.desktop /usr/share/applications/
         cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/ClassicWB-P96.uae /opt/Amiga/conf
      cd /opt/Amiga/dir/System_P96/System/Devs
      unzip -u  /opt/RetroPie_Rock5b/Amiga/ks.zip
      cd

fi

if [ -d /opt/Amiga/dir/System_ADVSP/ ]; then
    
 
      cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/ClassicWB-ADVSP.desktop /usr/share/applications/
      cp -rf /opt/RetroPie_Rock5b/Amiga/ClassicWB/ClassicWB-ADVSP.uae /opt/Amiga/conf
      cd /opt/Amiga/dir/System_ADVSP/System/Devs
      unzip -u  /opt/RetroPie_Rock5b/Amiga/ks.zip
      cd
fi 
       
       cp -rf "/opt/Amiga/Install/ClassicWB_UAE_v28/Hard Disk/Software" /opt/Amiga/dir/
       
       rm -d -r /opt/Amiga/Install/DF0/  
     
         chmod -R 777 /opt/Amiga
      cd
      clear
      toilet "RetroPie_Rock5b-OS" --metal
      echo -e "$GREY RetroPie_Rock5b-OS ROM Operating System and Libraries" 
      echo " Version V2.0 2020-2021 RetroPie_Rock5b-OS "
      echo " No Rights Reserved.  "
      echo " "      
      echo -e "$BLACK  "
      echo -e "$BLUE ClassicWBs createt "
      echo -e "$BLACK  "
      ClassicWB-P96_run
