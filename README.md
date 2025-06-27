# 🌐 Manulife VDI Login Guide

This guide walks you through the **setup of the RSA SecurID Authenticator** and how to **log in to Manulife's Virtual Desktop Infrastructure (VDI)** via Citrix.

---

## 🔐 Step 1: Configure RSA Authenticator (like UofT’s DUO)

You’ll use the **RSA SecurID app** to generate temporary passcodes needed for VDI access.

### 1.1 Bind Your Device with RSA

1. **Download** the *RSA SecurID* app from the App Store or Google Play.
2. Open the app and **accept the terms**.
3. Tap the **“MORE”** tab at the bottom (tabs: `Home`, `QR Scan`, `More`).
4. Tap **“About”**, then **press and hold** to **copy your Binding ID**.
5. **Send the Binding ID** to:  
   📧 `RemoteOrderDesk@manulife.com`
6. Once you receive the **QR code** via email, return to the app and tap **“QR Scan”** to scan and bind it.
7. Navigate back to the **Home** tab — you should see something like:  
   `"SecureID OTP Credential 1"`

---

### 1.2 Retrieve a Temporary Passcode

1. Open the RSA app and **enter your PIN**.  
   > ⚠️ On your **first login**, leave the PIN field empty (see Step 2). You’ll be prompted to set one.
2. The app will generate an **8-digit passcode**, valid for **60 seconds**.

---

## 📧 Credentials Required Before Step 2

Before logging into VDI, you must receive an email from IT that includes the following:

Windows Logon:

DOMAIN ID: abcdefg

DOMAIN: XXXX

PASSWORD: (Password will be sent separately)

Outlook:
Email: YourFirstName_YourLastName@manulife.com

Password: Use your DOMAIN password (same as Windows)



---

## 💻 Step 2: Log in to VDI (Citrix)

🔗 [VDI Login Page](https://sf.manulife.com/vpn/logout.html)

### 2.1 Log in via VDI Web Portal

1. Enter:
   - **Username:** your `DOMAIN ID`
   - **Password:** your Windows password
   - **Passcode:** the current 8-digit RSA code
   - **PIN:**
     - If this is your **first login**, **leave this field empty** and click **Submit**. You’ll then be prompted to **create your PIN**.
     - Otherwise, enter the PIN you set earlier.
   - **Domain:** select the correct domain (e.g., `MFCDG`)

2. Click **Login**

---

### 2.2 Launch Your Virtual Desktop

- A **Citrix Viewer** window should pop up with your virtual desktop.
- If it doesn’t:
  1. Click the **“DESKTOPS”** tab in the web portal.
  2. Select **“External Azure VDI”**
  3. Click **Open**

---

### 2.3 Log in Within Citrix Viewer

1. At the Citrix virtual desktop login screen:
   - **Username:** `DOMAIN/DOMAIN_ID` (e.g., `MFCDG/zhaxxxx`)
   - **Password:** your Windows password

2. Press **Enter** to access your virtual machine.

---

✅ You’re now logged into your Manulife Virtual Desktop!


