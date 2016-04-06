*Sources:*
https://10kloc.wordpress.com/2016/04/03/effective-code-reviews/
http://www.codeproject.com/Articles/524235/Codeplusreviewplusguidelines

#Definition:

* Code review is the process in which code written by a developer is inspected by another person to look for defects and improvements. In other words, developers work on their code mostly in isolation and call for a review when they are ready.

#Goals of Code Review:

* Simplify Code
* Make sure acceptance criteria are met
* Keep code maintanable
* Maintain code style
* Keep good test coverage

#Roles

##Management:

* Don't use code reviews as a means to produce developer performance metrics (ie Code Review grades).  They should only be viewed through the lens of work towards the best code possible being delivered.

##Reviewers:

* Remain polite.
* Prefer to comment as an observer, "I did not see what was going on here." vs "This doesn't make sense."
* Comment about the code not the author.
* Praise good decisions alongside critiquing others.
* Avoid philosophical debates when possible.  Stick to code issues that are in line with the stated Goals above.
* For style problems, word your thoughts as questions about why the style guide was not followed, the writer could have a good reason. ie, "Did you mean to leave out the parantheses?"
* The goal is not to prove yourself a superior programmer.
* Avoid "Why" questions, using "why" can seem accusatory.
* Don't think you need to follow a "script", reviews should be a conversation.

##Developers:

* Remain polite.
* Making sure to follow our style guide will make it easier to review your code.
* Remember, the target of the review is the code not you.
* Taking pride in your work is natural.  Defend your work if you think critiques are missing something, but remain flexible.
* It is okay to ask questions of the reviewer if you are not clear on what they are saying.
* Saying thanks is nice.


Some ideas for using/updating this guide:
* Link code reviews/PRs as examples for style guide
* Severity ratings on comments (Blocking, non-blocking, trivial, etc
