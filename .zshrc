alias la='ls -a'
alias ls='ls -G'
alias ll='ls -l'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export ANT_HOME="/usr/local/bin/apache-ant-1.9.2"
export PLAY_HOME="/Users/toriumi/Development/tools/play"
export PATH=$ANT_HOME/bin:$PATH
export PATH=$PLAY_HOME:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/toriumi/Github/toriumi0118/cocos2d-x/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/bin/apache-ant-1.9.2/bin
export PATH=$ANT_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Users/toriumi/Github/toriumi0118/tools/android-ndk
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT="/Applications/Android Studio.app/sdk"
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

