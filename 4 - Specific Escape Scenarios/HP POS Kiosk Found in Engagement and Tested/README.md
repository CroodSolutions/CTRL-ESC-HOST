## Executive Summary

During a recent site visit / assessment with a scope focused on kiosks and exposed devices, there was an HP POS kiosk that was on a user/agent signin screen. After testing a wide range of normal kiosk escapes that did not work, Shift+Alt+NumLock for a dialog box and the Windows link to "Disable this keyboard shortcut..." successfully spawned Control Panel, and it was obviously all downhill from there.  

Disclaimer / caveat: In testing kiosks, there is no real screen shot of the stages leading up to escape, so you are stuck with my TERRIBLE camera phone photos. Sucks to be you. 

## Kiosk / POS Build

This is a random kiosk I found during IRL testing, running Windows 10 with the HP Point of Sale (PoS) software, including what appears to be their own security software. While the OS build looks old, I checked for KBs and it did seem to be getting recent patches (also none of this involved win/CVE exploits - just good old fashioned escape tactics). Did not take a ton of time to deep dive exact versions of the HP software, but based upon a quick once-over, I think the actual kiosk/PoS software is up-to-date, while the peripheral drivers and supporting components are out of date. As such it is probably safe to assume the escape behavior is somewhat representative unless additional security controls are implemented by a specific HP customer (e.g., explicit host hardening policies, maybe refined to prevent these exact tactics).  

## Failed Escape Attempts 

As mentioned, I tried all of the Windows key escapes including all options involving Windows key combinations that I know of, plus the usual suspects such as Sticky Keys and Filter Keys, with no avail. Even the Accessability feature shorcuts that I have had good luck with in the past, did not work here. However, once moving past the newer methods, there were some old-school escapes they missed, including Shift+Alt+Numlock and Shift+Alt+PrintScreen. Ok, to be more clear, Sticky Keys did generate the expected dialog box, but clicking the link to get to Control Panel failed / resulted in a rather unelegant error.  

TL; DR, They definitely made a good faith effort to block at least some kiosk escapes.  

## Kiosk Escape and Subsequent Testing (no screen shots)

 - Shift+Alt+NumLock to open the Mouse Keys dialog box.
 - Click "Diasble this keyboard shortcut..."
 - Control Panel window loads.
 - Path A: Nagigate to "All Control Panel Items" and change settings, so long as you stay in userland.
 - Path B: Type an exact filepath to an LotL binary with a UI in the Explorer dialog box.
 - My first attempt was C:\Windows\System32\cmd.exe and it worked (shell).
 - Most of the usual things that can launch without PE did, including PS.
 - Strange caviat: random wierd things were blocked, including Task Manager.
 - That said, there was so much LotL open for abuse, it did not really matter.
 - Did not install a beacon, RMM, or attempt a PE to fully unlock the potental because that was not my scope for this effort.
 - Remember that the most valuable LotL in a kiosk escape may be a web browser to interact with adjacent resources. 

## Walk-through w/ Limited and Redacted Screen Shots

Intial Escape

<img width="1328" height="497" alt="image" src="https://github.com/user-attachments/assets/39dcadaf-b858-4330-b650-b62c3843a00e" />

Control Panel

<img width="383" height="207" alt="image" src="https://github.com/user-attachments/assets/4d70d162-7e4c-4848-8b69-93de95cf96ed" />

Full Control Panel

<img width="382" height="210" alt="image" src="https://github.com/user-attachments/assets/1f5914b1-425e-4edf-9ec8-18a4b1242156" />


Launching CMD (or other LotL)

<img width="468" height="90" alt="image" src="https://github.com/user-attachments/assets/9f9f6447-4573-46e1-93a3-3bb8ee9c7192" />

<img width="468" height="213" alt="image" src="https://github.com/user-attachments/assets/22e634f3-f066-4953-b180-319589832c86" />

## Recommendations and Lessons Learned 

 - WDAC (applicaiton control)
 - Proper Network Segmentation (Isolate Kiosks)
 - Avoid joining kiosks to any important DC/domain (have isolated domain with no shared secrets, if one is needed)
