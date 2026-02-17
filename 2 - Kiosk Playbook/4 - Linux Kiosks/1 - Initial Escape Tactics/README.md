This directory collects initial escape tactics and supporting resources for testing kiosk-to-host breakout paths on Linux.

## Resources

- `prepare-kiosk.sh`: Environment setup script that installs required packages, configures protocol handlers, and optionally adds autostart entries. Built for `Protocol-Handler-Escape`, but reusable for other scenarios that need a consistent kiosk baseline.
- `airline_kiosk.html`: SkyLine Premium Kiosk demo UI. A full-screen HTML kiosk app with embedded escape triggers; originally authored for `Protocol-Handler-Escape`, but can serve as a generic test surface for other scenarios.

## prepare-kiosk.sh Optional Hardening Flags

- `--disable-super-key`: Disables the GNOME Super key Activities overlay (`org.gnome.mutter overlay-key`).
- `--enable-gdm-autologin`: Updates `/etc/gdm/custom.conf` so `[daemon]` includes:
  - `AutomaticLoginEnable=True`
  - `AutomaticLogin=kiosk`
- `--additioal-chorme` (alias: `--additional-chrome`): For Chrome/Chromium launches, adds:
  - `--noerrdialogs`
  - `--disable-infobars`
  - `--no-first-run`
  - `--enable-features=OverlayScrollbar`
  - `--start-maximized`
- `--global-shortcut-lockdown`: Adds GNOME global overrides for common kiosk escape shortcuts (for example `Ctrl+W`, `Ctrl+T`, `Ctrl+N`, `Super+D`, `Super+S`) and disables selected WM/Shell shortcuts such as close/minimize/show-desktop/workspace switching.
- `--help` / `--helper`: Show script usage.

These are optional features. Existing kiosk setup behavior remains unchanged unless you opt in.
When you run `--kioskmode off` (or choose Remove/Disable Kiosk), the script now also performs best-effort cleanup for optional hardening changes.

## Notes

- The `Protocol-Handler-Escape/` directory contains a full walkthrough and rationale for the protocol-handler tactic and references the shared resources above.

## Reuse Across Scenarios

- Use `prepare-kiosk.sh` as a baseline to standardize kiosk OS configuration before testing other escape chains (e.g., alternate protocol handlers, file viewer pivots, or browser-to-app handoffs).
- Use `airline_kiosk.html` as a repeatable UI harness to embed new triggers and test flows without rebuilding a full kiosk frontend each time.
