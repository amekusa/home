#!/bin/bash
BASE="$HOME/.sh"
. "$BASE/shlib/util.sh"
. "$BASE/shlib/io.sh"
. "$BASE/shlib/format.sh"
. "$BASE/shlib/task.sh"

task-system --save-to "$BASE/.setup.tasks" "$@"

# ---- npm ----
if task NPM && _has-cmd npm; then
	npm config set prefix "$NPM_PREFIX"
	pkgs=(
		"npm-check-updates"
		"c8"
		"mocha"
		"gulp"
		"jsdoc@3.6.11"
	)
	for each in "${pkgs[@]}"; do
		npm install -g "$each"
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
