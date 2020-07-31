# dotfiles

There are many like them, but these are mine.


# Usage

This repo is designed to be used with [GNU Stow](https://www.gnu.org/software/stow/), it should be placed/cloned into your home directory, and then run with the appropriate Makefile target.

There are Makefile targets for most common operations, each with a check variant that will run in simulation mode:

 - `make stow-check`
 - `make stow`
 - `make adopt-check`
 - `make adopt`
 - `make restow-check`
 - `make restow`

There are two other Makefile targets related to [git-crypt](https://github.com/AGWA/git-crypt) which I've used to encrypt any secrets or sensitive information that might exist herein. Those targets are `make git-crypt-status` to display the status of encrypted files, and `make git-crypt-status-all` to show the status of all files.
