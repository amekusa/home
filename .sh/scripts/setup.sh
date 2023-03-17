#!/bin/bash
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
. "$BASE/shlib/util.sh"
. "$BASE/shlib/io.sh"
. "$BASE/shlib/format.sh"
. "$BASE/shlib/task.sh"

task-system --save-to "$BASE/.setup.tasks" "$@"


# ---- nix ----
if task NIX; then
	_has-cmd nix || fail "nix not found"
	nix-env -irf "$HOME/.env.nix"
ksat; fi


# ---- npm ----
if task NPM; then
	_has-cmd npm || fail "npm not found"
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
ksat; fi


# ---- vscodium ----
if task VSCODE; then
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
ksat; fi

_success "Done."
