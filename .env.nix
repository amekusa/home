with import <nixpkgs> {}; [

bash
zsh
openssl
openssh
coreutils
jq

ripgrep
fd
fzf

tmux
lf

nano
neovim

git
tig
lazygit

nmap
arp-scan

nodejs
php
php81Packages.composer
go
lua
ruby
stack

chafa  # image viewer
glow  # markdown viewer
wordnet  # wordnet dictionary (wn)
wiki-tui  # wikipedia viewer

musikcube
nb

# To install:
#   nix-env -irf .env.nix

# To cleanup:
#   nix-store --gc

]
