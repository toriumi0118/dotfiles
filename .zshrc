# alias
alias la='ls -a'
alias ls='ls -G'
alias ll='ls -l'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vf='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim +VimFiler "$@"'
alias vir='vim -R'

# paths
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export NDK_ROOT=/Users/toriumi/Library/Android/android-ndk
export ANDROID_SDK_ROOT=/Users/toriumi/Library/Android/sdk

export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH
export PATH=$NDK_ROOT:$PATH

# node
source ~/.nvm/nvm.sh
nvm use v0.12.2 > /dev/null

# Add brew setting
export PATH=/usr/local:$PATH
