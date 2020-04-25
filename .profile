# --------------------------------
#  BASH Configuration
#  Place this at: ~/
# ================================

export HOMEBREW_PREFIX="${HOME}/Library/Homebrew"
export HOMEBREW_TEMP="${HOMEBREW_PREFIX}/.tmp"
export NODE_PATH="${HOMEBREW_PREFIX}/lib/node_modules"
export COMPOSER_HOME="${HOME}/.composer"
export ANDROID_HOME="${HOMEBREW_PREFIX}/opt/android-sdk"
export PATH="./node_modules/.bin:./vendor/bin:${COMPOSER_HOME}/vendor/bin:${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin:${PATH}"

alias ls="ls -G"
alias ll="ls -l"
alias la="ls -la"
