Dotfiles that live directly in my user directory, i.e. no symlinks.

## Setup

Cloning into a home directory can be challenging, since it will almost certainly
not be empty. Here's a way to get going to workaround that:

```
git init .
git remote add -t \* -f origin git@github.com:thorncp/dotfiles.git
git switch main
```
