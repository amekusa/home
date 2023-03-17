#  shell environment variables
# ----------------------------- *

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
export EDITOR=nano
export VISUAL=$EDITOR

# nix
if [ "$_NIX" = 1 ] && [ -f "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" ]; then
  . "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
  export NIX_PATH="$HOME/.nix-defexpr"
fi

# homebrew
if [ "$_HOMEBREW" = 1 ]; then
	export HOMEBREW_PREFIX="$HOME/.brew"
	export HOMEBREW_TEMP="$HOMEBREW_PREFIX/.tmp"
	export HOMEBREW_NO_AUTO_UPDATE=1
	export HOMEBREW_NO_ANALYTICS=1
	PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"

	# llvm
	if [ "$_HOMEBREW_LLVM" = 1 ]; then
		PATH="$HOMEBREW_PREFIX/opt/llvm/bin:$PATH"
		export LDFLAGS="-L$HOMEBREW_PREFIX/opt/llvm/lib"
		export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/llvm/include"
	fi
fi

# python
PATH="$PATH:$HOME/Library/Python/3.9/bin"

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

# custom executables
PATH="$PATH:$HOME/.sh/bin"
PATH="$PATH:$HOME/.sh/scripts"

# done
export PATH
export FPATH
