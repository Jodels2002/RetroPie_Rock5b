	 sudo rm -rf /usr/share/plymouth/themes/spinner/watermark.png
	 sudo cp -rf /opt/RetroPie_Rock5b/config/Retrorock.png /usr/share/plymouth/themes/spinner/watermark.png
	 sudo cp -rf /opt/RetroPie_Rock5b/config/Retrorock.png /usr/share/plymouth/ubuntu-logo.png
	 
	  sudo rm -rf /usr/share/plymouth/themes/armbian/watermark.png
	 sudo cp -rf /opt/RetroPie_Rock5b/config/Retrorock.png /usr/share/plymouth/themes/armbian/watermark.png
	 sudo cp -rf /opt/RetroPie_Rock5b/config/Retrorock.png /usr/share/plymouth/ubuntu-logo.png
  	
  	sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/spinner/spinner.plymouth 500
	sudo update-initramfs -u
