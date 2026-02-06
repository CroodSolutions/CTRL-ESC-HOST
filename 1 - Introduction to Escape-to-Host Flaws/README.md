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

---
*Note: Interestingly, a search for "kiosk" on the main MITRE ATT&CK page yields no results. We hope to help bridge this gap by highlighting these scenarios.*
