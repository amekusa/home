#!/bin/bash

repos=(
https://github.com/zsh-users/zsh-autosuggestions
https://github.com/zsh-users/zsh-syntax-highlighting
https://github.com/zsh-users/zsh-completions
https://github.com/agkozak/zsh-z
https://github.com/romkatv/powerlevel10k
https://github.com/tj/n
)

cd "$HOME"

[ -d .sh ] || mkdir .sh
cd .sh

echo "Checking repositories..."

for repo in "${repos[@]}"; do
  echo
  echo "> $repo.git"
  dir=$(basename "$repo")

  if [ -d "$dir" ]; then
    echo ">> Found at $PWD/$dir"
    cd "$dir"
    echo ">> Updating..."
    git pull origin master
    echo ">> Done."
    cd ..

  else
    echo ">> Cloning into $PWD/$dir"...
    git clone "$repo.git"
    echo ">> Done."
  fi

done

echo
echo "All the repositories have been updated."

echo
echo "Installing n..."
cd n && PREFIX="$N_PREFIX" make install
echo "Done."
