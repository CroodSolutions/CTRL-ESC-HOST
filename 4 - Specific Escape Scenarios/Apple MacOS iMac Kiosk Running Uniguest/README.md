## Introduction

Would you assume that, by default, an Apple Kiosk such as iMac running MacOS would be way more secure than a Win11 Attended Access kiosk?  

We did think this at first. Except, we were wrong.

It turns out that Apple does not provide an ‘out of the box’ Kiosk-mode configuration for MacOS, kind of making it a free-for-all. The most secure option is probably to deploy iMac kiosks via JAMF or InTune, but Jordan helped us check and there was not a “kiosk button” here either, so it is up to each administrator to figure it out, and results may vary. In theory this could be made very secure, but it would be up to each org to understand and implement proper security measures. What it seems is the common go-to for most with MacOS kiosk needs, is to implement a third-party solution.

In this write-up, we consider the overall state of security for Apple MacOS kiosks, and as an example we walk through testing observations for a MacOS kiosk using the Uniguest software solution. While the iMac/MacOS kiosk we tested happened to be Uniguest, we suspect similar issues probably exist across the broader landscape, so we are not really picking on them. Instead, we are pointing out a larger problem with trust boundaries, using this particular product as an example since it was the test case available to us.

TL;DR, MacOS kiosks are all over the map, configurations may vary, and LotL Apple attack surface such as Automator seems to get overlooked a lot providing code/command execution after escape. 

## A Few Observations
In researching the MacOS kiosk landscape, we had a few observations that are worth considering, before we get into our specific testing use case/example.
### Observation 1
Unlike Win11 Attended Access or ChromeOS, MacOS does not actually provide a native ‘out of the box’ kiosk mode.  You can full-screen a browser or application, and/or implement lots of custom individual settings via InTune or JAMF that you may or may not get right – or purchase a custom 3rd party kiosk solution for your use case. However, there is no push-button “make this iMac a secure kiosk” option like we expect with Microsoft and Google. This situation sets the stage for the problems we explore, in part two of this write-up.  
### Observation 2
It seems like a common path, due to the lack of ‘out of the box’ kiosk options provided by Apple, leads people toward custom 3rd party kiosk solutions, if they are even trying to do it right. Alternatively, some may just do a full screen of the application they want presented, maybe with some Screen Time restrictions. Take a look at the adoption numbers claimed by popular kiosk vendors such as Uniguest on their web site, to get an idea how widespread these solutions are (scope is vast). Of course, proper implementation of custom/well-tuned policies via JAMF or InTune, directly or in tandem with 3rd party solutions, will go a long way.  That said, remember these policies are individual and up to each organization (vs secure by default), creating a testing placeholder for ethical hackers that extends far into the future.  
### Observation 3
So far, it seems like the average <expectation> of custom third-party solutions is below the level of Win11 or ChromeOS Kiosk modes; moreover, if complex configs are dependent on specific administrators to properly implement them, results may vary. Again, the counterintuitive finding is that some of the more commodity solutions may outperform at least some of the premium or custom solutions. 
### Observation 4
Really more of a concession: MacOS kiosks are WAY less common than Windows or ChromeOS kiosks, at least in our experience. This provides, at least a partial explanation, for why more MacOS kiosk hacking has not surfaced sooner. 
### Conclusions From Observations
If you are doing a penetration test or other ethical research that includes an in-person component and see a MacOS kiosk, do not consider it an unhackable unicorn. Test for normal escape boundaries and remember that Automator can expose the ability to execute ZSH, Python, or a host of other payloads via the test/run functionality. Enforcement and validation of trust boundaries seems to have been limited; such as saving and running Automator files (blocked), vs just hitting the run button in the dev/test mode (allowed).  

## Demo Mode: A Specific Use Case, Examined 

Note that the photos suck because kiosk hacking does not always provide the convenient opportunity to virtualize or install software, for a clean video. As such, sometimes we just take pictures and walk people through them the best we can, so bear with us.
Here is the specific kiosk software that was running:

 <img width="341" height="74" alt="image" src="https://github.com/user-attachments/assets/b72177a4-390a-4af2-ace9-5f0a514322d3" />

It is basically a public-use secure kiosk, for hospitality, in particular iMacs running MacOS, powered by Uniguest.  

<img width="393" height="186" alt="image" src="https://github.com/user-attachments/assets/8202a293-3d72-4686-9a49-b5a0ad1987e4" />

 
Some trust boundaries stand up well, such as trying to launch Terminal after kiosk escape. You can see this angle was blocked. 

<img width="468" height="114" alt="image" src="https://github.com/user-attachments/assets/72e3b199-5064-4501-a9c7-4b085472d069" />

 
Others, less so, such as launching Automator:

<img width="459" height="320" alt="image" src="https://github.com/user-attachments/assets/35d135af-7f81-4e9d-b736-614770ee0db5" />

 
So, what does this provide for attackers? Pretty much anything that a ZSH shell or Python interpreter running in userland can offer:

<img width="468" height="406" alt="image" src="https://github.com/user-attachments/assets/9e1d0621-44e4-4ec1-90eb-04c3ff77a099" />

 
See below for examples of launching Calculator and a Python Hello World script.  Of course, I was very interested in “Send Birthday Greetings” option and the social possibilities it represented. That said, I moved on to other more meaningful test cases.  🤣
Calculator:

<img width="207" height="248" alt="image" src="https://github.com/user-attachments/assets/981fd3de-7345-4a50-a825-0537506c0e36" />

  
Python code execution:

<img width="244" height="182" alt="image" src="https://github.com/user-attachments/assets/99b4983b-4ce9-4b57-8f56-172ce09eed45" />

 
## Conclusion

The decisions related to how we should lock down kiosks, should not make foolish assumptions, such as: ‘this is an apple kiosk, it must be secure by default’ – instead, we should try to hack all of the things all of the time, and then write custom IOAs, charter new projects, and challenge SOCs to create new notables for what we find with such testing.  


## Credits
Special thanks to Ezra Woods, Christian Taillon, Jordan Mastel, Daniel Addington, Brandon Stevens, Komal Chhibber, and our many other CTRL+ESC+HOST / Kiosk Security contributors.
Also thanks to our broader list of supporters and contributors for this research (also see main readme.md for the project):

<img width="442" height="360" alt="image" src="https://github.com/user-attachments/assets/7b654184-5053-470e-9267-98652a7066be" />


## Disclaimer 
Our views are ours alone and do not represent those of our employers, customers, or any non-profit organization we are associated with (directly or indirectly). Only test on kiosks that are yours or when you have permission, such as a penetration test, bug bounty, or other legal/ethical approved testing scenario.  

