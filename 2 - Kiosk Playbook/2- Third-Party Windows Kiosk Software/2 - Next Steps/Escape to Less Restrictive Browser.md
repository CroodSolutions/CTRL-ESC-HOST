## Escape to Less Restrictive Browser

In some cases the kiosk app will be a full-screen browser; in other cases it will be some other application that is running. In either case, one important objective is to escape from this restrictive application context and get to a more unlocked browser experience. Sometimes even this "less restrictive" browser context can be quite restrictive if done right, hence tactics such as the sub-domain/trusted SaaS payload smuggling techniques. There are quite a few things you can try to accomplish this. 

## Testing Instructions

Most direct path:

 - Win+A
 - Scroll down and click Cast option (may even come up with Win+K on some kiosks)
 - Click Can't Find a Device

This should load a less locked down browser for you, where you can attempt things like the Download LotL Binaries via Browser from Local Host.

Second method:

 - Open Settings
   - Win+A for Accessibility seems to work quite often (click the gear icon)
   - Win+(+/-) to activte Magnifier (Gear Icon, then Go to Settings
 - In Settings:
   - Navigte to Apps
   - Select Actions
   - Select Learn how to get started with Actions.

Once in settings, there are numerous links that will also launch an unlocked browser, and more get added as Win11 evolves and gains new features.  

## Defensive Recommendations 

Here are a few things you can do to make yourself more resilient against this tactic:

 - Disable as many keyboard shortcuts to launch settings as possible.  
 - See hardening scripts by Jordan Mastel in the defensive portion of this repo.

## Ethical Note

Remember to only test on your own kiosks, or with permission such as in the scope of a bug bounty or penetration test, with good intentions of helping elevate kiosk security.  
