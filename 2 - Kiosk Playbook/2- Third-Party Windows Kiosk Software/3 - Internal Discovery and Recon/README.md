## Introduction and Overview

So, you managed to get shell on a kiosk. Now what?

In a normal penetration test engagement, this is where you run a defense evastion and ingress tool transfer playbook, to start dropping the tools on the host. 

And in fact, if this is a full-scoped engagement, you may load tools such as:
 - Nmap, Zenmap, or Masscan
 - MimiKatz, Rubeus, or other cred harvesting tool
 - Bloodhound, Locksmith, AD Deliganator
 - A beacon for your favorite C2 framework (we are partial to BeaconatorC2 using BOF, but Sliver, Cobalt Strike, or Brute Ratel also work).

It has been my experience though that kiosk engagements sometimes have a smaller scope and tighter rules of engagement. That does not stop administrators from asking questions though; such as, "you got shell on my kiosk, so what?" Here are some things that you can do from a windows Kiosk (or Citrix/presented app) host that do not require any particular tooling.  

**Key Point**: This is not intended to replace tools like Locksmith or Rubeus. What you can learn about a host with these commands is very high level, basic, and will miss a lot of more subtle points. It does give you enough to answer a few basic questions relevant to (ethical) kiosk hacking though, in a few minutes with no tooling. It will allow you to very quick understand:
 - What network(s) is it on / what hosts can it likely reach.
 - Is it joined to a domain?
 - What domain trusts may exist that need to be considered.  

## Basic Recon 

Most of these will work via both CMD and PowerShell. Some of these commands will trigger AV/EDR alerts in more mature environments. 

### Basic Host Info

 - SystemInfo (make note of "Domain:" as an input for basic AD recon)

### Passive Network Discovery

 - route print
 - arp -a
 - netstat -ano
 - ipconfig /displaydns

### Basic Account, Domain, and Policy Enumeration

 - net user
 - nltest /dclist:(domain name here)
 - nltest /domain_trusts
 - gpresult /z

### Identify Running Software

 - Tasklist
 - Taslklist /v findstr /i "NameOfProcess"
 - Launch Task Manager (view tasks and services)

### File Share Mapping 

 - Explorer 
   - (Ctrl+O or Ctrl+S)
   - Look for mapped drives or shares
   - Enter the server address/folder path to resources found during host recon.
   - Browse network
 - net share

### Examine Scheduled Tasks

 - schtasks /query /fo LIST

### Domain Enumeration via Add Printer 

This assumes a few preconditions:
 - The host is domain joined.
 - At least one printer is on the domain.
 - You have access to print.

Here are the steps to perform domain enumeration via Find Printer:
 - Click Print, Ctrl+P, or other methods of launching print dialog box.
 - Click Find Printer.
 - Browse to select desired domain objects.
 - Open Properties.
 - Go to Security tab, and click Advanced.
 - Click the Effective Access tab and click Select a user.
 - And, this is what you are really looking for: the Select User, Computer, Service Account or Group dialog box.
   - Click Advanced
   - Select desired Object Types to scope your search
   - Use common queries to scope your search to identify domain controllers, administrators, service accounts, or any other type of object.
 - There are numerous pathways to the Select User, Computer, Service Account or Group dialog (this is just the one I used in some testing the day of writing). 

**Note** that this is recon only and usually you cannot modify or add permissions (unless serious misconfigurations, so always test it to be sure).  

## Other Articles and Resources 

