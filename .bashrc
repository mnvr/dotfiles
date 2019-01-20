PS1="\w$ "

export EDITOR=emacs
export VISUAL=emacs

export PATH=$PATH:$HOME/.local/bin

# git clone https://github.com/sschober/kqwait && cd kqwait && make
swift-watch () {
    while true; do swift $1; ~/Downloads/kqwait/kqwait $1; done
}
