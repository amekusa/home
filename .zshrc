#  zsh setup
# ----------- ---- -- -

# uncomment to analyze the zsh startup time
# zmodload zsh/zprof
# NOTE: this enables `zprof` command which shows the stat

# options
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS

# functions & aliases
source ~/.sh/fn.sh

# cd hook (ls after cd)
chpwd() {
  emulate -L zsh
  ls
}

# zsh plugins
source ~/.sh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.sh/zsh-z/zsh-z.plugin.zsh

# powerlevel10k
source ~/.sh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh
# NOTE: to customize, run `p10k configure`

# syntax highlighting
source ~/.sh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# NOTE: this line should be at the end of .zshrc

# initialize the completion system
autoload -Uz compinit
if [ ! -f ~/.zcompdump ] || [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit && touch ~/.zcompdump
else
  compinit -C
fi
