MacOS Kiosks are interesting, because they actually do not have an out-of-the-box kiosk mode, yet iMac/MacOS devices are used widly as kiosks for upscale sceanrios such as for fancy hotels. While JAMF and InTune provide a wide range of hardening steps that can in theory lead to the setup of a very secure kiosk, even they do not provide a "kiosk mode" to produce a consistent lockdown experience. 

This means that MacOS kiosks follow a few possible scenarios:

 - Full screen of an application, such as a browser, with no real lockdown.
 - Lockdown via a tool like JAMF or InTune (can be secure, but results will very from org to org).
 - Third party solution.

It seems like the most common path based upon some random sampling, is the third party option.

In this specific kiosk write up, we tested a hostpitality kiosk running Uniguest software and found it relatively easy to escape and achieve code/command execution. Check out the [article](https://github.com/CroodSolutions/CTRL-ESC-HOST/tree/main/4%20-%20Specific%20Escape%20Scenarios/Apple%20MacOS%20iMac%20Kiosk%20Running%20Uniguest) on this for more details. Further MacOS testing notes will be added as we encounter more MacOS kiosks to report on, although it could be some time before we have enough data to assemble a comprehensive testing framework for MacOS. 
