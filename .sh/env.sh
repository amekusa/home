#  shell environment variables
# ----------------------------- *

# configuration
[ -f "$HOME/.sh/env.local" ] || cp "$HOME/.sh/env.conf" "$HOME/.sh/env.local"
. "$HOME/.sh/env.conf"
. "$HOME/.sh/env.local"

# default editor
export EDITOR=nano
export VISUAL=$EDITOR

# homebrew
if "$_HOMEBREW"; then
	export HOMEBREW_PREFIX="$HOME/.brew"
	export HOMEBREW_TEMP="$HOMEBREW_PREFIX/.tmp"
	export HOMEBREW_NO_AUTO_UPDATE=1
	export HOMEBREW_NO_ANALYTICS=1
	PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"

	# llvm
	if "$_HOMEBREW_LLVM"; then
		PATH="$HOMEBREW_PREFIX/opt/llvm/bin:$PATH"
		export LDFLAGS="-L$HOMEBREW_PREFIX/opt/llvm/lib"
		export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/llvm/include"
	fi
fi

# python
PATH="$PATH:$HOME/Library/Python/3.9/bin"

# composer
export COMPOSER_HOME="$HOME/.composer"
PATH="$PATH:./vendor/bin:$COMPOSER_HOME/vendor/bin"

# node
PATH="$PATH:./node_modules/.bin"

# n (node version manager)
if "$_N"; then
	export N_PREFIX="$HOME/.n"
	export NODE_PATH="$N_PREFIX/lib/node_modules"
	PATH="$PATH:$N_PREFIX/bin"
fi

# rust
PATH="$PATH:$HOME/.cargo/bin"

# go
export GOPATH="$HOME/.go"
PATH="$PATH:$GOPATH/bin"

# custom executables
PATH="$PATH:$HOME/.sh/bin"
PATH="$PATH:$HOME/.sh/scripts"

# vscode
PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# nix
if "$_NIX" && [ -f "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" ]; then
  . "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
  export NIX_PATH="$HOME/.nix-defexpr"
fi

# export resulting path
export PATH
