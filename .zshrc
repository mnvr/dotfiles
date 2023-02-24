export EDITOR=emacs
export VISUAL=emacs

PROMPT="%1~$ "

autoload -Uz compinit && compinit

# History settings --

# See `man zshparam` for details about these variables
export HISTSIZE=1000000
export SAVEHIST=1000000

# See `man zshoptions` for details about these options
# Do not save duplicates (they'll still go into history list)
setopt HIST_SAVE_NO_DUPS
# But also don't put them into the history list
setopt HIST_IGNORE_ALL_DUPS
# Write to history file immediately instead of shell exit
setopt INC_APPEND_HISTORY
# Do not add lines that begin with a space to history
setopt HIST_IGNORE_SPACE

# By default, history aliases to `fc -l 16 -1`
# Change it to show all the history stored.
alias history="fc -l 1"

# brew install fzf
# /opt/homebrew/opt/fzf/install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases ---

alias g=git
alias gs='git status'
alias gcb='git checkout -b'
alias gc='git add -p && git commit'
alias gca='git add -p && git commit --amend'

# PATH --

eval "$(/opt/homebrew/bin/brew shellenv)"
