# Created by newuser for 5.0.2

## Paths
export JAVA_HOME="C://Program Files/Java/jdk1.8.0_11"
export CYG_JAVA_HOME="/cygdrive/c/Program Files/Java/jdk1.8.0_11"
export ANT_HOME=~/bin/apache-ant-1.9.4
export PLAY_HOME=~/bin/play-1.2.5.3
export PLAY2_HOME=~/bin/activator-1.2.12-minimal
export GRADLE_HOME=~/bin/gradle-2.1
export ANDROID_HOME=~/bin/androidsdk
export PYTHON_HOME=/cygdrive/c/python34
export PYTHON2_HOME=/cygdrive/c/toriumi_y/python
export NODEJS_HOME="/cygdrive/c/Program Files/nodejs"
export HASKELL_HOME="/cygdrive/c/Program Files/Haskell Platform/2014.2.0.0"
export COCOS2D_HOME=~/.cocos2d/console/console/bin
   
export PATH=$PLAY2_HOME:$PATH
export PATH=$COCOS2D_HOME:$PATH
export PATH=$HASKELL_HOME/bin:$PATH
export PATH=$HASKELL_HOME/lib/extralibs/bin:$PATH
export PATH=$NODEJS_HOME:$PATH
export PATH=$GRADLE_HOME/bin:$PATH
export PATH=$PYTHON2_HOME/bin:$PATH
#export PATH=$PYTHON_HOME/:$PATH
#export PATH=$PYTHON_HOME/Scripts/:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$CYG_JAVA_HOME/bin:$PATH
export PATH=$ANT_HOME/bin:$PATH
export PATH=$PLAY_HOME:$PATH
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


## connect environments
function connect-aries  { start connect_aries.bat  $1 $2 }
function connect-taurus { start connect_taurus.bat $1 $2 }

## start diplay for gitk
startxwin >/dev/null 2>&1 exit
trap "kill -9 `ps auxw | grep XWin | awk '{print $4}'`" EXIT
