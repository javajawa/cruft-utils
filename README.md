Cruft Utilities
===============

A group of small utilities to check on the cleanliness of a server.

- `general-cruft` is a combined `cruft`/`debsums` tool which lists
  the changes that been made on a server.
- `homedir-cruft` shows not recently used files in a users' homedirs
- `generate-package-patch` creates a patch for a binary debian package
  between the local files and the original .deb

General Cruft
-------------

General Cruft is a support utilitiy that combines the output of
debsums, cruft, and apt to inform you of the tidyiness of a machine.

It reports:

 - All manually installed apt packages
 - All packages that be automatically removed
 - All changed package and configuration files
 - All files reported missing by cruft
 - All broken symlinks and extrnuous files
 - Files in home directories, excluding the
   'expected' dotfiles, that are more than 2 days
   old.

