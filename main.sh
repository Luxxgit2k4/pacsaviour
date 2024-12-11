#!/bin/bash
source ./scripts/ascii.sh
echo -e "\e[1;34mPlease choose an option:\e[0m"
echo -e "\e[1;32m1. Optimize Mirrors\e[0m"
echo -e "\e[1;32m2. Clean Up Packages\e[0m"
echo -e "\e[1;32m3. Update System\e[0m"
echo -e "\e[1;32m4. Exit\e[0m"
read -p "Enter the option: " choice
echo -e "\n"
case $choice in
  1) ./scripts/mirror_optimize.sh
    ;;
  2) ./scripts/cleanup.sh
    ;;
  3) ./scripts/update.sh
    ;;
  4) echo "Exiting..."
    exit 0
    ;;
  *) echo "Invalid option"
    ;;
esac

