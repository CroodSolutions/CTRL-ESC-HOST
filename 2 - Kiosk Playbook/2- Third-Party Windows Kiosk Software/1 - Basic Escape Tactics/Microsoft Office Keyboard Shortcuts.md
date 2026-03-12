## Microsoft Office Keyboard Shortcuts

Microsoft Windows has native shortcuts to launch Microsoft applications, which can provide a breakout opportunity if any of these applications are installed - and, if these shortcuts have not been disabled. 

## Test Cases

 - Ctrl+Alt+Shift+Win+W (MS Word)
 - Ctrl+Alt+Shift+Win+X (MS Excel)
 - Ctrl+Alt+Shift+Win+P (MS PowerPoint)
 - Ctrl+Alt+Shift+Win+O (MS Outlook)
 - Ctrl+Alt+Shift+Win+T (MS Teams)
 - Ctrl+Alt+Shift+Win+N (MS OneNote)
 - Ctrl+Alt+Shift+Win+Y (MS Yammer)
 - Ctrl+Alt+Shift+Win+L (Opens LinkedIn in a browser)  

Note that some may launch in a browser and others may launch the actual desktop application. Both outcomes can be useful for kiosk escape. 

## Next Steps

While the functionality afforded by escaping to a Microsoft application may vary, here are a few common goals:

 - File Open / File Save dialog box.
 - Help or other context menu options to open an unlocked browser.
 - VBA or other scripting interpreters as a part of MS Office.
 - Use Chat App or shared document (e.g., MS Teams) to smuggle a payload onto the host.

If running VBA as an attack vector, be sure to check out our [BeaconatorC2](https://github.com/CroodSolutions/BeaconatorC2/tree/main) and [AutoRMM](https://github.com/CroodSolutions/AutoRMM) projects. If smuggling payloads onto the host, check out our upcoming/emerging project [SmuggleKing](https://github.com/CroodSolutions/SmuggleKing). 

## Ethical Note

Remember to only test on your own kiosks, or with permission such as in the scope of a bug bounty or penetration test, with good intentions of helping elevate kiosk security.  
