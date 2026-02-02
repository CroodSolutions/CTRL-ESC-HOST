# Firefox Kiosk Breakout: External Application Escape

## Overview

A demonstration of escaping a Firefox kiosk-mode browser through external application handlers. This repository contains two scenarios: a basic public services portal and a more complex, realistic airline kiosk.

**Attack Chain:**
1. **Firefox Kiosk** → User clicks a `mailto:` or `tel:` link.
2. **External Handler** → OS opens the link in an unconstrained external application (e.g., Thunderbird, Dialer, or Zoom).
3. **Application Escape** → The external application allows access to system tools, help menus, or file browsers.
4. **System Access** → Full OS access or shell execution is achieved.

## The Vulnerability

Firefox kiosk mode (`--kiosk` flag) locks down the browser UI but still respects external protocol handlers via `xdg-open`. When a protocol link is clicked:

1. Firefox delegates the request to the OS.
2. OS launches the registered application as a new process.
3. The application spawns in an **unconstrained window** (not bound by the browser's kiosk constraints).
4. Full OS integration (file manager, help menus, terminal) becomes available through the external application's features.

## Files

- `prepare-kiosk.sh` - Sets up Firefox kiosk mode and dependencies.
- `escape.html` - Basic interactive demo page with `mailto:` triggers.
- `airline_kiosk.html` - A polished, high-fidelity demo of an airline check-in kiosk with integrated corporate support and membership features.

## Demo Scenarios

### 1. Basic Portal (`escape.html`)
A simple municipal services portal. Use the red email buttons to trigger the protocol handler.

### 2. SkyLine Premium Kiosk (`airline_kiosk.html`)
A realistic airline kiosk experience.
- **Escape Route:** Navigate to `Assistance` -> `Digital Support` (or "Visit Support Center") -> `Contact`. Clicking the hyperlinked phone numbers or emails will trigger external handlers.
- **Features:** Interactive numpad, baggage weighing simulation, and membership rewards splash screen.

## Quick Start

```bash
./prepare-kiosk.sh

# To run the basic demo:
firefox --kiosk file://$(pwd)/escape.html

# To run the airline kiosk demo:
firefox --kiosk file://$(pwd)/airline_kiosk.html
```

## Mitigation

- **Disable Protocol Handlers:** Configure Firefox to ignore external protocols via `about:config` (e.g., `network.protocol-handler.external.mailto`).
- **Minimal Environment:** Uninstall unnecessary applications like Thunderbird: `sudo apt remove thunderbird`.
- **Remove xdg-open:** `sudo apt remove xdg-utils` (if the kiosk doesn't need external handlers).
- **Hardened Kiosk OS:** Use a dedicated kiosk OS with process sandboxing (Windows Assigned Access, Chrome OS).

## Educational Purpose

This demonstrates why "kiosk mode" ≠ "security boundary" on Linux systems. Effective kiosk security requires controlling the entire process lifecycle and OS integration, not just the browser UI.