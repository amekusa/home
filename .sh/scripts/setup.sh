#!/usr/bin/env bash
#
#  My setup script for macOS
# --------------------------- -
#  @author Satoshi Soma (github.com/amekusa)
#
#  Usage:
#    setup.sh
#    setup.sh --list
#    setup.sh --prompt
#    setup.sh --force <TASK_NAME>
#
# =========================================== *

base="$HOME/.sh"
. "$base/lib/ush/load" util
. "$base/lib/ush/load" io
. "$base/lib/ush/load" fmt; _ansi
. "$base/lib/ush/load" task

_task-system --save-to "$base/.setup.tasks" "$@"

if _task XCODE_SELECT; then
	xcode-select --install
fi

if _task GIT_CONFIG; then
	git config --global core.excludesfile "~/.gitignore_global"
fi

# NIX
if _has-cmd nix; then
	if _task NIX_ENV -r; then
		nix-env -irf "$HOME/.env.nix"
	fi

	if [ -f '/etc/bashrc.backup-before-nix' ]; then
		if _task NIX_BASHRC_REVERT; then
			sudo cp -f '/etc/bashrc' '/etc/bashrc.backup-after-nix' || _fail
			sudo cp -f '/etc/bashrc.backup-before-nix' '/etc/bashrc' || _fail
		fi
	fi

	if [ -f '/etc/zshrc.backup-before-nix' ]; then
		if _task NIX_ZSHRC_REVERT; then
			sudo cp -f '/etc/zshrc' '/etc/zshrc.backup-after-nix' || _fail
			sudo cp -f '/etc/zshrc.backup-before-nix' '/etc/zshrc' || _fail
		fi
	fi
fi

# NPM
if _has-cmd npm; then
	if _task NPM_CONFIG; then
		npm config set prefix "$(_dir "$NPM_PREFIX")"
	fi

	if _task NPM_PKGS; then
		pkgs=(
			"npm-check-updates"
			"npm-watch"
			"c8"
			"mocha"
			"gulp"
			"jsdoc"
		)
		for each in "${pkgs[@]}"; do
			npm ls -g "$each" || npm install -g "$each"
		done
	fi
fi

# VSCodium
if [ -e "/Applications/VSCodium.app" ]; then
	if _task VSCODIUM_CONFIG; then
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
				_success "Symlinked: '$src' > '$dir/$each'"
			done
		fi
	fi

	if _task VSCODIUM_EXTENSIONS; then
		extensions=(
			# themes
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
	fi
fi

_success "Done."
