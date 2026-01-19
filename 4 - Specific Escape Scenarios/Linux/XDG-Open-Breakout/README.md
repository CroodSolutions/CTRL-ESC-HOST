# XDG-Open & Default Handler Breakouts

[![Watch the Demo](https://img.youtube.com/vi/PLACEHOLDER/maxresdefault.jpg)](LINK_TO_VIDEO_HERE)
*Video Demonstration: Escaping a Hardened Chromium Kiosk via Mailto Protocol Handlers.*

## The "Why": Window Manager vs. Process Isolation

To understand this vulnerability, it is crucial to distinguish between how "Kiosk Mode" is implemented on Windows versus Linux.

*   **Windows (Assigned Access):** Often relies on deep OS-level integration where the Shell itself is replaced. New processes are often spawned inside the same restricted container or are blocked entirely by AppLocker/WDAC policies.
*   **Linux (Chromium --kiosk):** "Kiosk mode" here is typically a **Window Manager** constraint combined with a browser flag. The browser requests to be full-screen and the Window Manager (like Openbox, i3, or GNOME Shell) obliges.

**The Failure Mechanism:**
The vulnerability lies in the interaction between the browser and the underlying OS via the `xdg-open` protocol (or DBus).
1.  A user clicks a scheme-specific link, such as `mailto:contact@support.com`.
2.  Chromium sees `mailto:`, which it does not handle internally.
3.  Chromium hands the request off to the OS via `xdg-open`.
4.  The OS checks the registered MIME handler for `x-scheme-handler/mailto` (usually **Thunderbird** or **Evolution**).
5.  **CRITICAL:** The OS launches the mail client as a **new, unconstrained process**.
6.  This new application (Thunderbird) is NOT bound by the browser's kiosk flags. It spawns its own window, often with a title bar, menu bar, and—most importantly—file system access capabilities.

From this new unconstrained window, the attacker can leverage standard "Living off the Land" features (like "Open File" or "Help" menus) to traverse the file system and launch a terminal.

## Quick Mitigation

The most effective defense is to minimize the attack surface by removing the tools that facilitate the jump.

1.  **Remove Protocol Handlers:** Uninstall unnecessary mail clients or other default handlers.
    ```bash
    sudo apt remove thunderbird evolution
    ```
2.  **Restrict xdg-utils:** If possible, remove or restrict `xdg-open` if the kiosk application does not require it.
3.  **Remap Handlers:** Force `mailto` and other schemes to open harmless applications or remain handled within the web app context (if supported).
