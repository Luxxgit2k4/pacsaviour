#!/bin/bash
echo "Cleaning up package cache..."
echo "Current package cache size:"
du -sh /var/cache/pacman/pkg
echo -e "\n"
read -p "Do you want to remove contents in package cache? (y/n, default: y): " choice
choice=${choice:-y}
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
  echo "Clearing the package cache..."
  paccache -r  || echo "The package cache is empty"
else
  echo "Skipping the package cache removal."
fi
echo -e "\n"
# Remove orphan dependencies
read -p "Do you want to remove orphan dependencies also? (y/n, default: y): " choice
choice=${choice:-y}
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
  echo "Removing orphan dependencies..."
  pacman -Rns $(pacman -Qtdq) 2>/dev/null || echo "No orphan dependencies to remove."
else
  echo "Skipping orphan dependencies removal"
fi
echo -e "\n"
# Display size after cleanup
echo "Updated package cache size:"
du -sh /var/cache/pacman/pkg

echo "Cleanup complete!"
