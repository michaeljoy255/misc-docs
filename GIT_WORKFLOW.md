# My workflow for Git and GitHub
What follows is a reasonable workflow for contributing to a project, or making
changes to your own repositories. The sections are specific to certain tasks you
may be trying to accomplish.

# Git and GitHub setup

1. Login to GitHub account

   ![GitHub Login](https://github.com/michaeljoy255/misc-docs/blob/master/images/ghlogin.png "GitHub Login")

2. Download GitHub desktop application (use account info during install)

   https://desktop.github.com/

3. Launch Git-Bash from GitHub Desktop

   ![Git-Bash](https://github.com/michaeljoy255/misc-docs/blob/master/images/git-bash.png "Git-Bash")

4. Set Git's default text editor for things like commits

   ```
   git config --global core.editor "notepad"
   ```

5. Alter Git-Bash prompt appearance by changing `git-prompt.sh` (my version in scripts folder)

   ```
   C:\Program Files\Git\etc\profile.d\git-prompt.sh
   ```

# Initial repository setup

Explanation

1. Fork a project on GitHub or create a new repository

   ...

2. Clone the fork onto your local computer

   ...

3. Setup remotes for the local repository

   ```
   git add <remote-alias> <URL>
   ```
   ##### Examples:
   ```
   git add original https://github.com/godotengine/godot-docs.git
   git add myfork https://github.com/michaeljoy255/godot-docs.git
   ```

4. Create and checkout a development branch on your local repository

   ```
   git checkout -b <branch-name>
   ```

# Pull request workflow

Explanation

1. Make sure you local repository is up-to-date with your changes rebased on top

   ```
   git pull --rebase <remote> <remote-branch>
   ```
   ##### Example:
   ```
   git pull --rebase original master
   ```

2. Push changes from local development branch to forked repository

   ```
   git push <remote> <local-branch>:<remote-branch>
   ```
   ##### Example:
   ```
   git push myfork dev:master
   ```

3. Make a Pull Request to the original project from your fork

   ...

# Modifying a pull request

Explanation

# Common Git commands

Use Git Cheatsheet when lost.

Common commands...
