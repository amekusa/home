# === ENVIRONMENT VARIABLES ===

# save/restore the system default PATH & FPATH
if [ -z "$_FIRST_LOGIN" ]; then
	export _FIRST_LOGIN=true
	export _DEF_PATH="$PATH"
	export _DEF_FPATH="$FPATH"
else
	_FIRST_LOGIN=false
	PATH="$_DEF_PATH"
	FPATH="$_DEF_FPATH"
fi

# configuration
[ -f "$HOME/.sh/env.local" ] || cp "$HOME/.sh/env.conf" "$HOME/.sh/env.local"
. "$HOME/.sh/env.conf"
. "$HOME/.sh/env.local"

# default editor
export EDITOR=nvim
export VISUAL=$EDITOR

# homebrew
if [ "$env_brew" = 1 ]; then
	export HOMEBREW_PREFIX="$HOME/.brew"
	export HOMEBREW_TEMP="$HOMEBREW_PREFIX/.tmp"
	export HOMEBREW_NO_ANALYTICS=1
	export HOMEBREW_NO_AUTO_UPDATE=1
	export HOMEBREW_NO_INSTALL_CLEANUP=1
	PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"

	# llvm
	if [ "$env_brew_llvm" = 1 ]; then
		PATH="$HOMEBREW_PREFIX/opt/llvm$env_brew_llvm_ver/bin:$PATH"
		export LDFLAGS="-L$HOMEBREW_PREFIX/opt/llvm$env_brew_llvm_ver/lib"
		export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/llvm$env_brew_llvm_ver/include"
	fi
fi

# nix
if [ "$env_nix" = 1 ] && [ -f "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" ]; then
  . "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
  export NIX_PATH="$HOME/.nix-defexpr"
  export NIXPKGS_ALLOW_UNFREE=1
fi

# node
export NPM_PREFIX="$HOME/.npm-global"
PATH="$PATH:./node_modules/.bin:$NPM_PREFIX/bin"

# composer
export COMPOSER_HOME="$HOME/.composer"
PATH="$PATH:./vendor/bin:$COMPOSER_HOME/vendor/bin"

# rust
PATH="$PATH:$HOME/.cargo/bin"

# go
export GOPATH="$HOME/.go"
PATH="$PATH:$GOPATH/bin"

# ruby
export GEM_HOME="$HOME/.gem"
export GEM_PATH="$GEM_HOME"
PATH="$PATH:$GEM_HOME/bin"

# odin
#   NOTE: To install & build odin compiler
#   1. git clone https://github.com/odin-lang/Odin ~/.sh/lib/odin
#   2. cd ~/.sh/lib/odin; make
# export ODIN_ROOT="$HOME/.sh/lib/odin"
# PATH="$PATH:$ODIN_ROOT"

# user-end apps & scripts
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.sh/scripts"

# done
export PATH
export FPATH
