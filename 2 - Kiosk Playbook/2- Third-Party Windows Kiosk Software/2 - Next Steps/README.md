## Introduction

This section is for ways to expand reach, when the initial escape leads to a universal pivot point, with many options / when next things to try may not be obvious at first.

A good example may be, when you have escaped to an app such as Settings, MS Teams, or MS Feedback Hub, and need a pathway of what to try next (without having to exhaustively try every possible option).

## Techniques

Here are a few helpful flows you may follow, to build kiosk escape sequences to move from kiosk mode to having a code/command/payload execution on the host.  

### A Possible FLow of Tactics

 - You may start with [Escape to Less Restrictive Browser](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/2%20-%20Next%20Steps/Escape%20to%20Less%20Restrictive%20Browser.md), then try one of these tactics 
   - [Download LotL Binaries via Browser from Local Host](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/2%20-%20Next%20Steps/Download%20LotL%20Binaries%20via%20Browser%20from%20Local%20Host.md) - or -
   - [Subdomain Smuggling of LotL Payload](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/2%20-%20Next%20Steps/Subdomain%20Smuggling%20of%20LotL%20Payload.md) - then - 
 - Execute the payload
   - If you can, just run it.
   - If not, try to [Rename LotL or Payload as Name of Kiosk App or Allowed Program](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/2%20-%20Next%20Steps/Rename%20LotL%20or%20Payload%20as%20Name%20of%20Kiosk%20App.md)

### Some Tactics Really only Need A Single Step

 - Such as to [Launch Terminal from File Open Dialog Box via Preview Pane](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/2%20-%20Next%20Steps/Launch%20Terminal%20from%20File%20Open%20Dialog%20Box%20via%20Preview%20Pane.md)
 - Or using Win+X to launch a Terminal (if it works).

 Sometimes the escape is as simple as getting your first dialog box, and then running whatever you want (in some cases nothing is blocked).  

## Next Steps

From here you move on to:

 - [3 - Internal Discovery and Recon](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/3%20-%20Internal%20Discovery%20and%20Recon) - or -
 - [4 - Post Exploitation](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/4%20-%20Post%20Exploitation)

Where to go next, depends on your scope and objectives. If you are doing kiosk testing, you may not need to go much further than doing some discovery and recon to show that the kiosk is on the wrong network, joined to a sensitive domain, or has host artifacts that represent a risk. For a full penetration test, you may want to skip to the post exploitation stage where you may want a beacon or RMM, building toward steps such as ingress tool transfer, defensive evasion, lateral movement, and so on.  

## Ethical Note

Remember to only test on your own kiosks, or with permission such as in the scope of a bug bounty or penetration test, with good intentions of helping elevate kiosk security.  



