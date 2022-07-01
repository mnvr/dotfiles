export EDITOR=emacs
export VISUAL=emacs

PROMPT="%1~$ "

autoload -Uz compinit && compinit

alias code='open -b com.microsoft.vscode'

function git-amend () {
    git add -p && git commit --amend --reset-author
}

export PATH="$PATH:$HOME/Code/flutter/bin"
export PATH="$PATH":"$HOME/Code/flutter/.pub-cache/bin"
export PATH="$PATH:$HOME/Code/dotfiles/bin"
export PATH="$PATH:$HOME/Code/bin"

export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"

export PGDATA=/opt/homebrew/var/postgresql@12
export PGHOST=localhost
export PGUSER=postgres
export PGDATABASE=postgres

# ente/museum
export DB_USER=postgres

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

# By default, history aliases to `fc -l 16 -1`
# Change it to show all the history stored.
alias history="fc -l 1"

# brew install fzf
# /opt/homebrew/opt/fzf/install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# if [[ "$(defaults read -g AppleInterfaceStyle 2&>/dev/null)" != "Dark" ]]; then
#     export MCFLY_LIGHT=TRUE
# fi

# eval "$(mcfly init zsh)"
# export MCFLY_FUZZY=true

# Immediately execute the command on ctrl-x
# https://github.com/junegunn/fzf/pull/1492#issuecomment-461670530

fzf_history() {
  local selected
  IFS=$'\n' selected=($(fc -lnr 1 | fzf --expect=ctrl-x --no-sort --height=40% --query="$BUFFER"))
  if [[ "$selected" ]]; then
    LBUFFER="$selected"
    if [[ ${#selected[@]} -eq 2 ]]; then
      LBUFFER="${selected[2]}"
      zle accept-line
    fi
  fi
  zle reset-prompt
}
zle -N fzf-history fzf_history
bindkey "^R" fzf-history

# Scaleway CLI autocomplete initialization.
eval "$(scw autocomplete script shell=zsh)"
