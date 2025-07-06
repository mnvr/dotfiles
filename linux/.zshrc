# This script is sourced by zsh(1) each time it runs "interactively".

# Use Helix as the editor when the need arises (e.g. git commit messages).
export EDITOR=hx

# Save history.
#
# All three need to be set. HISTFILE sets the location, HISTSIZE the number of
# in-memory history entries, SAVEHIST the number of them written out.
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=999999999

# Enable the new compsys completion system.
#
# Give it an explicit path to a file to use as a cache/dump, otherwise it
# creates one in ~/.zcompdump.
autoload -U compinit
mkdir -p ~/.cache/zsh
compinit -d ~/.cache/zsh/zcompdump

# Set the PROMPT (left and right).
#
# - Left prompt shows the abbreviated directory.
# - Right prompt shows the last-exit! (if nonzero) and job count (if nonzero).
PROMPT='%~$ '; RPROMPT='%(?..%?!)%(1j. %j.)'

# Provide a definition for the special hook function, chpwd, which the shell
# runs whenever the directory changes, and use it to pass the current directory
# name (enveloped in the appropriate escape sequence) to our terminal emulator.
#
# Also run the function once on startup to set the initial value.
chpwd () { test -t 1 && case $TERM in; *xterm*) print -Pn "\e]2;%~\a";; esac }
chpwd
