#  shell environment variables
# ----------------------------- ---- -- -

# default editor
export EDITOR=nano
export VISUAL=$EDITOR

# homebrew
export HOMEBREW_PREFIX="$HOME/.brew"
export HOMEBREW_TEMP="$HOMEBREW_PREFIX/.tmp"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1
PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"

# python
PATH="$PATH:$HOME/Library/Python/3.9/bin"

# composer
export COMPOSER_HOME="$HOME/.composer"
PATH="$PATH:./vendor/bin:$COMPOSER_HOME/vendor/bin"

# node (n)
export N_PREFIX="$HOME/.n"
export NODE_PATH="$N_PREFIX/lib/node_modules"
PATH="$PATH:./node_modules/.bin:$N_PREFIX/bin"

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

# export resulting path
export PATH
