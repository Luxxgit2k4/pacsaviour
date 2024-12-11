#!/bin/bash
echo "Checking for internet connection..."
if ! ping -c 1 google.com &>/dev/null; then
    echo "No internet connection detected. Please check your network settings."
    exit 1
fi
echo "Internet connection detected. Proceeding with system update."
if ! pacman -Qu &>/dev/null; then
  echo "Your system is already up to date."
  exit 0;
else
  echo "System updates are available. Proceeding with the upgrade."
  sudo pacman -Sy && sudo pacman -Su
fi
echo "System update complete!"
