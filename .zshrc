#  zsh setup
# ----------- ---- -- -

# functions & aliases
source ~/.sh/fn.sh

# cd hook (cd then ls)
chpwd() {
  emulate -L zsh
  ls
}

# zsh plugins
# NOTE: run .update.sh to install the plugins
source ~/.sh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.sh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.sh/zsh-z/zsh-z.plugin.zsh
source ~/.sh/powerlevel10k/powerlevel10k.zsh-theme

# to customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# enable autocompletion
autoload -Uz compinit && compinit
