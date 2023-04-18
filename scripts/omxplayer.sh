# Create directory to store the video
sudo mkdir /usr/share/boot-video

# Copy the video file to the directory
sudo cp boot-video.mp4 /usr/share/boot-video/

# Install necessary packages for playing video
sudo apt-get update
sudo apt-get install mpv

# Create the script that plays the video
sudo tee /etc/init.d/boot-video.sh > /dev/null << EOF
#!/bin/bash
# Play boot video using mpv
/usr/bin/mpv --no-audio --no-osc --no-input-default-bindings --fs /usr/share/boot-video/boot-video.mp4 &
EOF

# Make the script executable
sudo chmod +x /etc/init.d/boot-video.sh

# Register the script to run at boot time
sudo update-rc.d boot-video.sh defaults
