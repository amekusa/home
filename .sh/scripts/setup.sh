#!/bin/bash
BASE="$HOME/.sh"
. "$BASE/shlib/io.sh"
. "$BASE/shlib/format.sh"

# ---- vscodium ----

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

exe="/Applications/VSCodium.app/Contents/Resources/app/bin/codium"
list=(
	"paulvandermeijs.loved"
	"Holllo.love"
	"qufiwefefwoyn.kanagawa"
	"jdinhlife.gruvbox"

	"EditorConfig.EditorConfig"
	"marp-team.marp-vscode"
	"alefragnani.Bookmarks"
)
for each in "${list[@]}"; do
	"$exe" --install-extension "$each" &&
	echo -e "[${GRN}SUCCESS${RST}] Installed VSCode extension '$each'"
done;

echo -e "${GRN}Done.${RST}"
