#!/bin/bash
#source ./scripts/ascii.sh
log_file="/var/log/pacsaviour.log"
log_action() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> "$log_file"
}
show_help() {
    echo "PacSaviour - A Package Optimization Tool for optimizing mirrors, cleaning packages and updating the system"
    echo
    echo "Usage: pacsaviour [options]"
    echo "Options:"
    echo "  -i           Interactive Menu"
    echo "  -mi          Optimize Mirrors"
    echo "  -pc          Cleanup Package Cache and Orphans"
    echo "  -up          Update System"
    echo "  --help       Show this help message"
    echo "Every option requires root privileges to run."
    echo
    echo "Interactive Menu:"
    echo "Use the interactive menu to enter your choice and perform the task."
    exit 0
}
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo "This operation requires root privileges."
        log_action "Attempted to run without root permissions."
        exit 1
    fi
}
optimize_mirrors() {
    log_action "Starting mirror optimization."
    ./scripts/mirror_optimize.sh && log_action "Mirror optimization completed." || log_action "Mirror optimization failed."
}

cleanup_packages() {
    log_action "Starting cleanup."
    ./scripts/cleanup.sh && log_action "Cleanup completed." || log_action "Cleanup failed."
}

update_system() {
    log_action "Starting system update."
    ./scripts/update.sh && log_action "System update completed." || log_action "System update failed."
}

if [[ "$1" == "--help" || $# -eq 0 ]]; then
    show_help
elif [[ "$1" == "-mi" ]]; then
    check_root
    optimize_mirrors
    exit 0
elif [[ "$1" == "-pc" ]]; then
    check_root
    cleanup_packages
    exit 0
elif [[ "$1" == "-up" ]]; then
    check_root
    update_system
    exit 0
  elif [["$1" == "i"]]; then
    check_root
    show_menu
fi
show_menu() {
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
}

