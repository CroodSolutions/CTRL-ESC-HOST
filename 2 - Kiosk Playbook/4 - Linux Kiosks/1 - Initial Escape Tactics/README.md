This directory collects initial escape tactics and supporting resources for testing kiosk-to-host breakout paths on Linux.

## Resources

- `prepare-kiosk.sh`: Environment setup script that installs required packages, configures protocol handlers, and optionally adds autostart entries. Built for `Protocol-Handler-Escape`, but reusable for other scenarios that need a consistent kiosk baseline.
- `airline_kiosk.html`: SkyLine Premium Kiosk demo UI. A full-screen HTML kiosk app with embedded escape triggers; originally authored for `Protocol-Handler-Escape`, but can serve as a generic test surface for other scenarios.

## Notes

- The `Protocol-Handler-Escape/` directory contains a full walkthrough and rationale for the protocol-handler tactic and references the shared resources above.

## Reuse Across Scenarios

- Use `prepare-kiosk.sh` as a baseline to standardize kiosk OS configuration before testing other escape chains (e.g., alternate protocol handlers, file viewer pivots, or browser-to-app handoffs).
- Use `airline_kiosk.html` as a repeatable UI harness to embed new triggers and test flows without rebuilding a full kiosk frontend each time.
