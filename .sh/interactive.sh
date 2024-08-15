#  utils for interactive shell
# ----------------------------- *

. "$HOME/.sh/lib/ush/load" -p '' interactive


# ---- aliases ----

alias h='help'

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

# npm shortcuts
alias nrun='npm run'
alias nbuild='npm run build'
alias ntest='npm run test'
alias nwatch='npm run watch'

# pico8
alias pico8='/Applications/PICO-8.app/Contents/MacOS/pico8'

# vscodium
alias code='/Applications/VSCodium.app/Contents/Resources/app/bin/codium'

# ripgrep
alias rg='rg --no-ignore'  # do not exclude gitignore'd files

# fd
alias fd='fd -u'  # force not hiding anything

# wiki-tui
alias wiki='wiki-tui'

# xplr
alias x='cd "$(xplr --print-pwd-as-result)"'

# md5
md5() {
	[ -n "$1" ] || return
	openssl dgst -md5 "$1" | awk '{print $2}'
}

# chafa
img() {
	local sym="sextant+quad+half+solid"
	sym="$sym+u2582..u2586"
	sym="$sym+u258b..u258d"
	local opts=(
		--symbols "$sym"
		--color-space din99d
		--preprocess on
		--work 9
	)
	[ -n "$TMUX" ] && opts+=(--passthrough tmux)
	chafa "${opts[@]}" "$@"
}

# lf
lf() {
	# `command` is needed in case `lfcd` is aliased to `lf`
	cd "$(command lf -print-last-dir "$@")"
}

# vt-cli: fetch info of a file
vtf() {
	[ -n "$1" ] || return
	vt file "$(openssl dgst -md5 "$1" | awk '{print $2}')" --include="names,total_votes,times_submitted,last_analysis_date,last_analysis_results.*.result,last_analysis_stats,sigma_analysis_stats"
}

# vt-cli: upload a file to scan
vts() {
	[ -n "$1" ] || return
	local lim=681574400
	if [ "$(stat -f%z "$1")" -gt $lim ]; then
		echo "file size can't be larger than $lim bytes"
		return 1
	fi
	vt analysis "$(vt scan file "$1" | awk '{print $2}')"
}

# start/stop server
alias start-server='brew services run mariadb; php-fpm -D; sudo nginx'
alias stop-server='brew services stop mariadb; killall php-fpm; sudo nginx -s stop'

