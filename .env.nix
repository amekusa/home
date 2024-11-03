with import <nixpkgs> {}; [

bash
zsh
openssl
openssh
coreutils
jq
wget

ripgrep
fd
fzf

tmux
lf
darwin.trash

nano
neovim

git
tig
lazygit

nmap
arp-scan

nodejs
php
php82Packages.composer
go
lua
python3
python311Packages.pip
python311Packages.pipx
ruby
odin
stack
sqlite

ffmpeg-full  # video & audio processing tool
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
