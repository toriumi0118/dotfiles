# Created by newuser for 5.0.2

## Paths
export JAVA_HOME="C://Program Files/Java/jdk1.8.0_11"
export CYG_JAVA_HOME="/cygdrive/c/Program Files/Java/jdk1.8.0_11"
export PYTHON_HOME=/cygdrive/c/python34
export HASKELL_HOME="/cygdrive/c/Program Files/Haskell Platform/2014.2.0.0"
   
export PATH=$HASKELL_HOME/bin:$PATH
export PATH=$HASKELL_HOME/lib/extralibs/bin:$PATH
export PATH=$CYG_JAVA_HOME/bin:$PATH
export PATH=~/bin/:$PATH

## less coloring
export LESS='-R'
export LESSOPEN='| /usr/bin/src-hilite-lesspipe.sh %s'

## gitk display setting
export DISPLAY=localhost:0.0

## alias
alias ls="ls --show-control-chars --color"
alias echo-path='echo $PATH | tr ":" "\n"'
alias gitlog='git log --decorate --oneline --graph'
alias start="cygstart"
alias play="play.bat"
alias gitk="start --hide mintty gitk"

## zsh history
function history-all { history -E 1 }
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

## start diplay for gitk
startxwin >/dev/null 2>&1 exit
trap "kill -9 `ps auxw | grep XWin | awk '{print $4}'`" EXIT
