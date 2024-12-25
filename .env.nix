with import <nixpkgs> {}; [

bash
zsh
openssl
openssh

# ESSENTIALS
tmux
wget
jq
ripgrep
fzf

# GENERAL UTILS
darwin.trash
nix-search-cli
fd
lf
pstree
bottom  # htop alternative (cmd: btm)

# NETWORK UTILS
nmap
arp-scan

# EDITORS
nano
neovim

# DEVELOPMENT TOOLS
git
tig
lazygit

# LANGUAGES
shellcheck
nodejs
go
lua
python311
python311Packages.pip
python311Packages.pipx
ruby
php
php82Packages.composer
sqlite

# MISC.
ffmpeg-full  # video & audio processing tool
chafa  # image viewer
glow  # markdown viewer
imagemagick  # image editor (cmd: magick)
wordnet  # wordnet dictionary (cmd: wn)
wiki-tui  # wikipedia viewer
musikcube  # music
nb  # note taking
cheat  # cheatsheet manager
vt-cli  # VirusTotal client

# TOYS
tenki  # clock for terminal
neo  # matrix-like screen effect

# To install:
#   nix-env -irf .env.nix

# To cleanup:
#   nix-store --gc

]
