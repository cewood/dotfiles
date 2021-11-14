# dotfiles

There are many like them, but these are mine.


# Usage

This repo is designed to be used with [GNU Stow](https://www.gnu.org/software/stow/), it should be placed/cloned into your home directory, and then run with the appropriate Makefile target.

If you're installing the dotfileis into a brand new/bare user directory, then you will want to use the `make init` target to seed the directories. What this does is it uses the `.stow-fold.sh` script to create the needed directory structures before stowing the files. It does this to control how stow 'folds' the directories, as when starting from a completely bare user directory, this would result in stow folding all the directories, which might not be what you wanted. So to control this you can place a `.stow-fold` file in any directory that you do want to be folded, and thus `.stow-fold.sh` won't create any child directories for this path, as such stow will fold that directory when it stows the files/directories.

There are Makefile targets for most common operations, each with a check variant that will run in simulation mode:

 - `make init-check`
 - `make init`
 - `make stow-check`
 - `make stow`
 - `make restow-check`
 - `make restow`
 - `make adopt-check`
 - `make adopt`

There are two other Makefile targets related to [git-crypt](https://github.com/AGWA/git-crypt) which I've used to encrypt any secrets or sensitive information that might exist herein. Those targets are `make git-crypt-status` to display the status of encrypted files, and `make git-crypt-status-all` to show the status of all files.
