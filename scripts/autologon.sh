#!/bin/bash


sudo systemctl disable getty@tty1.service


sudo tee /etc/systemd/system/autologin@.service > /dev/null <<EOT
[Unit]
Description=Autologin to console as %I
After=getty.target

[Service]
ExecStart=-/sbin/agetty --autologin pi --noclear %I 38400 linux

[Install]
WantedBy=multi-user.target
EOT


sudo systemctl daemon-reload
sudo systemctl enable autologin@tty1.service
echo "Autologin enabled for user pi"
