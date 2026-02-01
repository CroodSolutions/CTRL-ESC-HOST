There are multiple scenarios in which software is presented in a low trust context, with the intention of presenting a single application or limited set of functionality, with the intention to constrain users in a way that prevents them from “escaping” to a higher trust context. 


In MITRE ATT&CK, Escape to Host is referenced and explained as a Privilege Escalation tactic, to escape a VM or container to the running hypervisor/system. However, if we really think about escaping to host, it includes so much more, including:
 - Escaping a browser sandbox to interact with the host system.
 - Escaping a kiosk to interact with the host system, network, and/or domain.
 - Escaping a Presented Application, such as with Citrix Storefront or VMware Horizon.


For this project, we will take a particular interest in kiosks, although we also cover testing and protecting Presented Applications.  We would like to point out that, while they had to put it somewhere, placing Escape to Host in the bucket of Privilege Escalation does not properly represent the full scope and potential of Escape to Host flaws.  


The key to escaping to host, is to find some unintended or accidental functionality, which provides a bridge from the low-trust context to a higher-trust context.  The simplest and most common example of this, may be a dialog box such as Save As, Open, or a system dialog box such as the classic Sticky Keys (Shiftx5) or Win+A as a gateway to open Settings.  


In some of our testing, it has been as simple as a rogue swipe on something like a fast-food ordering menu, to expose a Windows Start Menu or other powerful capability.  In other cases, we have found kiosks that are very well locked down, requiring considerable work to find an exact sequence of steps to escape (or sometimes there is an escape, but it is very limited and relatively low risk.


There are some key questions to ask when contemplating kiosks or presented apps for example:
 - What privilege level does the kiosk/presented software run with?
 - Is the host joined to a domain? (map AD compromise paths)
 - What network is it on, and what else is on that network?
 - What credentials/accounts or other intel could be coerced from this system?


One thing is clear: We need to raise awareness about escape to host flaws involving Kiosks and Presented Applications, and also broaden the definition of Escape to Host to include additional scenarios and utility in other ATT&CK phases (in particular Initial Access, Execution, and Credential Access).   

Intersting footnote: When I search the MITRE ATT&CK main page for kiosk (ctrl+f and via page search bar), no results are found. Maybe we should add something for these two scenarios (kiosk and presented app).  
