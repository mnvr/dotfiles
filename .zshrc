export EDITOR=emacs
export VISUAL=emacs

PROMPT="%1~$ "

autoload -Uz compinit && compinit

alias code='open -b com.microsoft.vscode'

export PATH="$PATH:$HOME/Code/flutter/bin"
export PATH="$PATH":"$HOME/Code/flutter/.pub-cache/bin"
export PATH="$PATH:$HOME/Code/dotfiles/bin"
export PATH="$PATH:$HOME/Code/bin"

export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"
export PGDATA=/opt/homebrew/var/postgresql@12

# History settings

# See `man zshparam` for details about these variables
export HISTSIZE=1000000
export SAVEHIST=1000000

# See `man zshoptions` for details about these options
# Do not save duplicates (they'll still go into history list)
setopt HIST_SAVE_NO_DUPS
# Write to history file immediately instead of shell exit
setopt INC_APPEND_HISTORY

# By default, history aliases to `fc -l 16 -1`
# Change it to show all the history stored.
alias history="fc -l 1"

# brew install fzf
# /opt/homebrew/opt/fzf/install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
