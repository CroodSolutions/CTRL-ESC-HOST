## Background on our ChromeOS Kiosk Testing (so far)

In our testing experience so far, properly set up ChromeOS kiosks configured with Chrome Enterprise Enrollment are quite secure, when compared to the average of Windows Kiosks.

When attacking ChromeOS Kiosks, we have had success in two types of scenarios:

 - The first is when policies allow for some keyboard shortcuts, and the default Enterprise Enrollment (Device Registration) policy is less secure than the specific kiosk policy that is applied (escape to default policy).
 - Second we have noticed cases where the application itself, running on ChromeOS has security flaws that can be exploited.

Most ChromeOS signage kiosks or Chromebooks have a restrictions on entering the device bios even upon reboot, although others have written of multiple hardware hacking approaches to this, apparently sometimes as simple as removing a Write Protect control screw.  

So far, we have not found much in the way of flaws in ChromeOS allowing for native escape and takeover when properly configured. Here are a few reasons we suspect this is the case: 

 - ChromeOS allows for fewer things to install and run, and has less in the way of default programs and attack surface than Windows or even MacOS.
 - It seems to have been designed with kiosks and low-trust (student) scenarios in mind.
 - Every high-schooler in America has been trying to mess with these things for years now.  Lol
 - Manipulating things at boot sequence phase is well protected, with a few exceptions.

It is worth noting that I have been able to crash ChromeOS kioks producing a WSOD / White Screen of Death, causing these devices to become unresponsive until rebooted. While I would consider this DOS tactic less than useless, we continue to experiment, looking for ways to manipulate such a crash to escape kiosk mode.  

## Specific Testing Scenarios

We have two primary real-world testing scenarios to share, representing scenarios we think you may also find when penetration testing ChromeOS kiosks:

 - Misconfigured Default Enterprise Enrollment template, Allowing Escape via Powerwash
 - Hijack Signage Template via Unregister and then Reregister an Attacker Controlled Account

These two specific scenarios, underscore the more generic concept, of there being a few types of layers to attack ChromeOS Kiosks:
 - Attack the application running (as kiosk): Can be easy.
 - Attack weaknesses in the implementation, administration, or setup: Can be easy.
 - Attack ChromeOS itself: Seems to be difficult 

## General Things to Try for ChromeOS

We have compiled a quick-reference of ChromeOS keyboard shortcuts and things you can try when testing ChromeOS kiosks. Some of these are from general research and may include internet-suggested keyboard shortcuts that we have never actually seen work, but it is easy enough to try them anyway.  

- [Generic ChromeOS Kiosk Test Cases](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/3%20-%20Chrome%20Kiosk%20Mode/ChromeOS%20Generic%20Testing%20Resources.md)

## Legal and Ethical Reminder 

Only test on your kiosks or with permission such as part of a penetration test or bug bounty, in accordance with all applicable laws and ethical standards.
