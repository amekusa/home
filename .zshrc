#  zsh setup
# ----------- ---- -- -

# uncomment to analyze the zsh startup time
# zmodload zsh/zprof
# NOTE: this enables `zprof` command which shows the stat

# options
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS

# fn + delete = forward delete
bindkey "^[[3~"  delete-char
bindkey "^[3;5~" delete-char

# functions & aliases
source ~/.sh/fn.sh

# cd hook (ls after cd)
chpwd() {
  emulate -L zsh
  ls
}

# z
source ~/.sh/repos/zsh-z/zsh-z.plugin.zsh

# autosuggestions
source ~/.sh/repos/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# powerlevel10k
source ~/.sh/repos/powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh
# NOTE: to customize, run `p10k configure`

# syntax highlighting
source ~/.sh/repos/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# NOTE: this line should be at the end of .zshrc

# initialize the completion system
autoload -Uz compinit
if [ ! -f ~/.zcompdump ] || [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit && touch ~/.zcompdump
else
  compinit -C
fi
