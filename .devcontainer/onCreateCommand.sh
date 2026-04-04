#!/bin/bash
# 1. Directory Setup
mkdir -p /workspaces/Windows/windows
cp /workspaces/Windows/.devcontainer/helpers/* /usr/local/bin/
chmod +x /usr/local/bin/*

# 2. Cleanup and Install tools
echo "[SYSTEM] Freeing space and installing tools..."
sudo rm -rf /usr/local/share/dotnet /usr/local/lib/node_modules /usr/local/go
sudo apt-get update && sudo apt-get install -y qemu-system-x86 qemu-utils wget curl p7zip-full novnc net-tools --no-install-recommends

# 3. High-Speed Zip Download
URL="https://my.microsoftpersonalcontent.com/personal/e633715ed8e8b835/_layouts/15/download.aspx?UniqueId=31984a96-101e-4304-a231-96356ed22d29&Translate=false&tempauth=v1e.eyJzaXRlaWQiOiI1MTAwNDFmZS1lYTQyLTQ1ZGQtYjFjMC02ZjhhYTMxMWQzODIiLCJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvbXkubWljcm9zb2Z0cGVyc29uYWxjb250ZW50LmNvbUA5MTg4MDQwZC02YzY3LTRjNWItYjExMi0zNmEzMDRiNjZkYWQiLCJleHAiOiIxNzc1MjY1NTcwIn0.jjHy6Ks6zKNl5JdaIX_ESJBgbgrnyhDMBKL3ToC7XsqfmR3LuGj1RAEENHYZWCJUCr-u1DA1PTZ47xKHdctCtyaBxrGRm-jH860NByyNxbOdNdZdjHvs-wFUjCXbstUmVLt7Duxnsiy9DF6xnacJ4ttHpfGuQ_TURYw6JsIuCvsTpoga4HkCsaVY30BbV0PS60MydqBkrmCIG_FpLq6fyjvh2qUZxwACDdHXePVrXaFoEODjRRAaxNa3Z83GLs5rTimefTXnjOlUnGmp5GfGSSQaVl1alhAUDbOnNFpHdt0DZ1S6dNvCQrJCwb7PU2-2N90OMFxVuPNbmnkkRS1XXzlGQc0-t7jC2Aas9rfbPkxL7MGIZdsSOiUPO8Xt2bO_NkYI5JzI8-L78dmof3yBotOYwVMrr5eIC4lTdZQWTz_4gyR7jrzQus4d-FzfzvJmenbElsyVAc29izIT-6GWpiyBzFrkeMiLMT5wDdpdXlHJeea7IZbOFdevGilGrjypCwZZ6eBSlrAU4Pf3TqChNw.TN_qSxYgv-TNWGj5kSu2xxfHckBTmilZSoRe8C6gTNs"

if [ ! -f "/workspaces/Windows/windows/data.vhdx" ]; then
    echo '[SYSTEM] Downloading 10.9GB Zip...'
    curl -L -o /workspaces/Windows/windows/sunshine.zip "$URL"
    
    echo '[SYSTEM] Extracting VHDX...'
    7z e /workspaces/Windows/windows/sunshine.zip -o/workspaces/Windows/windows/ -y
    
    echo '[SYSTEM] Cleaning up Zip file...'
    rm /workspaces/Windows/windows/sunshine.zip
    
    # Ensure file is named correctly
    mv /workspaces/Windows/windows/*.vhdx /workspaces/Windows/windows/data.vhdx 2>/dev/null
fi

echo '[SUCCESS] Setup finished. Type start to boot.'