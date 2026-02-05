# Protocol Handler Kiosk Breakout: External Application Escape

## Overview

A demonstration of escaping a kiosk-mode browser through external application handlers. This strategy should work for any browser. Note that the kiosk mode for the framework to test with this uses the firefox browser's kiosk mode.

**Attack Chain:**
1. **Kiosk Browser** → User clicks a `mailto:` or `tel:` link.
2. **External Handler** → OS opens an unconstrained window (e.g., Thunderbird).
3. **Application Escape** → Access system tools or file browsers via the external app.
4. **System Access** → Full OS access or shell execution.

## Files

- `prepare-kiosk.sh` - Setup tool for dependencies and persistence.
- `airline_kiosk.html` - Polished airline check-in demo with integrated escape routes.

## Setup & Usage

The setup script handles Firefox/Thunderbird installation and configures the `mailto:` handler.

### 1. Configure the Environment
```bash
chmod +x prepare-kiosk.sh
./prepare-kiosk.sh
```
*   **Manual Mode:** Adds "SkyLine Kiosk" to your App Menu and Desktop.
*   **Persistence Mode:** Adds the kiosk to `~/.config/autostart` for launch on login.

### 2. Launch the Demo
If using Manual Mode, click the desktop icon. Otherwise, run:
```bash
# Launch Airline Kiosk
firefox --kiosk "file://$(pwd)/airline_kiosk.html"
```

## Demo Scenario: SkyLine Premium Kiosk

1.  **Enter the Portal:** Use any 6-digit ID (or `111111` to trigger a hidden file-upload diagnostic).
2.  **Trigger the Escape:** 
    *   Click **Assistance** (top left).
    *   Click **Digital Support** (bottom left).
    *   Navigate to the **Contact Support** card.
    *   Click the **Email** or **Phone** links to trigger `xdg-open` and launch Thunderbird.

## Mitigation

For detailed mitigation strategies regarding protocol handlers, please refer to [Protocol Handler Hardening](../../../../5%20-%20Defensive%20Recommendations/Protocol-Handler-Hardening.md).