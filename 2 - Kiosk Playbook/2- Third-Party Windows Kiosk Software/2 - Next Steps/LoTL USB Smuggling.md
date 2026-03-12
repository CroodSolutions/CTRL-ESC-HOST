## LoTL USB or Payload Smuggling

This attack involves pre-staging a USB drive with a copy of ftp.exe renamed to msedge.exe, and requires a pre-condition of physical access to a USB or USB-C port.

## Testing Instructions

Here are the basic steps:
 - Format a USB and stage a copy of ftp.exe, renamed to msedge.exe
 - Plug in USB (if you are testing in a VM, be sure to map the USB to the VM).
 - Press Ctrl+O or Ctrl+S
 - Click in the file path area, and type the direct file path to your file, guessing the USB drive letter (e.g., D:\msedge.exe).
 - Once ftp.exe launches, you can use ! followed by PowerShell to run scripts.
 - Launch PowerShell.exe or Cmd.exe from here to gain full shell (in userland).   

While we tested this with ftp.exe, similar tests worked with other LotL binaries and even custom payloads, as long as renamed as msedge.exe (to be clear, some things are outright blocked and do not work for this USB Smuggling vector, but a lot of payloads will run). 

It is important to note that this may work, even when the USB does not show up in the GUI, as was the case with Attended Access. Effective USB Device Control or Application Control will successfully mitigate the issue. 

## Defensive Recommendations 

Here are a few things you can do to make yourself more resilient against this tactic:

 - Lock down USB via InTune, GPO, or using device control features of your EDR/AV/RMM product(s).
 - Create custom IOAs in your EDR to detect file execution from unexpected locations, such as, in this case, ftp.exe from an unexpected drive location.
 - Consider Application Control via WDAC (Windows Defender Application Control) or a 3rd party solution.  

## Ethical Note

Remember to only test on your own kiosks, or with permission such as in the scope of a bug bounty or penetration test, with good intentions of helping elevate kiosk security.  
