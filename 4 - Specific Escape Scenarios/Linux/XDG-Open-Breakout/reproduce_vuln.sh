#!/bin/bash

# ==============================================================================
# XDG-Open Kiosk Breakout - Reproduction Script
# ------------------------------------------------------------------------------
# Purpose: Sets up a vulnerable local environment to practice the 'mailto' escape.
# Target:  Ubuntu/Debian systems with GUI.
# Risks:   Modifies default protocol handlers. Run in a VM!
# ==============================================================================

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}[*] Starting Reproduction Setup...${NC}"

# 1. Check/Install Dependencies
echo -e "${BLUE}[*] Checking for required packages (chromium-browser, thunderbird)...${NC}"
if ! command -v chromium-browser &> /dev/null; then
    echo -e "${RED}[!] chromium-browser not found. Attempting install...${NC}"
    sudo apt-get update && sudo apt-get install -y chromium-browser
fi

if ! command -v thunderbird &> /dev/null; then
    echo -e "${RED}[!] thunderbird not found. Attempting install...${NC}"
    sudo apt-get install -y thunderbird
fi

# 2. Set the Trap (Force Thunderbird as default mailto handler)
# This prevents the "Select Application" dialog which might break the flow or look suspicious.
echo -e "${BLUE}[*] Configuring xdg-mime to force Thunderbird for 'mailto:'...${NC}"
xdg-mime default thunderbird.desktop x-scheme-handler/mailto

# Verify the setting
CURRENT_HANDLER=$(xdg-mime query default x-scheme-handler/mailto)
echo -e "${GREEN}[+] Current 'mailto' handler: $CURRENT_HANDLER${NC}"

# 3. Generate Local Target Page
echo -e "${BLUE}[*] Generating local Kiosk target page...${NC}"
cat <<EOF > /tmp/kiosk_demo.html
<!DOCTYPE html>
<html>
<head>
    <title>Secure Kiosk Terminal</title>
    <style>
        body { background-color: #333; color: white; font-family: sans-serif; display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100vh; margin: 0; }
        .container { text-align: center; border: 2px solid #555; padding: 50px; border-radius: 10px; background-color: #444; }
        h1 { margin-bottom: 20px; }
        .btn { background-color: #e74c3c; color: white; padding: 20px 40px; text-decoration: none; font-size: 24px; border-radius: 5px; display: inline-block; margin-top: 20px; }
        .btn:hover { background-color: #c0392b; }
        p { color: #aaa; margin-top: 40px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to the Public Terminal</h1>
        <div>SYSTEM STATUS: <span style="color: #2ecc71;">ONLINE</span></div>
        <br>
        <div>This terminal is restricted for public use.</div>
        
        <!-- THE VULNERABLE LINK -->
        <a href="mailto:admin@corp.local" class="btn">Contact Support</a>
        
        <p>Restricted Environment v1.0.4</p>
    </div>
</body>
</html>
EOF
echo -e "${GREEN}[+] Target created at file:///tmp/kiosk_demo.html${NC}"

# 4. Instructions and Launch
echo -e "${BLUE}[*] Launching Kiosk in 5 seconds...${NC}"
echo -e "${RED}-------------------------------------------------------------${NC}"
echo -e "${RED} INSTRUCTIONS TO ESCAPE:${NC}"
echo -e "1. Click 'Contact Support' button."
echo -e "2. Wait for Thunderbird to open."
echo -e "3. Go to Menu -> Help -> Troubleshooting Information."
echo -e "4. Click 'Open Directory' next to Profile Directory."
echo -e "5. In the file manager, Right Click -> Open Terminal Here."
echo -e "${RED}-------------------------------------------------------------${NC}"
echo -e "To EXIT this demo: Use Alt+F4 (if not blocked) or switch TTYs (Ctrl+Alt+F2) to kill chromium."
echo -e "${BLUE}-------------------------------------------------------------${NC}"

sleep 5

# Using --no-first-run and --no-default-browser-check to reduce noise
chromium-browser --kiosk --no-first-run --no-default-browser-check "file:///tmp/kiosk_demo.html" &

echo -e "${GREEN}[+] Kiosk launched (PID: $!).${NC}"
