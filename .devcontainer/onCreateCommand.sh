#!/bin/bash
# 1. MEGA NUKE (Freeing ~20GB of bloat to make room)
echo "[SYSTEM] Clearing space on disk..."
sudo rm -rf /usr/local/share/dotnet /usr/local/lib/node_modules /usr/local/go /opt/ghc /usr/local/share/powershell /opt/microsoft /usr/share/rust
sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*

# 2. Minimal Install
echo "[SYSTEM] Installing Virtual Machine tools..."
sudo apt-get update && sudo apt-get install -y --no-install-recommends qemu-system-x86 qemu-utils 7zip wget curl
sudo apt-get clean

# 3. Directory Setup
mkdir -p /workspaces/Windows/windows
cp /workspaces/Windows/.devcontainer/helpers/* /usr/local/bin/ 2>/dev/null
chmod +x /usr/local/bin/*

# ==========================================
# PASTE YOUR DOWNLOAD / ZIP CODE BELOW HERE
# ==========================================



# ==========================================
# PASTE YOUR DOWNLOAD / ZIP CODE ABOVE HERE
# ==========================================

echo '[SUCCESS] Setup finished. Type start.'