#!/bin/bash
mkdir -p /Workspaces/Windows/Windows
cp /workspaces/Windows/.devcontainer/4-core/helpers/* /usr/local/bin/ 2>/dev/null
chmod +x /usr/local/bin/*
sudo rm -rf /usr/local/share/dotnet /usr/local/lib/node_modules /usr/local/go
echo "[SYSTEM] Installing tools..."
sudo apt-get update && sudo apt-get install -y --no-install-recommends qemu-system-x86 qemu-utils wget curl ovmf
sudo apt-get clean

if [ ! -f "/Workspaces/Windows/Windows/Methalo.vhdx" ]; then
    echo '[SYSTEM] Downloading VHDX directly...'
    curl -L -o /Workspaces/Windows/Windows/Methalo.vhdx "https://pub-dc6f3e26ce5940dd92d9c742a92d150e.r2.dev/Sunshine.vhdx"
    
    sudo chmod -R 777 /Workspaces/Windows/Windows
fi
echo '[SUCCESS] Setup finished. Type start.'
