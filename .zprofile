#  zsh login setup
# ----------------- *

# environment variables
. ~/.sh/env.sh

# command history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=512
export SAVEHIST=$HISTSIZE

# zsh-completions
export FPATH="$HOME/.sh/repos/zsh-completions/src:$FPATH"
