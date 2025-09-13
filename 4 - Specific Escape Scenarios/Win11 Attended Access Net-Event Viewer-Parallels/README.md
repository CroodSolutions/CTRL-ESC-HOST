## Introduction / Background
A few years back, some friends and I became interested in escape to host flaws, at first exploring Citrix ADC issues (Kitusune-Sec and Fawdc0de). Later, Shammahwoods joined the quest and Mspisces8 helped me to expand my view of what should be considered when exploring escape to host flaws (it’s raining kiosks).  

Together, we have found many escape to host flaws; admittedly most of them were found by other people also/usually before us, but we had a ton of fun along the way, all the same.

Hacking kiosks for cyber, is sort of like Quidditch in Harry Potter.  It usually is not that essential to the plot line, but it adds a lot of the fun and spice that makes things exciting, helping the story to come alive.  It usually is not at the top of a risk matrix, but that is precisely what makes kiosk hacking fun.  

When I first met Win11 Single App Kiosk Mode / Attended Access running Edge a few months ago, it was love at first sight.  Compared to other products I have tested, it was quite good, IMHO.  I tinkered with it and many of the usual pathways were blocked – it was possible to escape the limited browser and even get to Settings, but I struggled to get full code or command execution.  Later I got advice and ideas from TechSpence and others, including helpful conversations with NotNordgaren, where he pointed me to videos from John Hammond.  These videos were great, because they showed my why so many things did not work – because these videos found them years earlier and they were fixed.  A true success story of how this ecosystem is supposed to work.  

Messing with Win11 Attended Access, became something I would tinker with, when bored in a long meeting or traveling.  Recently identified a path that allows for complete escape and compromise in the very narrow edge case of running Win11/kiosk on Parallels MacOS (real world == never).  While less cool, it can also work for Win11/kiosk on x64 bare metal, although there it has the caveat of needing an admin password.  This could open up pathways for further research though, including what else can be done with the way Parallels handles VMs, as well as other pathways I may have missed for native Win11.

Happy Hacking – use these ideas responsibly and ethically.  

