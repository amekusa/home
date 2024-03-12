#  utils for interactive shell
# ----------------------------- *

. "$HOME/.sh/shlib/interactive.sh"


# ---- aliases ----

# cd
alias cd='scd'
alias ..='cd ..'
alias ...='cd ../../'

# ls with options
alias ls='ls -pG'
alias ll='ls -hl'
alias la='ls -hal'

# run the previous command with sudo
alias plz='sudo $(fc -ln -1)'

# tmux
alias tm='tmux'

# lazygit
alias lg='lazygit'

# neovim
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'

# fix micro + tmux conflicts
alias micro='TERM=xterm-256color micro'

# npm shortcuts
alias nrun='npm run'
alias nbuild='npm run build'
alias ntest='npm run test'
alias nwatch='npm run watch'

# VSCodium
alias code='/Applications/VSCodium.app/Contents/Resources/app/bin/codium'

# nnn
alias n='nnn'

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && cd -- "$cwd"
	rm -f -- "$tmp"
}

# start/stop server
alias start-server='brew services run mariadb; php-fpm -D; sudo nginx'
alias stop-server='brew services stop mariadb; killall php-fpm; sudo nginx -s stop'
