# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?
  * Version Control is why we use Git to save our code. This allows us to have a sense of security in case something goes horribly wrong in the code, we are then able to use version control to go back to the code we had before a bug was introduced.
  * Version control also helps us to see what changes were made at what time in a project. This is even more helpful when multiple people are working on the same project. (See answer below about branches)
* What is a branch and why would you use one?
  * A branch is a way of copying your code or file so that you can make changes without effecting the master file. This allows you to create and check code before it is merged.
  * A branch is especially helpful when working in a team and multiple people are working in the same project or file at the same time. Using a branch then allows multiple people to push or pull code from each others repositories once merged to the master repository.
* What is a commit? What makes a good commit message?
  * A commit saves your changes at a single point in time in Git. This will save the change in the repository locally, but you would need to push these changes to the remote repository on GitHub.
  * A good commit message is one that clearly states what change was made to the file. If it is the initial commit then a good message may be "initial commit."
* What is a merge conflict?
  * A merge conflict is when Git cannot identify the proper way to merge. This can happen when 2 people are working on the same line of code and Git is not able to determine which user's code to use. You then have to manually decide which line of code in the conflict to choose. There are many ways to correct the conflict, one of which is using the syntax "git mergetool" in your command line to open a GUI to help you more easily visualize the conflict and correct the change.

* I am making a slight change to this file for 1.5 Release 2 to tag my teacher.