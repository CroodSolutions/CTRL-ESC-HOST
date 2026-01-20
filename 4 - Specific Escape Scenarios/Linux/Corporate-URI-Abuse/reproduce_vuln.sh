#!/bin/bash

# Setup for CityConnect Scenario
DIR="$(dirname "$(realpath "$0")")"
TARGET_HTML="$DIR/city_connect.html"
SETUP_SCRIPT="$DIR/setup_handlers.sh"

# 1. Handler Verification
echo "[*] Verifying RTSP handler..."
RTSP_HANDLER=$(xdg-mime query default x-scheme-handler/rtsp)

if [ -z "$RTSP_HANDLER" ]; then
    echo "[!] No default handler found for rtsp://"
    echo "[*] Running setup script to register Mock Player..."
    if [ -f "$SETUP_SCRIPT" ]; then
        "$SETUP_SCRIPT"
    else
        echo "[!] Error: setup_handlers.sh not found."
        exit 1
    fi
else
    echo "[+] RTSP is currently handled by: $RTSP_HANDLER"
fi

# 2. Browser Check
if ! command -v chromium-browser &> /dev/null; then
    echo "[!] WARNING: 'chromium-browser' is not installed."
fi

# 3. Verify Target Page Exists
if [ ! -f "$TARGET_HTML" ]; then
    echo "[!] Error: Target HTML file not found at: $TARGET_HTML"
    exit 1
fi

# 4. Launch the Scenario
echo "[*] Launching CityConnect Kiosk..."
# Using a temp user-data-dir to ensure no previous session restoration and clean state
chromium-browser --kiosk --no-first-run --user-data-dir=$(mktemp -d) "file://$TARGET_HTML" &>/dev/null &

echo "[+] Kiosk launched. PID: $!"
echo "[+] Click the 'WATCH COUNCIL MEETING LIVE' button to trigger the exploit."
