#!/bin/bash

# Set terminal colors
BG_GRAY='\033[48;5;240m'
TXT_DARK_GRAY='\033[38;5;240m'
RESET_COLOR='\033[0m'

# Display menu using dialog with Font Awesome font
dialog --backtitle "Debian Game Emulators" \
       --title "Main Menu" \
       --nocancel \
       --menu "\nPlease select an option:" 10 40 3 \
       --font /usr/share/fonts/truetype/fontawesome-webfont.ttf \
       1 "\uf11b  Start Amiga AGS" \
       2 "\uf11b  Start Emulationstation" \
       3 "\uf00d  Quit" \
       2> /tmp/menu.tmp

# Get user input from temporary file
choice=$(cat /tmp/menu.tmp)

# Execute selected option
case $choice in
  1)
    ./MegaAGS_run
    ;;
  2)
    ./e
    ;;
  3)
    exit 0
    ;;
  *)
    printf "Invalid choice\n"
    ;;
esac




