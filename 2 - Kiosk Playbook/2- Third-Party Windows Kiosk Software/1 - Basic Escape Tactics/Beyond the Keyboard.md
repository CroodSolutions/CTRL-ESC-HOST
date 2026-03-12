## Looking Beyond the Keyboard

There are a variety of strategies for Kiosk Hacking that do not involve or require a keyboard to get started. Sometimes connecting a keyboard may be difficult, due to locked panels or other security measures. 

## Testing Instructions

Here are a few classic kiosk escapes for when you cannot easily plug in a keyboard:

 - Explore the IU / see what options exist
 - Try to swipe away the application, from the foreground of the touchscreen.
 - If approved and in-scope of your testing, you can try unplugging or rebooting the kiosk.
 - Look for pathways to launch the windows onscreen keyboard, or Osk.exe
 - Hold all four corners of the screen / try for pixels that activate maintenance modes.


## Defensive Recommendations 

Here are a few things you can do to make yourself more resilient against these tactics:

 - See hardening scripts by Jordan Mastel in the defensive portion of this repo.
 - Remove default usernames and passwords.
 - Network isolate kiosks and also avoid joining them to an on-prem AD domain.  

## Ethical Note

Remember to only test on your own kiosks, or with permission such as in the scope of a bug bounty or penetration test, with good intentions of helping elevate kiosk security.  
