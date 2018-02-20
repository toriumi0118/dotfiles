### Aliases
# For MacVim (ctagsとVimを優先するため前置)
# set -gx PATH '/Applications/MacVim.app/Contents/bin' $PATH
# alias vi='/Applications/MacVim.app/Contents/bin/vim'
. ~/.config/fish/aliases.fish
alias vim='/Applications/MacVim.app/Contents/bin/vim'
alias tmux='tmux -u'

# use anyenv
set -x PATH $HOME/.anyenv/bin $PATH
# eval (anyenv init -)

# pyenv 
set -x PYENV_ROOT "$HOME/.anyenv/envs/pyenv"
set -x PATH $PATH "$HOME/.anyenv/envs/pyenv/bin"
# [pyenv init - fish]
set -gx PATH "$HOME/.anyenv/envs/pyenv/shims" $PATH
set -gx PYENV_SHELL fish
source "$HOME/.anyenv/envs/pyenv/libexec/../completions/pyenv.fish"
command pyenv rehash 2>/dev/null
function pyenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (pyenv "sh-$command" $argv|psub)
  case '*'
    command pyenv "$command" $argv
  end
end
####################

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
