# Corporate URI Handler Abuse (RTSP to Totem)

[![Watch the Demo](https://img.youtube.com/vi/PLACEHOLDER/0.jpg)](https://www.youtube.com/watch?v=PLACEHOLDER)

## The Scenario: "CityConnect" Public Access Terminal

You are auditing a **Public Access Terminal** deployed in municipal buildings (libraries, city halls, transit centers). These kiosks are running the **"CityConnect"** interface, a web-based dashboard designed to provide citizens with government transparency and services.

Key features of this terminal include:
-   **Live Council Streams:** Citizens can watch real-time feeds of city council meetings.
-   **Sanitation Calendars:** Users can sync trash pickup schedules.
-   **Accessibility Tools:** Direct links to system help documentation.

While the web browser is locked down in Kiosk Mode (no address bar, no right-click, limited keyboard shortcuts), the underlying operating system relies on standard desktop associations to handle specialized content.

## The "Why": Plausible Deniability via Standard Protocols

The vulnerability relies on how desktop environments (like GNOME/Ubuntu) handle specific URI schemes (`scheme://`).

1.  **RTSP (Real-Time Streaming Protocol):** This is the industry standard for IP camera feeds and live broadcasts. It is technically distinct from HTTP/HTTPS.
2.  **Default Associations:** When a Linux browser (Chromium/Firefox) encounters an `rtsp://` link, it often does not have a built-in player capable of handling the stream natively. Instead, it queries the OS (via `xdg-open` logic) for the registered handler.
3.  **The Pivot:** On many standard builds (including Ubuntu Desktop), `rtsp://` is registered to **Totem (GNOME Videos)**.
4.  **The Escape:** Unlike the Kiosk-restricted browser, the invoked external application (Totem) is launched as a standard window with its full menu bar and capabilities intact. It is not "aware" it was launched from a restricted environment.

This allows an attacker to "pivot" from the constrained web environment into a fully featured desktop application, from which further filesystem access can be gained.
