A vast number of kiosks we have encountered in the wild have been third party software suites, implementing a propritary kiosk suite on top of Windows. In theory, such devices can also be protected via InTune or GPO policies for significant levels of hardening and attack surface reduction, in addition to the 'out of the box' kiosk restrictions of a given 3rd party product. In practice, we rarely see this - usually the setup is somewhere between the normal workstation build and whatever level of security the kiosk software provider brings to the table.

Many of the third-party windows kiosk builds, will also be vulnerable to some of the tactics outlined for [Windows 11 Attended Access](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/2%20-%20Kiosk%20Playbook/1%20-%20Win11%20Kiosk%20Mode%20-%20Attended%20Access) kiosks, so those testing playbooks are always a good place to start.

See also these specific Windows walkthroughs that outline real-world test cases:

 - [HP POS Kiosk Testing](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/4%20-%20Specific%20Escape%20Scenarios/HP%20POS%20Kiosk%20Found%20in%20Engagement%20and%20Tested)
 - [Library Testing of Win11 Attended Access + InTune Hardening, Part 1](https://github.com/CroodSolutions/CTRL-ESC-HOST/blob/main/4%20-%20Specific%20Escape%20Scenarios/Win11%20Attended%20Access%20CtrlO%20Preview%20to%20Terminal/README.md)
 - [Library Testing of Win11 Attended Access + InTune Hardening, Part 2](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/4%20-%20Specific%20Escape%20Scenarios/Win11%20Attended%20Access%20Feedback%20Hub%20Escape)
 - [EnvisionWare PC Reservation Kiosks](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/4%20-%20Specific%20Escape%20Scenarios/EnvisonWare%20PC%20Reservation%20Software%20Pre-Auth%20Escape)


Ethical Reminder: Only test on your kiosks or with permission such as part of a penetration test or bug bounty, in accordance with all applicable laws and ethical standards.
