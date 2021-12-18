#  zsh setup
# ----------- ---- -- -

# functions & aliases
source ~/.sh/fn.sh

# zsh plugins
# NOTE: Run .update.sh to install the plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-z/zsh-z.plugin.zsh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# enable autocompletion
autoload -Uz compinit && compinit

# cd hook (cd then ls)
chpwd() {
  emulate -L zsh
  ls
}
