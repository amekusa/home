#!/usr/bin/env bash
BASE="$HOME/.sh"
. "$BASE/modules/ush/load" fmt; _ansi

REPOS_DIR="$BASE/repos"
REPOS=(
	https://github.com/zsh-users/zsh-autosuggestions
	https://github.com/zsh-users/zsh-syntax-highlighting
	https://github.com/zsh-users/zsh-completions
	https://github.com/agkozak/zsh-z
	https://github.com/romkatv/powerlevel10k
)

[ -d "$REPOS_DIR" ] || mkdir -p "$REPOS_DIR"
cd "$REPOS_DIR" || exit 1

echo "Checking repositories..."

for repo in "${REPOS[@]}"; do
	echo
	echo -e "=> ${CYN}$repo.git${RST}"
	dir=$(basename "$repo")

	if [ -d "$dir" ]; then
		echo " -> Found at $PWD/$dir"
		cd "$dir"
		echo " -> Updating..."
		git pull origin master && echo -e " -> ${GRN}Done.${RST}"
		cd ..

	else
		echo " -> Cloning into $PWD/$dir"...
		git clone "$repo.git" && echo -e " -> ${GRN}Done.${RST}"
	fi

done

echo
echo "All the repositories have been updated."
echo
