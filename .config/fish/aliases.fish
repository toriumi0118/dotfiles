alias g='git'
alias gst='git status'
alias gd='git diff'
alias gdd='git branch --merged|egrep -v "\\*|develop|master"|xargs git branch -d'
alias gdc='git diff --cached'
alias gp='git push'

function gdv
  git diff -w $argv | view -
end

alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcam='git commit -v -a -m'
alias gcm='git commit -m'
alias gco='git checkout'
alias gr='git remote'
alias grv='git remote -v'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias gb='git branch'
alias glo='git log --oneline'
alias glog='git log --oneline --graph'
alias gss='git status -s'
alias ga='git add'
alias gm='git merge'
