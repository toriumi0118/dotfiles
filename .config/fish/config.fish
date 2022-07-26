### Aliases
# For MacVim (ctagsとVimを優先するため前置)
# set -gx PATH '/Applications/MacVim.app/Contents/bin' $PATH
# alias vi='/Applications/MacVim.app/Contents/bin/vim'
. ~/.config/fish/aliases.fish
alias vim='nvim'
alias tmux='tmux -u'

### Setup direnv
eval (direnv hook fish)

### Add Command for peco with z
function peco_z
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  z -l | peco $peco_flags | awk '{ print $2 }' | read recent
  if [ $recent ]
    cd $recent
    commandline -r ''
    commandline -f repaint
    end
end
source ~/.asdf/asdf.fish

### Default Environments
set --export EDITOR nvim
set --export PATH $PATH /Users/toriumi0118/Dev/src/github.com/flutter/flutter/bin # flutter
set --export PATH $PATH /Users/toriumi0118/.bin # terrafrom-lsp

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/toriumi0118/google-cloud-sdk/path.fish.inc' ]; . '/Users/toriumi0118/google-cloud-sdk/path.fish.inc'; end
