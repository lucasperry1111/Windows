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

if [ ! -f "/tmp/windows/methalo.vhdx" ]; then
    echo '[SYSTEM] Downloading Windows VHDX...'
    sudo curl -L --retry 10 --retry-delay 5 -C - -o /tmp/windows/methalo.vhdx "https://pub-dc6f3e26ce5940dd92d9c742a92d150e.r2.dev/methalo.vhdx"
    sudo chmod -R 777 /tmp/windows
fi
echo '[SUCCESS] Setup finished.'
