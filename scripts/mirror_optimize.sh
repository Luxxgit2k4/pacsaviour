#!/bin/bash
log_file="/var/log/mirror_optimize.log"
log_action() {
  echo "$(date +%F_%T) - $1" >> "$log_file";
}

if ! ping -c 1 google.com &>/dev/null; then
  echo "No internet connection detected. Please check your network settings.";
  exit 1;
fi

backup_file="/etc/pacman.d/mirrorlist.backup_$(date +%F_%T)"
cp /etc/pacman.d/mirrorlist "$backup_file"
log_action "Mirror list backed up to $backup_file"
echo "Backup saved to $backup_file"

read -p "Do you want to filter mirrors by country? (y/n, default: y): "  country_choice
country_choice=${country_choice:-y}
if [[ "$country_choice" == "y" || "$country_choice" == "Y" ]];then
read -p "Enter the 2-letter country code (e.g., US, IN, DE) or the country name (e.g., United States, India): " country

if [[ -n "$country" ]]; then
country_filter="-c $country"
log_action "Filtering mirrors by country: $country"
else
echo "Invalid country entered. Proceeding without country filter."
country_filter=""
fi
fi

echo "Optimizing mirror list..."
sudo reflector --verbose --latest 10 --sort rate --exclude thaller.ws --connection-timeout 10 $country_filter --save /etc/pacman.d/mirrorlist
log_action "Mirror list optimized using reflector"
echo -e "\n"
echo "Mirror list updated successfully."

