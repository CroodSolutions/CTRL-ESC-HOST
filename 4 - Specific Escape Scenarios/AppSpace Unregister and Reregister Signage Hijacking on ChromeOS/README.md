## Introduction

While attacking a properly configured ChromeOS kiosk directly can be a daunting task, in particular with the time allotted during the normal scope of penetration testing, there could be interesting issues with any given app running on the kiosk.

In this example, the signage kiosk vendor AppSpace, simply allows you to unregister the kiosk, and register it again with your own (attacker controlled account). Not the most serious issue, but having someone hijack control of signage may be a highly undesirable outcome, in particular for certain use cases (imagine if the sign for a televised event or game is using this, for example). This was also intersting because some legacy functionality of AppSpace may allow for a remote payload to be served up, which if combined with a known (or new) Chrome (OS or Browser) exploit, could maybe lead to more serious outcomes. We do not have any successful demonstrations of this to show (yet), but hopefully sharing the concept is helpful.

## Basic Steps to Replicate

On your device / via web browser:

 - Navigate to https://www.appspace.com/digital-signage/
 - Select Sign up for Free and setup an account

Now on the kiosk:

 - Ctrl+Alt+Shift+M
 - Select Unregister

Back on your browser:

 - Go to Devices and click Add.
 - Register with the code.
 - Create a channel with the content you want to serve up.
 - Add this channel as content with your registered device.

Now, whatever content you have setup on AppSpace should show on the kiosk, including options for web pages, text, images, or files.  

## Legal and Ethical Reminder

Only test on your kiosks or with permission such as part of a penetration test or bug bounty, in accordance with all applicable laws and ethical standards.

