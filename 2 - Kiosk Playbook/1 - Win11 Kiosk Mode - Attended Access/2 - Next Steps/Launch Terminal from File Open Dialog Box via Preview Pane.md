## Launch Terminal from File Open Dialog Box via Preview Pane

It is possible to launch a terminal from the Preview Pane of the File Open dialog box, via right clicking twice.  

## Testing Instructions

Make sure “Select a file to preview” / preview pane is visible, and click to show it, if not.
 - Right click in the preview area, and then click away.
 - Right click a second time in the preview area. 
 - Select “Open in Terminal”

Note, if the double right click option to launch a terminal is unavailable due to host hardening/policies, attempt:
 - [LotL USB Smuggling Attack](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/1%20-%20Win11%20Kiosk%20Mode%20-%20Attended%20Access/1%20-%20Initial%20Escape%20Tactics/LotL%20USB%20Smuggling%20Attack.md)
 - [Download LotL Binaries via Browser](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/1%20-%20Win11%20Kiosk%20Mode%20-%20Attended%20Access/2%20-%20Next%20Steps/Download%20LotL%20Binaries%20via%20Browser%20from%20Local%20Host.md)

Then, attempt the Rename LotL or Payload as Msedge to launch.  

## Next Steps

From here proceed to [3 - Post-Exploitation - Moving from Kiosk to Domain and-or Network](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/2%20-%20Kiosk%20Playbook/1%20-%20Win11%20Kiosk%20Mode%20-%20Attended%20Access/3%20-%20Post-Exploitation%20-%20Moving%20from%20Kiosk%20to%20Domain%20and-or%20Network)

## Defensive Recommendations 

Here are a few things you can do to make yourself more resilient against this tactic:

 - Microsoft should patch this / should not be this easy to launch Terminal in Attended Access Kiosk mode.
 - Disable or remove Terminal from kiosks.
 - See hardening scripts by Jordan Mastel in the defensive portion of this repo.  

## Ethical Note

Remember to only test on your own kiosks, or with permission such as in the scope of a bug bounty or penetration test, with good intentions of helping elevate kiosk security.  
