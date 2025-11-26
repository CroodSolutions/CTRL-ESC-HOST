## Executive Summary

During a recent site visit / assessment with a scope focused on kiosks and exposed devices, there was an HP POS kiosk that was on a user/agent signin screen. After testing a wide range of normal kiosk escapes that did not work, Shift+Alt+NumLock for a dialog box and the Windows link to "Disable this keyboard shortcut..." successfully spawned Control Panel, and it was obviously all downhill from there.  

Disclaimer / caveat: In testing kiosks, there is no real screen shot of the stages leading up to escape, so you are stuck with my TERRIBLE camera phone photos. 

## Kiosk / POS Build

This is a random kiosk I found during IRL testing, running Windows 10 with the HP Point of Sale (PoS) software, including what appears to be their own security software. While the OS build looks old, I checked for KBs and it did seem to be getting recent patches (also none of this involved win/CVE exploits - just good old fashioned escape tactics). Did not take a ton of time to deep dive exact versions of the HP software, but based upon a quick once-over, I think the actual kiosk/PoS software is up-to-date, while the peripheral drivers and supporting components are out of date. As such it is probably safe to assume the escape behavior is somewhat representative unless additional security controls are implemented by a specific HP customer (e.g., explicit host hardening policies, maybe refined to prevent these exact tactics).  

## Failed Escape Attempts 

As mentioned, I tried all of the Windows key escapes including all options involving Windows key combinations that I know of, plus the usual suspects such as Sticky Keys and Filter Keys, with no avail. Even the Accessibility feature shortcuts that I have had good luck with in the past, did not work here. However, once moving past the newer methods, there were some old-school escapes they missed, including Shift+Alt+Numlock and Shift+Alt+PrintScreen. Ok, to be more clear, Sticky Keys did generate the expected dialog box, but clicking the link to get to Control Panel failed / resulted in a rather inelegant error.  

TL; DR, They definitely made a good faith effort to block at least some kiosk escapes.  

## Kiosk Escape and Subsequent Testing (without screenshots)

 - Shift+Alt+NumLock to open the Mouse Keys dialog box.
 - Click "Disable this keyboard shortcut..."
 - Control Panel window loads.
 - Path A: Navigate to "All Control Panel Items" and change settings, so long as you stay in userland.
 - Path B: Type an exact filepath to an LotL binary with a UI in the Explorer dialog box.
 - My first attempt was C:\Windows\System32\cmd.exe and it worked (shell).
 - Most of the usual things that can launch without PE did, including PS.
 - Strange caveat: random weird things were blocked, including Task Manager.
 - That said, there was so much LotL open for abuse, it did not really matter.
 - Did not install a beacon, RMM, or attempt a PE to fully unlock the potential because that was not my scope for this effort.
 - Remember that a valuable LotL in a kiosk escape may be a web browser to interact with adjacent resources. 

## Walk-through w/ Limited and Redacted Pictures of Kiosk

Initial Escape

<img width="1328" height="497" alt="image" src="https://github.com/user-attachments/assets/39dcadaf-b858-4330-b650-b62c3843a00e" />

Control Panel

<img width="383" height="207" alt="image" src="https://github.com/user-attachments/assets/4d70d162-7e4c-4848-8b69-93de95cf96ed" />

Full Control Panel

<img width="382" height="210" alt="image" src="https://github.com/user-attachments/assets/1f5914b1-425e-4edf-9ec8-18a4b1242156" />


Launching CMD (or other LotL)

<img width="468" height="90" alt="image" src="https://github.com/user-attachments/assets/9f9f6447-4573-46e1-93a3-3bb8ee9c7192" />

And we have shell!

<img width="468" height="213" alt="image" src="https://github.com/user-attachments/assets/22e634f3-f066-4953-b180-319589832c86" />

## Recommendations and Lessons Learned 

Here are some recommendations for organizations using HP or any other kiosk mode software: 

It is clear that kiosk vendors across the board, need to do more with hardening against the basics. I will give a rare shoutout to Microsoft here, because the most recent builds of Windows 11 single app kiosk mode (Assigned Access), have not presented much useful attack surface, for me at least. This contrast establishes a standard. Having poor security on kiosk and POS systems is not a given; we can actually work to make it better. Having a secure configuration is not an absolute, but at least you can know you gave it your best effort. Once I escaped kiosk on the HP device, there were very few obstacles in doing whatever else I wanted. When I escape the isolated app in Win11 single app kiosk mode, or certain other products, I am used to encountering obstacles and difficulty. For HP, after the first moment of escape, my only obstacle was admin rights, which only needed some ingress tool transfer and PE, which I deemed out of scope for this test.    

Key points:

 - Win11 Kiosk mode if possible (if not, you can replicate most of the settings via WDAC and GPO).
 - WDAC (application control).
 - Proper Network Segmentation (Isolate Kiosks).
 - Avoid joining kiosks to any important DC/domain (have isolated domain with no overlapping secrets, if one is needed)

This list will grow with time.  

## Reflection on Roles and Responsibilities.  

It is important to note that there is some ambiguity if this should be the fault of HP or the customer who implemented their product (or a third-party service provider). Often when I report escapes to vendors, they say it is a misconfiguration and that it is up to each customer to harden the host to prevent escape and subsequent abuse. I can see both sides. We do not necessarily blame Adobe for an entire infection chain, just because PDFs can be weaponized - at most, they shoulder the burden of initial access. It is expected that other measures are in place to frustrate efforts to move from initial access to complete compromise. On the flip side, are these vendors advertising that they provide a turnkey solution that is secure out of the box?  There may be some nuance to this topic. 

## Risk Prioritization

These kiosk issues represent a niche topic of limited importance, when considered alongside more fundamental security issues that are being neglected. That said, the exemplify the types of issues that bite us in other places such as:
 - Lack of proper segmentation.
 - Inadequate host hardening.
 - Excessive permissions in the context of the user serving up an application.
 - Issues with AD, domain trusts, and weak or overlapping passwords.

And, vendors who produce these products should make them better. That said, how likely is it for someone to stand there and smile for the camera while hacking your kiosk? Not that likely, when compared to the risk level of phishing, token/cookie/session theft, or Winter2025! That said, a tech savvy malicious insider or really important use case where a kiosk is a pathway to critical infrastructure or spanning into an isolated zone, could be important. I rate these types of risks as a medium priority.  

## References and Resources

https://www.pentestpartners.com/security-blog/breaking-out-of-citrix-and-other-restricted-desktop-environments/#usefulsystemadministrativetools

https://book.hacktricks.wiki/en/hardware-physical-access/escaping-from-gui-applications.html 

https://medium.com/@Rend_/give-me-a-browser-ill-give-you-a-shell-de19811defa0 

https://payatu.com/blog/how-to-prevent-hacking-out-of-kiosk/ 

