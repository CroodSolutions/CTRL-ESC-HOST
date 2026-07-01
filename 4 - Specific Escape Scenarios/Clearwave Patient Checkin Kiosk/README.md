## Overview 

This testing involved trying to escape to host (pre-auth) on a Clearwave XT-6315 purchased on ebay. Since this device was not necessarily new or supported fully, it is not necessarily representative of how their production / most up-to-date kiosks would perform when tested.  

This product is a patient self checkin kiosk used in medical offices and clinics, across various healthcare organizations according to their web site.

https://www.clearwaveinc.com/patient-check-in-kiosk/ 

## Steps to Replicate Escape 

Precondition: Attach a keyboard (can be a small wireless keyboard).  

In this case, there were two keyboard shortcuts we found that allowed for escape:

 - Alt+Shift+PrintScreen (High Contrast)
 - Alt+Shift+NumbLock (Mouse Keys)

Both of these generate a dialog box, where you can click to open settings.

From there, the steps to fully escape were:

 - Click to open settings.
 - Type PowerShell in in the settings browser bar (or Explorer.exe).
 - Use PowerShell to launch Explorer.exe
 - Click Task View.
 - Kill the Clearwave software by closing the window.
 - Move on to recon, ingress tool transfer, and lateral movement phases of your penetration test.  

One interesting thing to note is that for the box we tested, the default Clearwave account was already running as administrator. So, once the Clearwave software was escaped, there was a clear runway ahead. 

Again, the box we had may not be representative of what is new/normal, since this is just a host we ordered on Ebay as part of the upcoming workshop we are leading at Defcon Red Team Village (RTV).  

## Screeshots 

The Kiosk out of the box / running:

<img width="530" height="1024" alt="image" src="https://github.com/user-attachments/assets/7c88acd5-a509-4665-b0ac-4f1f88664ab7" />

Dialog box to escape:

<img width="1024" height="768" alt="image" src="https://github.com/user-attachments/assets/3d490ebd-3439-4e09-ba49-b2a11512dd79" />

Settings Menu:

<img width="1024" height="768" alt="image" src="https://github.com/user-attachments/assets/bf030531-3477-459b-ae4b-c4cb3b6e51be" />

Powershell as administrator:

<img width="1024" height="572" alt="image" src="https://github.com/user-attachments/assets/22a046ae-8236-4bae-b190-1331915e9db1" />



## Ethical Note

Important note: only use CTRL-ESC-HOST and the associated tools and techniques for legal and ethical testing and educational purposes.
