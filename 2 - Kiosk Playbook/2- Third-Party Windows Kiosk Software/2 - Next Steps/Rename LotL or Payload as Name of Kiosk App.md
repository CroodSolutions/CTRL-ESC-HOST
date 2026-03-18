 ## Rename LotL or Payload as Name of Kiosk App or Allowed Program

It was originally pointed out by John Hammond that you can simply rename a file to msedge.exe and it would get around Win11 Attended Access. It still works to this day, with a few caveats and nuances to when and where this works. This same type of approach can be effective against other types of kiosks as well, including third party kiosk solutions.

## Testing Instructions

Using a method such as downloading from the local file system via file:///C:/Windows/System32, or any of the file smuggling tactics shared here:
 - Obtain a LotL binary such as ftp.exe or cmd.exe (or custom payload)
 - Rename the file to msedge.exe 
 - Type msedge in the browser bar of any Windows Explorer dialog box and hit Enter, or double-click to launch (if one does not work, try the other)

Key point: Renaming the file to msedge.exe assumes that edge is the app the kiosk is running (or at least that it is allowed). If the kiosk runs another application, you can figure out and use the name of that kiosk application instead.

# Attended Access Update - Microsoft Fixed This, but Not Really  

Note that Microsoft fixed this issue, sort of, a little bit (or at least they tried); insofar as, it no longer works in Win11 Attended Access directly from the File Open menu. 

However, this tactic does still work if fine you simply place the executable renamed to msedge.exe in a zip folder and run it from there. This breaks some LotL binaries, but many such as Ftp.exe and PowerShell_ISE.exe work just fine running out of an archive (renamed) in downloads. There are a few ways to get an archive file to put your executable in:

 - Right click in Preview Pane and select Send to / Compressed (zipped) folder
 - Paste in your executable
 - Type msedge in the browser bar and hit enter

The executable will still run for Attended Access as of March 2026 updates, as long as you run it from an archive. Note that there are a few different methods of adding the payload to a zip file and running from there. 

## Defensive Recommendations 

Here are a few things you can do to make yourself more resilient against this tactic:
 - Proper Application Control: Restrictions based on file names are not enough!
 - Custom IOAs in your EDR for launching LotL payloads out of Downloads or subfolders therein.
 - Custom IOA for exe running out of an archive.  


## Ethical Note

Remember to only test on your own kiosks, or with permission such as in the scope of a bug bounty or penetration test, with good intentions of helping elevate kiosk security.  
