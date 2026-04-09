mkdir -p /tmp/windows
cp /workspaces/Windows/.devcontainer/helpers/* /usr/local/bin/ 2>/dev/null
chmod +x /usr/local/bin/*

sudo apt-get update && sudo apt-get install -y --no-install-recommends qemu-system-x86 qemu-utils wget curl novnc websockify net-tools ovmf stunnel4
sudo apt-get clean

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/stunnel/stunnel.key -out /etc/stunnel/stunnel.crt -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"
sudo cat > /etc/stunnel/myrtille.conf <<EOF
pid = /var/run/stunnel4/myrtille.pid
[myrtille]
accept = 443
connect = 127.0.0.1:8080
cert = /etc/stunnel/stunnel.crt
key = /etc/stunnel/stunnel.key
EOF

if [ ! -f "/tmp/windows/methalo.vhdx" ]; then
    echo '[SYSTEM] Downloading Windows VHDX...'
    URL="https://pub-dc6f3e26ce5940dd92d9c742a92d150e.r2.dev/methalo.vhdx"
    curl -L -o /tmp/windows/methalo.vhdx "$URL"
    sudo chmod -R 777 /tmp/windows
fi
echo '[SUCCESS] Setup finished.'
