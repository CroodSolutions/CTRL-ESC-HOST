# CTRL-ESC-HOST

This repo is intended to be a collection of our thoughts and ideas related to escape to host flaws, kiosk hacking, and how to better protect against these scenarios.  

## Incremental Rollout

Note that we are going to release a teaser of a fun recent finding here shortly, but it will take a few additional months to take this out of beta and build out a more robust testing framework.

## Why are we creating this?

In our own testing, a few of us have noticed that escape-to-host flaws are quite prevalent and we believe this is a topic that requires more attention. In some cases, vendors ignore these flaws until there is a lot of attention on the topic (e.g., customer tickets from red team engagements or large public dialog related to something). We seek to assemble a collection of resources and techniques to refine a playbook for escape-to-host testing, which can be applied across various scenarios (from presented apps to kiosks).  

## Backstory

This all started with a few of us working an attack on some Citrix ADC infrastructure, 3-4 years back. Once we were done with the normal SOC/IR steps, we decided to purple team Citrix a bit, just to see what attack surface existed that made it such an enticing target. Now of course, there have been countless RCEs with their products before and also since, but something else caught our attention. Some of us stayed up until 3-AM, exploring these flaws, which we later reported to them (w/ FlawdC0de & Kitsune-Sec). We found numerous ways to escape to host from a presented app, and ultimately compromise the underlying system(s). The response from Citrix was that they did not really care and that it was up to each customer to lock down ADC for each app via GPO. This was confirmed by Kitsune-Sec finding resources where people had found the Citrix flaws, long before us (so they were not really even new, at least not most of them).

That started our interest in this area though, both as we continued to test escape-to-host flaws more widely, also branching into testing the same flaws on kiosk software. After finding ways to escape multiple types of kiosks using the "basics" of classical kiosk hacking, I found Windows 11, single App Kiosk mode w/ MS Edge to be an interesting challenge. This led me to explore the videos of John Hammond, and also led to conversations with TechSpence, NotNordgaren, and others. Our first article with what 'might' be a new-ish escape path, will be published shortly.
 
I noticed when watching the outstanding videos by John Hammond, via NotNordgaren; not only were these videos very helpful in elevating my understanding, they also let me know why some things do not work that I tried previously on Win11 Single App Kiosk, or Attended Access as it is called. It was a very clear example of how doing analysis like this improves security - Hammond found flaws, shared information, and the product got a lot better, IMHO. He also mentioned that it would be cool to compile a set of kiosk hacking resources, which is something we have wanted to do for some time. We will start putting things out in the coming months, but also totally game to combine forces or just roll this into a bigger project if there is something out there already.  

It was also pointed out to me by Mspices8 that we need to think more broadly about what constitutes a kiosk or even a presented app. They are everywhere and we are probably missing a lot of flaws that it would be beneficial to identify and remediate. This project hopes to build momentum as a community, raising awareness, improving how we test for these types of flaws, ultimately leading to remediation and detection engineering to reduce risk.  

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
- [Mspices8](https://x.com/mspisces8)
- [BiniamGebrehiwot1](https://github.com/BiniamGebrehiwot1)
- Jordan Mastel
- [christian-taillon](https://github.com/christian-taillon)
- [Duncan4264](https://github.com/Duncan4264)

The direct work on this started with Kitsune-Sec and FlawdC0de, and later included Shammahwoods, Mspices8, and others. Many others contributed advice, mentoring, and/or were part of our background research. 

