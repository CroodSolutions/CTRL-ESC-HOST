## Rename LotL or Payload as Msedge

It was pointed out by John Hammond a few years back, among other issues, that it was possible to rename another LotL binary such as cmd.exe to msedge.exe and it would run providing a shell as an escape from kiosk mode. While this and several other issues he pointed out were resolved, it appears the fix is a bandaid.  

## Testing Instructions 

Using a prior tactic, such as downloading via file:///C:/Windows/System32, staging at a location reachable from the web browser, or smuggling via USB:
 - Obtain a LotL binary such as ftp.exe or cmd.exe (or custom payload)
 - Rename the file to msedge.exe 
 - Type msedge in the browser bar and hit Enter, or double-click to launch (if one does not work, try the other)

Note that this works with many, but not all LotL binaries (it is confirmed with cmd and ftp). It also worked with a custom payload we created as a compiled AutoIt script compiled and renamed as msedge.exe.  

## Attended Access Update - Microsoft Fixed This, but Not Really  

Note that Microsoft fixed this issue, sort of, a little bit (or at least they tried); insofar as, it no longer works in Win11 Attended Access directly from the File Open menu. 

However, this tactic does still work if fine you simply place the executable renamed to msedge.exe in a zip folder and run it from there. This breaks some LotL binaries, but many such as Ftp.exe and PowerShell_ISE.exe work just fine running out of an archive (renamed) in downloads. There are a few ways to get an archive file to put your executable in:

 - Right click in Preview Pane and select Send to / Compressed (zipped) folder
 - Paste in your executable
 - Type msedge in the browser bar and hit enter

The executable will still run for Attended Access as of March 2026 updates, as long as you run it from an archive. Note that there are a few different methods of adding the payload to a zip file and running from there.  

## Next Steps

From here proceed to [3 - Post-Exploitation - Moving from Kiosk to Domain and-or Network](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/2%20-%20Kiosk%20Playbook/1%20-%20Win11%20Kiosk%20Mode%20-%20Attended%20Access/3%20-%20Post-Exploitation%20-%20Moving%20from%20Kiosk%20to%20Domain%20and-or%20Network)

## Ethical Note

Remember to only test on your own kiosks, or with permission such as in the scope of a bug bounty or penetration test, with good intentions of helping elevate kiosk security. 
