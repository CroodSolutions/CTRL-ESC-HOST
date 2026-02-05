#!/bin/bash
# prepare-kiosk.sh - Setup Firefox kiosk mode for escape demonstration
# Updated to use XDG Desktop Entries instead of shell hooks

set -e

# Configuration
KIOSK_HTML="$(pwd)/airline_kiosk.html"
DESKTOP_FILE_NAME="skyline-kiosk.desktop"
AUTOSTART_DIR="$HOME/.config/autostart"
APP_DIR="$HOME/.local/share/applications"
DESKTOP_DIR="$HOME/Desktop"

# --- HELPER FUNCTIONS ---

cleanup_legacy_config() {
    # Check for and remove legacy .bashrc/.zshrc modifications that cause crashes
    for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
        if [ -f "$rc" ]; then
            if grep -q "# --- KIOSK MODE START ---" "$rc"; then
                echo "    [!] Cleaning up legacy configuration from $(basename "$rc")..."
                # Create backup
                cp "$rc" "${rc}.bak_pre_kiosk_cleanup"
                # Remove the block
                sed -i '/# --- KIOSK MODE START ---/,/# --- KIOSK MODE END ---/d' "$rc"
                echo "    [+] Removed legacy Kiosk block from $rc"
            fi
        fi
    done
}

generate_desktop_entry() {
    local output_path="$1"
    
    cat <<EOF > "$output_path"
[Desktop Entry]
Version=1.0
Type=Application
Name=SkyLine Kiosk
Comment=Launch the Airline Escape Kiosk
Exec=firefox --kiosk "file://$KIOSK_HTML"
Icon=firefox
Terminal=false
StartupNotify=false
X-GNOME-Autostart-enabled=true
EOF
    
    chmod +x "$output_path"
}

setup_manual_launcher() {
    echo "Setting up Manual Launcher..."
    cleanup_legacy_config

    # 1. Add to Applications Menu
    mkdir -p "$APP_DIR"
    generate_desktop_entry "$APP_DIR/$DESKTOP_FILE_NAME"
    echo "    [+] Added to Applications Menu: $APP_DIR/$DESKTOP_FILE_NAME"

    # 2. Add to Desktop (if exists)
    if [ -d "$DESKTOP_DIR" ]; then
        generate_desktop_entry "$DESKTOP_DIR/$DESKTOP_FILE_NAME"
        echo "    [+] Added to Desktop: $DESKTOP_DIR/$DESKTOP_FILE_NAME"
        
        # GNOME specific: Allow launching
        if command -v gio &> /dev/null; then
            gio set "$DESKTOP_DIR/$DESKTOP_FILE_NAME" metadata::trusted true 2>/dev/null || true
        fi
    fi
    
    # 3. Clean up autostart if it exists (switch mode)
    if [ -f "$AUTOSTART_DIR/$DESKTOP_FILE_NAME" ]; then
        rm "$AUTOSTART_DIR/$DESKTOP_FILE_NAME"
        echo "    [-] Removed existing Autostart entry (switched to Manual)"
    fi
}

setup_autostart_launcher() {
    echo "Setting up Autostart Persistence..."
    cleanup_legacy_config
    
    # Ensure directory exists
    mkdir -p "$AUTOSTART_DIR"
    
    # Generate Entry
    generate_desktop_entry "$AUTOSTART_DIR/$DESKTOP_FILE_NAME"
    
    echo "    [+] Created Autostart Entry: $AUTOSTART_DIR/$DESKTOP_FILE_NAME"
    echo "    [+] Kiosk will launch automatically on next login."
}

disable_kiosk() {
    echo "Disabling Kiosk Mode..."
    cleanup_legacy_config
    
    if [ -f "$AUTOSTART_DIR/$DESKTOP_FILE_NAME" ]; then
        rm "$AUTOSTART_DIR/$DESKTOP_FILE_NAME"
        echo "    [-] Removed Autostart entry."
    else
        echo "    [!] No Autostart entry found."
    fi
}

check_dependencies() {
    echo "[1/4] Checking Firefox installation..."
    if ! command -v firefox &> /dev/null; then
        echo "    Installing Firefox..."
        sudo apt update && sudo apt install -y firefox
    else
        echo "    Firefox already installed"
    fi

    echo ""
    echo "[2/4] Checking Thunderbird installation..."
    if ! command -v thunderbird &> /dev/null; then
        echo "    Installing Thunderbird..."
        sudo apt install -y thunderbird
    else
        echo "    Thunderbird already installed"
    fi

    echo ""
    echo "[3/4] Verifying xdg-open..."
    if ! command -v xdg-open &> /dev/null; then
        echo "    Installing xdg-utils..."
        sudo apt install -y xdg-utils
    fi

    echo ""
    echo "[4/4] Configuring Mail Handler..."
    # Check if thunderbird is default mail handler
    MAILTO_HANDLER=$(xdg-mime query default x-scheme-handler/mailto 2>/dev/null || echo "none")
    if [[ "$MAILTO_HANDLER" != *thunderbird* ]]; then
        echo "    Setting Thunderbird as default mail client..."
        xdg-mime default thunderbird.desktop x-scheme-handler/mailto
    else
        echo "    Thunderbird is already the default mail handler"
    fi
}

# --- MAIN EXECUTION ---

# Handle Arguments
if [[ "$1" == "--kioskmode" ]]; then
    if [[ "$2" == "off" ]]; then
        disable_kiosk
        exit 0
    fi
    if [[ "$2" != "on" ]]; then
        echo "Usage: $0 [--kioskmode on|off]"
        exit 1
    fi
    # If "on", assume full persistence
    check_dependencies
    setup_autostart_launcher
    exit 0
fi

echo "================================"
echo "   Firefox Kiosk Setup Tool"
echo "================================"

# Verify OS
if ! command -v apt &> /dev/null; then
    echo "[!] This script is designed for Debian/Ubuntu systems"
    exit 1
fi

check_dependencies

echo ""
echo "----------------------------------------------------------------"
echo "Select Configuration Mode:"
echo "1) Manual Launcher (Recommended for Dev)"
echo "   - Adds 'SkyLine Kiosk' to your Desktop & App Menu."
echo "   - You must click to launch."
echo ""
echo "2) Full Persistence (Autostart)"
echo "   - Automatically launches Kiosk on every login."
echo "   - Uses ~/.config/autostart (Safe method)."
echo "   - To exit kiosk: Alt+F4"
echo ""
echo "3) Remove/Disable Kiosk"
echo "----------------------------------------------------------------"
read -p "Choose an option [1-3]: " choice

echo ""
case "$choice" in
    1)
        setup_manual_launcher
        echo ""
        echo "Done! Look for 'SkyLine Kiosk' on your desktop or menu."
        ;;
    2)
        setup_autostart_launcher
        echo ""
        echo "Done! The kiosk will start next time you log in."
        ;;
    3)
        disable_kiosk
        if [ -f "$DESKTOP_DIR/$DESKTOP_FILE_NAME" ]; then
            rm "$DESKTOP_DIR/$DESKTOP_FILE_NAME"
            echo "    [-] Removed Desktop shortcut."
        fi
        if [ -f "$APP_DIR/$DESKTOP_FILE_NAME" ]; then
            rm "$APP_DIR/$DESKTOP_FILE_NAME"
            echo "    [-] Removed Menu entry."
        fi
        echo "Done!"
        ;;
    *)
        echo "Invalid option."
        exit 1
        ;;
esac
