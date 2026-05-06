#!/bin/bash

# DISCLAIMER: This script is provided as-is, without any warranty.
# The author is not responsible for any damage, data loss, or other
# issues that may result from running this script. Use at your own risk.

if [ -e ./oldCord/ ]; then 
    echo "Found oldCord file, removing."
    sudo rm -rf ./oldCord
fi

echo "Starting the update..."
mv ./Vencord/ ./oldCord/

echo " "
echo "Fetching Vencord"
echo " "
git clone https://github.com/Vendicated/Vencord
cp -r ./oldCord/src/plugins/. ./Vencord/src/plugins/

echo " "
echo "Finished Vencord install, installing dependencies."
echo " "
cd ./Vencord/
pnpm install --frozen-lockfile

echo " "
echo "Finished dependencies install, building Vencord."
echo " "
sleep 0.1
sudo pnpm build
echo " "
echo "Finished build, injecting... "
echo " "
sleep 0.1
sudo pnpm inject

echo " "
echo " "
echo " "
echo " "
echo "Script has ended. You may have to completely stop the Discord process for the changes to take effect."
echo " "
echo " "
echo " "
echo " "
echo " "

sleep 2