#!/bin/bash
mkdir -p /tmp/windows
cp /workspaces/Windows/.devcontainer/4-core/helpers/* /usr/local/bin/ 2>/dev/null
chmod +x /usr/local/bin/*
sudo rm -rf /usr/local/share/dotnet /usr/local/lib/node_modules /usr/local/go
echo "[SYSTEM] Installing tools..."
sudo apt-get update && sudo apt-get install -y --no-install-recommends qemu-system-x86 qemu-utils wget curl novnc websockify net-tools ovmf
sudo apt-get clean

if [ ! -f "/tmp/windows/data.vhdx" ]; then
    echo '[SYSTEM] Downloading VHDX directly...'
    curl -L -o /tmp/windows/data.vhdx "https://my.microsoftpersonalcontent.com/personal/e633715ed8e8b835/_layouts/15/download.aspx?UniqueId=5e2ea8d8-7db3-4dc6-90bb-ce1408b1ef31&Translate=false&tempauth=v1e.eyJzaXRlaWQiOiI1MTAwNDFmZS1lYTQyLTQ1ZGQtYjFjMC02ZjhhYTMxMWQzODIiLCJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvbXkubWljcm9zb2Z0cGVyc29uYWxjb250ZW50LmNvbUA5MTg4MDQwZC02YzY3LTRjNWItYjExMi0zNmEzMDRiNjZkYWQiLCJleHAiOiIxNzc1NDMwMjgxIn0.hDjwxjYbcsH6I6IFo1CUC44qXVcdczlSPH6yDO-k-NMFAlL7JasidepZeToict9_fjfm4oC3tGrZlFyprMu2JsYBrjrZyY5qTnq7Cd73kKIDppysAQ4sJZYSxQlPbKLl9VUQ_kosKVRINFuicaEEsu05dnsuvGL2PhzGBkKGjPEdq9SyO1nMH3SQsVfktmOmwfmJCDvipALlK92LcFK_lwUTwu9xffYUIt2KGoESmUsshEGwnZ-m2hMRdhK4ypswfpO-0leC42rPw5Qs6XwqAv1g0h3nh50q28ANJiKZChJA51J0Iv-CQQg8UztZmOKWgv8xEdNSIqZ0fE1Js4Q4BvFQNyTU_JVfq4ua5lfSdfAeKQixbzRSyjAA6ZEnvOoARVk09eM4boo-h9VIkNXTWSHldOKDqb37gHR4qDEpogvSrf0gVbNrXOKqJRMHVqD7YWmNlJ0W9vB5QsJVPZ6maIOuBANczTTwepMEc7L1u4YYF4nlNO_VdMtMIqEyw5syhZ8vtLaCQzjqYYbnV4aljw.ifSv-RV1_aiEyYuZDIQeweizN-VoSocu48lEdue69Cs"
    sudo chmod -R 777 /tmp/windows
fi
echo '[SUCCESS] Setup finished. Type start.'
