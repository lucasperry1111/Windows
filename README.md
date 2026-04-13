#  Methalo Windows

</h1>

[setup](https://github.com/user-attachments/assets/ddf9b44e-adb5-49b6-9f40-f2a4b0fc041f)

Run a fully functional Windows VM directly inside a GitHub Codespace with high-performance networking.

##  Step 1: Creating your Codespace

1.  Click the **"Code"** button on this repository.
2.  Select the **"Codespaces"** tab.
3.  Click the **"..."** (Options) and select **"New with options..."**.

<img width="1350" height="607" alt="layout" src="https://github.com/user-attachments/assets/30b20e13-49eb-4587-b3a0-6c5f862c09be" />
<img width="1346" height="606" alt="4-core" src="https://github.com/user-attachments/assets/48e6e3b7-170b-4d34-aebe-01f900d44e93" />

4.  **Machine Type:** 
    *   **Recommended:** 4-core, 16GB RAM.
    *   **Minimum:** 2-core, 8GB RAM.
5.  Click **"Create codespace"**.

##  Step 2: Booting Windows

Once your codespace is ready (takes 15-20 minutes to install windows):

**`Done`**
<img width="1362" height="605" alt="done" src="https://github.com/user-attachments/assets/5c20f6dc-259a-418a-95de-1a58712962d9" />

*   **Open a terminal:** Right-click the codespace and click **"New Terminal"** after the codespace is ready.
*   **To start a fresh VM:** Type `start`. (The first boot will download the 23GB disk automatically).
*   **To restore a backup:** Type `vm-import` and paste your link.

##  How to Access

After the install is done, wait about 2-3 minutes for Windows to set up the RDP connection.

1.  **Browser Access (Methalo Browser):** Click the ports tab (as shown in the image above) and click on the Debug 8006 to see it booting, and then click on the 8008 Methalo Browser, and it'll take you to an IIS page. Then, in the search bar, add /myrtille/ to sign into it (EX, `https://urban-space-halibut-wrwqv6v9q6jqf96vg-8008.app.github.dev/` to `https://urban-space-halibut-wrwqv6v9q6jqf96vg-8008.app.github.dev/myrtille/`) (Just an example link, yours will be different).

**`Before`** <img width="1361" height="675" alt="IIS" src="https://github.com/user-attachments/assets/5aadab01-2762-46b6-b514-9e9522d5ede0" />
**`After`** <img width="1362" height="674" alt="myrtille" src="https://github.com/user-attachments/assets/883856d1-2f96-4452-8424-260367a924dd" />

##  Signing into the RDP

1. **The email and the password will always be the same**
2. **You can leave the Hostname empty, and it'll default to localhost; you can use 127.0.0.1, or 10.0.2.15, both do the same thing.**
3. **Username: Methalo**
4. **Password: Lp842010**

**`Sign In`** <img width="1360" height="674" alt="signin" src="https://github.com/user-attachments/assets/28c9fd40-47c6-48af-867a-8f1216ce50b3" />
**`Signed in`** <img width="1361" height="676" alt="in" src="https://github.com/user-attachments/assets/f23bd552-9fe4-4afa-b4fd-e1ec658dc6c6" />

##  Export & Backup Feature

Since Codespaces are temporary, they will delete your data if they stop, and they stop after 30 minutes of inactivity. I recommend setting it to 240 minutes just in case the built-in keep-alive program breaks. You can save and import the saved VM if you want to save data. If you don't feel like typing vm-export or forget, then the built-in auto-saver will export it for you, and when you create an account at methalo.lol it will show in your account settings with all your other links, and it'll also send you an email with the link.

1.  Type **`vm-export`** in a new terminal.
2.  Enter your **email address**, **Name**, and **Save Name**.
<img width="1366" height="678" alt="export" src="https://github.com/user-attachments/assets/a62876ac-d567-4ccd-8f9b-f273de6a2b64" />

4.  The system will upload your VM and email you a **Restore Link**, or if you go to https://methalo.lol and sign up with the email that you used and then go to account settings, a list of your links will be there. 
5.  Next time you start a Codespace, use **`vm-import`** with that link to pick up exactly where you left off.
<img width="1366" height="677" alt="import1" src="https://github.com/user-attachments/assets/a0e6dfa5-07f5-4856-9dbd-6ab8ea14665f" />

6.  If you don't want to stay and watch the VM save, then you can close the **BROWSER** tab, and when it's done, a link will get sent to the email you put in. (Don't close the terminal tab)

##  VM options visual

**`[Use for the import link]`** `(skips the default download saving time)` <img width="1348" height="607" alt="Import" src="https://github.com/user-attachments/assets/1e527729-9c33-4290-b13e-124ccdce09ca" />

**`[2-core settings (minimal)]`** `(least amount of ram for the device, makes it laggy kinda)(5gb)` <img width="1345" height="606" alt="2-core" src="https://github.com/user-attachments/assets/920dff51-d827-4f66-b76e-5d2d5d644fed" />

**`[4-core settings (recommended)]`** `(best, not laggy, gives you 11GB of ram download Minecraft or something)(11gb)` <img width="1346" height="606" alt="4-core" src="https://github.com/user-attachments/assets/d6afaba3-c5df-4262-b86c-2cfe1d8b1f59" />
