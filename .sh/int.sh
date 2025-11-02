# === INTERACTIVE SHELL UTIL ===

. "$HOME/.sh/modules/ush/load" -p '' int


# ---- aliases ----

alias h='help'

# cd
alias d='cd'
alias ..='cd ..'
alias ...='cd ../../'

# ls with options (BSD)
alias ls='/bin/ls -pG'
alias ll='/bin/ls -pGhl'
alias la='/bin/ls -pGhla'
#   NOTE: Q. Why full path?
#         A. To avoid using coreutils version of ls

# run the previous command with sudo
alias pls='sudo $(fc -ln -1)'

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

# iina
alias iina='/Applications/IINA.app/Contents/MacOS/iina-cli'

# vscodium
alias code='/Applications/VSCodium.app/Contents/Resources/app/bin/codium'

# ripgrep
alias rg='rg --no-ignore'  # do not exclude gitignore'd files

# fd
alias fd='fd -u'  # force not hiding anything

# wiki-tui
alias wiki='wiki-tui'

# tmux
tm() {
	if tmux has &> /dev/null
		then exec tmux attach
		else exec tmux new
	fi
}

# git
git-publish() {
	if [ -z "$1" ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
		cat <<- EOF
		Usage:
		  $0 <remote> <branch> <tag>
		EOF
		return 1
	fi
	local remote="$1"; shift
	local branch="$1"; shift
	local tag="$1"; shift
	local curr="$(git branch --show-current)"
	if [ "$branch" != "$curr" ]; then
		git checkout "$branch" || return 1
		git merge --no-ff "$curr" || return 1
	fi
	git push "$remote" "$branch" || return 1
	if [ -n "$tag" ]; then
		git tag "$tag" || return 1
		git push "$remote" tag "$tag" || return 1
	fi
	git checkout "$curr" || return 1
	git rebase "$branch" || return 1
}

# md5
md5() {
	[ -n "$1" ] || return
	openssl dgst -md5 "$1" | awk '{print $NF}'
}

# chafa
img() {
	[ -n "$1" ] || return
	local sym="sextant+quad+half+solid"
	sym="$sym+u2582..u2586"
	sym="$sym+u258b..u258d"
	sym="$sym+u25a0" # ■
	local opts=(
		--symbols "$sym"
		--color-space din99d
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
	vt file "$(openssl dgst -md5 "$1" | awk '{print $NF}')" --include="names,total_votes,times_submitted,last_analysis_date,last_analysis_results.*.result,last_analysis_stats,sigma_analysis_stats"
}

# vt-cli: upload a file to scan
vts() {
	[ -n "$1" ] || return
	local lim=681574400
	if [ "$(stat -f%z "$1")" -gt $lim ]; then
		echo "file size can't be larger than $lim bytes"
		return 1
	fi
	vt analysis "$(vt scan file "$1" | awk '{print $NF}')"
}

