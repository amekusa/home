#!/bin/bash
BASE="$HOME/.sh"
. "$BASE/lib/styles"

dir="$HOME/Library/Application Support/Code/User"
if [ -d "$dir" ]; then
	file="settings.json"
	[ -f "$dir/$file" ] && rm "$dir/$file"
	ln -s "$HOME/.vscode/$file" "$dir/$file" &&
	echo -e "[${GRN}SUCCESS${RST}] Symlinked VSCode settings.json"
fi

echo -e "${GRN}Done.${RST}"