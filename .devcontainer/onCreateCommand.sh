#!/bin/bash
mkdir -p /tmp/windows
cp /workspaces/Windows/.devcontainer/helpers/* /usr/local/bin/ 2>/dev/null
chmod +x /usr/local/bin/*
sudo rm -rf /usr/local/share/dotnet /usr/local/lib/node_modules /usr/local/go /opt/ghc
echo "[SYSTEM] Installing tools..."
sudo apt-get update && sudo apt-get install -y --no-install-recommends qemu-system-x86 qemu-utils 7zip wget curl novnc websockify net-tools ovmf
sudo apt-get clean

# READ THE URL FROM THE FILE
URL=$(cat /workspaces/Windows/.devcontainer/url.txt | tr -d '\r\n')

if [ ! -f "/tmp/windows/data.vhdx" ]; then
    echo '[SYSTEM] Downloading Zip...'
    curl -L -o /tmp/windows/sunshine.zip "$URL"
    echo '[SYSTEM] Extracting...'
    7z e /tmp/windows/sunshine.zip -o/tmp/windows/ -y
    rm /tmp/windows/sunshine.zip
    mv /tmp/windows/*.vhdx /tmp/windows/data.vhdx 2>/dev/null
    sudo chmod -R 777 /tmp/windows
fi
echo '[SUCCESS] Setup finished. Type start.'