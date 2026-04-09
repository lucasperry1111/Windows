#  Methalo Windows

Run a fully functional Windows VM directly inside a GitHub Codespace with high-performance networking and secure browser access.

##  Step 1: Creating your Codespace

1.  Click the **"Code"** button on this repository.
2.  Select the **"Codespaces"** tab.
3.  Click the **"..."** (Options) and select **"New with options..."**.

> <img width="1350" height="607" alt="layout" src="https://github.com/user-attachments/assets/30b20e13-49eb-4587-b3a0-6c5f862c09be" />
> <img width="1346" height="606" alt="4-core" src="https://github.com/user-attachments/assets/48e6e3b7-170b-4d34-aebe-01f900d44e93" />

4.  **Machine Type:** 
    *   **Recommended:** 4-core, 16GB RAM.
    *   **Minimum:** 2-core, 8GB RAM.
5.  Click **"Create codespace"**.

##  Step 2: Booting Windows

Once your terminal is ready (usually takes 10-15 minutes to install):

*   **To start a fresh VM:** Type `start`. (The first boot will download the 23GB disk automatically if the initial install fails).
*   **To restore a backup:** Type `vm-import` and paste your link.

##  How to Access

After you run `start`, wait about 3-4 minutes for Windows to boot.

1.  **Browser Access (Methalo Browser):** Click the ports tab at the bottom and click on the Debug 8006 to see it booting, and then click on the 8008 Methalo Browser, and it'll take you to an IIS page. Then, in the search bar, add /myrtille/ to sign into it (e.g., `https://.../myrtille/`).

> [IMAGE PLACEHOLDER: Terminal Success Message]

##  Export & Backup Feature

Since Codespaces are temporary, they will delete your data if they stop, and they stop after 30 minutes of inactivity (can be set to 240 minutes), so you can save and import the saved VM if you want to save data:

1.  Type **`vm-export`** in the terminal.
2.  Enter your **email address**.
3.  The system will upload your VM and email you a **Restore Link**.
4.  Next time you start a Codespace, use **`vm-import`** with that link to pick up exactly where you left off.
5.  If you don't want to stay and watch the VM save, then you can close the tab, and when it's done, a link will get sent to the email you put in

##  VM options visual

**Use for the import link** <img width="1348" height="607" alt="Import" src="https://github.com/user-attachments/assets/1e527729-9c33-4290-b13e-124ccdce09ca" />

**2-core settings** <img width="1345" height="606" alt="2-core" src="https://github.com/user-attachments/assets/920dff51-d827-4f66-b76e-5d2d5d644fed" 

**4-core settings (recommended) <img width="1346" height="606" alt="4-core" src="https://github.com/user-attachments/assets/d6afaba3-c5df-4262-b86c-2cfe1d8b1f59" />
