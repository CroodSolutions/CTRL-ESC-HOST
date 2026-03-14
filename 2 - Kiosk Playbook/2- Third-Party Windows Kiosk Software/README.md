## Introduction

A vast number of kiosks we have encountered in the wild have been third party software suites, implementing a proprietary kiosk suite on top of Windows. In theory, such devices can also be protected via InTune or GPO policies for significant levels of hardening and attack surface reduction, in addition to the 'out of the box' kiosk restrictions of a given 3rd party product. In practice, we rarely see this - usually the setup is somewhere between the normal workstation build and whatever level of security the kiosk software provider brings to the table.

 ## Tactics for Initial Escape

 Start by trying these keyboard shortcuts and strategies for gaining initial escape from Kiosk mode.

  - [Accessibility Kiosk Breakouts](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/1%20-%20Basic%20Escape%20Tactics/Accessibility%20Kiosk%20Breakouts.md)
  - [Application and File Dialog Boxes](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/1%20-%20Basic%20Escape%20Tactics/Application%20and%20File%20Dialog%20Boxes.md)
  - [Basic OS Level Kiosk Escapes](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/1%20-%20Basic%20Escape%20Tactics/Basic%20OS%20Level%20Kiosk%20Escapes.md)
  - [Context and Control Menu](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/1%20-%20Basic%20Escape%20Tactics/Context%20and%20Control%20Menu.md)
  - [Microsoft Office Keyboard Shortcuts](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/1%20-%20Basic%20Escape%20Tactics/Microsoft%20Office%20Keyboard%20Shortcuts.md)
  - [Microsoft Windows Key Escapes](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/1%20-%20Basic%20Escape%20Tactics/Microsoft%20Windows%20Key%20Escapes.md)
  - [OEM Hardware Breakouts](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/1%20-%20Basic%20Escape%20Tactics/OEM%20Hardware%20Breakouts.md)
  - [Strategies for Beyond the Keyboard](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/1%20-%20Basic%20Escape%20Tactics/Beyond%20the%20Keyboard.md)

## Tactics for Next Steps After Initial Escape

Once the initial kiosk application has been escaped, here are some pathways to gain expanded capabilities on the host.

 - [Download LotL Binaries via Browser from Local Host](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/2%20-%20Next%20Steps/Download%20LotL%20Binaries%20via%20Browser%20from%20Local%20Host.md)
 - [Escape to Less Restrictive Browser](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/2%20-%20Next%20Steps/Escape%20to%20Less%20Restrictive%20Browser.md)
 - [Launch Terminal from File Open Dialog Box via Preview Pane](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/2%20-%20Next%20Steps/Launch%20Terminal%20from%20File%20Open%20Dialog%20Box%20via%20Preview%20Pane.md)
 - [LoTL USB Smuggling](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/2%20-%20Next%20Steps/LoTL%20USB%20Smuggling.md)
 - [Rename LotL or Payload as Name of Kiosk App](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/2%20-%20Next%20Steps/Rename%20LotL%20or%20Payload%20as%20Name%20of%20Kiosk%20App.md)
 - [Subdomain Smuggling of LotL Payload](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/2%20-%20Kiosk%20Playbook/2-%20Third-Party%20Windows%20Kiosk%20Software/2%20-%20Next%20Steps/Subdomain%20Smuggling%20of%20LotL%20Payload.md)


 ## Some Windows Kiosk Third Party Scenarios 

See also these specific Windows walkthroughs that outline real-world test cases:

 - [HP POS Kiosk Testing](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/4%20-%20Specific%20Escape%20Scenarios/HP%20POS%20Kiosk%20Found%20in%20Engagement%20and%20Tested)
 - [Library Testing of Win11 Attended Access + InTune Hardening, Part 1](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/4%20-%20Specific%20Escape%20Scenarios/Win11%20Attended%20Access%20CtrlO%20Preview%20to%20Terminal/README.md)
 - [Library Testing of Win11 Attended Access + InTune Hardening, Part 2](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/4%20-%20Specific%20Escape%20Scenarios/Win11%20Attended%20Access%20Feedback%20Hub%20Escape)
 - [EnvisionWare PC Reservation Kiosks](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/4%20-%20Specific%20Escape%20Scenarios/EnvisonWare%20PC%20Reservation%20Software%20Pre-Auth%20Escape)


## Ethical Note

Remember to only test on your own kiosks, or with permission such as in the scope of a bug bounty or penetration test, with good intentions of helping elevate kiosk security.  
