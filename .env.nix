with import <nixpkgs> {}; [

# BASIC
bash
zsh
openssl
openssh

# OS SPECIFIC
darwin.trash  # cmd: trash

# GENERAL UTILS
btop  # activity monitor
fd  # find alternative
fzf  # fuzzy finder
jq  # json parser
lf  # file manager
nix-search-cli  # nixpkgs search
pstree  # process tree viewer
ripgrep  # grep alternative
tmux  # terminal multiplexer
wget  # file downloader

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
license-cli
pandoc
asciinema
asciinema-agg
watchexec  # Executes commands in response to file modifications

# LANGUAGES
shellcheck
nodejs
yarn
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
axel  # fast downloader
chafa  # image viewer
cheat  # cheatsheet manager
ffmpeg-full  # video & audio processing tool
gifsicle  # gif image processing tool
glow  # markdown viewer
hugo  # website generator
imagemagick  # image editor (cmd: magick)
monolith  # Bundle any web page into a single HTML file
musikcube  # music player
nb  # note taking
pastel  # color utility
vt-cli  # VirusTotal client
wiki-tui  # wikipedia viewer
wordnet  # wordnet dictionary (cmd: wn)

# TOYS
tenki  # clock for terminal
neo  # matrix-like screen effect

# To install:
#   nix-env -irf .env.nix

# To cleanup:
#   nix-store --gc

]
