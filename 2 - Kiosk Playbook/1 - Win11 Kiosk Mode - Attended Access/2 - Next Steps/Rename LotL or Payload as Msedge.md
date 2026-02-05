## Rename LotL or Payload as Msedge

It was pointed out by John Hammond a few years back, among other issues, that it was possible to rename another LotL binary such as cmd.exe to msedge.exe and it would run providing a shell as an escape from kiosk mode. While this and several other issues he pointed out were resolved, it appears the fix is a bandaid.  

Using a prior tactic, such as downloading via file:///C:/Windows/System32, staging at a location reachable from the web browser, or smuggling via USB:
 - Obtain a LotL binary such as ftp.exe or cmd.exe (or custom payload)
 - Rename the file to msedge.exe 
 - Type msedge in the browser bar and hit Enter, or double-click to launch (if one does not work, try the other)

Note that this works with many, but not all LotL binaries (it is confirmed with cmd and ftp). It also worked with a custom payload we created as a compiled AutoIt script compiled and renamed as msedge.exe.  

From here proceed to [3 - Post-Exploitation - Moving from Kiosk to Domain and-or Network](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/2%20-%20Kiosk%20Playbook/1%20-%20Win11%20Kiosk%20Mode%20-%20Attended%20Access/3%20-%20Post-Exploitation%20-%20Moving%20from%20Kiosk%20to%20Domain%20and-or%20Network)

Remember: Only test on your own kiosks and/or with proper written permission and following all appropriate laws and industry ethics / best practices
