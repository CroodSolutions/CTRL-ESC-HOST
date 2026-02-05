# Protocol Handler Mitigation

This document outlines strategies to prevent kiosk escapes via external protocol handlers (e.g., `mailto:`, `tel:`).

## Mitigation Strategies

-   **Disable Protocols:**
    -   In browsers like Firefox, configure protocol handling to prevent external applications from launching.
    -   Example: Set `network.protocol-handler.external.mailto` to `false` in `about:config`.

-   **Hardened Image:**
    -   Remove unnecessary application handlers and utilities from the underlying OS image.
    -   Example (Linux):
        ```bash
        sudo apt remove thunderbird xdg-utils
        ```

-   **Sandboxing:**
    -   Use a dedicated Kiosk OS or containerized environment (e.g., Ubuntu Frame, Windows Assigned Access) that restricts window management and shell access to prevent new windows from stealing focus or providing shell access.
