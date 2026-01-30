As a teaser for our upcoming CactusCon 14 talk, releasing our new testing framework Ctrl+Esc+Host, Ezra Woods and I recorded a short video providing a teaser of one of our escape to host methods you can test for in your own/customer environments now.

Have you ever been curious about Kiosk hacking, or wondered if the growing sprawl of kiosks that surround us, have vulnerabilities and attack surface that may be getting overlooked?  

Ctrl+Esc+Host will provide a methodical approach for testing for a wide range of escape to host scenarios, ranging from Kiosks to Presented Applications.  And, to keep it fun, we also include a catalog of “war stories” from our own kiosk hacking adventures, with exact steps of what we did and how the escape worked.  

As we have spent quite a long time messing with kiosks, presented apps, and other trust boundaries along with our other friends (see credits) we have found some really obscure conditions that escape to host, which makes it almost embarrassing to present this escape that is so basic, we are amazed it worked.  

This is an escape for Win11 Attended Access / Single App Kiosk mode, running MS Edge:
-	Ctrl+O to generate “File Open” dialog box.
-	Right click in the file preview area that is visible (even though there are no files).
-	Click off the dropdown, and then right click a second time.
-	Select “Open Terminal” and as the TMNT would say, Shell Time!!
We are laughing about this, because some of our other methods for Attended Access escape are super clunky and complicated. <facepalm>

And your bonus tactic?  While USB drives do not show up in this flawed but limited explorer view, once you get a PowerShell window via the above (or other methods we will share at the con), if you plug in a USB to the kiosk and type cd D:\ via PowerShell window it will address the drive.  Then you can use Set-Clipboard – Path “filename” to copy it locally to downloads (smuggle as txt) and then rename to msedge.exe and it will run <only> if you type msedge in the explorer bar (nod to John Hammond’s amazing videos 3 years back that first showcased this – apparently the fixes were a Band-Aid).  Caveat: Does not work with all LotL / just some (experiment).

In summary, here is a testing flow you can run to move from Kiosk to Shell / Ingress Tool Transfer.  Hope to see you at CactusCon, but in either case we hope this was helpful to get you started with testing your kiosk attack surface.  

Special thanks to everyone who has helped us with this project, including:
•	shammahwoods
•	flawdC0de
•	Kitsune-Sec
•	John Hammond
•	NotNordGaren
•	TechSpence
•	Mspisces8
•	BiniamGebrehiwot1
•	Jordan Mastel
•	David Doyle
•	christian-taillon
•	Duncan4264

https://youtu.be/0v5fI6SEktY?si=eoDT_4-YHfZtBWzU&t=1
