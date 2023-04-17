sudo apt-get update
sudo apt-get install git build-essential libpcre3-dev libboost-dev libboost-thread-dev libboost-system-dev libavcodec-dev libavformat-dev libswscale-dev libpcrecpp0v5 libasound2-dev

cd
git clone https://github.com/popcornmix/omxplayer.git
cd omxplayer

make -j4
