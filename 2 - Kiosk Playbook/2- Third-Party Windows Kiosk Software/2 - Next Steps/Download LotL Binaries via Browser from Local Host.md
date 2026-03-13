## Download LotL Binaries via Browser from Local Host

Once you have [unlocked an unrestricted browser](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/2%20-%20Next%20Steps/Escape%20to%20Less%20Restrictive%20Browser.md), one of the most direct pathways to having a shell / running LotL binaries on the host, is to download those files via the browser and run them out of the downloads folder.  

## Testing Instructions

This test simply involves typing a local filepath into the browser bar, with the prefix of file:/// at the beginning.

Here are the basic steps to test:

 - Type a filepath in the browser bar, such as file:///C:/Windows/System32/cmd.exe
 - It will then proceed to download the local file via the browser to downloads, if not blocked.
 - Click the folder icon to open the downloads folder.

A couple key things to note:

 - The browser may warn you multiple times about downloading an executable, but if you keep clicking to keep and proceed, it works eventually (unless blocked).
 - Sometimes when InTune policy or other restrictions tell you the download failed in the browser, it will actually still be there, in the downloads folder.
 - Remember that some views, such as Ctrl+S for file save or Graphic Settings/Add desktop app, produce a File Open dialog that limits what type of file types it will show you.
 - If you encounter this, click to add a New Folder, highlight the folder, and then right click in Preview Pane to Open in New Window.
 - The New Window will show all file types.  

## Next Steps

From here, the next step is to [Rename LotL or Payload as Name of Kiosk App or Allowed Program](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/2%20-%20Next%20Steps/Rename%20LotL%20or%20Payload%20as%20Name%20of%20Kiosk%20App.md). 

## Defensive Recommendations 

Here are a few things you can do to make yourself more resilient against this tactic:

 - Custom IOAs in your EDR to detect Executables running from Downloads.
 - Implement Application Control on your Kiosk.  
 - See also hardening scripts by Jordan Mastel in the defensive portion of this repo.

## Ethical Note

Remember to only test on your own kiosks, or with permission such as in the scope of a bug bounty or penetration test, with good intentions of helping elevate kiosk security.  

## Demo Video

https://github.com/user-attachments/assets/8096c672-2323-48a3-b456-ccd81741da5b
