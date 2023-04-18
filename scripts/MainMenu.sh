#!/bin/bash

# Set up colors
bg_color="#444444"
text_color="#333333"

# Set up Font Awesome icons
icon_amiberry="\uF2A1"
icon_emu="\uF11B"

# Define menu options
options=("Start Amiberry $icon_amiberry" "Start EMU $icon_emu" "Quit")

# Define menu function
function show_menu {
    echo -e "\033[0;44m\033[0;37m"
    echo "------------------------------"
    echo "     MENU                     "
    echo "------------------------------"
    echo -e "\033[0m"

    # Loop through options and print them
    for i in "${!options[@]}"; do
        printf "%s) %s\n" "$i" "${options[$i]}"
    done
}

# Define menu loop
while true; do
    show_menu
    read -rp "Enter option: " selection
    case $selection in
        0) /path/to/amiberry.sh ;;
        1) /path/to/emu.sh ;;
        2) exit ;;
        *) echo "Invalid option." ;;
    esac
done
