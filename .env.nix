with import <nixpkgs> {}; [

bash
zsh
coreutils
openssh
jq

tmux
nano
micro

git
tig
lazygit

nodejs

php
php81Packages.composer

# To install:
#   nix-env -irf .env.nix

# To cleanup:
#   nix-store --gc

]
