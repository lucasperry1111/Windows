#!/bin/bash
# 1. Directory Setup
mkdir -p /workspaces/Windows/windows
cp /workspaces/Windows/.devcontainer/helpers/* /usr/local/bin/ 2>/dev/null
chmod +x /usr/local/bin/*

# 2. MEGA NUKE (Freeing ~20GB)
echo "[SYSTEM] Clearing disk..."
sudo rm -rf /usr/local/share/dotnet /usr/local/lib/node_modules /usr/local/go /opt/ghc /usr/local/share/powershell /opt/microsoft /usr/share/rust
sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/*

# 3. Minimal Install
echo "[SYSTEM] Installing Virtual Machine tools..."
sudo apt-get update && sudo apt-get install -y --no-install-recommends qemu-system-x86 qemu-utils 7zip wget curl
sudo apt-get clean

# 4. RAM STORAGE EXTRACTION (The Space-Saver)
if [ ! -f "/workspaces/Windows/windows/data.vhdx" ]; then
    echo '[SYSTEM] Downloading 11GB Zip to RAM storage (Bypassing disk limit)...'
    # Downloading to /dev/shm (System Memory) instead of hard drive
    curl -L -o /dev/shm/sunshine.zip "https://my.microsoftpersonalcontent.com/personal/e633715ed8e8b835/_layouts/15/download.aspx?UniqueId=31984a96-101e-4304-a231-96356ed22d29&Translate=false&tempauth=v1e.eyJzaXRlaWQiOiI1MTAwNDFmZS1lYTQyLTQ1ZGQtYjFjMC02ZjhhYTMxMWQzODIiLCJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvbXkubWljcm9zb2Z0cGVyc29uYWxjb250ZW50LmNvbUA5MTg4MDQwZC02YzY3LTRjNWItYjExMi0zNmEzMDRiNjZkYWQiLCJleHAiOiIxNzc1MjczMjk4In0.ZiPZGaY_IH8r4MhsmPW-MYkK9MMOQSkxM7TDTBSN9_q9rjel9noLHUNQ0wS6C2VMvxwzLQE0yTNXrBpMfxVGHcyVM3qMWfRVJH-YPnJqXxtODyzMeLwqEzJvwpnEkMtRSl2t_u2Hj9XMH9LYl5jLTPvHNq0C8tQ4zg6p9iJgKFS75kmjYg1_CjXyQPYakYudZEhZX8OLOM1xL6NBmycrs83-HFdTtT5_uv6pOAU4g4dbghBInhvf_E3PAz0jc1-El01jJb0FiFfsXp4-ehwvysZNrx29QKeySjo-jeXUpLICbp0G9VbuReIa9Mburoj-hMFyQPWpxazF0cc0dK-0NghNk6X00S1M3szVT0mHBW2UyqZU-l1u2-91zmTxquWsguE_1hRdgnfktC8RDm20h5AmaW8bwe1GZCK7rcKvR4uLvhtLBd6ZOaPAVG4YdwfhXO0PH4DjNv8Nsmiv7cWEPeMSXCR-t08lxkyKlm0w8IonLxT7kxugiyihUYEiFNto0Z23a2ipNm2epL1Mtx05NA.VXfzHd598S8YoCAKUkAbP--gDpQ3jj7MPq4tk1EaqAU"
    
    echo '[SYSTEM] Extracting VHDX to Workspace...'
    7z e /dev/shm/sunshine.zip -o/workspaces/Windows/windows/ -y
    
    echo '[SYSTEM] Cleaning up RAM storage...'
    rm /dev/shm/sunshine.zip
    
    # Rename extracted file to data.vhdx
    mv /workspaces/Windows/windows/*.vhdx /workspaces/Windows/windows/data.vhdx 2>/dev/null
fi

echo '[SUCCESS] Setup finished. Type start.'