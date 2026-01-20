#!/bin/bash

# Setup for CityConnect Scenario
DIR="$(dirname "$(realpath "$0")")"
TARGET_HTML="$DIR/city_connect.html"
ASSETS_DIR="$DIR/assets"
MOCK_BIN_TARGET="$HOME/.local/bin/mock-totem"
MOCK_DESKTOP_TARGET="$HOME/.local/share/applications/mock-totem.desktop"
MIME_TYPE="x-scheme-handler/rtsp"

MODE="DEV"
if [[ "$1" == "--prod" ]]; then
    MODE="PROD"
fi

cleanup() {
    echo "[*] Cleaning up temporary handler..."
    xdg-mime default "" "$MIME_TYPE" 2>/dev/null
    rm -f "$MOCK_BIN_TARGET" "$MOCK_DESKTOP_TARGET"
    # Force update database
    update-desktop-database "$HOME/.local/share/applications" 2>/dev/null
    echo "[+] Cleanup complete."
}

install_handler() {
    echo "[*] Installing Mock Video Player handler..."
    mkdir -p "$HOME/.local/bin" "$HOME/.local/share/applications"
    
    # Copy and setup script
    cp "$ASSETS_DIR/mock-totem" "$MOCK_BIN_TARGET"
    chmod +x "$MOCK_BIN_TARGET"
    
    # Setup desktop file with correct path
    sed "s|PLACEHOLDER_PATH|$MOCK_BIN_TARGET|g" "$ASSETS_DIR/mock-totem.desktop" > "$MOCK_DESKTOP_TARGET"
    
    # Register handler
    xdg-mime default mock-totem.desktop "$MIME_TYPE"
    update-desktop-database "$HOME/.local/share/applications" 2>/dev/null
    echo "[+] Mock handler registered."
}

# 1. Handler Verification
RTSP_HANDLER=$(xdg-mime query default "$MIME_TYPE")

if [ -z "$RTSP_HANDLER" ]; then
    if [ "$MODE" == "PROD" ]; then
        echo "[PROD] No handler found. Installing Mock Player persistently..."
        install_handler
    else
        echo "[DEV] No handler found. Installing Mock Player temporarily..."
        install_handler
        trap cleanup EXIT
    fi
else
    echo "[+] RTSP is currently handled by: $RTSP_HANDLER"
    if [ "$MODE" == "PROD" ] && [[ "$RTSP_HANDLER" == *"mock-totem"* ]]; then
        echo "[PROD] Existing mock handler detected. Keeping it."
    fi
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
echo "[*] Launching CityConnect Kiosk (Mode: $MODE)..."

if [ "$MODE" == "PROD" ]; then
    # PROD: Full Kiosk, no cleanup
    chromium-browser --kiosk --no-first-run --user-data-dir=$(mktemp -d) "file://$TARGET_HTML" &>/dev/null &
    echo "[+] Kiosk launched in PRODUCTION mode."
else
    # DEV: Windowed, with cleanup trap
    chromium-browser --no-first-run --user-data-dir=$(mktemp -d) --app="file://$TARGET_HTML" &>/dev/null &
    echo "[+] Kiosk launched in DEV mode (Windowed)."
    echo "[i] Close the browser or press Ctrl+C to clean up temporary handlers."
    
    # Wait for browser to exit so trap works correctly
    wait $!
fi
