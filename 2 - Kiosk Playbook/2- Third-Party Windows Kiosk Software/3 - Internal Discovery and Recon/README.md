## Introduction and Overview

So, you managed to get shell on a kiosk. Now what?

In a normal penetration test engagement, this is where you run a defense evasion and ingress tool transfer playbook, to start dropping the tools on the host. 

And in fact, if this is a full-scoped engagement, you may load tools such as:
 - Nmap, Zenmap, or Masscan
 - MimiKatz, Rubeus, or other cred harvesting tool
 - Bloodhound, Locksmith, AD Deliganator or Ping Castle 
 - A beacon for your favorite C2 framework (we are partial to BeaconatorC2 using BOF, but Sliver, Cobalt Strike, or Brute Ratel also work).

It has been my experience though that kiosk engagements sometimes have a smaller scope and tighter rules of engagement. That does not stop administrators from asking questions though; such as, "you got shell on my kiosk, so what?" Here are some things that you can do from a windows Kiosk (or Citrix/presented app) host that do not require any particular tooling.  

**Key Point**: This is not intended to replace tools like Locksmith or Rubeus. What you can learn about a host with these commands is very high level, basic, and will miss a lot of more subtle points. It does give you enough to answer a few basic questions relevant to (ethical) kiosk hacking though, in a few minutes with no tooling. It will allow you to very quickly understand:
 - What network(s) is it on / what hosts can it likely reach.
 - Is it joined to a domain?
 - What domain trusts may exist that need to be considered.  

## Basic Recon 

Most of these will work via both CMD and PowerShell. Some of these commands will trigger AV/EDR alerts in more mature environments. 

### Basic Host Info

 - systeminfo (make note of "Domain:" as an input for basic AD recon)
 - echo %COMPUTERNAME%
 - echo %USERNAME%
 - echo %USERDOMAIN%
 - echo %LOGONSERVER%
 - whoami /all
 - whoami /fqdn
 - whoami /groups
 - wmic os get caption,version,buildnumber
 - wmic computersystem get domain,username,model
 - net config workstation

**Note** that whoami always gets hit by EDR, so when in doubt try it via ftp.exe with the "!" to prepend the commands.  

### Passive Network Discovery

 - route print
 - arp -a
 - netstat -ano
 - ipconfig /displaydns
 - ipconfig /all
 - netsh advfirewall show currentprofile

### Basic Account, Domain, and Policy Enumeration

#### Using only CMD

 - net user
 - nltest /dclist:(domain name here)
 - nltest /domain_trusts
 - gpresult /z
 - gpresult /r
 - quser
 - net accounts
 - net localgroup administrators
 - certutil -config - -ping
 - certutil -CATemplates
    (or)
 - certutil -template
 - certutil -store my
 - klist
 - setspn -Q */*
 - cmdkey /list

#### PowerShell Options

 - ([ADSI]"LDAP://RootDSE").defaultNamingContext
 - ([adsisearcher]"(&(objectCategory=computer)(name=$env:COMPUTERNAME))").FindOne().Path
 - ([adsisearcher]"(&(objectCategory=computer)(name=$env:COMPUTERNAME))").FindOne().Properties
 - ([adsisearcher]"(&(objectCategory=group)(cn=Domain Admins))").FindOne().Properties.member
 - ([adsisearcher]"(&(objectCategory=user)(samAccountName=$env:USERNAME))").FindOne().Properties
 - ([adsisearcher]"(&(objectCategory=computer)(name=$env:COMPUTERNAME))").FindOne().Properties | % Keys
 - ([adsisearcher]"(servicePrincipalName=*)").FindAll() | % { $_.Properties.samaccountname; $_.Properties.distinguishedname; $_.Properties.serviceprincipalname; '' }
     (or)
 - ([adsisearcher]"(servicePrincipalName=*)").FindAll() | % { [pscustomobject]@{User=$_.Properties.samaccountname[0];SPN=($_.Properties.serviceprincipalname -join '; ');DN=$_.Properties.distinguishedname[0]} }
 - Get-ChildItem Cert:\LocalMachine\My | select Subject,Issuer,EnhancedKeyUsageList


### Identify Running / Interesting Software and Services

 - tasklist
 - tasklist /v findstr /i "NameOfProcess"
 - tasklist /svc
 - sc query
 - sc query | findstr /i "NameOfProcess"
 - driverquery
 - Get-WmiObject -Class Win32_Service | Where-Object { $_.State -eq 'Running' }
 - Get-Service | Where-Object { $_.Status -eq 'Running' }
 - Launch Task Manager (view tasks and services)
 - Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select DisplayName, DisplayVersion
 - wmic service get name,displayname,pathname,startmode | findstr /i "Auto" | findstr /i "Program Files"
 - wmic qfe get csname,hotfixid,installedon,description
 - Get-WmiObject Win32_Service | Where-Object { $_.PathName -notmatch '"' -and $_.PathName -match ' ' } | Select-Object Name, PathName, StartMode, StartName
 - gwmi Win32_Service | ? { $_.PathName -notmatch '"' -and $_.PathName -match ' ' } | select Name, PathName
 - Get-Process | Select-Object Name, Id, Path, UserName

### Mapped Drives and Reachable Shares

 - Explorer 
   - (Ctrl+O or Ctrl+S)
   - Look for mapped drives or shares
   - Enter the server address/folder path to resources found during host recon.
   - Browse network
 - net share (local only)
 - net use
 - net view \\hostname
 - net use
  - net use
  - wmic logicaldisk get name,drivetype,providername
  - wmic printer get name,systemname,sharename,network
  - Get-Printer (via PowerShell or FTP+!)

**Note**: EDR clobbered my net view commands right away and killed the PowerShell window. However, when launched via FTP using "!" prepended, with the commands after, it ran fine. For net view, any hostname in the domain can be used (not just the one you are on), including any hostnames you found via ipconfig /displaydns. 

### Examine Scheduled Tasks

 - schtasks /query /fo LIST
 - schtasks /query /fo LIST /v

### Active Sessions

 - qwinsta
 - quser
 - query user

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

Here are some helpful links and resources for further exploration:
 - [AD Security Kit by TechSpence](https://spenceralessi.com/adsecuritykit/)
 - [AD Deleginator](https://github.com/techspence/ADeleginator)
 - [Purple Knight](https://www.semperis.com/purple-knight/)
 - [Ping Castle](https://www.pingcastle.com/)
 - [From Vendor to ESC1 by Debugger](https://medium.com/@Debugger/from-vendor-to-esc1-ed32281b7ea7)
 - [From Vendor to ESC3 by Debugger](https://medium.com/@Debugger/from-vendor-to-esc3-esc4-3f7d2d9fbde7)

## Credits

In addition to the overall project contributors on the main page for CTRL+ESC+HOST, these ideas have been shaped by:
 - [TechSpence](https://x.com/techspence)
 - [FlawdC0de](https://x.com/FlawdC0de)
 - [NotNordGaren](https://x.com/NotNordgaren)
 - [Kitsune-Sec](https://github.com/Kitsune-Sec)
 - [shammahwoods](https://github.com/shammahwoods)
 - [DebugPrivilege](https://x.com/DebugPrivilege)
 - [Christian Taillon](https://x.com/christian_tail)

## Footnotes 

 - Note that WMIC has been completely removed from any recent builds of Win11
  - It still works on most supported server builds in most production environments (for Citrix and other presented apps).
  - Also, still will work on a lot of legacy kiosks that have not been moved to Win11 or recently patched.
  - So, we are leaving it in this guide, for times when it may work where other things are blocked.  
