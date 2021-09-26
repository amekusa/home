#  Bash Login Configuration
#  This is loaded only when Bash was launched as a login shell
# ------------------------------------------------------------ ////

export EDITOR=$(which nano)

export HOMEBREW_PREFIX="${HOME}/.brew"
export HOMEBREW_TEMP="${HOMEBREW_PREFIX}/.tmp"
export HOMEBREW_NO_AUTO_UPDATE=1
# export NODE_PATH="${HOMEBREW_PREFIX}/lib/node_modules" # NodeJS (Homebrew)
export COMPOSER_HOME="${HOME}/.composer"
export ANDROID_HOME="${HOMEBREW_PREFIX}/opt/android-sdk"
export PATH="./node_modules/.bin:./vendor/bin:${COMPOSER_HOME}/vendor/bin:${HOMEBREW_PREFIX}/bin:${HOMEBREW_PREFIX}/sbin:${PATH}"
