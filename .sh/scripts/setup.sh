#!/bin/bash
BASE="$HOME/.sh"
. "$BASE/shlib/io.sh"
. "$BASE/shlib/format.sh"

# ---- vscodium ----

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
		echo -e "[${GRN}SUCCESS${RST}] Symlinked VSCode $each"
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
	echo -e "[${GRN}SUCCESS${RST}] Installed VSCode extension '$each'"
done;

echo -e "${GRN}Done.${RST}"
