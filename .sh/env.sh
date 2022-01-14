#  shell environment variables
# ----------------------------- ---- -- -

# default editor
export EDITOR=nano
export VISUAL=$EDITOR

# homebrew
export HOMEBREW_PREFIX="$HOME/.brew"
export HOMEBREW_TEMP="$HOMEBREW_PREFIX/.tmp"
export HOMEBREW_NO_AUTO_UPDATE=1
PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"

# node (homebrew)
# export NODE_PATH="$HOMEBREW_PREFIX/lib/node_modules"

# composer
export COMPOSER_HOME="$HOME/.composer"
PATH="./vendor/bin:$COMPOSER_HOME/vendor/bin:$PATH"

# node (n)
export N_PREFIX="$HOME/.n"
export NODE_PATH="$N_PREFIX/lib/node_modules"
PATH="./node_modules/.bin:$N_PREFIX/bin:$PATH"

# rust
PATH="$HOME/.cargo/bin:$PATH"

# custom executables
PATH="$PATH:$HOME/.sh/bin"

# export resulting path
export PATH
