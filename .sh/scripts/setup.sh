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
. "$base/modules/ush/load" util
. "$base/modules/ush/load" io
. "$base/modules/ush/load" fmt; _ansi
. "$base/modules/ush/load" task

# processor info
case "$(_lower "$(sysctl -n machdep.cpu.brand_string)")" in
	*intel*) cpu=intel ;;
	*)       cpu=whatever ;;
esac


# --- TASKS ---
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

	if [ -e "/etc/bashrc.backup-before-nix" ] && [ ! -e "/etc/bashrc.backup-after-nix" ]; then
		if _task NIX_REVERT_BASHRC; then
			sudo cp "/etc/bashrc" "/etc/bashrc.backup-after-nix" || _fail
			sudo cp -f "/etc/bashrc.backup-before-nix" "/etc/bashrc" || _fail
		fi
	fi

	if [ -e "/etc/zshrc.backup-before-nix" ] && [ ! -e "/etc/zshrc.backup-after-nix" ]; then
		if _task NIX_REVERT_ZSHRC; then
			sudo cp "/etc/zshrc" "/etc/zshrc.backup-after-nix" || _fail
			sudo cp -f "/etc/zshrc.backup-before-nix" "/etc/zshrc" || _fail
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
			"eslint"
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
	exe="/Applications/VSCodium.app/Contents/Resources/app/bin/codium"
	dir="$HOME/Library/Application Support/VSCodium/User"

	if [ -e "$dir" ]; then
		if _task VSCODIUM_CONFIG; then
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
		done
	fi
fi

if _task IM_SELECT; then
	src="https://github.com/daipeihust/im-select"
	src="$src/raw/9cd5278b185a9d6daa12ba35471ec2cc1a2e3012"
	dst="$base/bin/im-select"
	case "$cpu" in
		intel) src="$src/macOS/out/intel/im-select" ;;
		*)     src="$src/macOS/out/apple/im-select" ;;
	esac
 	curl -L --create-dirs -o "$dst" "$src"
	chmod u+x "$dst"
fi

if _task MACISM; then
	dst="$base/bin/macism"
	src="https://github.com/laishulu/macism"
	src="$src/releases/download/v1.4.6/macism"
	case "$cpu" in
		intel) src="$src-x86_64" ;;
		*)     src="$src-arm64" ;;
	esac
 	curl -L --create-dirs -o "$dst" "$src"
	chmod u+x "$dst"
fi

_success "Done."
