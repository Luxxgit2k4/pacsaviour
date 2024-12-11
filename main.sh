#!/bin/bash
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo "This operation requires root privileges. Please run with sudo."
        exit 1
    fi
}
check_root
source ./scripts/ascii.sh
echo -e "\e[1;34mPlease choose an option:\e[0m"
echo -e "\e[1;32m1. Optimize Mirrors\e[0m"
echo -e "\e[1;32m2. Clean Up Packages\e[0m"
echo -e "\e[1;32m3. Update System\e[0m"
echo -e "\e[1;32m4. Exit\e[0m"
read -p "Enter the option: " choice
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

