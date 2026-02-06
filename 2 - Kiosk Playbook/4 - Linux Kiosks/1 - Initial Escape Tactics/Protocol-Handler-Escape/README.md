# Protocol Handler Kiosk Breakout (Linux)

## Overview

This directory contains resources for the **Protocol Handler Escape** tactic. This technique demonstrates how to escape a locked-down Linux kiosk browser by exploiting the operating system's default handling of external protocols (such as `mailto:`).

Unlike standard browser exploits, this attack leverages the **Operating System's "User Context."** When a restricted kiosk browser hands off a protocol request to an external application (like a mail client), that secondary application often launches with the privileges of the logged-in user, bypassing the strict containerization (Snap/AppArmor) applied to the browser itself.

**Repo:** [https://github.com/CroodSolutions/CTRL-ESC-HOST](https://github.com/CroodSolutions/CTRL-ESC-HOST)

## Files

* `../prepare-kiosk.sh`: A setup script that installs dependencies (Firefox/Thunderbird), configures the `mailto:` handler, and sets up the environment.
* `../airline_kiosk.html`: The **SkyLine Premium Kiosk** demo. A polished HTML5 web app (simulating an airline check-in) designed to be run in full-screen Kiosk mode, containing integrated escape triggers.
* `kiosk-playbook/`: Directory containing specific Ansible or shell playbooks for Linux configuration (referenced in the broader project).

---

## Technical Nuances: The "Pivot"

The success of this escape relies on specific behaviors in Linux Desktop Environments (specifically GNOME/Ubuntu) and how web browsers handle external schemes.

### 1. Browser Handling (Chrome vs. Firefox)

* **Chromium/Chrome:** Typically hands off protocols like `mailto:` directly to the OS default handler without restriction, making it the primary target for this specific demo.
* **Firefox:** Often defaults to handling `mailto:` internally (opening a web-based composer) or blocking it in Kiosk mode.
* *Note:* We use Firefox in this demo for its ease of Kiosk configuration, but the `prepare-kiosk.sh` script forces the OS association to demonstrate the vulnerability common in Chromium-based kiosk deployments.



### 2. The Container Gap

Even if the browser is sandboxed (Snap/Flatpak), triggering an external app breaks that containment.

1. **Browser (Restricted):** Cannot access the file system or run shell commands.
2. **Protocol Handoff:** Browser tells OS "Open this email address."
3. **Mail Client (User Context):** The OS launches Thunderbird. While Thunderbird might also be a Snap package, it runs as the **User**, not the Kiosk Browser service.

---

## Setup & Usage

### 1. Configure the Environment

The setup script prepares the machine by installing necessary viewers and configuring the desktop environment.

```bash
chmod +x ../prepare-kiosk.sh
../prepare-kiosk.sh

```

* **Manual Mode:** Adds "SkyLine Kiosk" to your App Menu and Desktop for testing.
* **Persistence Mode:** Adds the kiosk to `~/.config/autostart` to launch automatically on login/reboot.

### 2. Launching the Attack Simulation

If using the manual shortcut, simply click the "SkyLine Kiosk" icon. To launch manually from the terminal:

```bash
firefox --kiosk "file://$(pwd)/../airline_kiosk.html"

```

---

## Escape Walkthrough

### Phase 1: The Trigger

1. **Enter the Portal:** Use any 6-digit ID (e.g., `123456`) to enter the mock Airline Check-in.
2. **Find the Link:**
* Click **Assistance** (top left).
* Click **Digital Support** (bottom left).
* Navigate to the **Contact Support** card.
* Click the **Email** link.


3. **Result:** The browser passes the request to the OS, which launches **Thunderbird** (or the default mail client).

### Phase 2: The Traversal

We now utilize the legitimate UI of the mail client to spawn a File Manager window.

1. Inside Thunderbird, go to the **Hamburger Menu (≡)** or **Help** tab.
2. Select **Troubleshooting Information**.
3. Find the "Profile Folder" row and click **Open Directory**.
4. **Result:** The Linux File Manager (Nautilus) opens.

### Phase 3: Shell Access

Because the File Manager was spawned by the Mail Client (which was spawned by the User), it inherits User permissions.

1. In the File Manager window, right-click in any whitespace.
2. Select **Open in Terminal**.
3. **Result:** You have a terminal shell as the `kiosk` user, breaking out of the browser's restrictions.

---

## Persistence (Post-Exploitation)

Once shell access is achieved, you can ensure your code runs every time the kiosk reboots (a common troubleshooting step by admins).

**Method: Autostart Injection**
Navigate to the autostart config directory and inject a payload (like the calculator demo or a C2 beacon):

```bash
cd ~/.config/autostart/
# Create a .desktop file or script entry here
# The system will execute this upon next login

```

The `../prepare-kiosk.sh` script demonstrates this by placing the Kiosk launch file here. An attacker would replace or append to this to launch their own payload alongside (or instead of) the Kiosk app.

---

## Mitigation

To prevent this style of breakout:

1. **Remove Unused Binaries:** Uninstall default mail clients (`thunderbird`), file managers, and terminal emulators from the kiosk OS image.
2. **Hardening Browser Policy:** Configure the browser (via `policies.json` or GPO) to block external protocol requests (`mailto`, `tel`).
3. **Disable Context Menus:** Remove `nautilus-extension-gnome-terminal` to prevent right-click terminal access in the file manager.

For detailed defensive strategies, refer to:
[Protocol Handler Hardening](https://www.google.com/search?q=https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/5%2520-%2520Defensive%2520Recommendations/Protocol-Handler-Hardening.md)
