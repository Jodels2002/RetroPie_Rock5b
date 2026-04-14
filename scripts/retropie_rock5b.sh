#!/usr/bin/env bash


# =========================================
# RetroRock Setup Script
# =========================================

REPO="$HOME/RetroPie_Rock5b"
TARGET="/opt/RetroPie_Rock5b"

echo "==> Installing base tools"
sudo apt update
sudo apt install -y p7zip-full unzip git toilet

# =========================================
# Copy Files
# =========================================
echo "==> Copy RetroPie files"
sudo rm -rf "$TARGET"
sudo mkdir -p /opt
sudo cp -r "$REPO" "$TARGET"

sudo install -m 644 "$TARGET/config/rc.local" /etc/rc.local
cp -f "$TARGET/config/.bashrc" "$HOME/.bashrc"

# =========================================
# EmulationStation dirs
# =========================================
echo "==> Setup directories"
sudo mkdir -p /etc/emulationstation
sudo mkdir -p /opt/retropie/emulators

# =========================================
# Amiga Setup
# =========================================
if [ ! -d /opt/Amiga/dir ]; then
    echo "==> Installing Amiga"

    sudo rm -rf /opt/Amiga
    sudo mkdir -p /opt/Amiga

    ln -sfn /opt/Amiga "$HOME/Amiga"

    mkdir -p "$HOME/Amiberry"
    ln -sfn /opt/Amiga/conf "$HOME/Amiberry/conf"

    sudo unzip -o "$TARGET/Amiga/Amiga.zip" -d /opt/

    sudo rm -f /opt/Amiga/conf/amiberry*.conf

    echo "==> Installing Amiga dependencies"
    sudo apt install -y \
        worker unadf xdms fonts-amiga \
        cmake libsdl2-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 \
        flac mpg123 libmpeg2-4 libserialport0 libportmidi0 \
        libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev \
        libflac-dev libmpg123-dev libpng-dev \
        libmpeg2-dev libserialport-dev libportmidi-dev
fi

# =========================================
# RetroPie Setup
# =========================================
if [ ! -d /opt/retropie/emulators/retroarch ]; then
    echo "==> Installing RetroPie"

    rm -rf "$HOME/RetroPie-Setup"

    git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git "$HOME/RetroPie-Setup"

    cp -f "$TARGET/retropie/system.sh" "$HOME/RetroPie-Setup/scriptmodules/"
    cp -f "$TARGET/retropie/retropie_setup.sh" "$HOME/RetroPie-Setup/"

    cd "$HOME/RetroPie-Setup"

    sudo __nodialog=1 __platform=rk3588 ./retropie_setup.sh basic_install
fi

# =========================================
# AmigaVision Integration
# =========================================
if [ -d /opt/AmigaVision/games/Amiga ]; then
    echo "==> Configuring AmigaVision"

    sudo install -m 644 \
        "$TARGET/Amiga/AmigaVision/AmigaVision.desktop" \
        /usr/share/applications/

    cp -f "$TARGET/Amiga/AmigaVision/AmigaVision.desktop" "$HOME/Desktop/" || true

    cp -f "$TARGET/Amiga/AmigaVision/AmigaVision.uae" /opt/Amiga/conf/

    cp -f /opt/AmigaVision/games/Amiga/*.rom /opt/Amiga/kickstarts/ 2>/dev/null || true
    cp -f /opt/AmigaVision/games/Amiga500/*.rom /opt/Amiga/kickstarts/ 2>/dev/null || true
fi

# =========================================
# Symlinks Fix
# =========================================
if [ -d /opt/Amiga/dir/pimiga3/disks/Games ]; then
    echo "==> Fixing WHDLoad links"

    sudo rm -rf /opt/Amiga/dir/Software/Games
    sudo ln -sfn /opt/Amiga/dir/pimiga3/disks/Games/WHDLOAD \
        /opt/Amiga/dir/Software/Games

    sudo rm -rf /opt/Amiga/dir/Software/Demos
    sudo ln -sfn /opt/Amiga/dir/pimiga3/disks/Demos/WHDLOAD \
        /opt/Amiga/dir/Software/Demos
fi

# =========================================
# RetroArch Config Link
# =========================================
if [ -d /opt/retropie/configs/all/retroarch ]; then
    echo "==> Linking RetroArch config"

    rm -rf "$HOME/.config/retroarch"
    ln -s /opt/retropie/configs/all/retroarch "$HOME/.config/retroarch"
fi

# =========================================
# Final Cleanup
# =========================================
echo "==> Final cleanup"

sudo mkdir -p /media/pi

rm -rf "$HOME/RetroPie_Rock5b"

sudo apt autoremove -y
sudo apt clean

# =========================================
# Finish Screen
# =========================================
clear
toilet "RetroRock" --metal

cat <<EOF
RetroRock ROM Operating System

(e) EmulationStation
(d) Desktop
(m) Config Menu
(u) Update
(s) Shutdown
EOF
