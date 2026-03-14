## File Explorer Interaction Tips

There are some subtle nuances to how you can interact with File Open and File Save dialog boxes in Windows, to side-step certain restrictions or expose other options.

## Testing Instructions


 - When in various File Save or File Open dialog boxes, be sure to try both Right Click and Shift + Right Click, to sometimes unlock different menu options. This opens the classic Explorer Right Click menu options, vs. the newer options, exposing other options. 
 - If you are not in the type of File/Explorer dialog box you want but have the ability to add a New Folder, or sometimes other file types, try New Folder and then right click in the Preview Pane for this New Folder for other options.
 - Other file types under create new, could let you add an archive to drop an executable in (can sometimes bypass app restrictions) or even drop an empty text file, type or paste in a script, then change the file type and attempt to run.
 - It is said elsewhere, but until it is removed, the ability to just Right click (1-2 times) and expose the ability to open in Terminal or Powershell (depending on context) is just nuts.
 - Also, if you are trying to smuggle or launch something LotL and the normal stuff gets blocked, always try ftp.exe, and remember that newer versions of ftp.exe will let you add tabs to terminal, or all contexts will let you type !, followed by any PowerShell scripting you want to run.  

## Defensive Recommendations 

Here are a few things you can do to make yourself more resilient against this tactic:
 - Microsoft should really clean-up some of these things.
 - Removing Terminal and restricting File Open and File Save dialog boxes can go a long way. 
 - See hardening scripts by Jordan Mastel in the defensive portion of this repo, for some work arounds to reduce this type of attack surface. 

## Ethical Note

Remember to only test on your own kiosks, or with permission such as in the scope of a bug bounty or penetration test, with good intentions of helping elevate kiosk security.  

## Shoutout

Thanks again to [NotNordGaren](https://x.com/NotNordgaren) for the tips on FTP, as well as the power of Shift + Right Click to expose other menu options.  
