# Git Strategy
1. Start a new feature branch off of the latest master
  - Naming convention is to start the branch name with the feature's JIRA ID (without II)
  - e.g. for JIRA II-1234: `git checkout -b 1234-feature-name`
1. Do work on your branch, rebasing onto master as necessary
  - Make clean commits of logical chunks of work.
  - Limit subject line of commit to 50 characters, starting with "II-1234: ..."
  - Follow subject line with empty line, then body of commit message with lines limited to 72 characters
  - Generaly based off [this style guide](http://chris.beams.io/posts/git-commit/)
1. Put code up for review on the branch
  - create a pull request in Github for conversation
  - Deploy code to an alpha environemnt (e.g. user dev virtual machine), including necessary seed data and fixtures
1. After acceptance:
  - Rebase feature branch onto latest master
  - Push feature branch to origin so tests run
  - If tests pass, merge feature branch into master via a no-fast-foward merge commit
    - Note: the purpose of no-fast-forward is for ease of reverting features
    - This is what github's UI does this automatically so that is one way to go
    - or `git merge 1234-feature-name --no-ff` from the command line

