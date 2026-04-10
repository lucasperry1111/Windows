#!/bin/bash
mkdir -p /tmp/windows
cp /workspaces/Windows/.devcontainer/4-core/helpers/* /usr/local/bin/ 2>/dev/null
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
EXPECTED_SIZE=24196939776 # ~22.5GB

if [ ! -f "$VHDX" ] || [ $(stat -c%s "$VHDX" 2>/dev/null || echo 0) -lt $EXPECTED_SIZE ]; then
    echo '[SYSTEM] Starting Download...'
    
    # Loop until the file size matches the source
    until [ $(stat -c%s "$VHDX" 2>/dev/null || echo 0) -ge $EXPECTED_SIZE ]; do
        echo "[SYSTEM] Downloading... ($(stat -c%s "$VHDX" 2>/dev/null || echo 0) bytes received)"
        sudo curl -L -C - --retry 10 --retry-delay 5 -o "$VHDX" "$URL"
        if [ $? -ne 0 ]; then
            echo "[RETRY] Connection dropped. Waiting 10s to reconnect..."
            sleep 10
        fi
    done
    
    sudo chmod -R 777 /tmp/windows
    echo '[SUCCESS] Download 100% Complete.'
fi

echo '[SUCCESS] Setup finished.'
