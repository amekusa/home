#!/bin/bash

REPOS=(
  https://github.com/zsh-users/zsh-autosuggestions
  https://github.com/zsh-users/zsh-syntax-highlighting
  https://github.com/zsh-users/zsh-completions
  https://github.com/agkozak/zsh-z
  https://github.com/romkatv/powerlevel10k
  https://github.com/tj/n
)

BASE_DIR="$HOME/.sh"
REPOS_DIR="$BASE_DIR/repos"

[ -d "$REPOS_DIR" ] || mkdir -p "$REPOS_DIR"
cd "$REPOS_DIR" || exit 1

echo "Checking repositories..."

for repo in "${REPOS[@]}"; do
  echo
  echo "=> $repo.git"
  dir=$(basename "$repo")

  if [ -d "$dir" ]; then
    echo " -> Found at $PWD/$dir"
    cd "$dir"
    echo " -> Updating..."
    git pull origin master
    echo " -> Done."
    cd ..

  else
    echo " -> Cloning into $PWD/$dir"...
    git clone "$repo.git"
    echo " -> Done."
  fi

done

echo
echo "All the repositories have been updated."

echo
echo "Installing n..."
cd "$REPOS_DIR/n" && PREFIX="$N_PREFIX" make install
echo "Done."
