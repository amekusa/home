#!/usr/bin/env bash
#
#  My setup script for macOS
# --------------------------- -
#  @author Satoshi Soma (github.com/amekusa)
#
#  Usage:
#    setup.sh
#    setup.sh --list
#    setup.sh --force <TASK_NAME>
#
# =========================================== *

BASE="$HOME/.sh"
. "$BASE/lib/ush/load" util
. "$BASE/lib/ush/load" io
. "$BASE/lib/ush/load" format; _ansi
. "$BASE/lib/ush/load" task

_task-system --save-to "$BASE/.setup.tasks" "$@"


# ---- nix ----
if _task NIX -r; then
	_has-cmd nix || _fail "nix not found"
	nix-env -irf "$HOME/.env.nix"
_ksat; fi


# ---- brew ----
if _task BREW; then
	_has-cmd brew || _fail "brew not found"
	pkgs=(
		cmake
		ninja
		llvm@14
	)
	for each in "${pkgs[@]}"; do
		_q brew list "$each" || brew install "$each"
	done
_ksat; fi


# ---- npm ----
if _task NPM; then
	_has-cmd npm || _fail "npm not found"
	npm config set prefix "$(_dir "$NPM_PREFIX")"
	pkgs=(
		"npm-check-updates"
		"npm-watch"
		"c8"
		"mocha"
		"gulp"
		"jsdoc@3.6.11"
	)
	for each in "${pkgs[@]}"; do
		npm ls -g "$each" || npm install -g "$each"
	done
_ksat; fi


# ---- vscodium ----
if _task VSCODE; then
	exe="/Applications/VSCodium.app/Contents/Resources/app/bin/codium"
	dir="$HOME/Library/Application Support/VSCodium/User"
	if [ -d "$dir" ]; then
		files=(
			"settings.json"
			"keybindings.json"
			"snippets"
		)
		for each in "${files[@]}"; do
			src="$HOME/.vscode/$each"
			_symlink -F "$src" "$dir/$each" &&
			_success "Symlinked VSCode $each"
		done
	fi
	extensions=(
		# themes
		"paulvandermeijs.loved"
		"Holllo.love"
		"qufiwefefwoyn.kanagawa"
		"jdinhlife.gruvbox"

		# utils
		"EditorConfig.EditorConfig"
		"marp-team.marp-vscode"
		"alefragnani.Bookmarks"
		"huntertran.auto-markdown-toc"
		"wwm.better-align"
	)
	for each in "${extensions[@]}"; do
		"$exe" --install-extension "$each" &&
		_success "Installed VSCode extension '$each'"
	done;
_ksat; fi

_success "Done."
