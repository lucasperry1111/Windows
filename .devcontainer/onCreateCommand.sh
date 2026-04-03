#!/bin/bash
# 1. Aggressive Cleanup to save every megabyte
echo "[SYSTEM] Clearing system cache to make room..."
apt-get clean
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/*

# 2. Install only essential tools
apt-get update && apt-get install -y qemu-system-x86 qemu-utils wget curl novnc net-tools --no-install-recommends

# 3. Directory Setup
mkdir -p /workspaces/Windows/windows
cp /workspaces/Windows/.devcontainer/helpers/* /usr/local/bin/
chmod +x /usr/local/bin/*

# 4. Check space before download
FREE_SPACE=$(df -k --output=avail /workspaces/Windows | tail -1)
if [ "$FREE_SPACE" -lt 22000000 ]; then
    echo "[CRITICAL] Not enough disk space for 21GB download. (Have: $((FREE_SPACE/1024)) MB)"
    echo "Please delete this Codespace and create a new one using an '8-Core' machine."
    exit 1
fi

# 5. Direct High-Speed Download
URL="https://my.microsoftpersonalcontent.com/personal/e633715ed8e8b835/_layouts/15/download.aspx?UniqueId=e4b8f49a-15b8-41df-860a-030347a2e50a&Translate=false&tempauth=v1e.eyJzaXRlaWQiOiI1MTAwNDFmZS1lYTQyLTQ1ZGQtYjFjMC02ZjhhYTMxMWQzODIiLCJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvbXkubWljcm9zb2Z0cGVyc29uYWxjb250ZW50LmNvbUA5MTg4MDQwZC02YzY3LTRjNWItYjExMi0zNmEzMDRiNjZkYWQiLCJleHAiOiIxNzc1MjU2NDE5In0.wMOgzT1moAjrb3byv-JdEa15xHazJDJ-vE6r2qBByKSyj4q5GXUpOeIXZRuKKw0vuO7-zn7rD2RA7-JnB4prbdflAIkD2eKCrWncRwKr0kPUhiZnF7KubchArSD6q4f1IXP0xJKBgin9PtUX8ORkLzP2R8ZxT_rwReUDEt9I72sAwhyihWXoydITGJueLWiW4cLCQoEmkuvnlfg5f4IvJlshPYziPcYLEgbAPTkuR2CVPf8DCKUSf7iAMMtSfkLLEpAVbq1jjuPvk17mS0ZsclMLPnFZ7k-ylgzEFeF5fVfTm7SWGH3bpO-V_WsCMtx8N-6jD99stFfXB1XPXkEzt5oorjhnRGs90ygJQz8UU_ONd2QQip5ejWHxakB-DHnse64m78Vu6Up5XdRmdxrj4nGih2C9srOt-qgy6F-Qhr9WIVF-yOx-Q251XT-nFiqiYpK8dPN1HpJgbzT-5I_vNEC5T8g9D7ACaPWak39nkUBOnRh21108w2WC4tIEl4rhFgS8gVRuvIQO7-OKHSKZOQ.hLTbBsOL1A5E0o_vRxlg4UYzWMmHZb7W8W_jnUR7Tl8"

if [ ! -f "/workspaces/Windows/windows/data.vhdx" ]; then
    echo '[SYSTEM] Downloading VHDX...'
    curl -L -o /workspaces/Windows/windows/data.vhdx "$URL"
fi

echo '[SUCCESS] Ready. Type start to boot.'