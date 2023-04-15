sudo apt-get install plymouth -y



sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /lib/plymouth/themes/amiga-logo.plymouth 100
sudo update-initramfs -u
