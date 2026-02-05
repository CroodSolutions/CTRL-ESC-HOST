#!/bin/bash
# prepare-kiosk.sh - Setup Firefox kiosk mode for escape demonstration

set -e

# Detect shell configuration file (zsh or bash)
SHELL_RC="$HOME/.bashrc"
[[ "$SHELL" == */zsh ]] && SHELL_RC="$HOME/.zshrc"

KIOSK_FILE="$(pwd)/airline_kiosk.html"

enable_kiosk() {
    echo "Enabling Kiosk Mode Persistence..."
    
    # Backup existing configuration
    cp "$SHELL_RC" "${SHELL_RC}.bak"
    echo "    Backup created at ${SHELL_RC}.bak"

    # Add auto-launch command if not present
    if grep -q "firefox --kiosk" "$SHELL_RC"; then
        echo "    [!] Kiosk mode seems to be already configured in $(basename "$SHELL_RC")"
    else
        # Append kiosk launch logic
        {
            echo ""
            echo "# --- KIOSK MODE START ---"
            echo "# Auto-launch Firefox in Kiosk mode (Added: $(date))"
            echo "if [ -z \"\$SSH_CONNECTION\" ]; then"
            echo "    # Launch only on local sessions, allow SSH bypass"
            echo "    firefox --kiosk \"file://$KIOSK_FILE\""
            echo "fi"
            echo "# --- KIOSK MODE END ---"
        } >> "$SHELL_RC"

        echo "    [+] $SHELL_RC updated."
        echo "    [+] Kiosk mode will start on next login."
    fi
}

disable_kiosk() {
    echo "Disabling Kiosk Mode Persistence..."
    if grep -q "# --- KIOSK MODE START ---" "$SHELL_RC"; then
        # Remove the block using sed
        # Detect OS for sed -i compatibility (Linux vs BSD/Mac) - though script checks for apt so likely Linux
        sed -i '/# --- KIOSK MODE START ---/,/# --- KIOSK MODE END ---/d' "$SHELL_RC"
        echo "    [+] Removed Kiosk mode configuration from $SHELL_RC"
    else
        echo "    [!] Kiosk mode configuration not found in $SHELL_RC"
    fi
}

# Handle Arguments
if [[ "$1" == "--kioskmode" ]]; then
    if [[ "$2" == "off" ]]; then
        disable_kiosk
        exit 0
    fi
    # If "on", we continue to dependency checks
    if [[ "$2" != "on" ]]; then
        echo "Usage: $0 [--kioskmode on|off]"
        exit 1
    fi
fi

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

# If non-interactive mode "on" was selected
if [[ "$1" == "--kioskmode" && "$2" == "on" ]]; then
    enable_kiosk
    exit 0
fi

# Interactive Menu
echo "----------------------------------------------------------------"
echo "Select Kiosk Mode Configuration:"
echo "1) Standard (Dependencies only)"
echo "   - You must launch the kiosk manually."
echo "   - Command: firefox --kiosk file://$(pwd)/airline_kiosk.html"
echo ""
echo "2) Full Persistence (Updates shell config)"
echo "   - Automatically launches Kiosk on every login."
echo "   - LOCKS THE USER into the Firefox application."
echo "   - Ideal for testing true breakout scenarios."
echo "----------------------------------------------------------------"
read -p "Choose an option [1/2]: " choice

if [ "$choice" == "2" ]; then
    echo ""
    echo "[!] CRITICAL WARNING [!]"
    echo "You are about to modify your shell configuration to auto-start Firefox."
    echo "This means every time you login, you will be trapped in the kiosk."
    echo "Ensure you have a way to revert this (e.g., SSH access, root user)."
    echo ""
    read -p "Are you absolutely sure? (type 'yes' to confirm): " confirm

    if [ "$confirm" == "yes" ]; then
        enable_kiosk
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
