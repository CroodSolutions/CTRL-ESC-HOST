# Introduction to Escape-to-Host Flaws

Software is frequently deployed in low-trust contexts—such as kiosks or single-app environments—with the intention of constraining users to a specific set of functionality and preventing them from "escaping" to the underlying host system.

## Defining "Escape to Host"

In [MITRE ATT&CK](https://attack.mitre.org/), **Escape to Host** is primarily referenced as a Privilege Escalation tactic (escaping a VM or container to the running hypervisor). However, we believe the practical scope of this concept is much broader.

For the purposes of this project, "Escape to Host" includes:
*   Escaping a browser sandbox to interact with the host system.
*   Escaping a [kiosk](../2%20-%20Kiosk%20Playbook) to interact with the host system, network, or domain.
*   Escaping a "Presented Application" (e.g., Citrix Storefront, VMware Horizon).

## Scope & Methodology

While this project covers testing and protecting Presented Applications, we take a particular interest in **kiosks**. We argue that placing Escape to Host solely in the "Privilege Escalation" bucket does not properly represent the full scope and potential of these flaws. They often serve as key drivers for **Initial Access**, **Execution**, and **Credential Access**.

The key to escaping to the host is finding unintended or accidental functionality that bridges the low-trust context to a higher-trust one.
*   **Common Examples:** Dialog boxes like "Save As", "Open", or "Print".
*   **System Shortcuts:** Sticky Keys (Shift ×5) or `Win+A` (Settings gateway).
*   **Physical/UI Quirks:** Rogue swipes on touchscreens (e.g., exposing a Start Menu on a fast-food menu).

Some escapes are simple; others require considerable work to find an exact sequence of steps (or sometimes an escape exists, but it is limited and relatively low risk).

## Key Questions for Testing

When analyzing kiosks or presented apps, consider the following:
*   What privilege level does the software run with?
*   Is the host joined to a domain? (Map AD compromise paths).
*   What network is it on, and what else is on that network?
*   What credentials/accounts or other intel could be coerced from this system?

## Quick Reference: Common Escape Triggers

If you are just starting an assessment, these common keyboard shortcuts and interactions are often the first step in identifying a breakout path.

| Trigger / Action | Mechanism | Potential Outcome |
| :--- | :--- | :--- |
| **Shift (pressed 5 times)** | Sticky Keys | Opens a system dialog (Ease of Access) which may link to Help or Settings. |
| **Win + A** | Action Center | Opens the notification sidebar; look for "All Settings" or actionable notifications. |
| **Ctrl + P** | Print Dialog | If a printer is selectable, look for "Print to PDF" or "Properties" to spawn a file explorer. |
| **Ctrl + S** / **Ctrl + O** | Save / Open | Opens a native OS file explorer. Look for "Right Click" opportunities or typing paths like `C:\Windows\System32\cmd.exe`. |
| **F1** | Help Menu | Often opens a browser window or a Help Viewer with a search bar that can navigate to URLs. |
| **Edge Swipe** | Touch Gesture | Swiping from the right or left edge on a touchscreen may reveal the Action Center or Task View. |

## Where to Start?

Select the playbook below that matches your target environment:

*   **Windows Kiosk?** See [Win11 Kiosk Mode](../2%20-%20Kiosk%20Playbook/1%20-%20Win11%20Kiosk%20Mode%20-%20Attended%20Access) or [Third-Party Software](../2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software).
*   **ChromeOS?** See [Chrome Kiosk Mode](../2%20-%20Kiosk%20Playbook/3%20-%20Chrome%20Kiosk%20Mode).
*   **Citrix / VMware?** See the [Presented App Playbook](../3%20-%20Presented%20App%20Playbook).
*   **Linux?** See [Linux Kiosks](../2%20-%20Kiosk%20Playbook/4%20-%20Linux%20Kiosks).

---
*Note: Interestingly, a search for "kiosk" on the main MITRE ATT&CK page yields no results. We hope to help bridge this gap by highlighting these scenarios.*
