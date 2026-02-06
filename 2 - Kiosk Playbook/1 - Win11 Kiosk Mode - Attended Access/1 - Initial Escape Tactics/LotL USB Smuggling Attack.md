## LotL USB Smuggling Attack

This attack involves pre-staging a USB drive with a copy of ftp.exe renamed to msedge.exe, and requires a pre-condition of physical access to a USB or USB-C port.  

Here are the basic steps:
 - Format a USB and stage a copy of ftp.exe, renamed to msedge.exe
 - Plug in USB (if you are testing in a VM, be sure to map the USB to the VM).
 - Press Ctrl+O or Ctrl+S
 - Click in the file path area, and type the direct file path to your file, guessing the USB drive letter (e.g., D:\msedge.exe).
 - Once ftp.exe launches, you can use ! followed by PowerShell to run scripts.
 - Launch PowerShell.exe or Cmd.exe from here to gain full shell (in userland).   

While we tested this with ftp.exe, similar tests worked with other LotL binaries and even custom payloads, as long as renamed as msedge.exe (to be clear, some things are outright blocked and do not work for this USB Smuggling vector, but a lot of payloads will run). 

From here / in this flow, proceed to [3 - Post-Exploitation - Moving from Kiosk to Domain and-or Network](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/2%20-%20Kiosk%20Playbook/1%20-%20Win11%20Kiosk%20Mode%20-%20Attended%20Access/3%20-%20Post-Exploitation%20-%20Moving%20from%20Kiosk%20to%20Domain%20and-or%20Network)

Remember: Only test on your own kiosks and/or with proper written permission and following all appropriate laws and industry ethics / best practices.

Here is a short video demo of this tactic:  

https://youtu.be/XTlbUAwq7Iw?si=CoYh0p7sXuSEJ9xi 
