# This script is sourced by zsh(1) each time it runs "interactively".

# Use Emacs as the editor when the need arises (e.g. git commit messages).
export EDITOR=emacs

# Save history.
#
# All three need to be set. HISTFILE sets the location, HISTSIZE the number of
# in-memory history entries, SAVEHIST the number of them written out.
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=999999999

# Enable the new compsys completion system.
autoload -U compinit; compinit