## Video Overview
https://youtu.be/bjJIAT_XeIM?si=7RzyXvf_Ye6Zedz7 
[![Watch the video](https://img.youtube.com/vi/bjJIAT_XeIM/maxresdefault.jpg)](https://youtu.be/bjJIAT_XeIM)

## Overview of Findings
For a very unique edge-case:  If running Win11 on MacOS via Parallels, you may get full kiosk escape to System privileges, via Magnifier, Advanced network settings, Edit (under more adapter options), click “yes” (without a password), configure the network adapter, click events, view all events, action/open saved log, type in direct file path to LotL binary, and it will run with full kiosk escape (including cmd/ps/taskmgr/beacon payload). 


Findings for Win11, Kiosk Mode, Attended Access on traditional host, running AMD Ryzen Pro 7 laptop were a bit different. All of the other aspects of this attack path worked, but with the exception that an admin password was required in order to launch network edit view, which allowed us to spawn event viewer. 

## Detailed Walkthrough on MacOS w/ Parallels
Start in Win11 Single App Kiosk Mode for MS Edge (Attended Access).
Press “Command” and “+” to launch Magnifier.

 <img width="246" height="39" alt="image" src="https://github.com/user-attachments/assets/5a7f32f2-060e-4b16-b9a8-5ef85f2749aa" />

Click the Gear icon on the right to open next dialog box.

 <img width="206" height="113" alt="image" src="https://github.com/user-attachments/assets/b8dd03e8-d08d-4a3b-8756-ae0c1cbdbd2c" />

Click “Go to Settings”

<img width="468" height="209" alt="image" src="https://github.com/user-attachments/assets/bb099b25-bb64-442c-afe9-21ef5d0610f4" />

You will land in the Magnifier Win11 Settings menu.  Close Magnifier and click “Network and internet”

<img width="468" height="34" alt="image" src="https://github.com/user-attachments/assets/dd801769-9cf9-4fa0-a2b9-5a7a82cf6a58" />

 
Click “Advanced network settings” at the bottom of the options listed.

<img width="468" height="217" alt="image" src="https://github.com/user-attachments/assets/2f00d61a-9098-46ba-b7ca-1a1110191d4d" />

Click to expand one of the Network adapters, and click “Edit” to launch.

<img width="221" height="287" alt="image" src="https://github.com/user-attachments/assets/f6e03b89-303e-414e-a438-f6a582254953" />

For both Win11 running on Parallels/MacOS and Windows running natively on x64 hardware, this dialog box pops up.  What is unique about the Parallels path is that you can click “Yes” without entering a password and still launches “Ethernet Properties” as System. For a bare metal install of Win11, this required an admin password.  As John Hammond has pointed out previously, this still can be useful there is a weak/guessable admin password or if combined with Social Engineering.  However, I found the behavior on MacOS/Parallels to be the most interesting.  Working with Shammahwoods to do further debugging to see what is actually happening here, because it seems like there may be more to this story.  

<img width="176" height="227" alt="image" src="https://github.com/user-attachments/assets/6bb52f69-ca94-4080-b82b-fe357059dd67" />
 
While it looks like maybe we could do some interesting things here with the Install button, for this test we click “Configure” to launch the Adapter Properties screen.

<img width="190" height="216" alt="image" src="https://github.com/user-attachments/assets/40c2e4fa-dc06-4817-9a48-7d31261ea58e" />
 
While we are going to quickly move to the Events tab, it is worth pointing out that the Driver tab seems like it could also present some testing potential.

<img width="192" height="218" alt="image" src="https://github.com/user-attachments/assets/41713ced-c3d5-48cf-80f7-7f5977e194a2" />
 
Let’s move on to click Events though.

<img width="191" height="218" alt="image" src="https://github.com/user-attachments/assets/2d3f28e8-b5e3-4047-9e66-efbaf949f53c" />
 
Click “View All Events” and wait for it to load. If there are issues with later steps, do it at least one additional time, since later stages of this seemed more reliable when I had multiple instances of Event Viewer running. 

<img width="156" height="186" alt="image" src="https://github.com/user-attachments/assets/51918e59-27a6-43c9-8e9e-5631a8486fcf" />
 
Now Navigate to Action and select “Open Saved Log…” 

<img width="326" height="227" alt="image" src="https://github.com/user-attachments/assets/0b832a44-f783-4be5-889b-48a9d6f69707" />
 
Now type in the file path to a LotL binary you would like to launch. It constrains what it will display to Event Log Files, but if you type an absolute file path, it will launch many (not all) LotL binaries.  WDAC does seem to whack some things, but most everything you could want will run, including typing an absolute file path to a mapped beacon payload.

<img width="468" height="302" alt="image" src="https://github.com/user-attachments/assets/6628260c-c6ce-4382-a694-fd27d1836208" />

And, we have a very large CMD prompt.  Now, on the native Apple keyboard I am able to use Option+Shift+Esc to tab through windows, and on Win11 ability use Alt+Tab varied. But with some experimentation usually you can get an escaped kiosk to swap windows, although across different kiosk scenarios how I accomplish this varies, and it tends to be temperamental.  

<img width="323" height="228" alt="image" src="https://github.com/user-attachments/assets/15c5ac56-840d-45ed-b95c-1e149fd1503b" />
 
Try other LotL binaries, such as PowerShell.

<img width="411" height="139" alt="image" src="https://github.com/user-attachments/assets/8eac470f-f102-4461-a29d-bfc27b995c50" />
 
Try Task Manager, since it has some interesting capabilities.

<img width="323" height="226" alt="image" src="https://github.com/user-attachments/assets/2a87370d-64be-4efb-bc94-5b2004a4fa10" />
 
Tip: At least one EDR flagged on some of these escape tricks (but it did not block them). It is my suspicion that these are very specific rules to detect Event Viewer launching specific LotL binaries, so navigating directly to an evasive beacon payload or RMM install is probably less likely to be detected. 

<img width="197" height="108" alt="image" src="https://github.com/user-attachments/assets/4c060917-9547-4501-80c8-dcb0fe06b75d" />
 
Also, I am really fond of this “Create this task with administrative privileges” checkbox.  

<img width="155" height="20" alt="image" src="https://github.com/user-attachments/assets/6ffeb373-1218-4f60-8ee0-074e2939f3e4" />
 
Some command “shell:…” commands work here as well, although not all of them.

<img width="319" height="87" alt="image" src="https://github.com/user-attachments/assets/6bc3241f-e842-4001-8a79-1d0a1a08a9a4" />
 
Happy Hacking!!  

## Testing on Win11, Attended Access / Kiosk Mode, bare metal
All of this was the same on Win11 Single App Kiosk Mode (attended Access), when running natively on x64 with no Parallels/VM, with the one exception that you had to enter a password to escalate to adapter settings.  Social engineering or guessing weak passwords could come into play; although, let’s face it – this scenario is more fun and interesting than practical anyway.  That said, we fully intend to dive into what makes a MacOS version, running Parallels, different from a bare metal install.  More to follow, at least, if we find anything interesting.  

## Ethical Notice
This project is to test scenarios related to Escape-to-Host flaws.  We can only be successful at properly defending against adversary tactics, if we have the tools and resources to replicate the approaches being used by threat actors in an effective manner. Participation in this project and/or use of this information implies good intent to use these techniques ethically to help better protect/defend, as well as an intent to follow all applicable laws and ethical principles. The views expressed as part of this project are the views of the individual contributors, and do not reflect the views of our employer(s) or any affiliated organization(s).  

## Changes Since Last Testing Performed 
The first observation is that John Hammond found many flaws, in his excellent videos on escaping Unattended Access, three years ago.  I have tried many of those tricks today, and quite a bit has been fixed.  Moreover, even since my most recent testing before hacker summer camp, many things have improved:

•	File system access via downloads not as useful (although you can still reach files via file:///C:/ syntax in an unlocked browser). Browsers can be unlocked by clicking a web link from Settings.    
•	The ability to enter app settings and “Modify” an MSI has been removed (only uninstall option).

## Resources 
John Hammond videos on Kiosk escapes (5/5 recommend):
 - https://www.youtube.com/watch?v=R7srpHUshuI
 - https://www.youtube.com/watch?v=aBMvFmoMFMI
 - https://www.youtube.com/watch?v=iL_WzZZ72_s

(Thanks also to NotNordgaren for discussions and pointing me to these resources)

TechSpence:

 - https://www.youtube.com/watch?v=JWopwNVP_to  

## Credits
- [shammahwoods](https://github.com/shammahwoods)
- [flawdC0de](https://github.com/flawdC0de)
- [Kitsune-Sec](https://github.com/Kitsune-Sec)
- [John Hammond](https://github.com/JohnHammond)
- [NotNordGaren](https://x.com/NotNordgaren)
- [TechSpence](https://github.com/techspence)
- [Mspisces8](https://x.com/mspisces8)
- [BiniamGebrehiwot1](https://github.com/BiniamGebrehiwot1)
- Thomas Haney
- Jordan Mastel
- David Doyle
- [christian-taillon](https://github.com/christian-taillon)
- [Duncan4264](https://github.com/Duncan4264)
