#!/bin/bash
mkdir -p /tmp/windows
cp /workspaces/Windows/.devcontainer/helpers/* /usr/local/bin/ 2>/dev/null
chmod +x /usr/local/bin/*
sudo rm -rf /usr/local/share/dotnet /usr/local/lib/node_modules /usr/local/go
echo "[SYSTEM] Installing tools..."
sudo apt-get update && sudo apt-get install -y --no-install-recommends qemu-system-x86 qemu-utils wget curl ovmf
sudo apt-get clean

if [ ! -f "/tmp/windows/data.vhdx" ]; then
    echo '[SYSTEM] Downloading VHDX directly...'
    curl -L -o /tmp/windows/data.vhdx "https://pub-dc6f3e26ce5940dd92d9c742a92d150e.r2.dev/Sunshine.vhdx"
    
    sudo chmod -R 777 /tmp/windows
fi
echo '[SUCCESS] Setup finished. Type start.'
