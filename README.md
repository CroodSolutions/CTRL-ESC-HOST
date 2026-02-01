# CTRL+ESC+HOST

CTRL+ESC+HOST is a collection of atomic tests to identify and validate escape-to-host flaws, in particular focused on kiosks and presented applications. It is organized into a folder structure including sections to introduce the basics of escaping to host, playbooks for testing kiosks and presented apps, as well as write-ups and walkthroughs of several real-world escape-to-host problems we were able to find and fix using the framework. Finally, there is a section to organize defensive recommendations to reduce the risk associated with kiosks and presented applications.  

The Kiosk Playbook section is further organized into tops for testing:
 - Win11 Single App Kiosk Mode / Attended Access
 - Third Party Kiosk Software Testing on Windows (e.g., how do you test an HP POS, NCR, EnvisonWare, or other type of kiosk you encounter)
 - Chrome Kiosks
 - Placeholder folders for other kiosk platforms, although some of these are placeholders for kiosk types we do not often encounter.

The most robust section, relates to Win11 Kiosk escapaes, which are organized into flows of individual tactics you can chain together if doing red team assessments.  

Always test responsibly, in a legal and ethical manner, following the ethical guidelines provided below. Do not hack any kiosks or presented applications that are not yours, unless you have written permission.  

## How to use this framework

This framework is both for red-teams doing assessments that may involve kiosks or presented apps, as well as defenders looking to run tests to see when it is possible to escape kiosk or presnted app trust boundaries. We have organized this framework into a guided journey through a series of interconnected atomic tests, to expose security flaws, risks, and issues you do not want to allow to go live - at least, without understanding each risk tradeoff. 

## Why are we creating this?

In our own testing, a few of us have noticed that escape-to-host flaws are quite prevalent and we believe this is a topic that requires more attention. In some cases, vendors ignore these flaws until there is a lot of attention on the topic (e.g., customer tickets from red team engagements or large public dialog related to something). We have assembled a collection of resources and techniques to provide a playbook for escape-to-host testing, which can be applied across various scenarios (from presented apps to kiosks). Let's be real - we want to hack all the kiosks. They are like Pokemon, except with screens and USB ports.  

## Backstory

This all started with a few of us working an attack on some Citrix ADC infrastructure, 3-4 years back. Once we were done with the normal SOC/IR steps, we decided to purple team Citrix a bit, just to see what attack surface existed that made it such an enticing target. Now of course, there have been countless RCEs with their products before and also since, but something else caught our attention. Some of us stayed up until 3-AM, exploring these flaws, which we later reported to them (w/ FlawdC0de & Kitsune-Sec). We found numerous ways to escape to host from a presented app, and ultimately compromise the underlying system(s). The response from Citrix was that they did not really care and that it was up to each customer to lock down ADC for each app via GPO. This was confirmed by Kitsune-Sec finding resources where people had found the Citrix flaws, long before us (so they were not really even new, at least not most of them).

That started our interest in this area though, both as we continued to test escape-to-host flaws more widely, also branching into testing the same flaws on kiosk software. After finding ways to escape multiple types of kiosks using the "basics" of classical kiosk hacking, I found Windows 11, single App Kiosk mode w/ MS Edge to be an interesting challenge. This led me to explore the videos of John Hammond, and also led to conversations with TechSpence, NotNordgaren, and others. Our first article with what 'might' be a new-ish escape path, will be published shortly.
 
I noticed when watching the outstanding videos by John Hammond, via NotNordgaren; not only were these videos very helpful in elevating my understanding, they also let me know why some things do not work that I tried previously on Win11 Single App Kiosk, or Attended Access as it is called. It was a very clear example of how doing analysis like this improves security - Hammond found flaws, shared information, and the product got a lot better, IMHO. He also mentioned that it would be cool to compile a set of kiosk hacking resources, which is something we have wanted to do for some time. We will start putting things out in the coming months, but also totally game to combine forces or just roll this into a bigger project if there is something out there already.  

It was also pointed out to me by Mspisces8 that we need to think more broadly about what constitutes a kiosk or even a presented app. They are everywhere and we are probably missing a lot of flaws that it would be beneficial to identify and remediate. This project hopes to build momentum as a community, raising awareness, improving how we test for these types of flaws, ultimately leading to remediation and detection engineering to reduce risk.  

## Ethical Standards / Code of Conduct

This project is to test scenarios related to Escape-to-Host flaws.  We can only be successful at properly defending against adversary tactics, if we have the tools and resources to replicate the approaches being used by threat actors in an effective manner. Participation in this project and/or use of this information implies good intent to use these techniques ethically to help better protect/defend, as well as an intent to follow all applicable laws and ethical principles. The views expressed as part of this project are the views of the individual contributors, and do not reflect the views of our employer(s) or any affiliated organization(s).  

## How to Contribute

We welcome and encourage contributions, participation, and feedback - as long as all participation is legal and ethical in nature. Please develop new scripts, contribute ideas, improve the scripts that we have created. The goal of this project is to come up with a robust testing framework that is available to red/blue/purple teams for assessment purposes, with the hope that one day we can archive this project because improvements to detection logic make this attack vector irrelevant.

1. Fork the project
2. Create your feature branch (git checkout -b feature/AmazingFeature)
3. Commit your changes (git commit -m 'Add some AmazingFeature')
4. Push to the branch (git push origin feature/AmazingFeature)
5. Open a Pull Request

## Acknowledgments

Key contributors to our understanding of this topic, and also direct mentors and/or team members:

- [shammahwoods](https://github.com/shammahwoods)
- [flawdC0de](https://github.com/flawdC0de)
- [Kitsune-Sec](https://github.com/Kitsune-Sec)
- [John Hammond](https://github.com/JohnHammond)
- [NotNordGaren](https://x.com/NotNordgaren)
- [TechSpence](https://github.com/techspence)
- [Mspisces8](https://x.com/mspisces8)
- [BiniamGebrehiwot1](https://github.com/BiniamGebrehiwot1)
- Jordan Mastel
- David Doyle
- [christian-taillon](https://github.com/christian-taillon)
- [Duncan4264](https://github.com/Duncan4264)

The direct work on this started with Kitsune-Sec and FlawdC0de, and later included Shammahwoods, Mspisces8, and others. Many others contributed advice, mentoring, and/or were part of our background research.

## References and Resources

### Talks and Presentations

Special thanks to the foundation established by Paul Craig, with his foundational work on the topic of kiosk hacking, including his outstanding talk at Def Con 19: https://www.youtube.com/watch?v=LttwrHrLXoA

And more recently Jacob Steadman at bSides Belfast: https://www.youtube.com/watch?v=pZkpH3XV3h0 

(think we even worked on some of the same things in parallel, so we should collaborate on something sometime)

 ### Articles and Blog Posts

https://www.pentestpartners.com/security-blog/breaking-out-of-citrix-and-other-restricted-desktop-environments/#usefulsystemadministrativetools

https://book.hacktricks.wiki/en/hardware-physical-access/escaping-from-gui-applications.html 

https://medium.com/@Rend_/give-me-a-browser-ill-give-you-a-shell-de19811defa0 

https://payatu.com/blog/how-to-prevent-hacking-out-of-kiosk/ 





