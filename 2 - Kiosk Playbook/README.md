# Kiosk Hacking Playbook

The first step of kiosk hacking is to figure out what kind of kiosk you are testing. Often there is a vendor or product name displayed somewhere on the software, or even a product version usually shown on a banner near the top or the bottom. Sometimes the version numbers alone are specific enough to pull up the actual product directly, especially if you include mention of what type of product you are looking at when querying your favorite AI or search tool.

## Identification & OSINT

Once you have an idea what product you are dealing with, there is almost always some sort of online documentation that can help you learn and understand the product you are testing. This will also steer your testing down particular pathways of this framework (or it may cause you to add new contributions to the framework for pathways not yet explored).

If all else fails, Jacob Steadman pointed out recently at his bSides Belfast talk that one good way to find out exactly what a kiosk device is running is to reboot it and watch the post and startup sequences. This is usually accomplished by just killing power to the kiosk/unplugging it. Of course, be mindful of the scope and rules of engagement for your testing prior to trying this. As a tester, you may have an upset customer if their production kiosk does not come up properly right before a prime window of activity.

## Common Kiosk Types

If it is just a web browser displaying a limited browsing context, such as a specific website for hotel/event check-in or test taking, or a signage kiosk – in our experience it tends to be either:

*   **Win11 Attended Access Kiosk / Single App Kiosk mode** with Edge.
*   **ChromeOS** running Chrome Enterprise Kiosk Mode.
*   **Linux-based Kiosks** (often running Ubuntu/GNOME).
*   **A regular system** with a browser or app in Fullscreen mode.

Yes – we actually see that last one, and far too often. In the scenario with an app or browser just running in full-screen mode, it could be any OS with a policy set to prevent screen lockout (easy to validate). For Chrome or Windows, it is usually easy to tell based upon the actual hardware, unless there is an enclosure that prevents visualization of the computer itself. We all know airport kiosks are running Windows because on 7/19/2024 the CrowdStrike outages caused numerous systems in airports to display a Windows BSOD.

## Proprietary Software & Linux Nuances

In fact, kiosks that are just a native OS running a proprietary application that applies its own kiosk restrictions (not in native/OS Kiosk mode) seem to be all too common. This is important because, in our experience, proprietary kiosk software running on Windows is far less secure than the native functionality built into the OS by large vendors.

### The Linux Container Gap
For Linux-based kiosks, a specific architectural weakness often exists known as the **"Container Gap"**. Even if the kiosk browser is strictly sandboxed (e.g., via Snap or Flatpak), it often relies on the host OS to handle external protocols like `mailto:` or `tel:`.
*   **The Pivot:** Clicking a "Contact Us" email link can trigger the OS to launch an external mail client (like Thunderbird).
*   **The Escape:** Because this secondary application launches in the user's context (outside the browser's sandbox), it can be used to traverse to a File Manager and launch a Terminal, effectively bypassing the kiosk entirely.

## Interaction & Attack Surface

A key aspect of kiosk testing is figuring out how you will interact with the kiosk.
*   Is the touchscreen the only attack surface you are afforded?
*   Can you connect a USB or Bluetooth keyboard/mouse, USB drive, USB Rubber Ducky, or even a second screen or other peripheral?
*   Can you connect it to a secondary network you control, and are there any exposed/running services you can interact with?

Sometimes a physical security component can enter into this type of testing, including lock-picking to gain access to locked enclosures. Again, make sure any written permission document you have received for testing calls this out specifically if you will be picking locks or using other methods to gain physical access to locked ports or hardware.

## Repository Structure

This playbook is organized into directories by Operating System and Vendor to guide your testing path:

*   **[`1 - Win11 Kiosk Mode`](./1%20-%20Win11%20Kiosk%20Mode%20-%20Attended%20Access)**: Focuses on Windows 11 Attended Access and Single App modes.
*   **[`2 - Third-Party Windows`](./2-%20Third-Party%20Windows%20Kiosk%20Software)**: Tactics for proprietary software running on top of Windows.
*   **[`3 - Chrome Kiosk Mode`](./3%20-%20Chrome%20Kiosk%20Mode)**: Escapes for ChromeOS and Enterprise Kiosk modes.
*   **[`4 - Linux Kiosks`](./4%20-%20Linux%20Kiosks)**: **(New)** Covers Linux-specific vectors like Protocol Handler Escapes and Environment configuration (`prepare-kiosk.sh`).
*   **5-7**: Android, iPad, and macOS Kiosk sections.

For the latest updates, visit the repository: [https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/2%20-%20Kiosk%20Playbook](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/2%20-%20Kiosk%20Playbook)

---
*Remember, only test on systems that are your systems, or where you have written permission as part of the scope of a penetration test or approved bug bounty program. Follow all ethical guidelines of ethical hacking and industry best practices that may apply to your testing scenario.*
