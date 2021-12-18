#!/bin/bash

repos=(
https://github.com/zsh-users/zsh-autosuggestions
https://github.com/zsh-users/zsh-syntax-highlighting
https://github.com/zsh-users/zsh-completions
https://github.com/agkozak/zsh-z
https://github.com/romkatv/powerlevel10k
)

cd "$HOME"

[ -d .zsh ] || mkdir .zsh
cd .zsh

echo "Checking repositories..."

for i in "${repos[@]}"; do
  echo
  echo "> $i.git"
  dir=$(basename "$i")

  if [ -d "$dir" ]; then
    echo ">> Found at $PWD/$dir"
    cd "$dir"
    echo ">> Updating..."
    git pull origin master
    echo ">> Done."
    cd ..

  else
    echo ">> Cloning into $PWD/$dir"...
    git clone "$i.git"
    echo ">> Done."
  fi

done

echo
echo "All the repositories have been updated."
