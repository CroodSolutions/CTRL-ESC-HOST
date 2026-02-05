## Lenovo Business Hardware Specific - MS Teams Smuggling Attack

This escape tactic is specific to Lenovo Think-series business devices, and is dependent on a keyboard shortcut that is specific to their bios, on devices over a certain (unknown) span of time. The exact span/scope of how many devices or what exact models have this keyboard shortcut, remains unkown; that said, it only takes a moment to test/verify this scenario.  

So what is the shortcut sequence? After a fresh reboot, you can hit Ctrl+Alt+Shift+Win+F11, to trigger a local Lenovo bios keyboard shortcut, which appears to call a hook to launch MS Teams. All this seems perfectly reasonable, except it launches MS Teams even when it is in Attended Access / Kiosk Mode, unless teams has been actually removed via specific host hardening efforts.  It is my opinion that most organizations take the default policies of Attended Access / Kiosk Mode, so there are probably a decent number of hosts this attack vector could work on.    

 - The test for this is simple and follows these basic steps:
 - Reboot the host (sometimes this can be trigged arbitrarily, but it always works on susceptible hosts right after reboot).
 - First thing, after kiosk mode comes up, press Ctrl+Alt+Shift+Win+F11 (a strange keyboard squelch should be heard).  
 - MS Teams should launch, if this attack vector/test was successful.
 - Sign in to MS Teams with your personal/test account on the kiosk via the app.
 - From another device you fully control, share a file via that is ftp.exe, renamed to test.txt in a MS Teams chat with, well, yourself.
 - Download the file, click to open in downloads, and rename to msedge.exe
 - Launch msedge.exe 
 - Try double click (should fail)
 - Type msedge.exe into browser bar and hit enter.  

From here, you should be able to use FTP to send PowerShell commands, as long as they are prepended with an exclamation mark. This could appear as a version of ftp in terminal that lets you add tabs as PowerShell or CMD, or it could be a simplifed shell where you need to interact with ftp directly.  

Note: This does not work on consumer Lenovo devices / only the Think series.  

Next move on to [3 - Post-Exploitation - Moving from Kiosk to Domain and-or Network](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/2%20-%20Kiosk%20Playbook/1%20-%20Win11%20Kiosk%20Mode%20-%20Attended%20Access/3%20-%20Post-Exploitation%20-%20Moving%20from%20Kiosk%20to%20Domain%20and-or%20Network)

Remember: Only test on your own kiosks and/or with proper written permission and following all appropriate laws and industry ethics / best practices.
