mkdir -p /tmp/windows
cp /workspaces/Windows/.devcontainer/2-core/helpers/* /usr/local/bin/ 2>/dev/null
chmod +x /usr/local/bin/*

echo "[SYSTEM] Installing tools..."
sudo apt-get update && sudo apt-get install -y --no-install-recommends qemu-system-x86 qemu-utils wget curl novnc websockify net-tools ovmf stunnel4
sudo apt-get clean

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/stunnel/stunnel.key -out /etc/stunnel/stunnel.crt -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"
sudo bash -c 'cat > /etc/stunnel/myrtille.conf <<EOF
pid = /tmp/stunnel.pid
[myrtille]
accept = 443
connect = 127.0.0.1:8080
cert = /etc/stunnel/stunnel.crt
key = /etc/stunnel/stunnel.key
EOF'

echo '----------------------------------------------------'
echo '[SUCCESS] SETUP COMPLETE!'
echo 'Type "start" to download and boot Windows.'
echo '----------------------------------------------------'
