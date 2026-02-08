{
	description = "CLI tools";
	inputs.nixpkgs.url = "github:NixOS/nixpkgs";
	outputs = { nixpkgs, ... }:
		let
			system = "x86_64-darwin"; # or aarch64-darwin
			pkgs = import nixpkgs { inherit system; };
		in {
			packages.${system}.default = pkgs.buildEnv {
				name = "cli";
				paths = with pkgs; [
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
watchexec  # Executes commands in response to file modifications
pandoc
license-cli
asciinema
asciinema-agg

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
typst

# MISC.
elinks
axel  # fast downloader
chafa  # image viewer
cheat  # cheatsheet manager
ffmpeg-full  # video & audio processing tool
gifsicle  # gif image processing tool
gh  # github cli
glow  # markdown viewer
hugo  # website generator
imagemagick  # image editor (cmd: magick)
monolith  # Bundle any web page into a single HTML file
musikcube  # music player
nb  # note taking
pastel  # color utility
sc-im
typer  # typing test in your terminal
vt-cli  # VirusTotal client
wiki-tui  # wikipedia viewer
wordnet  # wordnet dictionary (cmd: wn)
zola  # static site generator

# TOYS
tenki  # clock for terminal
neo  # matrix-like screen effect

				];
			};
		};
}

