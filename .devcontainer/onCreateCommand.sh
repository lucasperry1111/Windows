#!/bin/bash
# 1. Directory Setup
mkdir -p /tmp/windows
cp /workspaces/Windows/.devcontainer/helpers/* /usr/local/bin/ 2>/dev/null
chmod +x /usr/local/bin/*

# 2. MEGA NUKE (Freeing space)
sudo rm -rf /usr/local/share/dotnet /usr/local/lib/node_modules /usr/local/go /opt/ghc

# 3. Minimal Install
echo "[SYSTEM] Installing tools..."
sudo apt-get update && sudo apt-get install -y --no-install-recommends qemu-system-x86 qemu-utils 7zip wget curl
sudo apt-get clean

# 4. PERMANENT DOWNLOAD (10.9GB Zip)
if [ ! -f "/tmp/windows/data.vhdx" ]; then
    echo '[SYSTEM] Downloading 10.9GB Zip from Permanent Link...'
    curl -L -o /tmp/windows/sunshine.zip "https://1drv.ms/download/c/e633715ed8e8b835/IQSa9LjkuBXfQYYKAwNHouUKAYIOPFNrUVWSJy00LZ8-PtI"
    
    # Check if we got a real file
    SIZE=
    if [ "" -lt 1000000 ]; then
        echo "[ERROR] Download failed. The file is only  bytes."
        exit 1
    fi

    echo '[SYSTEM] Extracting VHDX to 40GB drive...'
    7z e /tmp/windows/sunshine.zip -o/tmp/windows/ -y
    rm /tmp/windows/sunshine.zip
    
    # Rename extracted file
    mv /tmp/windows/*.vhdx /tmp/windows/data.vhdx 2>/dev/null
    
    # Permissions
    sudo chmod -R 777 /tmp/windows
fi

echo '[SUCCESS] Setup finished. Type start.'