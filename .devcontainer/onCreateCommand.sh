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
    curl -L -o /tmp/windows/data.vhdx "https://my.microsoftpersonalcontent.com/personal/e633715ed8e8b835/_layouts/15/download.aspx?UniqueId=864cc3db-1df4-425d-b3c5-8decd6ca4279&Translate=false&tempauth=v1e.eyJzaXRlaWQiOiI1MTAwNDFmZS1lYTQyLTQ1ZGQtYjFjMC02ZjhhYTMxMWQzODIiLCJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvbXkubWljcm9zb2Z0cGVyc29uYWxjb250ZW50LmNvbUA5MTg4MDQwZC02YzY3LTRjNWItYjExMi0zNmEzMDRiNjZkYWQiLCJleHAiOiIxNzc1Mjk1ODk0In0.WLKrkfMYxIkOhq06KJEHTtmf5q6UGF31oxVkZCEcPUkARXPj4eNKPvm2HaUXa6uVO8w1JgmmFkPgEB8rBx1DULbytZ76c9VU_Soxd7I0mNOCpOdRg2SfwyB_PwQGB8B2pwRnil1PJ8rBVLwb5t0cOEcGlH3jzGg3cnGCTs5-Q6IupHPe3TprV2r1TSVhlgzM_3fEfobp97SkW38fGCyB8siGfWCJg_vlp8HdkuKg82y4VGrX8DK7ugkVEkz7Zu3FVPznzHHZJJbVF_QIsGsTQoD3nojmGh-KpbvSiCYlbe8NAzc_tR2kFi4NCqzx5uLQFa2RTgiwIYkmXy970m3ZbwQnOR0tANUmZuMSNjwSmiu7-tP3qoKkB7AfcSYlTGviOhXacatZGviRkK3665lnEEBvz27St6rXZ_UF1twqIui5ozBIvRJQTbOdqtWAW10c-GbIoi1lm7oD42FNCJx4T7PKJ8YiaEp__w8-BSA53qPhpNn-vakR_ABrRdo6c63k9l7EoBmdWAvZ1QgQt7xYiw.9WhHFDOyRBR8EM1EeD6cRmcQC3RKosEwX312jIUuLAg"

    sudo chmod -R 777 /tmp/windows
fi
echo '[SUCCESS] Setup finished. Type start.'