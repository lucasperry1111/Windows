#!/bin/bash

(while true; do echo -n "."; sleep 300; done) &
KEEP_ALIVE_PID=$!

mkdir -p /tmp/windows
cp /workspaces/Windows/.devcontainer/4-core/helpers/* /usr/local/bin/ 2>/dev/null
chmod +x /usr/local/bin/*

sudo apt-get update && sudo apt-get install -y --no-install-recommends \
    qemu-system-x86 qemu-utils wget curl novnc websockify net-tools ovmf stunnel4 p7zip-full
sudo apt-get clean

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/stunnel/stunnel.key \
    -out /etc/stunnel/stunnel.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"

sudo bash -c 'cat > /etc/stunnel/myrtille.conf <<EOF
pid = /tmp/stunnel.pid
[myrtille]
accept = 443
connect = 127.0.0.1:8008
cert = /etc/stunnel/stunnel.crt
key = /etc/stunnel/stunnel.key
EOF'

# Disk directory still created, but no syncing/downloading
VHDX="/tmp/windows/methalo.vhdx"
touch "$VHDX"

kill $KEEP_ALIVE_PID
echo '[SUCCESS] Setup finished.'
