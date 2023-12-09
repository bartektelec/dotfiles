if [ -t 1 ]; then
	exec zsh
fi
# ----------------------
# Git Command Aliases
# ----------------------
#

alias gpoh='git push origin HEAD'
alias glog='git log --color --graph --date=iso --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset" --abbrev-commit --'
alias gtree="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gpull='git pull'
alias gpm='git pull origin master'
alias gc='git clone'
alias gr='git rebase'
alias ga='git add'
alias gaa='git add .'
alias gap='git add -p'
alias gs='git status'
alias gamend='git commit --amend'
alias grom='git rebase origin/master'

# ----------------------
# Shell
# ----------------------
alias reload="exec $SHELL -l"

# ----------------------
# WP CLI
# ----------------------
alias wpthl='wp theme list'
alias wppll='wp plugin list'

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
alias vim="nvim"
alias vimcfg="cd $HOME/AppData/Local/nvim"
alias cdpr="cd D:/projects/"

case "$TERM" in
xterm* | rxvt*)
	function xtitle() {
		builtin print -n -- "\e]0;$@\a"
	}
	;;
screen)
	function xtitle() {
		builtin print -n -- "\ek$@\e\\"
	}
	;;
*)
	function xtitle() {
	}
	;;
esac

last_two_dirs() {
	local left=${PWD%/*}
	echo "${PWD#${left%/*}/}"
}

function precmd() {
	xtitle "$(print -P bash $(last_two_dirs))"
}
function preexec() {
	xtitle "Running $1"
}
