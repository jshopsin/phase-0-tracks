# Web Servers

** Instructions: ** Research the following questions and record your answers in that file.

* What are some of the key design philosophies of the Linux operating system?
  * Unix (which Linux's design philopsophy is derived from) was the first operating system to be built on the philosophy that it's users would be computer literate, whereas former operating systems (VMS, MAC OS) were built on the basis that it had to protect the user from the computer's complexity.
  * Linux is designed to give every user the maximum capabilities, without a Graphical User Interface (GUI).
  * Linux gives the user more control without any handholding, so it is important to be aware of the dangers that can occur.

* In your own words, what is a VPS (virtual private server)? What, according to your research, are the advantages of using a VPS?
  * A VPS (Virtual Private Server) is a virtual computer that stores files and software needed to run a website. It is a unique computer with it's own IP Address that holds only what is needed for a specific website with it's own disc space, bandwith, and any software needed to run the computer's operating system and nothing else.
  * A VPS is basically a private computer that is created and stored in virtual space with a sole purpose of hosting the data and http request software for a given website.
  * There are many different VPS hosting services that allow for creating and storing any number of virtual private servers.

  * Advantages to using a VPS:
    * The greatest advantage to using a VPS is that if something goes wrong in the Linux command line, your personal computer will not be affected and you can simply destroy the VPS and create a new one.
    * VPS hosting is a lot cheaper than using a physical server, although it is still typically more expensive than shared hosting.
    * VPS is easily scalable, whereas physical servers may need more physical space to scale. This can potentially be a disadvantage if the hosting site you are using does not have the space for you to scale due to misallocating resources.
    * There are multiple levels of hosting for a VPS, from minimal maintenance to a fully managed hosting service.

* Optional bonus question: Why is it considered a bad idea to run programs as the root user on a Linux system?
  * Using a root user is a lot like staying in the master branch of git. By working under a different user, the root user (or master user) is protected from mistakes.
  * When working with a team, it is a lot better to have multiple users for each team member to be able to track who has done what.
  * When working remotely, you may be forced to use a different user than root.