#!/bin/bash

# Configuration
MOCK_BIN="$HOME/.local/bin/mock-totem"
DESKTOP_FILE="$HOME/.local/share/applications/mock-totem.desktop"
MIME_TYPE="x-scheme-handler/rtsp"

# Ensure directories exist
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/share/applications"

# 1. Create the Mock Application (Script)
echo "[*] Creating mock video player at $MOCK_BIN..."
cat > "$MOCK_BIN" << 'SCRIPT'
#!/bin/bash
# Simulates a video player attempting to open a stream
# This represents the "Totem" window that opens over the Kiosk

if command -v zenity &> /dev/null; then
    zenity --info \
        --title="Mock Video Player" \
        --text="<b>Connecting to RTSP Stream...</b>\n\n(This represents the 'Totem' player launching)\n\nIn a real attack, you would now use this window's\n'Open File' dialog to break out." \
        --width=400
else
    xterm -e "echo 'Mock Video Player Launched'; echo 'Press Enter to close...'; read"
fi
SCRIPT
chmod +x "$MOCK_BIN"

# 2. Create the Desktop Entry
echo "[*] Creating .desktop file at $DESKTOP_FILE..."
cat > "$DESKTOP_FILE" << DESKTOP
[Desktop Entry]
Name=Mock Video Player
Exec=$HOME/.local/bin/mock-totem %u
Type=Application
Terminal=false
MimeType=x-scheme-handler/rtsp;
NoDisplay=true
DESKTOP

# 3. Register the Handler
echo "[*] Registering 'rtsp://' handler..."
xdg-mime default mock-totem.desktop "$MIME_TYPE"

# Verify
CURRENT=$(xdg-mime query default "$MIME_TYPE")
echo "[+] Handler for $MIME_TYPE is now: $CURRENT"
