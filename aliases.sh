# ----------------------
# Git Command Aliases
# ----------------------
alias gpoh='git push origin HEAD'
alias glog='git log --color --graph --date=iso --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset" --abbrev-commit --'
alias gtree="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gpull='git pull'
alias gc='git clone'
alias gr='git rebase'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias ga='git add'
alias gaa='git add .'
alias gap='git add -p'
alias gs='git status'
alias gamend='git commit --amend'
alias grom='git rebase origin/main'

# ----------------------
# Shell
# ----------------------
alias reload="exec $SHELL -l"
export KUBE_EDITOR="nvim"
export EDITOR="nvim"

# ----------------------
# Additional
# ----------------------
alias weather="curl http://wttr.in/Oslo"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# ----------------------
# Yarn
# ----------------------
alias yi="yarn install"
alias yinit="yarn init"
alias yiy="yarn init -y"
alias ya="yarn add"
alias yad="yarn add -D"
alias yrm="yarn remove"
alias yanl="yarn add --no-lockfile"
alias yrn="yarn run"
# ----------------------
# ----------------------
# PNPM
# ----------------------
alias pni="pnpm install"
alias pninit="pnpm init"
alias pniy="pnpm init -y"
alias pna="pnpm install"
alias pnad="pnpm install -D"
alias pnrm="pnpm uninstall"
alias pn="pnpm"

# NPM
# ----------------------
alias ni="npm install"
alias ninit="npm init"
alias niy="npm init -y"
alias na="npm install"
alias nad="npm install -D"
alias nrm="npm uninstall"
alias nrn="npm run"

# ----------------------
# Vim
# ----------------------
alias nv="nvim"
alias vimcfg="cd $HOME/AppData/Local/nvim"
alias cdpr="cd D:/projects/"
alias cdpg="cdpr && cd pg.hosting.client/src/ClientApp"

# ----------------------
# Tmux
# ----------------------
export TERM="screen-256color"
alias tma="script -c 'tmux -u attach' /dev/null"
alias tmn="script -c tmux /dev/null"
alias ts="~/ts.sh"

# ----------------------
# Kube
# ----------------------

tmux() {
  TMUX="command tmux -u ${@}"
  SHELL=/usr/bin/bash script -qO /dev/null -c "eval $TMUX"
}
