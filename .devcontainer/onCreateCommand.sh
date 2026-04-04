#!/bin/bash
mkdir -p /tmp/windows
cp /workspaces/Windows/.devcontainer/helpers/* /usr/local/bin/ 2>/dev/null
chmod +x /usr/local/bin/*
sudo rm -rf /usr/local/share/dotnet /usr/local/lib/node_modules /usr/local/go
echo "[SYSTEM] Installing tools..."
sudo apt-get update && sudo apt-get install -y --no-install-recommends qemu-system-x86 qemu-utils wget curl novnc websockify net-tools ovmf
sudo apt-get clean

if [ ! -f "/tmp/windows/data.vhdx" ]; then
    echo '[SYSTEM] Downloading VHDX directly...'
    curl -L -o /tmp/windows/data.vhdx "https://my.microsoftpersonalcontent.com/personal/e633715ed8e8b835/_layouts/15/download.aspx?UniqueId=31984a96-101e-4304-a231-96356ed22d29&Translate=false&tempauth=v1e.eyJzaXRlaWQiOiI1MTAwNDFmZS1lYTQyLTQ1ZGQtYjFjMC02ZjhhYTMxMWQzODIiLCJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvbXkubWljcm9zb2Z0cGVyc29uYWxjb250ZW50LmNvbUA5MTg4MDQwZC02YzY3LTRjNWItYjExMi0zNmEzMDRiNjZkYWQiLCJleHAiOiIxNzc1MjgzNDIyIn0.GEMcDPElgP6GsimMPTnX6IkjO6_WWF1V1Hki7MFLh2c52pL3W6Pb78NmM7yhMgiteSXcoR4Vh5XoG_PwztL12Gd0eWE7hBJ507KbjIlOS9uNr2PTnjwA9xKZrf9kMlTw_3BgxQ1CSpR9ldDV5LtzuPQLQJpEiunKvwZAqeVSDWNIWGTIORsNhdxMneD4WHS1zIbTB-TTYUNWXP_4L99pVGdaj3uopBYGsBi1JuZU6VFtHuOOyrvvR0JDb0zZfAgZrKowSNU0vh0_S6zeNwCZwObh5C8vhGHDiyWOGrTGwo5GDiRghl-l18CQqq3Mj67p5eD7QicfkX5V4goJ0AAlL_ECbQB3flShCoxAFvDSB70dRf4qfgNpu02GEYIxe2dYcKuVsxHJP1ZIaXa0OkTG-4C4doExYZRzEa_xmMsQAtuMO5xM63oy1ppSIc4lMWDiYWnxLseY6SBARZKTuM6wNDYNjtOsEV2PvGc1mu__vwhhkTV54zoyEzJ9qAFvy1UIICq-hmvWmbEgm-Y_X0n9Bw.FO84cEq6bOJ3a_meRUaM4wvwtLO2XT9gPQrz8HYVNvg"
    sudo chmod -R 777 /tmp/windows
fi
echo '[SUCCESS] Setup finished. Type start.'