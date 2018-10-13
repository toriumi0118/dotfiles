### Aliases
# For MacVim (ctagsとVimを優先するため前置)
# set -gx PATH '/Applications/MacVim.app/Contents/bin' $PATH
# alias vi='/Applications/MacVim.app/Contents/bin/vim'
. ~/.config/fish/aliases.fish
alias vim='mvim -v'
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

### Default Environments
set --export EDITOR vim

### For Language
# if yarn -v > /dev/null 2>&1
#   set -x PATH $PATH (yarn global bin)
# end
