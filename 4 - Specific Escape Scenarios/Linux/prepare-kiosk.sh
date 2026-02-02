#!/bin/bash
# prepare-kiosk.sh - Setup Firefox kiosk mode for escape demonstration

set -e

echo "[+] Firefox Kiosk Breakout Setup"
echo "================================"

# Check if running on Ubuntu/Debian
if ! command -v apt &> /dev/null; then
    echo "[!] This script is designed for Debian/Ubuntu systems"
    exit 1
fi

echo ""
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

# Check if thunderbird is default mail handler
MAILTO_HANDLER=$(xdg-mime query default x-scheme-handler/mailto 2>/dev/null || echo "none")
if [[ "$MAILTO_HANDLER" != *thunderbird* ]]; then
    echo "    Setting Thunderbird as default mail client..."
    xdg-mime default thunderbird.desktop x-scheme-handler/mailto
fi

echo ""
echo "[4/4] Setup complete!"
echo ""

echo "----------------------------------------------------------------"
echo "Select Kiosk Mode Configuration:"
echo "1) Standard (Dependencies only)"
echo "   - You must launch the kiosk manually."
echo "   - Command: firefox --kiosk file://$(pwd)/airline_kiosk.html"
echo ""
echo "2) Full Persistence (Updates .bashrc)"
echo "   - Automatically launches Kiosk on every login."
echo "   - LOCKS THE USER into the Firefox application."
echo "   - Ideal for testing true breakout scenarios."
echo "----------------------------------------------------------------"
read -p "Choose an option [1/2]: " choice

if [ "$choice" == "2" ]; then
    echo ""
    echo "[!] CRITICAL WARNING [!]"
    echo "You are about to modify ~/.bashrc to auto-start Firefox in Kiosk mode."
    echo "This means every time you login, you will be trapped in the kiosk."
    echo "Ensure you have a way to revert this (e.g., SSH access, root user)."
    echo ""
    read -p "Are you absolutely sure? (type 'yes' to confirm): " confirm

    if [ "$confirm" == "yes" ]; then
        KIOSK_FILE="$(pwd)/airline_kiosk.html"
        
        # Backup bashrc
        cp ~/.bashrc ~/.bashrc.bak
        echo "    Backup created at ~/.bashrc.bak"

        # Check if already added
        if grep -q "firefox --kiosk" ~/.bashrc; then
            echo "    [!] Kiosk mode seems to be already configured in .bashrc"
        else
            echo "" >> ~/.bashrc
            echo "# --- KIOSK MODE START ---" >> ~/.bashrc
            echo "# Added by prepare-kiosk.sh on $(date)" >> ~/.bashrc
            echo "if [ -z \"\$SSH_CONNECTION\" ]; then" >> ~/.bashrc
            echo "    # Only run on local login, allow SSH to bypass" >> ~/.bashrc
            echo "    firefox --kiosk \"file://$KIOSK_FILE\"" >> ~/.bashrc
            echo "fi" >> ~/.bashrc
            echo "# --- KIOSK MODE END ---" >> ~/.bashrc
            echo "    [+] ~/.bashrc updated."
            echo "    [+] Kiosk mode will start on next login."
        fi
    else
        echo "    Aborted persistence setup."
    fi
else
    echo ""
    echo "To launch kiosk mode manually:"
    echo "  firefox --kiosk file://$(pwd)/airline_kiosk.html"
    echo ""
    echo "To kill Firefox kiosk if it locks up:"
    echo "  pkill firefox"
fi

echo ""
echo "[!] Security Warning: This creates a vulnerable kiosk environment"
echo "    Only run in isolated test environments"
