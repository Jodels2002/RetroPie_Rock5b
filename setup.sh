#!/bin/bash
# Install Retrorock
# B.Titze 2023
#extraargs="console=tty3 consoleblank=0 loglevel=1 quiet"


# =========================================
# RetroRock5b Installer 
# =========================================

REPO="$HOME/RetroPie_Rock5b"
TARGET="/opt/RetroPie_Rock5b"

echo "==> Copy files"
sudo mkdir -p "$TARGET"
sudo cp -r "$REPO/"* "$TARGET/"
sudo install -m 755 "$REPO/scripts/"* /usr/local/bin/

# =========================================
# System update 
# =========================================
echo "==> System update"
sudo apt update
sudo apt upgrade -y

# =========================================
# Benutzer anlegen (nur wenn nötig)
# =========================================
if ! id "pi" &>/dev/null; then
    echo "==> Creating user pi"
    sudo useradd -m -s /bin/bash pi
    sudo usermod -aG audio,video,sudo pi
fi

echo "pi ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/pi >/dev/null
sudo chmod 440 /etc/sudoers.d/pi

# =========================================
# Autologin
# =========================================
echo "==> Enable autologin"
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d/

sudo tee /etc/systemd/system/getty@tty1.service.d/autologin.conf >/dev/null <<EOF
[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin pi --noclear %I \$TERM
EOF

sudo systemctl daemon-reexec
sudo systemctl restart getty@tty1

# =========================================
# Pakete installieren 
# =========================================
echo "==> Installing packages"

sudo apt install -y \
    dialog mc zip unzip wget curl \
    build-essential git \
    gparted ntfs-3g nemo feh \
    geany p7zip-full \
    xserver-xorg xinit \
    toilet ksnip

# =========================================
# Unnötige Desktop-Pakete entfernen
# =========================================
echo "==> Cleaning system"
sudo apt purge -y \
    lxde* gnome* lightdm* \
    xserver-xorg-legacy

sudo apt autoremove -y
sudo apt clean

# =========================================
# Worker Setup
# =========================================
echo "==> Setup worker"

mkdir -p "$HOME/.worker"
unzip -o "$TARGET/config/worker.zip" -d "$HOME/.worker"

sudo cp -r "$TARGET/config/config/" "$HOME/.worker/"

# =========================================
# Fan Control (Rock5B)
# =========================================
echo "==> Installing fan control"

if [ ! -d "$HOME/fan-control-rock5b" ]; then
    git clone https://github.com/pymumu/fan-control-rock5b "$HOME/fan-control-rock5b"
fi

cd "$HOME/fan-control-rock5b"
make package
sudo dpkg -i fan-control*.deb || sudo apt -f install -y

sudo systemctl enable fan-control
sudo systemctl start fan-control

# =========================================
# Plymouth Theme
# =========================================
echo "==> Plymouth setup"

IMG="$TARGET/config/Retrorock.png"

sudo install -m 644 "$IMG" /usr/share/plymouth/themes/spinner/watermark.png
sudo install -m 644 "$IMG" /usr/share/plymouth/themes/armbian/watermark.png

sudo update-initramfs -u

# =========================================
# Icons / Theme
# =========================================
echo "==> Installing themes"

sudo unzip -o "$TARGET/config/AMIGAOSLINUX.zip" -d /usr/share/icons/

sudo ln -sfn /usr/share/icons/AMIGAOSLINUX /usr/share/icons/default

sudo cp -r "$TARGET/amitk" /usr/share/themes/

# =========================================
# Wallpapers
# =========================================
echo "==> Cleanup wallpapers"
sudo find /usr/share/backgrounds -type f -delete

sudo cp -r "$TARGET/config/rpd-wallpaper/Commodore/"* /usr/share/backgrounds/

# =========================================
# AmiRock Setup
# =========================================
echo "==> AmiRock setup"

if [ ! -d "$HOME/RetroPie_Rock5b/amigaos_xfwm4_themes" ]; then
    git clone --depth=1 https://github.com/lordwolfchild/amigaos_xfwm4_themes "$TARGET/amigaos_xfwm4_themes"
fi

sudo cp -r "$TARGET/amigaos_xfwm4_themes/"* /usr/share/themes/

# =========================================
# Final script
# =========================================
echo "==> Starting RetroPie script"
"$TARGET/scripts/retropie_rock5b.sh"

echo "==> DONE"
