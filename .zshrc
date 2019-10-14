. ~/.profile

PROMPT="%1~$ "

# unsetopt BEEP
unsetopt LIST_BEEP

autoload -Uz compinit && compinit
autoload -U select-word-style && select-word-style bash


