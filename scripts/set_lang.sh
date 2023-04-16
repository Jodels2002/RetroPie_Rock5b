#!/bin/bash
# RetroRock
# B.Titze 2023


languages=("English" "German" "Italian" "Spanish" "Greek")
for index in "${!languages[@]}"; do
  printf "%s. %s\n" "$((index+1))" "${languages[index]}"
done
read -p "Select a language option: " selection
case $selection in
  1)
    sudo update-locale LANG=en_US.UTF-8
    ;;
  2)
    sudo update-locale LANG=de_DE.UTF-8
    ;;
  3)
    sudo update-locale LANG=it_IT.UTF-8
    ;;
  4)
    sudo update-locale LANG=es_ES.UTF-8
    ;;
  5)
    sudo update-locale LANG=el_GR.UTF-8
    ;;
  *)
    echo "Invalid selection. Please choose a number from 1 to 5."
    exit 1
    ;;
esac

echo "Language settings updated."
