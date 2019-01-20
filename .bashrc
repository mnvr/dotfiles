PS1="\w$ "

export EDITOR=emacs
export VISUAL=emacs

export PATH=$PATH:$HOME/.local/bin

# git clone https://github.com/sschober/kqwait && cd kqwait && make
swift-watch () {
    while ~/Downloads/kqwait/kqwait $1; do swift $1; done
}
