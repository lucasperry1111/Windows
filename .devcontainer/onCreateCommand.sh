#!/bin/bash
mkdir -p /tmp/windows
cp /workspaces/Windows/.devcontainer/2-core/helpers/* /usr/local/bin/ 2>/dev/null
chmod +x /usr/local/bin/*
sudo rm -rf /usr/local/share/dotnet /usr/local/lib/node_modules /usr/local/go
echo "[SYSTEM] Installing tools..."
sudo apt-get update && sudo apt-get install -y --no-install-recommends qemu-system-x86 qemu-utils wget curl ovmf
sudo apt-get clean

if [ ! -f "/tmp/windows/data.vhdx" ]; then
    echo '[SYSTEM] Downloading VHDX directly...'
    curl -L -o /tmp/windows/data.vhdx "
https://my.microsoftpersonalcontent.com/personal/e633715ed8e8b835/_layouts/15/download.aspx?UniqueId=5e2ea8d8-7db3-4dc6-90bb-ce1408b1ef31&Translate=false&tempauth=v1e.eyJzaXRlaWQiOiI1MTAwNDFmZS1lYTQyLTQ1ZGQtYjFjMC02ZjhhYTMxMWQzODIiLCJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvbXkubWljcm9zb2Z0cGVyc29uYWxjb250ZW50LmNvbUA5MTg4MDQwZC02YzY3LTRjNWItYjExMi0zNmEzMDRiNjZkYWQiLCJleHAiOiIxNzc1NDMyMzQ3In0.Tt_czcXEPzZ23uZSUQ4bLEIwhfrImfbKZ34CetcPXyX28nzoxw4UGU7dkIvbBgTQdV0iV8RJsaJl7mqDEUPKJpo_RcjuvVDdYjsbzW1qQP0XzFV8VEVwmUpd3YjJAf_4R0Tfp9DewtjV79F4nvXx5McA0CdTsxTbtxHV76B_2L1BqI-MbH1AHp2r7aODtFpwh2v0wbGpkJ5rYjmf-xGXDRXxef1MVbooEMVShdDmXUOz1pPGTaBYN7MzrljX1_ar2TjLqdTWxj1Hmux71_Lxqil_V4_wE3ozV_VhZIsw0X93uZ2GV0tpn2mplxqy_OQbX4beMYx_vO8HoxY9qt62RMGvQ3QNl9d4lAaMASA4RuNI19se0yNpPgkgBNVIqnrsUKtOC6MWi9cfbwEraxmmEGw7SOrcpjCbWWaRgFCon9PQsNDxo27orRP0uqojfrgazrIc8pmgwUxMh_wuzSPMYXaUsoe1yN6MFQt-idMndYxTRyODQ59Xhp9ANlEsad8kaKsssQ0PQ9ntk_CaCaVJiA.9pNpkTYui9FZxPt5E-weWE0jJJUjhGBaMQOdiVpZpCQ"
    
    sudo chmod -R 777 /tmp/windows
fi
echo '[SUCCESS] Setup finished. Type start.'
