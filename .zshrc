export EDITOR=emacs
export VISUAL=emacs

PROMPT="%1~$ "

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

# Generate suggestions as we type based on history and completions
#
# Installation:
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Default is fg=8, which is hard to differentiate from the regular text when the
# terminal is using a non-full-saturation color.
#
# Change to a more easily distinguishable color.
# Color list:
# https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=4"

# Accept and execute the current suggestion: Ctrl-X
bindkey '^x' autosuggest-execute

# Faster cd
#
# Installation:
# curl -LO --output-dir ~/.zsh https://raw.githubusercontent.com/agkozak/zsh-z/master/zsh-z.plugin.zsh
source ~/.zsh/zsh-z.plugin.zsh

# Enable completion (after sourcing all plugins)
autoload -Uz compinit && compinit

# Delete till the last slash using ^W
#
# We can still delete the full word, i.e. till the previous
# whitespace, with Opt-Delete.

tcsh-backward-delete-word () {
    local WORDCHARS="${WORDCHARS:s#/#}"
    zle backward-delete-word
}

zle -N tcsh-backward-delete-word
bindkey '^W' tcsh-backward-delete-word

# Aliases ---

# Let the git log fail - this happens in a newly init-ed repo without any
# commits yet, but the subsequent git status will work fine.
alias gs='git log --oneline -1; git status'

alias gd='git diff'
alias gr='git reset --hard HEAD'
alias gr1='git reset --hard HEAD~'
alias gl='git log --stat'
alias glp='git log --stat -p'
alias gl1='git log --stat -p -1'
alias gcb='git checkout -b'
alias gc-='git checkout -'
alias gcm='git checkout main'
# Include untracked files in the patch by using `--intent-to-add`
alias gc='git add --intent-to-add . && git add -p && git commit'
alias gg='git add --intent-to-add . && git add . && git commit --amend --no-edit'
alias gca='git add --intent-to-add . && git add -p && git commit --amend'
alias gp='git push'

# Hide the configuration options that ffmpeg always prints
alias ffprobe="ffprobe -hide_banner"
alias ffplay="ffplay -hide_banner"
alias ffprobe="ffprobe -hide_banner"

# It boggles me that the people who made the GitHub CLI didn't make this easier
alias mp='git push && gh pr create --fill --web'

# Faster
alias d='yarn dev'
alias lf='yarn lint-fix'

# mkdir && cd
function mcd () { mkdir -p "$1" && cd "$1" }

# Open the editor in the provided path, or the current directory if none is
# provided.
function e() { test -z "$1" && code . || code "$1" }

# Assume the argument to be an epoch microsecond, and print the corresponding
# human readable date (first in UTC, then in local TZ)
function epoch-ms() {
    date -ur "$(echo "$1 / 1000000" | bc)"
    date -r "$(echo "$1 / 1000000" | bc)"
}

# Sum all the numbers in a JSON, keeping 7 digits of precision.
# Useful for comparing epsilon equal data.
function epsilon-sum() {
    jq 'reduce (..|.[]?|numbers|.*1e7|round/1e7) as $x (0; .+$x) |.*1e7|round'
}

# PATH --

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$PATH:$HOME/.bin"
export PATH="$PATH:$HOME/.docker/bin"
