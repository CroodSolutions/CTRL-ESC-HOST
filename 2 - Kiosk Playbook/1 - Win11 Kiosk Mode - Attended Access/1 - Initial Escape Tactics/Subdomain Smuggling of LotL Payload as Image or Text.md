## Subdomain Smuggling of LotL Payload as Image or Text

This attack is relevant for use cases where very aggressive policies have been applied to limit what URLs you can visit. In such scenarios, there is almost always an exclusion to allow communication with at least a few domains:
 - The company's own domains/subdomains (these could be tightly scoped, but they usually aren't).
 - Key SaaS/hosting providers used/trusted by the target org (look for DNS txt records for domain validations to find these).
 - Software providers like Microsoft, Google, or Amazon that may have overscoped allow rules.

Why does this matter? Because, across all of these organizations and providers, it is highly likely there is something available where you can setup (or phish) an account (free or paid) and attach a file to some sort of ticket, request, inquiry, or message. Chances are that if that file is an LotL binary, beacon payload, RMM-install, one of these things will give the adversary covert control of a host, with very low detectability.  

Subdomain smuggling attacks live at the intersection of a few problems:
 - Renaming or otherwise hiding LotL or beacon payloads can sneak them through many barriers, including kiosk modes and also some isolation browsers.
 - A lot of cloud services, SaaS applications, and custom apps are not looking very deeply at the contents of a file - send it as an executable and it will get smashed, rename it to a .txt file and it gets through with no issue.  
 - Allow lists are often too general, including cloud services and/or customer-facing applications with a large user-base.
 - Domain registration text files make it very easy to see many SaaS applications an organization uses.

## Steps to Replicate / Testing Instructions

On your system:
 - Recon phase: run nslookup to identify likely SaaS services to test nslookup -type=txt example.com (or other recon mentods).
 - Identify a SaaS/cloud application or internal app you can gain access to easily (for a large enterprise, think of customer-facing apps).
 - Find a form that allows you to attach a file (messaging, ticketing, or customer service portals work well for this).
 - Select an LotL binary, such as ftp.exe or a [beacon payload](https://github.com/CroodSolutions/BeaconatorC2) and rename it as text file.
 - Upload to the SaaS or internal application you have selected (and identified as allowed).

On the kiosk:
 - Escape to a [less restricted browser mode](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/1%20-%20Win11%20Kiosk%20Mode%20-%20Attended%20Access/2%20-%20Next%20Steps/Escape%20to%20Less%20Restrictive%20Browser.md), and test the URLs you think may be allowed.
 - Sign in to the account you control, where your file has been saved.
 - Click to download (it may say it was blocked, but it will be there).
 - Press Win+A, open the settings menu, and navigate to the search bar.
 - Search for "Graphics settings" and click "Add desktop app"
 - This view will only show executables, so click "New Folder" and right click in the preview area.
 - Select "Open in new window" and you should now see your downloaded file.
 - Rename it to msedge.exe and type msedge in the browser bar / hit enter.
 - And, you have shell or payload execution.
 - If you selected FTP, simply type !PowerShell.exe to get a full shell on the kiosk.

Special thanks to [Jake Frenzel](https://github.com/jakefrenzel) for his great work testing and refining this, as well as for the discovery that even when it shows that the download has failed, it actually succeeds.  

## For Additional Resources on HTTP Smuggling Attacks See SmuggleKing

For futher resources related to testing for Web Payload Smuggling attacks, check out our other project [SmuggleKing](https://github.com/CroodSolutions/SmuggleKing).

## Legal and Ethical Notice

Remember: Only test on your own kiosks and/or with proper written permission and following all appropriate laws and industry ethics / best practices.
