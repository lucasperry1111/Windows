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
    curl -L -o /tmp/windows/data.vhdx "https://my.microsoftpersonalcontent.com/personal/e633715ed8e8b835/_layouts/15/download.aspx?UniqueId=5e2ea8d8-7db3-4dc6-90bb-ce1408b1ef31&Translate=false&tempauth=v1e.eyJzaXRlaWQiOiI1MTAwNDFmZS1lYTQyLTQ1ZGQtYjFjMC02ZjhhYTMxMWQzODIiLCJhdWQiOiIwMDAwMDAwMy0wMDAwLTBmZjEtY2UwMC0wMDAwMDAwMDAwMDAvbXkubWljcm9zb2Z0cGVyc29uYWxjb250ZW50LmNvbUA5MTg4MDQwZC02YzY3LTRjNWItYjExMi0zNmEzMDRiNjZkYWQiLCJleHAiOiIxNzc1NDE4MzIxIn0.HbAUrQ3UALnU3bf01Jl5WuPY__iJkYdowCyyjMVYvEg-eHpdB8Un_0sIrwWwXCQyxqVxrniN8tlcpY9akLKFuoBANQATUvEYy37Vt6bcXkC7n_DzRWoccXgD-jLtf_C9_FnpI7PXC906Tr7nee0M0fzKUeEpHKQNcLLSqr7fg6cmZ4zgynb76IuhzR6iO_pkuKH5hMSzS0nm_wnSWmCRD29LQ1pPOz0GKNyUjbDZyvMzj5NZR1Gqf2XK-1HD8gvBxhwdE0u8JehErfmOCIKgAoH_BIgEIhEY0sMt2VmqhpqQfzqnXsHafaw94Y5M5Gtn0seN9ZHpVyz-YLPd-n4PSoFr4Y0uv8KF_3Vcw9Hy8ntDF6nCq-ZmaPs3WcDnaOmLLCd7gxGeL0MEGcCmC0a3jX2sCgOCVdBzjpsIk2P8ETedqStubG8JHGNNLxrT17H1HtA_p0-1bMIUFPlEfWnjpyx72gPdcKKb9yUzVBPXtBa9WmrPaCqRH3qsmKSp4HkvSbFlBErygWeM6DWcGnYniQ.dGMM2Jku959bJQK-8id9oSBMmho5CKv1wW5yXtFQ_TU"
    
    sudo chmod -R 777 /tmp/windows
fi
echo '[SUCCESS] Setup finished. Type start.'
