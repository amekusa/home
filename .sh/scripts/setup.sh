#!/bin/bash
BASE="$HOME/.sh"
. "$BASE/lib/styles"

dir="$HOME/Library/Application Support/Code/User"
if [ -d "$dir" ]; then
	file="settings.json"
	[ -f "$dir/$file" ] && rm "$dir/$file"
	ln -s "$HOME/.vscode/$file" "$dir/$file" &&
	echo -e "[${GRN}SUCCESS${RST}] Symlinked VSCode settings.json"

	file="snippets"
	[ -d "$dir/$file" ] && rm -rf "$dir/$file"
	ln -s "$HOME/.vscode/$file" "$dir/$file" &&
	echo -e "[${GRN}SUCCESS${RST}] Symlinked VSCode snippets"
fi

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
	code --install-extension "$each" &&
	echo -e "[${GRN}SUCCESS${RST}] Installed VSCode extension '$each'"
done;

echo -e "${GRN}Done.${RST}"
