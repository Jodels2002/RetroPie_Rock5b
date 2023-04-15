git clone https://github.com/raspberrypi-ui/piclone.git
sudo chmod -R 777 piclone
cd piclone
./autogen.sh
./configure
make
sudo make install
