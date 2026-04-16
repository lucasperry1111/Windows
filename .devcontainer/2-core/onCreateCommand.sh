#!/bin/bash

(while true; do echo -n "."; sleep 300; done) &
KEEP_ALIVE_PID=$!

mkdir -p /tmp/windows
cp /workspaces/Windows/.devcontainer/2-core/helpers/* /usr/local/bin/ 2>/dev/null
chmod +x /usr/local/bin/*

sudo apt-get update && sudo apt-get install -y --no-install-recommends qemu-system-x86 qemu-utils wget curl novnc websockify net-tools ovmf stunnel4 p7zip-full
sudo apt-get clean

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/stunnel/stunnel.key -out /etc/stunnel/stunnel.crt -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"
sudo bash -c 'cat > /etc/stunnel/myrtille.conf <<EOF
pid = /tmp/stunnel.pid
[myrtille]
accept = 443
connect = 127.0.0.1:8008
cert = /etc/stunnel/stunnel.crt
key = /etc/stunnel/stunnel.key
EOF'

VHDX="/tmp/windows/methalo.vhdx"
URL="https://pub-dc6f3e26ce5940dd92d9c742a92d150e.r2.dev/methalo.vhdx"

echo "[SYSTEM] Syncing with Cloud Storage..."
EXPECTED_SIZE=$(curl -sI "$URL" | grep -i Content-Length | awk '{print $2}' | tr -d '\r')
if [ -z "$EXPECTED_SIZE" ]; then EXPECTED_SIZE=24196939776; fi

if [ ! -f "$VHDX" ] || [ $(stat -c%s "$VHDX" 2>/dev/null || echo 0) -lt $EXPECTED_SIZE ]; then
    echo "[SYSTEM] File size mismatch detected. Starting sync..."
    until [ $(stat -c%s "$VHDX" 2>/dev/null || echo 0) -ge $EXPECTED_SIZE ]; do
        CURRENT=$(stat -c%s "$VHDX" 2>/dev/null || echo 0)
        echo "[DOWNLOAD] Current: $CURRENT | Goal: $EXPECTED_SIZE"
        sudo curl -L -C - --retry 10 -o "$VHDX" "$URL"
        if [ $? -ne 0 ]; then sleep 5; fi
    done
    sudo chmod -R 777 /tmp/windows
    echo "[SUCCESS] Disk fully synced."
fi

kill $KEEP_ALIVE_PID
echo '[SUCCESS] Setup finished.'
