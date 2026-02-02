The first step of kiosk hacking, is to figure out what kind of kiosk you are testing.  Often there is a vendor or product name displayed somewhere on software; or even a product version, usually shown on a banner near the top or the bottom.  Sometimes the version numbers alone are specific enough to pull up the actual product directly, especially if you include mention of what type of product you are looking at, when querying your favorite AI or search tool.


Once you have an idea what product you are dealing with, there is almost always some sort of online documentation that can help you learn and understand the product you are testing.  This will also steer your testing down particular pathways of this framework (or it may cause you to add new contributions to the framework for pathways not yet explored).  


If all else fails, Jacob Steadman pointed out recently at his bSides Belfast talk that one good way to find out exactly what a kiosk device is running, is to reboot it and watch the post and startup sequences. This is usually accomplished by just killing power to the kiosk/unplugging it. Of course, be mindful of the scope and rules of engagement for your testing, prior to trying this.  As a tester, you may have an upset customer if their production kiosk does not come up properly right before a prime window of activity.  


If it is just a web browser displaying a limited browsing context, such as a specific web site for hotel/event check-in or test taking, or a signage kiosk – in our experience it tends to be either:
 - Win11 Attended Access Kiosk / Single App Kiosk mode with Edge.
 - ChromeOS running Chrome Enterprise Kiosk Mode.
 - A regular system with a browser or app in Fullscreen mode.


Yes – we actually see that last one, and far too often. In the scenario with an app or browser just running in full-screen mode, it could be any OS with a policy set to prevent screen lockout (easy to validate).  For Chrome or Windows, it is usually easy to tell, based upon the actual hardware, unless there is an enclosure that prevents visualization of the computer itself. We all know airport kiosks are running Windows, because on 7/19/2024 the CrowdStroke outages caused numerous systems in airports to display a windows BSOD. Lol


In fact, kiosks that are just a native OS, running a proprietary application that applies its own kiosk restrictions (not in native/OS Kiosk mode), seems to be all too common. This is important, because in our experience, so far/on average, proprietary kiosk software running on Windows is far less secure than the native functionality built into the OS, by any of the large vendors (Microsoft or Google, for example). As a comparison case, see the HP POS example in the 'Specific Escape Scenarios' section and compare to the work we had to put into assembling a set of viable Win11 Attended Access escapes (significant difference).  


As mentioned above, if it is some sort of proprietary kiosk software, it is usually possible via OSINT to figure out what type of software it is, and what type of OS it runs on, steering your testing down one of these pathways. 


A key aspect of kiosk testing, is figuring out how you will interact with the kiosk.  Is the touchscreen the only attack surface you are afforded?  Can you connect a USB or Bluetooth keyboard/mouse, USB drive, USB Rubber Ducky, or even a second screen or other peripheral?  Can you connect it to a secondary network you control, and are there any exposed/running services you can interact with?  


Sometimes a physical security component can enter into this type of testing, including lock-picking to gain access to locked enclosures.  Again, make sure any written permission document you have received for testing calls this out specifically if you will be picking locks or using other methods to gain physical access to locked ports or hardware.  


Remember, only test on systems that are your systems, or where you have written permission as part of the scope of a penetration test or approved bug bounty program. Follow all ethical guidelines of ethical hacking and industry best practices that may apply to your testing scenario.   
