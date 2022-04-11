export EDITOR=emacs
export VISUAL=emacs

PROMPT="%1~$ "

autoload -Uz compinit && compinit

alias code='open -b com.microsoft.vscode'

export PATH="$PATH:$HOME/Downloads/flutter/bin"
export PATH="$PATH":"$HOME/Downloads/flutter/.pub-cache/bin"
