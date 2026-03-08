## Introduction

In our experience so far, testing boundaries for ChromeOS kiosks are quite good, unless there is a misconfiguration or issue. 

Normally, when you leverage Powerwash to reset a ChromeOS device that is managed via Enterprise Enrollment, ChromeOS does a very good job returning back to the enterprise profile. However, if there are multiple enterprise profiles, and the kiosk is not the default, it may return to a less secure profile.

In one testing scenario, this is exactly what happened. The device was a kiosk on a sensitive network, and we were able to Powerwash, returning it to a default policy that provided a rather full-featured ChromeOS experience instead of the signage kiosk. From there we had a browser and command line shell that we could do things with. Note that ChromeOS was still better than Windows at preventing us from being able to do Ingress Tool Transfer, and just install things, so what we could do here was still somewhat limited.

## Testing / Steps to Replicate (without screenshots)

Note that this particular test was on a ChromeOS Kiosk running AppSpace signage kiosk software. However, we were also able to produce similar results with other types of kiosks, if similar misconfigurations were present. Precondition includes the ability to connect a keyboard to the kiosk. 

The first step is to escape the application, which can be done a few ways:

 - For App Space, Ctrl+Alt+Shift+M, followed by Ctrl+Alt+S.
 - For other apps try Esc+Power+Refresh, enter developer mode, and then when it fails proceed with the steps below.

In either case, once out of the app, while on the settings menu:

 - Ctrl+Alt+Shift+R  to PowerWash (repeat Ctrl+Alt+Shift+R after restart).
 - Click Get Started to proceed with enterprise setup.
 - Click Sign into the App to unlock the default / less secure profile.

Variations on these outcomes/scenarios you may encounter: 

 - Powerwash could just work from the kiosk app, depending on settings, so it is at least worth a try.
 - Proper configurations could mean the default enterprise profile for the device, IS the kiosk profile (meaning no escape here).
 - If not enterprise enrolled, at the other extreme, it could just reset to the state of a new / unlocked chrome book.
 - This approach could also be combined with the well-documented approach of removing the Write Protect control screw, although I have not yet tried this.


## Resolution 

Make sure the enterprise profile you use has a default profile for the device, which includes the kiosk mode and all restrictions.  

## Legal and Ethical Reminder

Only test on your kiosks or with permission such as part of a penetration test or bug bounty, in accordance with all applicable laws and ethical standards.

## Appendix: A few Screen Shots / Photos

Since this is not the kind of testing where we were on a VM, what we are left with is actual photos.  TL;DR, the photos suck / apologies in advance.

Ctrl+Alt+Shift+M for APPSPACE Device Menu:

<img width="241" height="248" alt="image" src="https://github.com/user-attachments/assets/e906028b-68b7-4b1f-acea-848e582cd8f5" />

Ctrl+Alt+S to escape Appspace to ChromeOS Kiosk Mode:

<img width="326" height="200" alt="image" src="https://github.com/user-attachments/assets/42ab8cc6-10d7-40bb-b10a-1d3f9ddba380" />

Ctrl+Alt+Shift+R  to PowerWash (repeat Ctrl+Alt+Shift+R after restart):

 <img width="274" height="205" alt="image" src="https://github.com/user-attachments/assets/3b1e7640-2a0d-42a8-bc75-dc9d1e4d1954" />

Confirm:

<img width="268" height="130" alt="image" src="https://github.com/user-attachments/assets/c15eb245-adfa-4dfc-8ce1-e84e39dd540d" />
 
Walk through initial setup steps:

<img width="278" height="183" alt="image" src="https://github.com/user-attachments/assets/327f1e2a-1efd-4209-9fdb-d28dd9c1e4e1" />

Enterprise setup process will complete:

<img width="266" height="144" alt="image" src="https://github.com/user-attachments/assets/434f8570-790a-49e2-bde6-7c2fe637f97c" />
 
In this case, it completed letting us in to a less secure profile than the kiosk profile, letting us do some malicious things on a sensitive network as part of the testing.  

<img width="275" height="167" alt="image" src="https://github.com/user-attachments/assets/42a9cb11-ae95-46ae-bf21-f6f40afccf5a" />

