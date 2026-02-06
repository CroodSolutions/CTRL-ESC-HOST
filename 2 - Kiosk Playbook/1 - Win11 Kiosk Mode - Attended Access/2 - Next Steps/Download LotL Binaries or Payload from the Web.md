## Download LotL Binaries or Payload from the Web 

For this tactic, all you need to do is stage a LotL binary or payload somewhere on the internet, such as your favorite file sharing service, and then download. While there are numerous tactics for hiding an exe so it will not be blocked by cloud sharing services, it is important to remember that whatever method you use needs to work within the constraints of kiosk mode.

This leaves a couple of basic options that we use in testing:
 - Simply rename the exe to a txt (this works surprisingly often).
 - Create a zip or archive file (unzip does seem to work fine in kiosk mode).

For kiosks that are well locked down, the policies for allowed URLs may be very restrictive. Ways around this may include either guessing something likely to be allowed or finding a subdomain of the allowed web resource that lets you stage files. 

Key points for guessing allowed third-party sites:
 - Some domains that are frequently allowed are large cloud SaaS/IaaS providers or CDNs, where you could host a file.
 - Use nslookup -type=txt example.com and look through all of the text records for the kiosk owner's domain for domain verification records, to indicate what cloud services they use / may have allow-listed.  

Key points for finding a sub-domain that allows you to stage files:
 - Use your favorite OSINT tool or even Google dorking to explore subdomains that are allowed on the kiosk.  
 - Identify web resources such as ticketing or feedback pages that allow for an attachment of lower trust users, such as customers.   

Caveat: If browser-based download capabilities are completely disabled, this tactic will not work (instead try USB Smuggling or Lenovo MS Teams techniques).  

Now proceed to [Rename LotL or Payload as Msedge](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/1%20-%20Win11%20Kiosk%20Mode%20-%20Attended%20Access/2%20-%20Next%20Steps/Rename%20LotL%20or%20Payload%20as%20Msedge.md)  

Remember: Only test on your own kiosks and/or with proper written permission and following all appropriate laws and industry ethics / best practices
