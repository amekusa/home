#  shell environment variables
# ----------------------------- ---- -- -

# default editor
export EDITOR=nano
export VISUAL=$EDITOR

# paths
export HOMEBREW_PREFIX="$HOME/.brew"
export HOMEBREW_TEMP="$HOMEBREW_PREFIX/.tmp"
# export NODE_PATH="${HOMEBREW_PREFIX}/lib/node_modules" # NodeJS (Homebrew)
export COMPOSER_HOME="$HOME/.composer"
export PATH="./node_modules/.bin:./vendor/bin:$COMPOSER_HOME/vendor/bin:$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"

# prevent homebrew from updating automatically
export HOMEBREW_NO_AUTO_UPDATE=1
