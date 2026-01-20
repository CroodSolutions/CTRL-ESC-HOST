#!/bin/bash

# Setup for CityConnect Scenario
TARGET_HTML="$HOME/city_connect.html"
DIR="$(dirname "$0")"

# 1. Dependency Check
echo "[*] Checking dependencies..."
if ! command -v totem &> /dev/null; then
    echo "[!] WARNING: 'totem' (GNOME Videos) is not installed."
    echo "    The exploit requires a handler for rtsp://. Install it with: sudo apt install totem"
fi
if ! command -v chromium-browser &> /dev/null; then
    echo "[!] WARNING: 'chromium-browser' is not installed. Script might fail to launch kiosk."
fi

# 2. Generate the Target Page
# Execute the generator script located in the same directory
if [ -f "$DIR/generate_site.sh" ]; then
    "$DIR/generate_site.sh"
else
    echo "[!] Error: generate_site.sh not found in $DIR"
    exit 1
fi

# 3. Launch the Scenario
echo "[*] Launching CityConnect Kiosk..."
# Using a temp user-data-dir to ensure no previous session restoration and clean state
chromium-browser --kiosk --no-first-run --user-data-dir=$(mktemp -d) "file://$TARGET_HTML" &>/dev/null &

echo "[+] Kiosk launched. PID: $!"
echo "[+] Click the 'WATCH COUNCIL MEETING LIVE' button to trigger the exploit."
