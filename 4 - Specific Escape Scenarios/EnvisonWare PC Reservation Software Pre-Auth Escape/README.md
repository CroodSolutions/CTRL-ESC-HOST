## Overview

Envisonware is one of the most popular library kiosk sofware products around, with what appears to be very wide adoption. A common (legacy) offering they have all over the place, is PC Reservation, which has both pre/post authentication escape pathways.  

Testing strategy: Find the devices, escape, and then see if on a senstive network or joined to an important domain (or a domain trusted by an important domain). In our experience, kiosks are a great way to teleport into a network or identity context, where an attacker is not expected to appear.  

## Findings with PC Reservation 

There were escape pathways, both pre-authentication and after signing into a kiosk.  

### Pre-Authentication Kiosk Hacking Flows

Here are the steps to escape to host on a PC Reservation host, without signing in as a valid library user:
 - Sticky Keys (Shift x5 times)
 - Win+L followed immediately by Win+K, to launch screen cast.
 - Click "+" to add more desktops.
 - Drag a desktop onto the main screen.
 - Engage with Windows and search for LotL binaries to run.
 - For example, at this stage, we were able to launch Powershell and Cmd, a few different ways (see Attended Access and 3rd Pary Windows sections).

Key points:  PC Reservation did lock out a lot of activities and options, so it is clear they are trying. 

Defensive Recommendations: See what Jordan added to the defensive recommendations / windows kiosk hardening tips section as a guide. 

