#!/bin/bash

# Setup for CityConnect Scenario
# Locate the HTML file relative to this script
DIR="$(dirname "$(realpath "$0")")"
TARGET_HTML="$DIR/city_connect.html"

# 1. Dependency Check
echo "[*] Checking dependencies..."
if ! command -v totem &> /dev/null; then
    echo "[!] WARNING: 'totem' (GNOME Videos) is not installed."
    echo "    The exploit requires a handler for rtsp://. Install it with: sudo apt install totem"
fi
if ! command -v chromium-browser &> /dev/null; then
    echo "[!] WARNING: 'chromium-browser' is not installed. Script might fail to launch kiosk."
fi

# 2. Verify Target Page Exists
if [ ! -f "$TARGET_HTML" ]; then
    echo "[!] Error: Target HTML file not found at: $TARGET_HTML"
    exit 1
fi

# 3. Launch the Scenario
echo "[*] Launching CityConnect Kiosk..."
# Using a temp user-data-dir to ensure no previous session restoration and clean state
chromium-browser --kiosk --no-first-run --user-data-dir=$(mktemp -d) "file://$TARGET_HTML" &>/dev/null &

echo "[+] Kiosk launched. PID: $!"
echo "[+] Click the 'WATCH COUNCIL MEETING LIVE' button to trigger the exploit."
