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

# nvm (node version manager)
export NVM_DIR="$HOME/.sh/nvm"
source "$NVM_DIR/nvm.sh"

# node
export NODE_PATH="$(npm root -g)"
PATH="./node_modules/.bin:$PATH"

# export resulting path
export PATH
