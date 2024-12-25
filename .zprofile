# === ZSH LOGIN SETUP ===

# environment variables
. ~/.sh/env.sh

# command history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=512
export SAVEHIST=$HISTSIZE

# zsh-completions
FPATH="$HOME/.sh/modules/zsh-completions/src:$FPATH"
