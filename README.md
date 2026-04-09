# 🚀 Methalo Windows

Run a fully functional Windows VM directly inside a GitHub Codespace with high-performance networking and secure browser access.

## 🛠️ Step 1: Creating your Codespace

1.  Click the **"Code"** button on this repository.
2.  Select the **"Codespaces"** tab.
3.  Click the **"..."** (Options) and select **"New with options..."**.
4.  **Machine Type:** 
    *   **Recommended:** 4-core, 16GB RAM.
    *   **Minimum:** 2-core, 8GB RAM.
5.  Click **"Create codespace"**.

> [IMAGE PLACEHOLDER: Creating Codespace Options]

## ⚡ Step 2: Booting Windows

Once your terminal is ready (usually takes 30 seconds):

*   **To start a fresh VM:** Type `start`. (The first boot will download the 23GB disk automatically).
*   **To restore a backup:** Type `vm-import` and paste your link.

## 🌐 How to Access

After you run `start`, wait about 2-3 minutes for Windows to boot.

1.  **Browser Access (Premium):** Click the link provided in the terminal (e.g., `https://.../myrtille/`).
2.  **Console Access (Debug):** Go to the **Ports** tab in VS Code and open Port **8006** to see the noVNC console.

> [IMAGE PLACEHOLDER: Terminal Success Message]

## 💾 Export & Backup Feature

Since Codespaces are temporary, you can save your progress:

1.  Type **`vm-export`** in the terminal.
2.  Enter your **email address**.
3.  The system will upload your VM and email you a **Restore Link**.
4.  Next time you start a Codespace, use **`vm-import`** with that link to pick up exactly where you left off.

## ⚙️ Advanced Settings

*   **Networking:** Bridged via QEMU user-net (Host 8080 -> Guest 80).
*   **Security:** SSL Termination via `stunnel` for secure browser access.
*   **Performance:** Uses `virtio-vga` and `e1000` for maximum compatibility.

---
*Created by Methalo*
